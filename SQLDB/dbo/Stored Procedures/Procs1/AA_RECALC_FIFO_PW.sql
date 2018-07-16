CREATE procedure [dbo].[AA_RECALC_FIFO_PW] 

/*

V3 - 11th May 2016:

Added where clause to exclude estimate sales orders, due to issue with customer who had stock allocated to estimates


Written by Philip Walters, February 2012

Updates FIFO quantities on stock movements, to match what should be the correct available stock.  It does
nothing with FIFO values.

You will first need to recalculate physical and deliveries to update figures

This SP deals with the following:

1.  Sub analysis and non-sub analysis tracked stock items.
2.  Does not include serial tracked items as these are exempt from the FIFO movement fields
3.  Excludes negative and 0 quantity stock records
4.  Incorporates works orders
5.  Allows for different decimal place quantities
6.     Pre-allocated and non pre-allocated sales orders


*/

As

declare

  @StockCode                      varchar(25) 
, @SubAnalysisTracked             bit
, @StockPhysical                  decimal(24,8) --will be set as physical+printed/dtu
, @StockAllocated                 decimal(24,8) --will be taken from OD_QTYRESERVED to allow for pre and non-pre allocated stock. Also allows for works orders.
, @QtyNeeded                      decimal(24,8) --calculated as physical+printed-allocated
, @SubAnalysis                           varchar(25)
, @SubPhysical                           decimal(24,8) --will be later set as physical+printed/dtu
, @SubAllocated                          decimal(24,8) --will be taken from OD_QTYRESERVED to allow for pre and non-pre allocated stock. Also allows for works orders.
, @MovePrimary                           bigint
, @MoveQuantity                          decimal(24,8)
, @AccumulatedQty                 decimal(24,8) --Initially set as zero, used when looping through movements later
, @QuantityDPS                           tinyint
, @ErrorStr                              varchar(1000)


--Set uppercase values and parameters

select   @StockCode  = upper(@StockCode)
              
--Retrieve Decimal places for rounding Quantities and Values

select @QuantityDPS  = QUANTITY_DPS
from   SYS_DATAINFO
where  SYS_PRIMARY = 1

--Create table to store records updated for listing at the end

if exists (select * from sysobjects where name = 'TAG_STOCKLIST_REPAIRED')
drop table [dbo].TAG_STOCKLIST_REPAIRED

CREATE TABLE TAG_STOCKLIST_REPAIRED
(StockCode           varchar(25)
,SubAnalysis varchar (25)
,Physical           decimal(24,8)
,Allocated          decimal(24,8)
,QtyNeeded          decimal(24,8))

--Build stock record list

--Create stock cursor

DECLARE StockRecord CURSOR LOCAL FOR

              select distinct(stkcode)
              ,stk_multilocatn
              ,0 --Set all these fields as 0 for sub analysis tracked items as these will be set in the sub analysis loop later on
              ,0
              ,0
              ,0
              from stk_stock inner join stk_location
              on stkcode=loc_stock_code
              where stk_serialtrack<>1
              group by stkcode, stk_multilocatn, loc_code, loc_physical, loc_qtyprinted, loc_wo_alloc_quantity
              having round((loc_physical+loc_qtyprinted)-(isnull((select sum(od_qtyreserved)
              from ord_detail join ORD_HEADER
              on OD_ORDER_NUMBER=OH_ORDER_NUMBER
              where od_batch_flag=1
              and OH_PRIORITY<3
              and od_status<>2
              and od_stock_code=stkcode
              and od_locatn=loc_code
              group by od_stock_code, od_locatn),0)+loc_wo_alloc_quantity),@QuantityDPS)<>--only returns records with incorrect FIFO available stock
              round(isnull((select sum(sm_quantity-sm_fifo_qty)
              from stk_movements 
              where sm_stock_code=stkcode
              and sm_location=loc_code
              and sm_batch_flag<>1
              and sm_status='I'
              and sm_fifo_allocated=0
              and sm_type<>'L'
              and sm_fifo_qty<sm_quantity),0),@QuantityDPS)

              union --Also bring through non-sub analysis tracked items

              select stkcode
              ,stk_multilocatn
              ,round((stk_physical-stk_qtyprinted),@QuantityDPS)
              ,round((isnull((select sum(od_qtyreserved)
              from ord_detail join ORD_HEADER
              on OD_ORDER_NUMBER=OH_ORDER_NUMBER
              where od_batch_flag=1
              and OH_PRIORITY<3
              and od_status<>2
              and od_stock_code=stkcode
              group by od_stock_code),0)+stk_wo_alloc_quantity),@QuantityDPS)
              ,round(((stk_physical+stk_qtyprinted)-
              (isnull((select sum(od_qtyreserved)
              from ord_detail join ORD_HEADER
              on OD_ORDER_NUMBER=OH_ORDER_NUMBER
              where od_batch_flag=1
              and OH_PRIORITY<3
              and od_status<>2
              and od_stock_code=stkcode
              group by od_stock_code),0)+stk_wo_alloc_quantity)),@QuantityDPS)
              ,0            
              from stk_stock
              where stk_serialtrack<>1
              and stk_multilocatn<>1
              and round(((stk_physical+stk_qtyprinted)-
              (isnull((select sum(od_qtyreserved)
              from ord_detail join ORD_HEADER
              on OD_ORDER_NUMBER=OH_ORDER_NUMBER
              where od_batch_flag=1
              and OH_PRIORITY<3
              and od_status<>2
              and od_stock_code=stkcode
              group by od_stock_code),0)+stk_wo_alloc_quantity)),@QuantityDPS)<>
              round(isnull((select sum(sm_quantity-sm_fifo_qty)
              from stk_movements 
              where sm_stock_code=stkcode
              and sm_batch_flag<>1
              and sm_status='I'
              and sm_fifo_allocated=0
              and sm_type<>'L'
              and sm_fifo_qty<sm_quantity),0),@QuantityDPS)

              
       
OPEN StockRecord

FETCH NEXT FROM StockRecord INTO                
               @StockCode
              ,@SubAnalysisTracked
              ,@StockPhysical
              ,@StockAllocated
              ,@QtyNeeded
              ,@AccumulatedQty
       
WHILE @@FETCH_STATUS > -1

BEGIN

IF @SubAnalysisTracked=1

       BEGIN --Go into sub-analysis loop


              --Build Sub Analysis Record List using cursor

              DECLARE SubAnalysis CURSOR LOCAL FOR
                     
                     select loc_code
                     ,round(loc_physical+loc_qtyprinted,@QuantityDPS)
                     ,round((isnull((select sum(od_qtyreserved)
                     from ord_detail join ORD_HEADER
                     on OD_ORDER_NUMBER=OH_ORDER_NUMBER
                     where od_batch_flag=1
                     and OH_PRIORITY<3
                     and od_status<>2
                     and od_stock_code=loc_stock_code
                     and od_locatn=loc_code
                     group by od_stock_code, od_locatn),0)+loc_wo_alloc_quantity),@QuantityDPS)
                     ,round(loc_physical+loc_qtyprinted,@QuantityDPS)-round((isnull((select sum(od_qtyreserved)
                     from ord_detail join ORD_HEADER
                     on OD_ORDER_NUMBER=OH_ORDER_NUMBER
                     where od_batch_flag=1
                     and OH_PRIORITY<3
                     and od_status<>2
                     and od_stock_code=loc_stock_code
                     and od_locatn=loc_code
                     group by od_stock_code, od_locatn),0)+loc_wo_alloc_quantity),@QuantityDPS)
                     ,0
                     from stk_stock inner join stk_location
                     on stkcode=loc_stock_code
                     where loc_stock_code=@StockCode
                     and round(loc_physical+loc_qtyprinted,@QuantityDPS)<>0.00
                     group by loc_stock_code, loc_code, loc_physical, loc_qtyprinted, loc_wo_alloc_quantity
                     having round((loc_physical+loc_qtyprinted)-(isnull((select sum(od_qtyreserved)
                     from ord_detail join ORD_HEADER
                     on OD_ORDER_NUMBER=OH_ORDER_NUMBER
                     where od_batch_flag=1
                     and OH_PRIORITY<3
                     and od_status<>2
                     and od_stock_code=loc_stock_code
                     and od_locatn=loc_code
                     group by od_stock_code, od_locatn),0)+loc_wo_alloc_quantity),2)<> --only return incorrect sub analysis records as well
                     round(isnull((select sum(sm_quantity-sm_fifo_qty)
                     from stk_movements 
                     where sm_stock_code=loc_stock_code
                     and sm_location=loc_code
                     and sm_batch_flag<>1
                     and sm_status='I'
                     and sm_fifo_allocated=0
                     and sm_type<>'L'
                     and sm_fifo_qty<sm_quantity),0),2)
              
              

              OPEN SubAnalysis
       
              FETCH NEXT FROM SubAnalysis INTO 
                           @SubAnalysis
                           ,@SubPhysical
                           ,@SubAllocated
                           ,@QtyNeeded
                           ,@AccumulatedQty
                                  
                     
              WHILE @@FETCH_STATUS > -1

              BEGIN

                           --First store sub analysis record in temp table created earlier

                           insert into TAG_STOCKLIST_REPAIRED values(
                           @StockCode
                           ,@SubAnalysis
                           ,@SubPhysical
                           ,@SubAllocated
                           ,@QtyNeeded)
                                                  
                           
                           --Clear down all existing inward movements so we reset from scratch

                     
                           update stk_movements
                           set sm_fifo_qty=round((sm_quantity*sm_qtyunit),@QuantityDPS), sm_fifo_allocated=1
                           where sm_stock_code=@StockCode
                           and sm_location=@SubAnalysis
                           and sm_batch_flag<>1
                           and sm_status='I'
                           and sm_fifo_allocated=0
                           and sm_type<>'L'

                                  --Build Stock Movement List using cursor

                                  DECLARE StockMovements CURSOR LOCAL FOR

                                         select sm_primary
                                         ,round((sm_quantity*sm_qtyunit),@QuantityDPS)
                                         from stk_movements
                                         where sm_stock_code=@StockCode
                                         and sm_location=@SubAnalysis
                                         and sm_batch_flag<>1
                                         and sm_status='I'
                                         and sm_type<>'L'
                                         order by sm_primary desc

                                  OPEN StockMovements
              
                                  FETCH NEXT FROM StockMovements INTO 
                                   @MovePrimary
                                  ,@MoveQuantity
                                  
                                  WHILE @@FETCH_STATUS > -1

                                  BEGIN --Loop through stock movements

                                                IF @MoveQuantity>=(@QtyNeeded-@AccumulatedQty) --This movement fulfulls required stock so don't continue after this one
                                                       
                                                       BEGIN
                                                              update stk_movements
                                                              set  sm_fifo_qty=(@MoveQuantity-(@QtyNeeded-@AccumulatedQty))
                                                              ,sm_fifo_allocated=0
                                                              where sm_primary=@MovePrimary
                                                              and @QtyNeeded>0 --don't update movements for records with negative stock
                                                       BREAK
                                                
                                                END    

                                                ELSE --This movement does not fulfill the stock we need so accumulate quantity and loop to next movement
                                                              
                                                              update stk_movements
                                                              set    sm_fifo_qty=0
                                                              ,sm_fifo_allocated=0
                                                              where sm_primary=@MovePrimary

                                                              set @AccumulatedQty=round((@AccumulatedQty+@MoveQuantity),@QuantityDPS)
                                                                                                
                                                
                                  FETCH NEXT FROM StockMovements INTO 
                                  @MovePrimary
                                  ,@MoveQuantity
                                  
                                  END

                                  CLOSE StockMovements
                                  DEALLOCATE StockMovements

              
              FETCH NEXT FROM SubAnalysis INTO 
                      @SubAnalysis
                     ,@SubPhysical
                     ,@SubAllocated
                     ,@QtyNeeded
                     ,@AccumulatedQty
                                  

              END

              CLOSE SubAnalysis
              DEALLOCATE SubAnalysis

              

       END --Finish SubAnalysis Loop and go to next stock record


ELSE IF @SubAnalysisTracked<>1

       BEGIN --Go into non-sub analysis tracked loop

                           --First store stock record in temp table created earlier

                           insert into TAG_STOCKLIST_REPAIRED values(
                           @StockCode
                           ,'NOT USED'
                           ,@StockPhysical
                           ,@StockAllocated
                           ,@QtyNeeded)
                                                  
                           
                           --Clear down all existing inward movements so we reset from scratch

                     
                           update stk_movements
                           set sm_fifo_qty=round((sm_quantity*sm_qtyunit),@QuantityDPS), sm_fifo_allocated=1
                           where sm_stock_code=@StockCode
                           and sm_batch_flag<>1
                           and sm_status='I'
                           and sm_fifo_allocated=0
                           and sm_type<>'L'

                                  --Build Stock Movement List using cursor

                                  DECLARE StockMovements CURSOR LOCAL FOR

                                         select sm_primary
                                         ,round((sm_quantity*sm_qtyunit),@QuantityDPS)
                                         from stk_movements
                                         where sm_stock_code=@StockCode
                                         and sm_batch_flag<>1
                                         and sm_status='I'
                                         and sm_type<>'L'
                                         order by sm_primary desc

                                  OPEN StockMovements
              
                                  FETCH NEXT FROM StockMovements INTO 
                                   @MovePrimary
                                  ,@MoveQuantity
                                  
                                  WHILE @@FETCH_STATUS > -1

                                  BEGIN --Loop through stock movements

                                                IF @MoveQuantity>=(@QtyNeeded-@AccumulatedQty) --This movement fulfulls required stock so don't continue after this one
                                                       
                                                       BEGIN
                                                              update stk_movements
                                                              set  sm_fifo_qty=(@MoveQuantity-(@QtyNeeded-@AccumulatedQty))
                                                              ,sm_fifo_allocated=0
                                                              where sm_primary=@MovePrimary
                                                              and @QtyNeeded>0 --don't update movements for records with negative stock
                                                       BREAK
                                                
                                                END    

                                                ELSE --This movement does not fulfill the stock we need so accumulate quantity and loop to next movement
                                                              
                                                              update stk_movements
                                                              set    sm_fifo_qty=0
                                                              ,sm_fifo_allocated=0
                                                              where sm_primary=@MovePrimary

                                                              set @AccumulatedQty=round((@AccumulatedQty+@MoveQuantity),@QuantityDPS)
                                                                                                
                                                
                                  FETCH NEXT FROM StockMovements INTO 
                                  @MovePrimary
                                  ,@MoveQuantity
                                  
                                  END

                                  CLOSE StockMovements
                                  DEALLOCATE StockMovements  




       END --Finish non-sub analysis loop and go to next stock record

FETCH NEXT FROM StockRecord INTO                
               @StockCode
              ,@SubAnalysisTracked
              ,@StockPhysical
              ,@StockAllocated
              ,@QtyNeeded
              ,@AccumulatedQty

END

CLOSE StockRecord
DEALLOCATE StockRecord

--Finally, return list of updated records or apt message if none:

IF (select count(*) from TAG_STOCKLIST_REPAIRED)>0
       BEGIN
              select 'The below stock records were updated...'
              select * from TAG_STOCKLIST_REPAIRED
              order by StockCode, SubAnalysis
       END
ELSE
       BEGIN
              PRINT 'No records were found that need recalculating.'
       END

drop table TAG_STOCKLIST_REPAIRED




create procedure  SDK_WMS_ALLOCATE_STOCK_TO_ORDER_S
/*
** Stored Procedure
**
** Written     :  05/08/2015 NC
** Last Amended:  04/11/15 NC; 21/04/16 NC
**
*/
  @PS_UserId            varchar(4)
, @PS_OrderNumber       int               -- Order Number
, @PS_InsufficientStock bit = NULL  out
, @PS_AutoAllocate      bit = NULL
, @PS_LastLineWithInsufficientStock int = NULL out -- OD_PRIMARY of last line with InsufficientStock so that we can tell if it is new line or not.

as
declare
   @LS_OH_BATCH_FLAG                bit
 , @LS_OH_TYPE                      varchar(1)
 , @LS_OH_PRIORITY                  tinyint
 , @LS_OrderType                    varchar(20)
 , @LS_QUANTITY_DPS                 tinyint
 , @LS_AutoAllocate                 bit
 , @LS_WMSS_PICK_RESERVED_QUANTITY  bit
 , @LS_WMSS_SITE_ANALYSIS           varchar(40)
 , @LS_OD_PRIMARY                   float
 , @LS_OutstandingQtyToDeliver      decimal(24,8)
 , @LS_OD_STOCK_CODE                varchar(25)
 , @LS_OrderSite                    varchar(10)
 , @LS_STK_MULTILOCATN              bit
 , @LS_OrderHoldRef                 varchar(20)
 , @LS_STK_PRIMARY                  float
 , @LS_WMR_QUANTITY                 decimal(24,8)
 , @LS_WMR_STOCK_LINK               float
 , @LS_AlocationSite                varchar(20)
 , @LS_QtyOutstandingToAllocate     decimal(24,8)
 , @LS_Physical                     decimal(24,8)
 , @LS_StockAllocationQuantity      decimal(24,8)
 , @LS_StockWoAllocationQuantity    decimal(24,8)
 , @LS_UnallocatedHoldQty           decimal(24,8)
 , @LS_UnallocatedHoldRefQty        decimal(24,8)
 , @LS_AvailableQty                 decimal(24,8)
 , @LS_QtyToAllocate                decimal(24,8)
 , @LS_OH_PRIMARY                   float
 , @LS_OriginalAlocQty              decimal(24,8)
 , @LS_TotalAllocPickQty            decimal(24,8)
 , @LS_RemainingOverAllocPickQty    decimal(24,8)
 , @LS_AllocPickQty                 decimal(24,8)
 , @LS_PickNo                       int


select 
      @LS_QUANTITY_DPS = QUANTITY_DPS
   from 
      SYS_DATAINFO
   where 
      SYS_PRIMARY = 1

select 
      @LS_AutoAllocate                = WMSS_AUTO_RESERVE_STOCK
    , @LS_WMSS_PICK_RESERVED_QUANTITY = WMSS_PICK_RESERVED_QUANTITY
    , @LS_WMSS_SITE_ANALYSIS          = WMSS_SITE_ANALYSIS
   from 
      SDK_WMS_SETTINGS
   where 
      WMSS_PRIMARY = 1

if @LS_WMSS_PICK_RESERVED_QUANTITY = 0
   begin
      raiserror('Only able to allocate stock when the option to ''Only pick reserved quantity'' is on.',16,1,@PS_OrderNumber)
      return 99
   end

if @PS_AutoAllocate is NULL
   set @PS_AutoAllocate = @LS_AutoAllocate

select
       @LS_OH_BATCH_FLAG = OH_BATCH_FLAG
     , @LS_OH_PRIORITY   = OH_PRIORITY
     , @LS_OH_TYPE       = OH_TYPE
     , @LS_OH_PRIMARY    = OH_PRIMARY
   from ORD_HEADER 
   where OH_ORDER_NUMBER = @PS_OrderNumber

if @@rowcount = 0
   begin
      raiserror('Unable to find an order with an order number of %u to allocate stock to.',16,1,@PS_OrderNumber)
      return 99
   end
--if @LS_OH_BATCH_FLAG = 0
--   begin
--      raiserror('Order number %u is nolonger batched, so it is nolonger possible to allocate stock to it.',16,1,@PS_OrderNumber)
--      return 99
--   end
if @LS_OH_TYPE = 'C'
   begin
      raiserror('Order number %u is a Credit Note, so it is not possible to allocate stock to it.',16,1,@PS_OrderNumber)
      return 99
   end
if @LS_OH_PRIORITY > 0
   begin
      set @LS_OrderType = case @LS_OH_PRIORITY when 4 then 'an Estimate' when 3 then 'a Pro Forma' else 'a Progress Claim' end
      raiserror('Order number %u is %s, so it is not possible to allocate stock to it.',16,1,@PS_OrderNumber,@LS_OrderType)
      return 99
   end

set @PS_InsufficientStock = 0
set @LS_OD_PRIMARY = 0

begin tran

while (1=1)
   begin

      select top 1
            @LS_OD_PRIMARY                = OD_PRIMARY
         ,  @LS_OutstandingQtyToDeliver   = case when @LS_OH_BATCH_FLAG = 0 then 0 else dbo.AA_QUANTITY_DPS_F((OD_QTYORD - OD_QTYDELVD) * OD_QTYUNIT) end
         ,  @LS_OD_STOCK_CODE             = OD_STOCK_CODE
         ,  @LS_OrderSite                 = isnull(WMSPD_SITE,'')
         ,  @LS_STK_MULTILOCATN           = STK_MULTILOCATN
         ,  @LS_OrderHoldRef              = WMSPD_HOLD_REF
         ,  @LS_STK_PRIMARY               = STK_PRIMARY
         from ORD_DETAIL
            join SDK_WMS_SEND_STATUS on WMSP_TRAN_PRIMARY = @LS_OH_PRIMARY and WMSP_TRAN_TYPE='SOP' 
            join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY
            join STK_STOCK on STKCODE = OD_STOCK_CODE
         where OD_ENTRY_TYPE = 'S' and OD_ORDER_NUMBER = @PS_OrderNumber
            and OD_STATUS < 2
            and OD_PRIMARY > @LS_OD_PRIMARY
         order by OD_PRIMARY   
      
      if @@rowcount = 0
         begin
            break
         end
      
      set @LS_WMR_QUANTITY = 0
      
      select
            @LS_WMR_QUANTITY   = WMR_QUANTITY
          , @LS_WMR_STOCK_LINK = WMR_STOCK_LINK
          , @LS_AlocationSite  = WMR_SITE
         from SDK_WMS_STOCK_RESERVATION
         where WMR_ORDER_DETAIL_LINK = @LS_OD_PRIMARY
       
      set @LS_OriginalAlocQty = @LS_WMR_QUANTITY
      
      if @LS_WMR_STOCK_LINK <> @LS_STK_PRIMARY
         or @LS_AlocationSite <> @LS_OrderSite
         or (@LS_OutstandingQtyToDeliver <= 0 and @LS_WMR_QUANTITY > 0)
         begin
            delete SDK_WMS_STOCK_RESERVATION 
               where WMR_ORDER_DETAIL_LINK = @LS_OD_PRIMARY
               
            if @@error<>0
               begin
                  raiserror('Unable to delete from table SDK_WMS_STOCK_RESERVATION.',16,1)
                  rollback tran
                  return 99
               end
            set @LS_WMR_QUANTITY = 0
         end
      
      else if @LS_WMR_QUANTITY - @LS_OutstandingQtyToDeliver > (0.5/power(10,@LS_QUANTITY_DPS))
         begin
            update SDK_WMS_STOCK_RESERVATION 
               set WMR_QUANTITY = @LS_OutstandingQtyToDeliver 
               where WMR_ORDER_DETAIL_LINK = @LS_OD_PRIMARY
            
            if @@error<>0
               begin
                  raiserror('Unable to update table SDK_WMS_STOCK_RESERVATION.',16,1)
                  rollback tran
                  return 99
               end
            set @LS_WMR_QUANTITY = @LS_OutstandingQtyToDeliver
         end
         
      if @LS_OutstandingQtyToDeliver - @LS_WMR_QUANTITY > (0.5/power(10,@LS_QUANTITY_DPS))
         and @PS_AutoAllocate = 1
         begin
            set @LS_QtyOutstandingToAllocate = @LS_OutstandingQtyToDeliver - @LS_WMR_QUANTITY
            
            if @LS_STK_MULTILOCATN = 1 and @LS_WMSS_SITE_ANALYSIS <> ''
               begin
                  select 
                        @LS_Physical = isnull(sum(LOC_PHYSICAL + LOC_QTYPRINTED),0) 
                     from 
                        STK_LOCATION 
                     where 
                        LOC_STOCK_CODE = @LS_OD_STOCK_CODE
                        and 
                           case @LS_WMSS_SITE_ANALYSIS
                              when 'LOC_USERSORT1' then LOC_USERSORT1
                              when 'LOC_USERSORT2' then LOC_USERSORT2
                              when 'LOC_USERSORT3' then LOC_USERSORT3
                              when 'LOC_USERSORT4' then LOC_USERSORT4
                              when 'LOC_USERSORT5' then LOC_USERSORT5
                              when 'LOC_USERSORT6' then LOC_USERSORT6
                           end  
                           = @LS_OrderSite
                  
                  set @LS_StockAllocationQuantity = 0
                  set @LS_StockWoAllocationQuantity = 0
                  
                  select
                        @LS_StockAllocationQuantity = AllocationQuantity
                     from
                        SDK_WMS_STOCK_SITE_RESERVATION_VIEW 
                     where
                        StockLink = @LS_STK_PRIMARY
                        and Site = @LS_OrderSite;

                  select
                        @LS_StockWoAllocationQuantity = AllocationQuantity
                     from
                        SDK_WMS_STOCK_WO_SITE_RESERVATION_VIEW 
                     where
                        StockLink = @LS_STK_PRIMARY
                        and Site = @LS_OrderSite;
                        
                  with cte as
                     (select 
                           isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) as HoldQty
                         , OD_USRCHAR3 as HoldRef
                        from 
                           ORD_HEADER 
                           join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                           join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                           join STK_LOCATION on LOC_STOCK_CODE = OD_STOCK_CODE and LOC_CODE = OD_LOCATN
                        where 
                           OH_BATCH_FLAG = 1 
                           and OH_BATCH_REF = 'ONHOLD-ZZ'
                           and OH_TYPE = 'O'
                           and OD_STOCK_CODE = @LS_OD_STOCK_CODE
                           and case @LS_WMSS_SITE_ANALYSIS
                                 when 'LOC_USERSORT1' then LOC_USERSORT1
                                 when 'LOC_USERSORT2' then LOC_USERSORT2
                                 when 'LOC_USERSORT3' then LOC_USERSORT3
                                 when 'LOC_USERSORT4' then LOC_USERSORT4
                                 when 'LOC_USERSORT5' then LOC_USERSORT5
                                 when 'LOC_USERSORT6' then LOC_USERSORT6
                               end  
                               = @LS_OrderSite
                        group by 
                           OD_USRCHAR3
                     )
                  , cte2 as
                     (select 
                           sum(WMR_QUANTITY) as AllocHoldQty -- this may include unheld stock if more is allocated to an order line with a hold ref then is held with that reference
                         , WMSPD_HOLD_REF    as AllocHoldRef
                        from 
                           ORD_HEADER 
                           inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                           join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE='SOP' 
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                        where 
                           OD_TYPE = 'O'
                           and OD_ENTRY_TYPE = 'S' 
                           and OD_QTYDELVD < OD_QTYORD 
                           and OH_BATCH_FLAG = 1 
                           and OH_PRIORITY < 3 
                           and WMSPD_HOLD_REF<>''
                           and OD_STOCK_CODE = @LS_OD_STOCK_CODE
                           and WMSPD_SITE = @LS_OrderSite
                        group by
                           WMSPD_HOLD_REF
                     )
                  , cte3 as
                     (select sum(WMWR_QUANTITY) WoAllocHoldQty
                          , WMSPD_HOLD_REF      WoAllocHoldRef
                        from WO_ORDERS
                           inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE='S'
                           inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                           join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE='WOP'
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                        where 
                           WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED
                           and WO_STATUS < 10
                           and WMSPD_HOLD_REF <> ''
                           and STKCODE = @LS_OD_STOCK_CODE
                           and WMSPD_SITE = @LS_OrderSite
                        group by WMSPD_HOLD_REF
                     )
                  select @LS_UnallocatedHoldQty    = isnull(
                                                     sum(case 
                                                            when isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0) >= HoldQty then 0 
                                                            else HoldQty - isnull(AllocHoldQty,0) - isnull(WoAllocHoldQty,0)
                                                         end
                                                        ),0)
                       , @LS_UnallocatedHoldRefQty = isnull(
                                                     sum(case 
                                                            when isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0) >= HoldQty then 0 
                                                            when HoldRef = @LS_OrderHoldRef then HoldQty - isnull(AllocHoldQty,0) - isnull(WoAllocHoldQty,0)
                                                            else 0 
                                                         end
                                                        ),0)
                     from cte
                        left join cte2 on AllocHoldRef   = HoldRef
                        left join cte3 on WoAllocHoldRef = HoldRef;
                        
               end
            else
               begin
                  select 
                        @LS_Physical = STK_PHYSICAL + STK_QTYPRINTED
                     from  
                        STK_STOCK
                     where 
                        STK_PRIMARY = @LS_STK_PRIMARY
                        
                  set @LS_StockAllocationQuantity = 0
                  set @LS_StockWoAllocationQuantity = 0
                  
                  select
                        @LS_StockAllocationQuantity = AllocationQuantity
                     from
                        SDK_WMS_STOCK_RESERVATION_VIEW 
                     where
                        StockLink = @LS_STK_PRIMARY;
                  
                  select
                        @LS_StockWoAllocationQuantity = AllocationQuantity
                     from
                        SDK_WMS_STOCK_WO_RESERVATION_VIEW 
                     where
                        StockLink = @LS_STK_PRIMARY;
                  
                  with cte as
                     (select 
                           isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) as HoldQty
                         , OD_USRCHAR3 as HoldRef
                        from 
                           ORD_HEADER 
                           join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                           join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                        where 
                           OH_BATCH_FLAG = 1 
                           and OH_BATCH_REF = 'ONHOLD-ZZ'
                           and OH_TYPE = 'O'
                           and OD_STOCK_CODE = @LS_OD_STOCK_CODE
                        group by 
                           OD_USRCHAR3
                     )
                  , cte2 as
                     (select 
                           sum(WMR_QUANTITY) as AllocHoldQty -- this may include unheld stock if more is allocated to an order line with a hold ref then is held with that reference
                         , WMSPD_HOLD_REF    as AllocHoldRef
                        from 
                           ORD_HEADER 
                           inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                           join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE='SOP' 
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                        where 
                           OD_TYPE = 'O'
                           and OD_ENTRY_TYPE = 'S' 
                           and OD_QTYDELVD < OD_QTYORD 
                           and OH_BATCH_FLAG = 1 
                           and OH_PRIORITY < 3 
                           and WMSPD_HOLD_REF<>''
                           and OD_STOCK_CODE = @LS_OD_STOCK_CODE
                        group by
                           WMSPD_HOLD_REF
                     )
                  , cte3 as
                     (select sum(WMWR_QUANTITY) WoAllocHoldQty
                          , WMSPD_HOLD_REF      WoAllocHoldRef
                        from WO_ORDERS
                           inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE='S'
                           inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                           join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE='WOP'
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                        where 
                           WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED
                           and WO_STATUS < 10
                           and WMSPD_HOLD_REF <> ''
                           and STKCODE = @LS_OD_STOCK_CODE
                        group by WMSPD_HOLD_REF
                     )
                  select @LS_UnallocatedHoldQty    = isnull(
                                                     sum(case 
                                                            when isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0) >= HoldQty then 0 
                                                            else HoldQty - isnull(AllocHoldQty,0) - isnull(WoAllocHoldQty,0)
                                                         end
                                                        ),0)
                       , @LS_UnallocatedHoldRefQty = isnull(
                                                     sum(case 
                                                            when isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0) >= HoldQty then 0 
                                                            when HoldRef = @LS_OrderHoldRef then HoldQty - isnull(AllocHoldQty,0) - isnull(WoAllocHoldQty,0) 
                                                            else 0 
                                                         end
                                                        ),0)
                     from cte
                        left join cte2 on AllocHoldRef   = HoldRef
                        left join cte3 on WoAllocHoldRef = HoldRef;

               end
            
            if @LS_OrderHoldRef <> ''
               begin
                  set @LS_AvailableQty = @LS_Physical - @LS_StockAllocationQuantity - @LS_StockWoAllocationQuantity - @LS_UnallocatedHoldQty + @LS_UnallocatedHoldRefQty
               end
            else
               begin
                  set @LS_AvailableQty = @LS_Physical - @LS_StockAllocationQuantity - @LS_StockWoAllocationQuantity - @LS_UnallocatedHoldQty
               end
            
            if @LS_AvailableQty - @LS_QtyOutstandingToAllocate > (-0.5/power(10,@LS_QUANTITY_DPS))
               set @LS_QtyToAllocate = @LS_QtyOutstandingToAllocate
            else
               select @LS_QtyToAllocate = @LS_AvailableQty
                  , @PS_InsufficientStock = 1
                  , @PS_LastLineWithInsufficientStock = @LS_OD_PRIMARY
               
            if @LS_WMR_QUANTITY = 0 and @LS_QtyToAllocate > 0
               begin
                  set @LS_WMR_QUANTITY = @LS_QtyToAllocate
                  insert into SDK_WMS_STOCK_RESERVATION
                     (WMR_ORDER_DETAIL_LINK, WMR_STOCK_LINK , WMR_QUANTITY    , WMR_SITE     )
                  values
                     (@LS_OD_PRIMARY       , @LS_STK_PRIMARY, @LS_WMR_QUANTITY, @LS_OrderSite)  
                  
                  if @@error<>0
                     begin
                        raiserror('Unable to insert into table SDK_WMS_STOCK_RESERVATION.',16,1)
                        rollback tran
                        return 99
                     end
               end
            else
               begin
                  set @LS_WMR_QUANTITY = @LS_QtyToAllocate + @LS_WMR_QUANTITY
                  
                  update SDK_WMS_STOCK_RESERVATION 
                     set WMR_QUANTITY = @LS_WMR_QUANTITY
                     where WMR_ORDER_DETAIL_LINK = @LS_OD_PRIMARY
                  
                  if @@error<>0
                     begin
                        raiserror('Unable to update table SDK_WMS_STOCK_RESERVATION.',16,1)
                        rollback tran
                        return 99
                     end
               end
         end
      if @LS_OriginalAlocQty > 0
         begin
            select
                  @LS_TotalAllocPickQty = isnull(sum(WMSPR_ALLOCATION_QUANTITY),0) 
               from 
                  SDK_WMS_SOP_PICK_REQUESTS 
               where 
                  WMSPR_ORDER_DETAIL_LINK = @LS_OD_PRIMARY
            
            set @LS_RemainingOverAllocPickQty = @LS_TotalAllocPickQty - @LS_WMR_QUANTITY
            
            while @LS_RemainingOverAllocPickQty > 0
               begin
                  select top 1 
                        @LS_PickNo        = WMSPR_PICK_REQUEST_NUMBER
                      , @LS_AllocPickQty  = WMSPR_ALLOCATION_QUANTITY 
                     from 
                        SDK_WMS_SOP_PICK_REQUESTS 
                     where 
                        WMSPR_ORDER_DETAIL_LINK = @LS_OD_PRIMARY
                        and WMSPR_ALLOCATION_QUANTITY > 0 
                     order by 
                        WMSPR_PICK_REQUEST_NUMBER desc
                  
                  if @@rowcount = 0
                     break
                  
                  if @LS_AllocPickQty > @LS_RemainingOverAllocPickQty
                     begin
                        set @LS_AllocPickQty = @LS_AllocPickQty - @LS_RemainingOverAllocPickQty
                        set @LS_RemainingOverAllocPickQty = 0
                     end
                  else
                     begin
                        set @LS_RemainingOverAllocPickQty = @LS_RemainingOverAllocPickQty - @LS_AllocPickQty
                        set @LS_AllocPickQty = 0
                     end
                     
                  update 
                        SDK_WMS_SOP_PICK_REQUESTS  
                     set 
                        WMSPR_ALLOCATION_QUANTITY = @LS_AllocPickQty
                     where 
                        WMSPR_ORDER_DETAIL_LINK       = @LS_OD_PRIMARY
                        and WMSPR_PICK_REQUEST_NUMBER = @LS_PickNo

                  if @@error<>0
                     begin
                        raiserror('Unable to update table SDK_WMS_SOP_PICK_REQUESTS.',16,1)
                        rollback tran
                        return 99
                     end
               end
         end
   end -- end of detail loop

commit tran

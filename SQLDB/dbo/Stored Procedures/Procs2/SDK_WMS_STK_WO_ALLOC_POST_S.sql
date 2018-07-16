
create procedure  SDK_WMS_STK_WO_ALLOC_POST_S
/*
** Stored Procedure
**
** Written     :  06/05/2014 NC
** Last Amended:  10/09/2014 NC
**
*/
-- Declare all Parameters
   @PS_UserID                          varchar(4)                    -- User
,  @PS_ComponentPrimary                int
,  @PS_QtyToAllocate                   decimal(24,8)
,  @PS_QtyOrdered                      decimal(24,8)  = NULL
,  @PS_QtyIssued                       decimal(24,8)  = NULL
,  @PS_QtyAlreadyAllocated             decimal(24,8)  = NULL
,  @PS_StockCode                       varchar(25)    = NULL
,  @PS_RaiseValidationErrors           bit            = 1
,  @PS_ValidationError                 int            = NULL out  -- 1= Allocation Quantity Exceeds Order Quantity

as

declare
   @LS_QtyOrdered                      decimal(24,8)
,  @LS_QtyIssued                       decimal(24,8)
,  @LS_QtyAlreadyAllocated             decimal(24,8)
,  @LS_StockCode                       varchar(25)
,  @LS_StockPrimary                    int
,  @LS_NewAllocQty                     decimal(24,8)
,  @LS_RowCount                        int
,  @LS_Error                           int
,  @LS_OrderNumber                     int
,  @LS_OrderStatus                     tinyint
,  @LS_AllocationQuantity              decimal(24,8)
,  @LS_WoAllocationQuantity            decimal(24,8)
,  @LS_Physical                        decimal(24,8)
,  @LS_STK_NEGATIVE                    bit
,  @LS_ErrorMessage                    varchar(2000)
,  @LS_WMWR_STOCK_LINK                 int
,  @LS_Site                            varchar(10)
,  @LS_STK_MULTILOCATN                 bit
,  @LS_WMSS_SITE_ANALYSIS              varchar(20)
,  @LS_WMSS_DEFAULT_SITE               varchar(10)
set @PS_ValidationError = 0 

select @LS_STK_NEGATIVE = isnull(STK_NEGATIVE,0)
   from SYS_DATAINFO
   where SYS_PRIMARY = 1

select @LS_WMSS_SITE_ANALYSIS = WMSS_SITE_ANALYSIS
   , @LS_WMSS_DEFAULT_SITE = WMSS_DEFAULT_SITE
   from SDK_WMS_SETTINGS
   where WMSS_PRIMARY =1

select
      @LS_QtyOrdered          = dbo.AA_QUANTITY_DPS_F(WC_QUANTITY_REQUIRED)
   ,  @LS_QtyIssued           = dbo.AA_QUANTITY_DPS_F(WC_QUANTITY_ISSUED)
   ,  @LS_StockCode           = isnull(STKCODE,'')
   ,  @LS_OrderNumber         = WC_ORDER_NUMBER
   ,  @LS_OrderStatus         = WO_STATUS
   ,  @LS_Site                = (select max(WMSPD_SITE) 
                                    from SDK_WMS_SEND_STATUS
                                       join 
                                         SDK_WMS_SEND_STATUS_DETAIL on WC_PRIMARY = WMSPD_TRAN_PRIMARY and WMSPD_WMSP_PRIMARY = WMSP_PRIMARY
                           where WMSP_TRAN_PRIMARY = WC_ORDER_NUMBER and WMSP_TRAN_TYPE = 'WOP'
                        )
   from WO_COMPONENTS
      join WO_ORDERS on WO_ORDER_NUMBER = WC_ORDER_NUMBER
      left join STK_STOCK on STK_PRIMARY = WC_PART_LINK and WC_TYPE = 'S'
   where 
      WC_PRIMARY = @PS_ComponentPrimary

select 
   @LS_RowCount = @@rowcount
,  @LS_Error    = @@error

if @LS_Error <> 0
   begin
      raiserror('Failed to query WO_COMPONENTS.',16,1)
      return 99
   end

if @LS_RowCount = 0
   begin
      if @PS_RaiseValidationErrors = 1
         raiserror('Could not find a works order component line with a primary of %u. Maybe it has been deleted.',16,1,@PS_ComponentPrimary)
      set @PS_ValidationError = 1
      return 0
   end

if @LS_Site is null or @LS_Site = ''
   set @LS_Site = @LS_WMSS_DEFAULT_SITE

if isnull(@PS_QtyToAllocate,0) = 0
   begin
      set @LS_ErrorMessage = 'The quantity to allocate to the works order component line with a primary of '
         + convert(varchar(30),@PS_ComponentPrimary)
         + ' has not been specified.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 11
      return 0
   end

if @LS_QtyOrdered <> @PS_QtyOrdered and @PS_QtyOrdered is not null
   begin
      set @LS_ErrorMessage = 'The quantity required ('
         + convert(varchar(30),@LS_QtyOrdered)
         + ') on the works order component line with a primary of '
         + convert(varchar(30),@PS_ComponentPrimary)
         + ' does not match the quantity that had been required when the allocation was started ('
         + convert(varchar(30),@PS_QtyOrdered)
         + '), making this allocation untenable. It was probably changed by another user.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 2
      return 0
   end

if @LS_QtyIssued <> @PS_QtyIssued and @PS_QtyIssued is not null
   begin
      set @LS_ErrorMessage = 'The quantity issued ('
         + convert(varchar(30),@LS_QtyIssued)
         + ') on the works order component line with a primary of '
         + convert(varchar(30),@PS_ComponentPrimary)
         + ' does not match the quantity that had been issued when the allocation was started ('
         + convert(varchar(30),@PS_QtyIssued)
         + '), making this allocation untenable. It was probably changed by another user.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 3
      return 0
   end

if @LS_StockCode <> @PS_StockCode and @PS_StockCode is not null
   begin -- in theory this should not occurr
      if @PS_RaiseValidationErrors = 1
         raiserror('The Stock record %s on the works order component line with a primary of %u is not the stock record %s you are trying to allocate to it.'
         ,16,1,@LS_StockCode,@PS_ComponentPrimary,@PS_StockCode)
      set @PS_ValidationError = 4
      return 0
   end

if @LS_OrderStatus in (10,14,15)
   begin -- in theory this should not occurr
      if @PS_RaiseValidationErrors = 1
         raiserror('The works order component line with a primary of %u is complete or has been closed. It is therefore not possible to allocate stock to it.'
         ,16,1,@PS_ComponentPrimary)
      set @PS_ValidationError = 6
      return 0
   end

select
     @LS_StockPrimary    = STK_PRIMARY
   , @LS_Physical        = dbo.AA_QUANTITY_DPS_F(STK_PHYSICAL)
   , @LS_STK_MULTILOCATN = STK_MULTILOCATN
   from STK_STOCK with (nolock)
   where STKCODE = @LS_StockCode

if @@error <> 0
   begin
      raiserror('Failed to query STK_STOCK.',16,1)
      return 99
   end

set @LS_AllocationQuantity = 0
set @LS_WoAllocationQuantity = 0

if @LS_WMSS_SITE_ANALYSIS <> '' and @LS_STK_MULTILOCATN = 1
   begin
      select 
            @LS_AllocationQuantity = AllocationQuantity
         from
            SDK_WMS_STOCK_SITE_RESERVATION_VIEW
         where
            StockLink = @LS_StockPrimary and Site = @LS_Site
            
      select 
            @LS_WoAllocationQuantity = AllocationQuantity
         from
            SDK_WMS_STOCK_WO_SITE_RESERVATION_VIEW
         where
            StockLink = @LS_StockPrimary and Site = @LS_Site
            
      select @LS_Physical = dbo.AA_QUANTITY_DPS_F(sum(LOC_PHYSICAL))
         from STK_LOCATION
         where LOC_STOCK_CODE = @LS_StockCode
            and case @LS_WMSS_SITE_ANALYSIS
                   when 'LOC_USERSORT1' then LOC_USERSORT1
                   when 'LOC_USERSORT2' then LOC_USERSORT2
                   when 'LOC_USERSORT3' then LOC_USERSORT3
                   when 'LOC_USERSORT4' then LOC_USERSORT4
                   when 'LOC_USERSORT5' then LOC_USERSORT5
                   when 'LOC_USERSORT6' then LOC_USERSORT6
                end 
                = @LS_Site
   end
else
   begin
      select 
       @LS_AllocationQuantity = AllocationQuantity
         from
       SDK_WMS_STOCK_RESERVATION_VIEW
         where
       StockLink = @LS_StockPrimary
       
      select 
            @LS_WoAllocationQuantity = AllocationQuantity
         from
            SDK_WMS_STOCK_WO_RESERVATION_VIEW
         where
            StockLink = @LS_StockPrimary
   end
   
set @LS_QtyAlreadyAllocated = 0

select
      @LS_QtyAlreadyAllocated  = dbo.AA_QUANTITY_DPS_F(WMWR_QUANTITY)
   ,  @LS_WMWR_STOCK_LINK      = WMWR_STOCK_LINK
   from SDK_WMS_STOCK_WO_RESERVATION
   where 
      WMWR_COMPONENT_LINK = @PS_ComponentPrimary

if @@error <> 0
   begin
      raiserror('Failed to query SDK_WMS_STOCK_WO_RESERVATION.',16,1)
      return 99
   end

if @LS_QtyAlreadyAllocated <> @PS_QtyAlreadyAllocated and @PS_QtyAlreadyAllocated is not null
   begin
      set @LS_ErrorMessage = 'The quantity of stock allocated ('
         + convert(varchar(30),@LS_QtyAlreadyAllocated)
         + ') to the works order component line with a primary of '
         + convert(varchar(30),@PS_ComponentPrimary)
         + ' does not match the quantity that had been allocated when the allocation was started ('
         + convert(varchar(30),@PS_QtyAlreadyAllocated)
         + '), making this allocation untenable. It was probably changed by another user.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 7
      return 0
   end


if @PS_QtyToAllocate > 0
   and @LS_STK_NEGATIVE = 0
   and @LS_Physical - @LS_AllocationQuantity - @LS_WoAllocationQuantity < @PS_QtyToAllocate
   begin
      if @LS_WMSS_SITE_ANALYSIS <> '' and @LS_STK_MULTILOCATN = 1
         set @LS_ErrorMessage = 'There is not enough stock ' 
            + @LS_StockCode 
            + ' at site ' + @LS_Site
            + ' to allocate ' + convert(varchar(30),@PS_QtyToAllocate) 
            + ' to the works order component line with a primary of ' 
            + convert(varchar(30),@PS_ComponentPrimary)

      else
         set @LS_ErrorMessage = 'There is not enough stock ' 
            + @LS_StockCode 
            + ' to allocate ' + convert(varchar(30),@PS_QtyToAllocate) 
            + ' to the works order component line with a primary of ' 
            + convert(varchar(30),@PS_ComponentPrimary)
         + '. Another user may have just allocated it to another order or moved some out of stock.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 8
      return 0
   end

set @LS_NewAllocQty = dbo.AA_QUANTITY_DPS_F(@LS_QtyAlreadyAllocated + @PS_QtyToAllocate)

if @LS_NewAllocQty > @LS_QtyOrdered - @LS_QtyIssued
   begin
      set @LS_ErrorMessage = 'It is not possible to allocate '
         + convert(varchar(30),@PS_QtyToAllocate)
         + ' to the works order component line with a primary of '
         + convert(varchar(30),@PS_ComponentPrimary)
         + ' as this would make the total quantity allocated to it greater than its quantity outstanding to issue ('
         + convert(varchar(30),@LS_QtyOrdered - @LS_QtyIssued)
         + ').'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 12
      return 0
   end

if @LS_NewAllocQty < 0
   begin
      set @LS_ErrorMessage = 'It is not possible to allocate '
         + convert(varchar(30),@PS_QtyToAllocate)
         + ' to the works order component line with a primary of '
         + convert(varchar(30),@PS_ComponentPrimary)
         + ' as this would make the total quantity allocated to it negative.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 13
      return 0
   end

if @LS_WMWR_STOCK_LINK is not null and @LS_WMWR_STOCK_LINK <> @LS_StockPrimary
   begin
      -- This should never happen, but just incase check that enough stock for new and existing allocations.
      set @LS_NewAllocQty = 0
   end

begin tran

if @LS_WMWR_STOCK_LINK is null and @LS_NewAllocQty > 0
   begin
      insert into SDK_WMS_STOCK_WO_RESERVATION
      (
           WMWR_COMPONENT_LINK
         , WMWR_STOCK_LINK       
         , WMWR_QUANTITY
         , WMWR_SITE
      )
      values
      (
           @PS_ComponentPrimary
         , @LS_StockPrimary
         , @LS_NewAllocQty
         , @LS_Site
      )
      if @@error <> 0
         begin
            raiserror('Failed to insert into table SDK_WMS_STOCK_WO_RESERVATION.',16,1)
            rollback tran
            return 99
         end
   end
else if @LS_NewAllocQty > 0
   begin
      update SDK_WMS_STOCK_WO_RESERVATION
         set WMWR_QUANTITY   = @LS_NewAllocQty
           , WMWR_STOCK_LINK = @LS_StockPrimary
           , WMWR_SITE       = @LS_Site
         where
            WMWR_COMPONENT_LINK = @PS_ComponentPrimary
            and dbo.AA_QUANTITY_DPS_F(WMWR_QUANTITY) = @LS_QtyAlreadyAllocated
      select 
         @LS_RowCount = @@rowcount
      ,  @LS_Error    = @@error

      if @LS_Error <> 0
         begin
            raiserror('Failed to update table SDK_WMS_STOCK_WO_RESERVATION.',16,1)
            rollback tran
            return 99
         end

      if @LS_RowCount = 0
         begin
            select  @LS_WMWR_STOCK_LINK = WMWR_STOCK_LINK
               from SDK_WMS_STOCK_WO_RESERVATION
               where 
                  WMWR_COMPONENT_LINK = @PS_ComponentPrimary
            if @@rowcount = 0
               begin
                  set @LS_ErrorMessage = 'There is nolonger any stock allocated to the works order component line with a primary of '
                     + convert(varchar(30),@PS_ComponentPrimary)
                     + '. This does not match the quantity that had been allocated when the allocation was started ('
                     + convert(varchar(30),@PS_QtyAlreadyAllocated)
                     + '), making this allocation untenable. Another user must have changed it.'
                  if @PS_RaiseValidationErrors = 1
                     raiserror(@LS_ErrorMessage,16,1)
                  set @PS_ValidationError = 9
                  return 0
               end
            else
               begin
                  set @LS_ErrorMessage = 'The quantity of stock allocated to the works order component line with a primary of '
                     + convert(varchar(30),@PS_ComponentPrimary)
                     + ' nolonger matches the quantity that had been allocated when the allocation was started ('
                     + convert(varchar(30),@PS_QtyAlreadyAllocated)
                     + '), making this allocation untenable. Another user must have changed it.'
                  if @PS_RaiseValidationErrors = 1
                     raiserror(@LS_ErrorMessage,16,1)
                  set @PS_ValidationError = 10
                  return 0
               end
            return 0
         end
   end
else
   begin
      delete SDK_WMS_STOCK_WO_RESERVATION
         where 
            WMWR_COMPONENT_LINK = @PS_ComponentPrimary
      if @@error <> 0
         begin
            raiserror('Failed to delete from table SDK_WMS_STOCK_WO_RESERVATION.',16,1)
            rollback tran
            return 99
         end
   end
  
  
insert into SDK_WMS_STOCK_WO_RESERVATION_HISTORY
   (
        WMWRH_WO_ORDER_NUMBER     
      , WMWRH_COMPONENT_LINK
      , WMWRH_STOCK_LINK       
      , WMWRH_QUANTITY         
      , WMWRH_USER_PUTIN       
      , WMWRH_DATE_PUTIN
      , WMWRH_SITE
   )
   values
   (
        @LS_OrderNumber --WMRH_ORDER_NUMBER     
      , @PS_ComponentPrimary --WMRH_ORDER_DETAIL_LINK
      , @LS_StockPrimary --WMRH_STOCK_LINK       
      , @PS_QtyToAllocate --WMRH_QUANTITY         
      , @PS_UserID --WMRH_USER_PUTIN       
      , getdate() --WMRH_DATE_PUTIN
      , @LS_Site
   )

if @@error <> 0
   begin
      raiserror('Failed to insert into table SDK_WMS_STOCK_RESERVATION_HISTORY.',16,1)
      rollback tran
      return 99
   end

commit tran

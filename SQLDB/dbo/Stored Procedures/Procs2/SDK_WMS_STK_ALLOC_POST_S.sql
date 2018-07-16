
create procedure  SDK_WMS_STK_ALLOC_POST_S
/*
** Stored Procedure
**
** Written     :  06/05/2014 NC
** Last Amended:  10/09/2014 NC
**
*/
-- Declare all Parameters
   @PS_UserID                          varchar(4)                    -- User
,  @PS_OrderDetailPrimary              int
,  @PS_QtyToAllocate                   decimal(24,8)
,  @PS_QtyOrdered                      decimal(24,8)  = NULL
,  @PS_QtyDelivered                    decimal(24,8)  = NULL
,  @PS_QtyAlreadyAllocated             decimal(24,8)  = NULL
,  @PS_StockCode                       varchar(25)    = NULL
,  @PS_RaiseValidationErrors           bit            = 1
,  @PS_ValidationError                 int            = NULL out  -- 1= Allocation Quantity Exceeds Order Quantity

as

declare
   @LS_QtyOrdered                      decimal(24,8)
,  @LS_QtyDelivered                    decimal(24,8)
,  @LS_QtyAlreadyAllocated             decimal(24,8)
,  @LS_StockCode                       varchar(25)
,  @LS_StockPrimary                    int
,  @LS_NewAllocQty                     decimal(24,8)
,  @LS_RowCount                        int
,  @LS_Error                           int
,  @LS_QtyUnit                         decimal(24,8)
,  @LS_OrderNumber                     int
,  @LS_OrderStatus                     tinyint
,  @LS_OrderType                       varchar(1)
,  @LS_AllocationQuantity              decimal(24,8)
,  @LS_WoAllocationQuantity            decimal(24,8)
,  @LS_Physical                        decimal(24,8)
,  @LS_STK_NEGATIVE                    bit
,  @LS_ErrorMessage                    varchar(2000)
,  @LS_WMR_STOCK_LINK                  int
,  @LS_Site                            varchar(10)
,  @LS_STK_MULTILOCATN                 bit
,  @LS_WMSS_SITE_ANALYSIS              varchar(20)
set @PS_ValidationError = 0 

select @LS_STK_NEGATIVE = isnull(STK_NEGATIVE,0)
   from SYS_DATAINFO
   where SYS_PRIMARY = 1

select @LS_WMSS_SITE_ANALYSIS = WMSS_SITE_ANALYSIS
   from SDK_WMS_SETTINGS
   where WMSS_PRIMARY =1

select
      @LS_QtyOrdered          = dbo.AA_QUANTITY_DPS_F(OD_QTYORD)
   ,  @LS_QtyDelivered        = dbo.AA_QUANTITY_DPS_F(OD_QTYDELVD)
   ,  @LS_QtyUnit             = dbo.AA_QUANTITY_DPS_F(OD_QTYUNIT)
   ,  @LS_StockCode           = OD_STOCK_CODE
   ,  @LS_OrderNumber         = OD_ORDER_NUMBER
   ,  @LS_OrderStatus         = OD_STATUS
   ,  @LS_OrderType           = OD_TYPE
   ,  @LS_Site                = (select max(WMSPD_SITE) 
                                    from SDK_WMS_SEND_STATUS
                                       join 
                                         SDK_WMS_SEND_STATUS_DETAIL on OD_PRIMARY = WMSPD_TRAN_PRIMARY and WMSPD_WMSP_PRIMARY = WMSP_PRIMARY
                           where WMSP_TRAN_PRIMARY = OH_PRIMARY and WMSP_TRAN_TYPE = 'SOP'
                        )
   from ORD_DETAIL
      join ORD_HEADER on OH_ORDER_NUMBER = OD_ORDER_NUMBER
   where 
      OD_PRIMARY = @PS_OrderDetailPrimary

select 
   @LS_RowCount = @@rowcount
,  @LS_Error    = @@error

if @LS_Error <> 0
   begin
      raiserror('Failed to query ORD_DETAIL.',16,1)
      return 99
   end

if @LS_RowCount = 0
   begin
      if @PS_RaiseValidationErrors = 1
         raiserror('Could not find an Order detail line with a primary of %u. Maybe it has been deleted.',16,1,@PS_OrderDetailPrimary)
      set @PS_ValidationError = 1
      return 0
   end

if isnull(@PS_QtyToAllocate,0) = 0
   begin
      set @LS_ErrorMessage = 'The quantity to allocate to the Order detail line with a primary of '
         + convert(varchar(30),@PS_OrderDetailPrimary)
         + ' has not been specified.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 11
      return 0
   end

if @LS_QtyUnit <> 1 and @LS_QtyUnit <> 0
   select
         @LS_QtyOrdered          = dbo.AA_QUANTITY_DPS_F(@LS_QtyOrdered * @LS_QtyUnit)
      ,  @LS_QtyDelivered        = dbo.AA_QUANTITY_DPS_F(@LS_QtyDelivered * @LS_QtyUnit)

if @LS_QtyOrdered <> @PS_QtyOrdered and @PS_QtyOrdered is not null
   begin
      set @LS_ErrorMessage = 'The quantity ordered ('
         + convert(varchar(30),@LS_QtyOrdered)
         + ') on the Order detail line with a primary of '
         + convert(varchar(30),@PS_OrderDetailPrimary)
         + ' does not match the quantity that had been ordered when the allocation was started ('
         + convert(varchar(30),@PS_QtyOrdered)
         + '), making this allocation untenable. It was probably changed by another user.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 2
      return 0
   end

if @LS_QtyDelivered <> @PS_QtyDelivered and @PS_QtyDelivered is not null
   begin
      set @LS_ErrorMessage = 'The quantity delivered ('
         + convert(varchar(30),@LS_QtyDelivered)
         + ') on the Order detail line with a primary of '
         + convert(varchar(30),@PS_OrderDetailPrimary)
         + ' does not match the quantity that had been delivered when the allocation was started ('
         + convert(varchar(30),@PS_QtyDelivered)
         + '), making this allocation untenable. It was probably changed by another user.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 3
      return 0
   end

if @LS_StockCode <> @PS_StockCode and @PS_StockCode is not null
   begin -- in theory this should not occurr
      if @PS_RaiseValidationErrors = 1
         raiserror('The Stock record %s on the Order detail line with a primary of %u is not the stock record %s you are trying to allocate to it.'
         ,16,1,@LS_StockCode,@PS_OrderDetailPrimary,@PS_StockCode)
      set @PS_ValidationError = 4
      return 0
   end

if @LS_OrderType = 'C'
   begin -- in theory this should not occurr
      if @PS_RaiseValidationErrors = 1
         raiserror('The Order detail line with a primary of %u belongs to a credit note. It is not possible to allocate stock to a SOP credit note.'
         ,16,1,@LS_StockCode,@PS_OrderDetailPrimary,@LS_StockCode)
      set @PS_ValidationError = 5
      return 0
   end

if @LS_OrderStatus = 2
   begin -- in theory this should not occurr
      if @PS_RaiseValidationErrors = 1
         raiserror('The Order detail line with a primary of %u is complete or has been closed. It is therefore not possible to allocate stock to it.'
         ,16,1,@PS_OrderDetailPrimary)
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
      @LS_QtyAlreadyAllocated  = dbo.AA_QUANTITY_DPS_F(WMR_QUANTITY)
   ,  @LS_WMR_STOCK_LINK       = WMR_STOCK_LINK
   from SDK_WMS_STOCK_RESERVATION
   where 
      WMR_ORDER_DETAIL_LINK = @PS_OrderDetailPrimary

if @@error <> 0
   begin
      raiserror('Failed to query SDK_WMS_STOCK_RESERVATION.',16,1)
      return 99
   end

if @LS_QtyAlreadyAllocated <> @PS_QtyAlreadyAllocated and @PS_QtyAlreadyAllocated is not null
   begin
      set @LS_ErrorMessage = 'The quantity of stock allocated ('
         + convert(varchar(30),@LS_QtyAlreadyAllocated)
         + ') to the Order detail line with a primary of '
         + convert(varchar(30),@PS_OrderDetailPrimary)
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
            + ' to the Order detail line with a primary of ' 
            + convert(varchar(30),@PS_OrderDetailPrimary)

      else
         set @LS_ErrorMessage = 'There is not enough stock ' 
            + @LS_StockCode 
            + ' to allocate ' + convert(varchar(30),@PS_QtyToAllocate) 
            + ' to the Order detail line with a primary of ' 
            + convert(varchar(30),@PS_OrderDetailPrimary)
         + '. Another user may have just allocated it to another order or moved some out of stock.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 8
      return 0
   end

set @LS_NewAllocQty = dbo.AA_QUANTITY_DPS_F(@LS_QtyAlreadyAllocated + @PS_QtyToAllocate)

if @LS_NewAllocQty > @LS_QtyOrdered - @LS_QtyDelivered
   begin
      set @LS_ErrorMessage = 'It is not possible to allocate '
         + convert(varchar(30),@PS_QtyToAllocate)
         + ' to the Order detail line with a primary of '
         + convert(varchar(30),@PS_OrderDetailPrimary)
         + ' as this would make the total quantity allocated to it greater than its quantity outstanding to deliver ('
         + convert(varchar(30),@LS_QtyOrdered - @LS_QtyDelivered)
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
         + ' to the Order detail line with a primary of '
         + convert(varchar(30),@PS_OrderDetailPrimary)
         + ' as this would make the total quantity allocated to it negative.'
      if @PS_RaiseValidationErrors = 1
         raiserror(@LS_ErrorMessage,16,1)
      set @PS_ValidationError = 13
      return 0
   end

if @LS_WMR_STOCK_LINK is not null and @LS_WMR_STOCK_LINK <> @LS_StockPrimary
   begin
      -- This should never happen, but just incase check that enough stock for new and existing allocations.
      set @LS_NewAllocQty = 0
   end

begin tran

if @LS_WMR_STOCK_LINK is null and @LS_NewAllocQty > 0
   begin
      insert into SDK_WMS_STOCK_RESERVATION
      (
           WMR_ORDER_DETAIL_LINK
         , WMR_STOCK_LINK       
         , WMR_QUANTITY
         , WMR_SITE
      )
      values
      (
           @PS_OrderDetailPrimary
         , @LS_StockPrimary
         , @LS_NewAllocQty
         , @LS_Site
      )
      if @@error <> 0
         begin
            raiserror('Failed to insert into table SDK_WMS_STOCK_RESERVATION.',16,1)
            rollback tran
            return 99
         end
   end
else if @LS_NewAllocQty > 0
   begin
      update SDK_WMS_STOCK_RESERVATION
         set WMR_QUANTITY   = @LS_NewAllocQty
           , WMR_STOCK_LINK = @LS_StockPrimary
           , WMR_SITE       = @LS_Site
         where
            WMR_ORDER_DETAIL_LINK = @PS_OrderDetailPrimary
            and dbo.AA_QUANTITY_DPS_F(WMR_QUANTITY) = @LS_QtyAlreadyAllocated
      select 
         @LS_RowCount = @@rowcount
      ,  @LS_Error    = @@error

      if @LS_Error <> 0
         begin
            raiserror('Failed to update table SDK_WMS_STOCK_RESERVATION.',16,1)
            rollback tran
            return 99
         end

      if @LS_RowCount = 0
         begin
            select  @LS_WMR_STOCK_LINK = WMR_STOCK_LINK
               from SDK_WMS_STOCK_RESERVATION
               where 
                  WMR_ORDER_DETAIL_LINK = @PS_OrderDetailPrimary
            if @@rowcount = 0
               begin
                  set @LS_ErrorMessage = 'There is nolonger any stock allocated to the Order detail line with a primary of '
                     + convert(varchar(30),@PS_OrderDetailPrimary)
                     + '. This does not match the quantity that had been allocated when the allocation was started ('
                     + convert(varchar(30),@PS_QtyAlreadyAllocated)
                     + '), making this allocation untenable. Another user must have chaged it.'
                  if @PS_RaiseValidationErrors = 1
                     raiserror(@LS_ErrorMessage,16,1)
                  set @PS_ValidationError = 9
                  return 0
               end
            else
               begin
                  set @LS_ErrorMessage = 'The quantity of stock allocated to the Order detail line with a primary of '
                     + convert(varchar(30),@PS_OrderDetailPrimary)
                     + ' nolonger matches the quantity that had been allocated when the allocation was started ('
                     + convert(varchar(30),@PS_QtyAlreadyAllocated)
                     + '), making this allocation untenable. Another user must have chaged it.'
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
      delete SDK_WMS_STOCK_RESERVATION
         where 
            WMR_ORDER_DETAIL_LINK = @PS_OrderDetailPrimary
      if @@error <> 0
         begin
            raiserror('Failed to delete from table SDK_WMS_STOCK_RESERVATION.',16,1)
            rollback tran
            return 99
         end
   end
  
  
insert into SDK_WMS_STOCK_RESERVATION_HISTORY
   (
        WMRH_ORDER_NUMBER     
      , WMRH_ORDER_DETAIL_LINK
      , WMRH_STOCK_LINK       
      , WMRH_QUANTITY         
      , WMRH_USER_PUTIN       
      , WMRH_DATE_PUTIN
      , WMRH_SITE
   )
   values
   (
        @LS_OrderNumber --WMRH_ORDER_NUMBER     
      , @PS_OrderDetailPrimary --WMRH_ORDER_DETAIL_LINK
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

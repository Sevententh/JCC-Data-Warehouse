create view SDK_WMS_STOCK_RESERVATION_VIEW
as

select
  WMR_STOCK_LINK                             as StockLink
, sum(dbo.AA_QUANTITY_DPS_F(WMR_QUANTITY))   as AllocationQuantity
   from SDK_WMS_STOCK_RESERVATION
   
   group by WMR_STOCK_LINK

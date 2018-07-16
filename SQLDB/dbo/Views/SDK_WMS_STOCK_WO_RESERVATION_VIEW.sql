
create view SDK_WMS_STOCK_WO_RESERVATION_VIEW
as

select
  WMWR_STOCK_LINK                             as StockLink
, sum(dbo.AA_QUANTITY_DPS_F(WMWR_QUANTITY))   as AllocationQuantity
   from SDK_WMS_STOCK_WO_RESERVATION
   
   group by WMWR_STOCK_LINK

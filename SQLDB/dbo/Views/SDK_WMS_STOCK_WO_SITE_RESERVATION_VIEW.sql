
create view SDK_WMS_STOCK_WO_SITE_RESERVATION_VIEW
as

select
  WMWR_STOCK_LINK                             as StockLink
, sum(dbo.AA_QUANTITY_DPS_F(WMWR_QUANTITY))   as AllocationQuantity
, WMWR_SITE                                   as Site
   from SDK_WMS_STOCK_WO_RESERVATION
   group by WMWR_STOCK_LINK, WMWR_SITE

CREATE VIEW ARM_STOCK_DELIVERIES_LOCATIONS AS
SELECT LOC_STOCK_CODE LocStockCode,
LOC_CODE StkLocation,
isnull((select SUM(CASE OD_TYPE WHEN 'O' THEN round((OD_QTYUNIT*OD_QTYPRINTED),QUANTITY_DPS) ELSE round(((OD_QTYUNIT*OD_QTYPRINTED)*-1),QUANTITY_DPS) END)
FROM ORD_DETAIL (nolock) inner join sys_datainfo on 1=1
where OD_STATUS<>'2'
AND OD_BATCH_FLAG='1'
AND OD_QTYPRINTED<>0
AND OD_LOCATN <> ''
and od_stock_code=loc_stock_code
and od_locatn=loc_code),0)NewLocDTUpdate
from stk_location
GROUP BY LOC_STOCK_CODE, LOC_CODE
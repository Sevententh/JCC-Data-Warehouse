CREATE VIEW ARM_STOCK_DELIVERIES AS
select stkcode StockCode, isnull((select SUM(CASE OD_TYPE WHEN 'O' THEN round((OD_QTYUNIT*OD_QTYPRINTED),QUANTITY_DPS) ELSE round(((OD_QTYUNIT*OD_QTYPRINTED)*-1),QUANTITY_DPS) END)
from ord_detail inner join sys_datainfo on 1=1
where isnull(OD_STATUS,0)<>'2'
AND isnull(OD_BATCH_FLAG,0)='1'
AND isnull(OD_QTYPRINTED,0)<>0
and od_stock_code=stkcode),0) NewDTUpdate
from stk_stock
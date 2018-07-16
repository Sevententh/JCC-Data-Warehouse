CREATE view arm_StockPhysical
as
select stkcode StkCode, 
isnull((select sum(CASE sm_status WHEN 'I' THEN round(sm_quantity*sm_qtyunit,QUANTITY_DPS) ELSE round(sm_quantity*sm_qtyunit*-1,QUANTITY_DPS) END) 
from stk_movements inner join sys_datainfo on 1=1
where sm_batch_flag<>1
and sm_stock_code=stkcode),0) StkPhysical
from stk_stock
group by stkcode
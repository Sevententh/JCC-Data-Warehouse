CREATE view arm_StockPhysicalbyLocation
as
select loc_stock_code LocStkCode, loc_code StkLocation, 
isnull((select sum(CASE sm_status WHEN 'I' THEN round(sm_quantity*sm_qtyunit,QUANTITY_DPS) ELSE round(sm_quantity*sm_qtyunit*-1,QUANTITY_DPS) END)
from stk_movements (nolock) inner join sys_datainfo on 1=1
where sm_batch_flag<>1
and sm_stock_code=loc_stock_code
and sm_location=loc_code),0) StkPhysical
from stk_location
group by loc_stock_code, loc_code
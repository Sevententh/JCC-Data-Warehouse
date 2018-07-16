create view arm_recalc_allocated as
select stkcode StockCode,
isnull((select sum(od_qtyreserved-(od_qtyprinted*od_qtyunit)) NewAllocated
from ord_detail inner join ord_header
on od_order_number=oh_order_number
where oh_priority<3
and od_status<>2
and od_batch_flag=1
and od_qtyreserved<>0
and od_type='O'
and od_stock_code=stkcode),0) NewAllocated
from stk_stock


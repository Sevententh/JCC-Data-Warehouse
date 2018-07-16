create view arm_recalc_allocated_locations as
select loc_stock_code StockCode,
loc_code Location,
isnull((select sum(od_qtyreserved-(od_qtyprinted*od_qtyunit))
from ord_detail inner join ord_header
on od_order_number=oh_order_number
where oh_priority<3
and od_status<>2
and od_batch_flag=1
and od_qtyreserved<>0
and od_type='O'
and od_stock_code=loc_stock_code
and od_locatn=loc_code),0) NewAllocated
from stk_location

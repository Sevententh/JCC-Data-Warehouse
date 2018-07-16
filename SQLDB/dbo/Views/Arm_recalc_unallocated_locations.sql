create view Arm_recalc_unallocated_locations as
select loc_stock_code StockCode,
loc_code Location,
isnull((select sum(((od_qtyord-od_qtydelvd)*od_qtyunit)-od_qtyreserved)
from ord_detail inner join ord_header
on od_order_number=oh_order_number
where oh_priority<3
and od_status<>2
and od_batch_flag=1
and od_type='O'
and od_qtyprinted<=od_qtyreserved
and od_stock_code=loc_stock_code
and od_locatn=loc_code),0) NewUnallocated
from stk_location
union all
select loc_stock_code StockCode,
loc_code Location,
isnull((select sum(((od_qtyord-od_qtydelvd-od_qtyprinted)*od_qtyunit)-od_qtyreserved)
from ord_detail inner join ord_header
on od_order_number=oh_order_number
where oh_priority<3
and od_status<>2
and od_batch_flag=1
and od_type='O'
and od_entry_type='S'
and od_qtyprinted>od_qtyreserved
and od_stock_code=loc_stock_code
and od_locatn=loc_code),0) NewUnallocated
from stk_location

create view Arm_recalc_unallocated as
select stkcode StockCode,
isnull((select sum(((od_qtyord-od_qtydelvd)*od_qtyunit)-od_qtyreserved)
from ord_detail inner join ord_header
on od_order_number=oh_order_number
where oh_priority<3
and od_status<>2
and od_batch_flag=1
and od_type='O'
and od_entry_type='S'
and od_qtyprinted<=od_qtyreserved
and od_stock_code=stkcode),0) NewUnallocated
from stk_stock
union
select stkcode StockCode,
isnull((select sum(((od_qtyord-od_qtydelvd-od_qtyprinted)*od_qtyunit)-od_qtyreserved)
from ord_detail inner join ord_header
on od_order_number=oh_order_number
where oh_priority<3
and od_status<>2
and od_batch_flag=1
and od_type='O'
and od_entry_type='S'
and od_qtyprinted>od_qtyreserved
and od_stock_code=stkcode),0) NewUnallocated
from stk_stock
group by stkcode

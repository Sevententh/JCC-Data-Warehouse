create view tag_recalc_wo_allocations as
select stkcode StockCode, isnull((select sum(wc_quantity_alloc)
from wo_components inner join wo_orders
on wc_order_number=wo_order_number
and wc_type='S'
where wo_status not in (10,14,15)
and wc_part_link=stk_primary
group by wc_part_link),0) WOAllocated,
isnull((select sum(wc_quantity_required-(wc_quantity_issued+wc_quantity_alloc))
from wo_components inner join wo_orders
on wc_order_number=wo_order_number
and wc_type='S'
where wo_status not in (10,14,15)
and wc_part_link=stk_primary
group by wc_part_link),0) WOUnallocated
from stk_stock
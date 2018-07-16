create view tag_recalc_wo_allocations_sub as
select wc_sub_analysis_link, sum(wc_quantity_alloc) WOAllocated, 
sum(wc_quantity_required-(wc_quantity_issued+wc_quantity_alloc)) WOUnallocated
from wo_components inner join wo_orders
on wc_order_number=wo_order_number
and wc_type='S'
where wo_status not in (10,14,15)
group by wc_sub_analysis_link

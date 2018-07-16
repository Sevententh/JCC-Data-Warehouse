create view arm_allocated_NonSerial_Stock as
select stk_alloc_order_number OrderNumber, stk_alloc_stkcode OrderStockCode, 
sum(stk_alloc_qtyalloc)as CorrectAllocated, --This should be the allocated quantity * the unit quantity
stk_alloc_od_link OrderPrimary
from stk_allocations --cannot use stk_allocation_link table as this is not used in all profit cost methods
group by stk_alloc_order_number,stk_alloc_stkcode,stk_alloc_od_link

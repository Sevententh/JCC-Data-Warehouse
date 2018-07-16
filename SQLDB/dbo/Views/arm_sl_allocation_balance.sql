 
create view arm_sl_allocation_balance as
select st_copycust Customer,
isnull(sum(case st_trantype
  when 'CRN' then (st_unallocated*-1)
  when 'PAY' then (st_unallocated*-1)
  when 'ACR' then (st_unallocated*-1)
  else st_unallocated end),0) AllocBalance
from sl_transactions
where st_batch_flag<>1
group by st_copycust
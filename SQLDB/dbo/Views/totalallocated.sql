create view totalallocated as
select stockcode,
sum(NewAllocated) NewAllocated
from [arm_recalc_allocated]
group by stockcode

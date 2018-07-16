
create view totalsum
as select stockcode, sum(newunallocated) newunallocated
from Arm_recalc_unallocated
group by stockcode


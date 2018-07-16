
create view totallocsum
as select stockcode, 
Location,
sum(newunallocated) newunallocated
from Arm_recalc_unallocated_locations
group by stockcode, location


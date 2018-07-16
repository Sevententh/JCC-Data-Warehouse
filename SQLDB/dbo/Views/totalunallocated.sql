create view totalunallocated as --PW 18th Jan 2012 - note that this view is required because two rows may be returned per stock item from the main view, above.
select stockcode,
sum(newunallocated) newunallocated
from Arm_recalc_unallocated
group by stockcode

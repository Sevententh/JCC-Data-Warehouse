create view totallocationunallocated as --PW 18th Jan 2012 - note that this view is required because two rows may be returned per stock item from the main view, above.
select stockcode,
Location,
sum(newunallocated) newunallocated
from Arm_recalc_unallocated_locations
group by stockcode, Location

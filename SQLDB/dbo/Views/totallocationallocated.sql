create view totallocationallocated as --PW 18th Jan 2012 - note that this view is required because two rows may be returned per stock item from the main view, above.
select stockcode,
Location,
sum(NewAllocated) NewAllocated
from arm_recalc_allocated_locations
group by stockcode, Location


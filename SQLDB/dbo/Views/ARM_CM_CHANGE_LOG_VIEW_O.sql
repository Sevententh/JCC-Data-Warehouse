create view ARM_CM_CHANGE_LOG_VIEW_O

/*
** Written     :  16/8/2011 RL
** Last Amended:  
*/
AS
select 
CHL_TYPE			as CHL_TYPE_O,
CHL_EVENT_ID	as CHL_EVENT_ID_O,
CHL_VALUE		as CHL_VALUE_O
from ARM_CM_CHANGE_LOG
where CHL_TYPE = 'OT' and CHL_ACTION = 'UPDATE'
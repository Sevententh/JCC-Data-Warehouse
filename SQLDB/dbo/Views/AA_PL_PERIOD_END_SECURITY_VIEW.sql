create view AA_PL_PERIOD_END_SECURITY_VIEW
/*
** Written:			20/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Purchase Period End
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_MODULE_MASK, 5, 1) as tinyint) as ALLOWEDACCESS
from SYS_USER_PROFILE
where UP_MODULE = 'PL'

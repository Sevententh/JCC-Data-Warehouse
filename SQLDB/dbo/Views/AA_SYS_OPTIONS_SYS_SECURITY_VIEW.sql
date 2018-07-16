create view AA_SYS_OPTIONS_SYS_SECURITY_VIEW
/*
** Written:			20/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for the System System Options.
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 1, 1) as tinyint) as ALLOWEDACCESS,
(case
	when substring(UP_TRAN_OPTIONS1, 12, 1) = 'X' then cast(0 as tinyint)
	when substring(UP_TRAN_OPTIONS1, 12, 1) = 'F' then cast(1 as tinyint)
	when substring(UP_TRAN_OPTIONS1, 12, 1) = 'V' then cast(2 as tinyint)
   end)
as EDIT
from SYS_USER_PROFILE
where UP_MODULE = 'SYS'

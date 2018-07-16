create view AA_SYS_COMPANY_SECURITY_VIEW
/*
** Written:			20/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for the System Company Record
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_RECORDMASK, 1, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_REC_OPTIONS1, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as EDIT,
(case 
   when substring(UP_REC_OPTIONS1, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as CUSTOMISE_CUSTOM_TAB,
(case 
   when substring(UP_REC_OPTIONS1, 3, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as SNAPSHOT,
(case
	when substring(UP_REC_OPTIONS1, 4, 1) = 'X' Then cast(0 as tinyint)
	when substring(UP_REC_OPTIONS1, 4, 1) = 'F' Then cast(1 as tinyint)
	when substring(UP_REC_OPTIONS1, 4, 1) = 'V' Then cast(2 as tinyint)
   end)
as HOME_DEFAULTS
from SYS_USER_PROFILE
where UP_MODULE = 'SYS'

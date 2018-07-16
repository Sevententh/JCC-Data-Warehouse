create view AA_CB_RECORD_SECURITY_VIEW
/*
** Written:			20/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for the Cashbook Record
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_RECORDMASK, 1, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_REC_OPTIONS1, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as BANK,
(case 
   when substring(UP_REC_OPTIONS1, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as PETTY_CASH
from SYS_USER_PROFILE
where UP_MODULE = 'CB'

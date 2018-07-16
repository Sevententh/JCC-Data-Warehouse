create view AA_SYS_TRADING_CURRENCY_SECURITY_VIEW
/*
** Written:			20/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for the System Trading Currency function.
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_RECORDMASK, 4, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_REC_OPTIONS4, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as [INSERT],
(case 
   when substring(UP_REC_OPTIONS4, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as [EDIT],
(case 
   when substring(UP_REC_OPTIONS4, 3, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as [DELETE],
(case 
   when substring(UP_REC_OPTIONS4, 4, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as INFO,
(case 
   when substring(UP_REC_OPTIONS4, 5, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as RATES
from SYS_USER_PROFILE
where UP_MODULE = 'SYS'

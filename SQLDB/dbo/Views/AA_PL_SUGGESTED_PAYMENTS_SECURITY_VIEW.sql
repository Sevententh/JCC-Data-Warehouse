create view AA_PL_SUGGESTED_PAYMENTS_SECURITY_VIEW
/*
** Written:			5/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Purchase Suggested Payments
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 8, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS8, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as [PRINT],
(case 
   when substring(UP_TRAN_OPTIONS8, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as DISPUTED,
(case 
   when substring(UP_TRAN_OPTIONS8, 3, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as STAGE_ONE_AUTHORISATION,
(case 
   when substring(UP_TRAN_OPTIONS8, 4, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as STAGE_TWO_AUTHORISATION,
(case 
   when substring(UP_TRAN_OPTIONS8, 5, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as PROCESS
from SYS_USER_PROFILE
where UP_MODULE = 'PL'

create view AA_CB_SUGGESTED_PAYMENTS_SECURITY_VIEW
/*
** Written:			6/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Cashbook Suggested Payments
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 14, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS14, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as [PRINT],
(case 
   when substring(UP_TRAN_OPTIONS14, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as DISPUTED,
(case 
   when substring(UP_TRAN_OPTIONS14, 3, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as STAGE_ONE_AUTHORISATION,
(case 
   when substring(UP_TRAN_OPTIONS14, 4, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as STAGE_TWO_AUTHORISATION,
(case 
   when substring(UP_TRAN_OPTIONS14, 5, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as PROCESS
from SYS_USER_PROFILE
where UP_MODULE = 'CB'

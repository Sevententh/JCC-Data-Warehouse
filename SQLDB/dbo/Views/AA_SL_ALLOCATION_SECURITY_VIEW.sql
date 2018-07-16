create view AA_SL_ALLOCATION_SECURITY_VIEW
/*
** Written:			5/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Sales Allocation
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
as PROCESS
from SYS_USER_PROFILE
where UP_MODULE = 'SL'

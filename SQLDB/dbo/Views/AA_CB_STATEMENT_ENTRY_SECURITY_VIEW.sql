create view AA_CB_STATEMENT_ENTRY_SECURITY_VIEW
/*
** Written:			6/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Cashbook Statement Entry
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 12, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS12, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as OPTIONS,
(case 
   when substring(UP_TRAN_OPTIONS12, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as POP_UP_ALLOCATION,
(case 
   when substring(UP_TRAN_OPTIONS12, 3, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as UPDATE_LIST_FOR_NEW_LINE,
(case 
   when substring(UP_TRAN_OPTIONS12, 4, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as BYPASS_COSTING
from SYS_USER_PROFILE
where UP_MODULE = 'CB'

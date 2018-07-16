create view AA_NL_POST_BATCH_RECURRING_SECURITY_VIEW
/*
** Written:			5/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Nominal Post Batch - Recurring
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 5, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS5, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as POST,
(case 
   when substring(UP_TRAN_OPTIONS5, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as EDIT,
(case 
   when substring(UP_TRAN_OPTIONS5, 3, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as [DELETE],
(case 
   when substring(UP_TRAN_OPTIONS5, 4, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as COMPLETE,
(case 
   when substring(UP_TRAN_OPTIONS5, 5, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as CHANGE_NEXT_POSTING_DATE,
(case 
   when substring(UP_TRAN_OPTIONS5, 6, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as POST_ALL,
(case 
   when substring(UP_TRAN_OPTIONS5, 7, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as SELECT_NEXT_POSTING_PERIOD
from SYS_USER_PROFILE
where UP_MODULE = 'NL'

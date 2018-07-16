create view AA_SL_POST_BATCH_SECURITY_VIEW
/*
** Written:			5/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Sales Post Batch
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 7, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS7, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as POST,
(case 
   when substring(UP_TRAN_OPTIONS7, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as EDIT,
(case 
   when substring(UP_TRAN_OPTIONS7, 3, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as [DELETE],
(case 
   when substring(UP_TRAN_OPTIONS7, 4, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as POST_ALL
from SYS_USER_PROFILE
where UP_MODULE = 'SL'

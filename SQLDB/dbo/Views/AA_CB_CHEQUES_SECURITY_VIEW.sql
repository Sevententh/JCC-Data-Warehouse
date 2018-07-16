create view AA_CB_CHEQUES_SECURITY_VIEW
/*
** Written:			6/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Cashbook Cheques
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 10, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS10, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as PRINT_ALL_CHEQUES,
(case 
   when substring(UP_TRAN_OPTIONS10, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as [DELETE]
from SYS_USER_PROFILE
where UP_MODULE = 'CB'

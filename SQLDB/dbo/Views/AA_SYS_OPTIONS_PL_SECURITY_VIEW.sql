create view AA_SYS_OPTIONS_PL_SECURITY_VIEW
/*
** Written:			20/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for the System Purchase Ledger Options.
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 1, 1) as tinyint) as ALLOWEDACCESS,
(case
	when substring(UP_TRAN_OPTIONS1, 3, 1) = 'X' Then cast(0 as tinyint)
	when substring(UP_TRAN_OPTIONS1, 3, 1) = 'F' Then cast(1 as tinyint)
	when substring(UP_TRAN_OPTIONS1, 3, 1) = 'V' Then cast(2 as tinyint)
   end)
as EDIT
from SYS_USER_PROFILE
where UP_MODULE = 'SYS'

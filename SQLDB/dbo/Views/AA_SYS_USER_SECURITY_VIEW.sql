create view AA_SYS_USER_SECURITY_VIEW
/*
** Written:			20/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for the System User function.
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_RECORDMASK, 6, 1) as tinyint) as ALLOWEDACCESS,
(case
	when substring(UP_REC_OPTIONS6, 1, 1) = 'X' Then cast(0 as tinyint)
	when substring(UP_REC_OPTIONS6, 1, 1) = 'F' Then cast(1 as tinyint)
	when substring(UP_REC_OPTIONS6, 1, 1) = 'V' Then cast(2 as tinyint)
   end)
as USER_RECORDS,
(case
	when substring(UP_REC_OPTIONS6, 4, 1) = 'X' Then cast(0 as tinyint)
	when substring(UP_REC_OPTIONS6, 4, 1) = 'F' Then cast(1 as tinyint)
	when substring(UP_REC_OPTIONS6, 4, 1) = 'V' Then cast(2 as tinyint)
   end)
as BUDGETS,
(case
	when substring(UP_REC_OPTIONS6, 2, 1) = 'X' Then cast(0 as tinyint)
	when substring(UP_REC_OPTIONS6, 2, 1) = 'F' Then cast(1 as tinyint)
	when substring(UP_REC_OPTIONS6, 2, 1) = 'V' Then cast(2 as tinyint)
   end)
as SECURITY_PROFILES,
(case
	when substring(UP_REC_OPTIONS6, 3, 1) = 'X' Then cast(0 as tinyint)
	when substring(UP_REC_OPTIONS6, 3, 1) = 'F' Then cast(1 as tinyint)
	when substring(UP_REC_OPTIONS6, 3, 1) = 'V' Then cast(2 as tinyint)
   end)
as INVOICE_REGISTER_APPROVERS
from SYS_USER_PROFILE
where UP_MODULE = 'SYS'

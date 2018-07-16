create view AA_CB_CURRENCY_TRANSFER_SECURITY_VIEW
/*
** Written:			5/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Cashbook Currency Transfers
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 13, 1) as tinyint) as ALLOWEDACCESS
from SYS_USER_PROFILE
where UP_MODULE = 'CB'

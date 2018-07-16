create view AA_SYS_COMPANY_ADDRESS_SECURITY_VIEW
/*
** Written:			20/4/2004 RL
** Last Amended: 
** Comments: 		Returns (**virtual**) Security Profile settings for the System Company Address Record
**						It just uses the Company record access for all settings.
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_RECORDMASK, 1, 1) as tinyint) as ALLOWEDACCESS,
cast(substring(UP_RECORDMASK, 1, 1) as tinyint) as [INSERT],
cast(substring(UP_RECORDMASK, 1, 1) as tinyint) as EDIT,
cast(substring(UP_RECORDMASK, 1, 1) as tinyint) as [DELETE]
from SYS_USER_PROFILE
where UP_MODULE = 'SYS'

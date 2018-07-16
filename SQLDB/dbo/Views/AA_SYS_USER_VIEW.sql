create view AA_SYS_USER_VIEW
/*
** Returns a table of data to create a User object
** Written: 21/03/2005 SR
** Last Amended: 
**
*/
as

select
USR_PRIMARY as [PRIMARY],
[USER_ID] as USR_ID,
case isnull(USER_DOMAIN, '') 
	when '' then [USER_NAME]
	else USER_DOMAIN + '\' + [USER_NAME] 
	end as USR_NAME,
USER_PROFILE_CODE as USR_PROFILE

from SYS_USER
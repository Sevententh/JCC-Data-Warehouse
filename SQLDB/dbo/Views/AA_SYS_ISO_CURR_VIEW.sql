create view AA_SYS_ISO_CURR_VIEW
/*
** Returns a table of ISO record information
** Written:      30/11/2004 SR
** Last Amended: 
**
*/
as

select

 IC_PRIMARY as [PRIMARY]
,IC_CODE
,coalesce(IC_DESCRIPTION,'') as IC_DESCRIPTION
from SYS_ISO_CCY_CODES
create view AA_SYS_ISO_CURR_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_SYS_ISO_CURR_LIST_S
** Written:      19/05/2004 DG
** Last Amended: 
**
*/
as

select

 IC_PRIMARY as [PRIMARY]
,IC_CODE
,coalesce(IC_DESCRIPTION,'') as IC_DESCRIPTION
from SYS_ISO_CCY_CODES

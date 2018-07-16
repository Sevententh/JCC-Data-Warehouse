create view AA_CST_BUDGET_PROFILE_LIST_VIEW
/*
** Returns a table to be used specifically with AA_CST_BUDGET_PROFILE_LIST_S
**
** Written:      09/11/2005 SH
** Last Amended: 
*/
as

select P.BUDGET_PROFILE_ID as [PRIMARY],
   P.ENTERED_BY,
   isnull(U.[USER_NAME],'') as [USER_NAME],
   isnull(U.USER_PROFILE_CODE,'') as USER_PROFILE_CODE,
   P.BUDGET_PROFILE_NAME,
   isnull(G.UPG_DESCRIPTION,'') as UPG_DESCRIPTION,
   isnull(P.DATE_EDITED,P.DATE_PUTIN) as DATE_EDITED
from CST_BUDGET_PROFILES P
   left join SYS_USER U on U.[USER_ID] = P.ENTERED_BY
   left join SYS_USER_PROFILE_GLOBAL G on G.UPG_CODE = USER_PROFILE_CODE
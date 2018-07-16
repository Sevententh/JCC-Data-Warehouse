CREATE VIEW AA_NET_PRC_RECORD_LIST_VIEW
/*
** Returns a table based on the parameter(search criteria).
** Also Encapsulates Profile Security and List Context
** Written:      12/03/03 SRB
** Last Amended: 
**
*/

AS


SELECT 

PRCODE as [PRIMARY]
,PR_LEVEL as PROFILELEVEL
,PRCODE
,PR_TYPE
,PR_DATE_PUTIN
,PR_DATE_EDITED
,COALESCE(PRNAME,'') as PRNAME
,COALESCE(PR_SORT_KEY,'') as PR_SORT_KEY

FROM PRC_PRICE_RECS 

where  (PR_TYPE is null OR PR_TYPE<>'R' )
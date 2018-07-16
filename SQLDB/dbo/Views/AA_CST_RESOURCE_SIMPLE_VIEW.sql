create view AA_CST_RESOURCE_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_CST_RESOURCE_LIST_S
**
** The following fields are intended to be displayed:
**               PRCODE                Resource Code
**               PRNAME                Resource Name
**               PERSON CODE           Person code
**               SORT                  Sort Key
**               USER1                 User Sort 1
**               USER2                 User Sort 2
**               USER3                 User Sort 3
**               USER4                 User Sort 4
**               USER5                 User Sort 5
**               USER6                 User Sort 6
**               PR_DATE_PUTIN         Date Entered
**               PR_DATE_EDITED        Date Last Modified
**
** The following extra fields are provided for searching:
**               PRCODE                Resource Code
**               PRNAME                Resource Name
**               PERSON CODE           Person code
**               SORT                  Sort Key
**               USER1                 User Sort 1
**               USER2                 User Sort 2
**               USER3                 User Sort 3
**               USER4                 User Sort 4
**               USER5                 User Sort 5
**               USER6                 User Sort 6
**               PR_DO_NOT_USE         Do not use flag
**
** [PRIMARY] identifies a row in the recordset
**
** Written     :  25/11/2005 SB
** Last Amended:  05/12/2005 SB
**
*/
as

select
 PR_PRIMARY as [PRIMARY]
--Display Fields
,PRCODE
,coalesce(PRNAME,'') as [NAME]
,coalesce(PP_CODE,'') PERSON_CODE
,coalesce(PR_SORT_KEY,'') as SORT
,coalesce(PR_SORT_KEY1,'') as USER1
,coalesce(PR_SORT_KEY2,'') as USER2
,coalesce(PR_SORT_KEY3,'') as USER3
,coalesce(PR_SORT_KEY4,'') as USER4
,coalesce(PR_SORT_KEY5,'') as USER5
,coalesce(PR_SORT_KEY6,'') as USER6
,PR_DATE_PUTIN
,PR_DATE_EDITED
,coalesce(PR_DO_NOT_USE,0) PR_DO_NOT_USE
--Search Fields
,PRNAME
,PR_SORT_KEY
,PR_SORT_KEY1
,PR_SORT_KEY2
,PR_SORT_KEY3
,PR_SORT_KEY4
,PR_SORT_KEY5
,PR_SORT_KEY6
,PP_CODE
from PRC_PRICE_RECS
left join SYS_PEOPLE on PR_PERSON_LINK = PP_PRIMARY

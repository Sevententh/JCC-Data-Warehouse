create view AA_CST_RESOURCE_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_CST_RESOURCE_LIST_S
**
** The following fields are intended to be displayed:
**               PRCODE                Resource Code
**               [NAME]                Resource Name
**               PERSON_CODE           Person code
**               SORT                  Sort Key
**               USER1                 User Sort 1
**               USER2                 User Sort 2
**               USER3                 User Sort 3
**               USER4                 User Sort 4
**               USER5                 User Sort 5
**               USER6                 User Sort 6
**               PR_DATE_PUTIN         Date Entered
**               PR_DATE_EDITED        Date Last Modified
**               RESPONSIBLE_TO        Person the resource is responsible to
**               PR_USRCHAR1           User Definable String
**               PR_USRCHAR2           User Definable String
**               PR_USRCHAR3           User Definable String
**               PR_USRCHAR4           User Definable String
**               PR_USRCHAR5           User Definable String
**               PR_USRCHAR6           User Definable String
**               PR_USRCHAR7           User Definable String
**               PR_USRCHAR8           User Definable String
**               PR_USRDATE1           User Definable Date
**               PR_USRDATE2           User Definable Date
**               PR_USRDATE3           User Definable Date
**               PR_USRFLAG1           User Definable Flag
**               PR_USRFLAG2           User Definable Flag
**               PR_USRFLAG3           User Definable Flag
**               PR_USRNUM1            User Definable Number
**               PR_USRNUM2            User Definable Number
**               PR_USRNUM3            User Definable Number
**               PR_DATE_USER1         Resource Date
**               PR_DATE_USER2         Resource Date
**               PR_DATE_USER3         Resource Date
**               PR_USER_PUTIN         User who entered the record
**               PR_USER_EDITED        User who Last Modified the record
**               PR_EMPLOYEE_CODE      Employee Code
**               PR_DO_NOT_USE         Do not use flag
**
** The following extra fields are provided for searching:
**               PRCODE                Resource Code
**               PRNAME                Resource Name
**               PERSON_CODE           Person code
**               PR_SORT_KEY           Sort Key
**               PR_SORT_KEY1          User Sort 1
**               PR_SORT_KEY2          User Sort 2
**               PR_SORT_KEY3          User Sort 3
**               PR_SORT_KEY4          User Sort 4
**               PR_SORT_KEY5          User Sort 5
**               PR_SORT_KEY6          User Sort 6
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
,coalesce(EMP.PP_CODE,'') as PERSON_CODE
,coalesce(PR_SORT_KEY,'') as SORT
,coalesce(PR_SORT_KEY1,'') as USER1
,coalesce(PR_SORT_KEY2,'') as USER2
,coalesce(PR_SORT_KEY3,'') as USER3
,coalesce(PR_SORT_KEY4,'') as USER4
,coalesce(PR_SORT_KEY5,'') as USER5
,coalesce(PR_SORT_KEY6,'') as USER6
,coalesce(PR_DATE_PUTIN,'') as PR_DATE_PUTIN
,coalesce(PR_DATE_EDITED,'') as PR_DATE_EDITED
,coalesce(MGR.PP_CODE,'') as RESPONSIBLE_TO
,coalesce(PR_USRCHAR1,'') as PR_USRCHAR1
,coalesce(PR_USRCHAR2,'') as PR_USRCHAR2
,coalesce(PR_USRCHAR3,'') as PR_USRCHAR3
,coalesce(PR_USRCHAR4,'') as PR_USRCHAR4
,coalesce(PR_USRCHAR5,'') as PR_USRCHAR5
,coalesce(PR_USRCHAR6,'') as PR_USRCHAR6
,coalesce(PR_USRCHAR7,'') as PR_USRCHAR7
,coalesce(PR_USRCHAR8,'') as PR_USRCHAR8
,coalesce(PR_USRDATE1,'') as PR_USRDATE1
,coalesce(PR_USRDATE2,'') as PR_USRDATE2
,coalesce(PR_USRDATE3,'') as PR_USRDATE3
,coalesce(PR_USRFLAG1,'') as PR_USRFLAG1
,coalesce(PR_USRFLAG2,'') as PR_USRFLAG2
,coalesce(PR_USRFLAG3,'') as PR_USRFLAG3
,coalesce(PR_USRNUM1,'') as PR_USRNUM1
,coalesce(PR_USRNUM2,'') as PR_USRNUM2
,coalesce(PR_USRNUM3,'') as PR_USRNUM3
,coalesce(PR_DATE_USER1,'') as PR_DATE_USER1
,coalesce(PR_DATE_USER2,'') as PR_DATE_USER2
,coalesce(PR_DATE_USER3,'') as PR_DATE_USER3
,coalesce(PR_USER_PUTIN,'') as PR_USER_PUTIN
,coalesce(PR_USER_EDITED,'') as PR_USER_EDITED
,coalesce(PR_EMPLOYEE_CODE,'') PR_EMPLOYEE_CODE
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
,EMP.PP_CODE
from PRC_PRICE_RECS
left join PRC_PRICE_RECS2 on PR_PRIMARY = PR_PRIMARY_2
left join SYS_PEOPLE EMP on PR_PERSON_LINK = EMP.PP_PRIMARY
left join SYS_PEOPLE MGR on EMP.PP_RESP_TO_LINK = MGR.PP_PRIMARY

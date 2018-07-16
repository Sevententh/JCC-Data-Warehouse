create view AA_CST_RESOURCE_VIEW
as
/*
** Returns a table to be used specifically with AA_CST_RESOURCE_RETRIEVE_S.  If viewing a duplicate, 
** certain fields will need to be empty.  These are: PRCODE, PR_DATE_PUTIN, PR_DATE_EDITED, PR_USER_PUTIN, PR_USER_EDITED
**
** The following fields are intended to be displayed:
**               PRCODE                   Resource Code
**               PRNAME                   Resource Name
**               PP_CODE                  Person code
**               PP_KNOWN_AS              Person Known As
**               PP_DEPARTMENT            Department
**               PP_RESP_TO               Responsible To
**               PAYRES_PAYTYPE           Pay Type
**               PR_TEXT                  Text
**               PR_NOTES                 Notes
**               PR_LEVEL                 Security Level
**               PR_DO_NOT_USE            Do not use flag
**               PR_DATE_USER1            User Date 1
**               PR_DATE_USER2            User Date 2
**               PR_DATE_USER3            User Date 3
**               PR_TARGET_HOURS          Target Hours
**               PR_TARGET_VALUE          Target Value
**               PR_TIMESHEET_UNITS       Timesheet Units
**               PR_TIMESHEET_UNIT_TYPE   Unit Type
**               PR_DATE_PUTIN            Date Entered
**               PR_DATE_EDITED           Date Last Modified
**               PR_USER_PUTIN            Date Entered
**               PR_USER_EDITED           Date Last Modified
**               PR_SORT_KEY              Sort Key
**               PR_SORT_KEY1             User Sort 1
**               PR_SORT_KEY2             User Sort 2
**               PR_SORT_KEY3             User Sort 3
**               PR_SORT_KEY4             User Sort 4
**               PR_SORT_KEY5             User Sort 5
**               PR_SORT_KEY6             User Sort 6
**               PR_USRCHAR1              User Definable Char 1
**               PR_USRCHAR2              User Definable Char 2
**               PR_USRCHAR3              User Definable Char 3
**               PR_USRCHAR4              User Definable Char 4
**               PR_USRCHAR5              User Definable Char 5
**               PR_USRCHAR6              User Definable Char 6
**               PR_USRCHAR7              User Definable Char 7
**               PR_USRCHAR8              User Definable Char 8
**               PR_USRNUM1               User Definable Number 1
**               PR_USRNUM2               User Definable Number 2
**               PR_USRNUM3               User Definable Number 3
**               PR_USRFLAG1              User Definable Flag 1
**               PR_USRFLAG2              User Definable Flag 2
**               PR_USRFLAG3              User Definable Flag 3
**               PR_USRDATE1              User Definable Date 1
**               PR_USRDATE2              User Definable Date 2
**               PR_USRDATE3              User Definable Date 3
**               DUPLICATE_FLAG           Duplicate Flag
**
** PR_PRIMARY identifies a row in the result set.
**
** Written:      05/12/05 SB
** Last Amended: 19/12/05 SB, 19/01/06 SB, 20/02/2006 JC, 20/02/06 SB
**
*/
select PR_PRIMARY
,  PRCODE
,  PRNAME
,  EMP.PP_CODE
,  EMP.PP_KNOWN_AS
,  EMP.PP_DEPARTMENT
,  RESP.PP_KNOWN_AS as PP_RESP_TO
,  PR_EMPLOYEE_CODE
,  PAYRES_PAYTYPE
,  PR_TEXT
,  PR_NOTES
,  PR_LEVEL
,  PR_DO_NOT_USE
,  PR_DATE_USER1
,  PR_DATE_USER2
,  PR_DATE_USER3
,  PR_TARGET_HOURS
,  PR_TARGET_VALUE
,  PR_TIMESHEET_UNITS
,  substring('01',charindex(isnull(PR_TIMESHEET_UNIT_TYPE,'H'),'HD'),1) as PR_TIMESHEET_UNIT_TYPE
,  PR_DATE_PUTIN
,  PR_USER_PUTIN
,  PR_DATE_EDITED
,  PR_USER_EDITED
,  PR_SORT_KEY
,  PR_SORT_KEY1
,  PR_SORT_KEY2
,  PR_SORT_KEY3
,  PR_SORT_KEY4
,  PR_SORT_KEY5
,  PR_SORT_KEY6
,  PR_USRCHAR1
,  PR_USRCHAR2
,  PR_USRCHAR3
,  PR_USRCHAR4
,  PR_USRCHAR5
,  PR_USRCHAR6
,  PR_USRCHAR7
,  PR_USRCHAR8
,  PR_USRNUM1
,  PR_USRNUM2
,  PR_USRNUM3
,  PR_USRFLAG1
,  PR_USRFLAG2
,  PR_USRFLAG3
,  PR_USRDATE1
,  PR_USRDATE2
,  PR_USRDATE3
,  PR_PERSON_LINK
,  dbo.AA_VALUE_DPS_F(PR_QTY_YTD)                                       as PR_QTY_YTD 
,  dbo.AA_VALUE_DPS_F(PR_COSTVAL_YTD)                                   as PR_COSTVAL_YTD
,  0 DUPLICATE_PRIMARY
,  PR_PRIMARY [PRIMARY]
from PRC_PRICE_RECS
inner join PRC_PRICE_RECS2 on PR_PRIMARY = PR_PRIMARY_2
left join dbo.PAY_RESOURC_LNK on PRCODE = PAYRES_RESOURCE
left join SYS_PEOPLE EMP on PR_PERSON_LINK = EMP.PP_PRIMARY
left join SYS_PEOPLE RESP on EMP.PP_RESP_TO_LINK = RESP.PP_PRIMARY
union all
select 0 PR_PRIMARY
,  NULL PRCODE
,  PRNAME
,  EMP.PP_CODE
,  EMP.PP_KNOWN_AS
,  EMP.PP_DEPARTMENT
,  RESP.PP_KNOWN_AS as PP_RESP_TO
,  PR_EMPLOYEE_CODE
,  PAYRES_PAYTYPE
,  PR_TEXT
,  PR_NOTES
,  PR_LEVEL
,  PR_DO_NOT_USE
,  PR_DATE_USER1
,  PR_DATE_USER2
,  PR_DATE_USER3
,  PR_TARGET_HOURS
,  PR_TARGET_VALUE
,  PR_TIMESHEET_UNITS
,  substring('01',charindex(isnull(PR_TIMESHEET_UNIT_TYPE,'H'),'HD'),1) as PR_TIMESHEET_UNIT_TYPE
,  NULL PR_DATE_PUTIN
,  NULL PR_USER_PUTIN
,  NULL PR_DATE_EDITED
,  NULL PR_USER_EDITED
,  PR_SORT_KEY
,  PR_SORT_KEY1
,  PR_SORT_KEY2
,  PR_SORT_KEY3
,  PR_SORT_KEY4
,  PR_SORT_KEY5
,  PR_SORT_KEY6
,  PR_USRCHAR1
,  PR_USRCHAR2
,  PR_USRCHAR3
,  PR_USRCHAR4
,  PR_USRCHAR5
,  PR_USRCHAR6
,  PR_USRCHAR7
,  PR_USRCHAR8
,  PR_USRNUM1
,  PR_USRNUM2
,  PR_USRNUM3
,  PR_USRFLAG1
,  PR_USRFLAG2
,  PR_USRFLAG3
,  PR_USRDATE1
,  PR_USRDATE2
,  PR_USRDATE3
,  PR_PERSON_LINK
,  dbo.AA_VALUE_DPS_F(PR_QTY_YTD)                                       as PR_QTY_YTD 
,  dbo.AA_VALUE_DPS_F(PR_COSTVAL_YTD)                                   as PR_COSTVAL_YTD
,  PR_PRIMARY DUPLICATE_PRIMARY
,  PR_PRIMARY [PRIMARY]
from PRC_PRICE_RECS
inner join PRC_PRICE_RECS2 on PR_PRIMARY = PR_PRIMARY_2
left join dbo.PAY_RESOURC_LNK on PRCODE = PAYRES_RESOURCE
left join SYS_PEOPLE EMP on PR_PERSON_LINK = EMP.PP_PRIMARY
left join SYS_PEOPLE RESP on EMP.PP_RESP_TO_LINK = RESP.PP_PRIMARY

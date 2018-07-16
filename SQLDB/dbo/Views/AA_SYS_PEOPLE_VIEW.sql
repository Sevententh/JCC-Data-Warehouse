create view AA_SYS_PEOPLE_VIEW
as
/*
** Returns a table to be used specifically with AA_CST_RESOURCE_RETRIEVE_S.  If viewing a duplicate, 
** certain fields will need to be empty.  These are: PP_CODE, PP_DATE_PUTIN, PP_DATE_EDITED, PP_USER_PUTIN, 
** PP_USER_EDITED and PP_DO_NOT_USE
**
** The following fields are intended to be displayed:
**               PP_CODE                  Person code
**               PP_TITLE                 Title (Mr, Mrs, Miss, Dr. etc)
**               PP_INITIALS              Initials
**               PP_FIRST_NAME            First Name
**               PP_SURNAME               Surname
**               PP_EXTERNAL              External
**               PP_KNOWN_AS              Person Known As
**               PP_SALUTE                Salute
**               PP_JOB_TITLE             Job Title
**               PP_DEPARTMENT            Department
**               PP_EMAIL                 Email Address
**               PP_MOBILE                Mobile Phone Number
**               PP_EXTENSION             Telephone Extension
**               PP_USER_ID               User ID
**               PR_RESOURCE_LINK         Link from resource record.
**               PR_PRIMARY               Resource Primary 
**               PRCODE                   Resource code
**               PP_RESP_TO_LINK          Responsible To Link
**               RESP_TO                  Responsible To
**               RESP_TO_NAME             Responsible To Name
**               PP_DO_NOT_USE            Do not use flag
**               PP_DATE_PUTIN            Date Entered
**               PP_DATE_EDITED           Date Last Modified
**               PP_USER_PUTIN            Date Entered
**               PP_USER_EDITED           Date Last Modified
**               PP_NOTES                 Notes
**               PP_USRCHAR1              User Definable Char 1
**               PP_USRCHAR2              User Definable Char 2
**               PP_USRCHAR3              User Definable Char 3
**               PP_USRCHAR4              User Definable Char 4
**               PP_USRCHAR5              User Definable Char 5
**               PP_USRCHAR6              User Definable Char 6
**               PP_USRCHAR7              User Definable Char 7
**               PP_USRCHAR8              User Definable Char 8
**               PP_USRNUM1               User Definable Number 1
**               PP_USRNUM2               User Definable Number 2
**               PP_USRNUM3               User Definable Number 3
**               PP_USRFLAG1              User Definable Flag 1
**               PP_USRFLAG2              User Definable Flag 2
**               PP_USRFLAG3              User Definable Flag 3
**               PP_USRDATE1              User Definable Date 1
**               PP_USRDATE2              User Definable Date 2
**               PP_USRDATE3              User Definable Date 3
**               DUPLICATE_PRIMARY        Duplicate Primary
**
** PP_PRIMARY identifies a row in the result set.
**
** Written:      05/12/05 SB
** Last Amended: 19/12/05 SB, 19/01/06 SB, 14/02/2006 JC, 16/02/06 SB, 23/02/06 SB, 01/03/2006 JC, 11/07/2006 JC
**
*/
select P.PP_PRIMARY
,  P.PP_CODE
,  P.PP_TITLE
,  P.PP_INITIALS
,  P.PP_FIRST_NAME
,  P.PP_SURNAME
--,   P.PP_EXTERNAL
,  P.PP_KNOWN_AS
,  P.PP_SALUTE
,  P.PP_JOB_TITLE
,  P.PP_DEPARTMENT
,  P.PP_EMAIL
,  P.PP_MOBILE
,  P.PP_EXTENSION
,  P.PP_USER_ID
,  PR.PR_PRIMARY
,  PR.PRCODE
,  P.PP_RESP_TO_LINK
,  RT.PP_CODE RESP_TO
,  RT.PP_KNOWN_AS RESP_TO_NAME
,  P.PP_PROJECT_LEADER
,  P.PP_DO_NOT_USE
,  P.PP_DATE_PUTIN
,  P.PP_USER_PUTIN
,  P.PP_DATE_EDITED
,  P.PP_USER_EDITED
,  P.PP_NOTES
,  P.PP_USRCHAR1
,  P.PP_USRCHAR2
,  P.PP_USRCHAR3
,  P.PP_USRCHAR4
,  P.PP_USRCHAR5
,  P.PP_USRCHAR6
,  P.PP_USRCHAR7
,  P.PP_USRCHAR8
,  P.PP_USRNUM1
,  P.PP_USRNUM2
,  P.PP_USRNUM3
,  P.PP_USRFLAG1
,  P.PP_USRFLAG2
,  P.PP_USRFLAG3
,  P.PP_USRDATE1
,  P.PP_USRDATE2
,  P.PP_USRDATE3
,  0 DUPLICATE_PRIMARY
,  P.PP_PRIMARY [PRIMARY]
from SYS_PEOPLE P
left outer join SYS_PEOPLE RT on P.PP_RESP_TO_LINK = RT.PP_PRIMARY
left outer join PRC_PRICE_RECS PR on PR.PR_PERSON_LINK = P.PP_PRIMARY
union all
select 0 PP_PRIMARY
,  NULL PP_CODE
,  P.PP_TITLE
,  NULL PP_INITIALS
,  NULL PP_FIRST_NAME
,  NULL PP_SURNAME
--,   P.PP_EXTERNAL
,  NULL PP_KNOWN_AS
,  NULL PP_SALUTE
,  NULL PP_JOB_TITLE
,  P.PP_DEPARTMENT
,  NULL PP_EMAIL
,  NULL PP_MOBILE
,  NULL PP_EXTENSION
,  NULL PP_USER_ID
,  NULL PR_PRIMARY
,  NULL PRCODE
,  P.PP_RESP_TO_LINK
,  RT.PP_CODE RESP_TO
,  RT.PP_KNOWN_AS RESP_TO_NAME
,  P.PP_PROJECT_LEADER
,  NULL PP_DO_NOT_USE
,  NULL PP_DATE_PUTIN
,  NULL PP_USER_PUTIN
,  NULL PP_DATE_EDITED
,  NULL PP_USER_EDITED
,  NULL PP_NOTES
,  NULL PP_USRCHAR1
,  NULL PP_USRCHAR2
,  NULL PP_USRCHAR3
,  NULL PP_USRCHAR4
,  NULL PP_USRCHAR5
,  NULL PP_USRCHAR6
,  NULL PP_USRCHAR7
,  NULL PP_USRCHAR8
,  NULL PP_USRNUM1
,  NULL PP_USRNUM2
,  NULL PP_USRNUM3
,  NULL PP_USRFLAG1
,  NULL PP_USRFLAG2
,  NULL PP_USRFLAG3
,  NULL PP_USRDATE1
,  NULL PP_USRDATE2
,  NULL PP_USRDATE3
,  P.PP_PRIMARY DUPLICATE_PRIMARY
,  P.PP_PRIMARY [PRIMARY]
from SYS_PEOPLE P
left outer join SYS_PEOPLE RT on P.PP_RESP_TO_LINK = RT.PP_PRIMARY

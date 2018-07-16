create view AA_SYS_PEOPLE_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_SYS_PEOPLE_LIST_S
**
** The following fields are intended to be displayed:
**               PP_CODE               Person Code
**               PP_KNOWN_AS           Known As
**               PP_FIRST_NAME         First Name
**               PP_SURNAME            Surname
**               PP_EMAIL              Email
**               PP_JOB_TITLE          Job Title
**               PP_DEPARTMENT         Department
**               RESPONSIBLE_TO_NAME   Name of whoever the person is responsible to
**               PP_SALUTE             Salute for person (eg. for mail)
**               PR_EMPLOYEE_CODE      Employee Code
**               PP_USER_ID            User ID
**               RESOURCE_CODE         Resource Code
**               PP_PROJECT_LEADER     Flag to show if the person is a project leader
**               RESPONSIBLE_TO_CODE   Code of whoever the person is responsible to
**               PP_TITLE              Title
**               PP_INITIALS           Initials
**               PP_USRCHAR1           User defined string
**               PP_USRCHAR2           User defined string
**               PP_USRCHAR3           User defined string
**               PP_USRCHAR4           User defined string
**               PP_USRCHAR5           User defined string
**               PP_USRCHAR6           User defined string
**               PP_USRCHAR7           User defined string
**               PP_USRCHAR8           User defined string
**               PP_USRDATE1           User defined date
**               PP_USRDATE2           User defined date
**               PP_USRDATE3           User defined date
**               PP_USRFLAG1           User defined flag
**               PP_USRFLAG2           User defined flag
**               PP_USRFLAG3           User defined flag
**               PP_USRNUM1            User defined number
**               PP_USRNUM2            User defined number
**               PP_USRNUM3            User defined number
**               PR_DATE_PUTIN         Date Entered
**               PR_DATE_EDITED        Date Last Modified
**               PR_USER_PUTIN         User who Entered
**               PR_USER_EDITED        User who Last Modified
**               PP_DO_NOT_USE         Do not use flag
**
** The following extra fields are provided for searching:
**               KNOWN_AS              Person Known As
**               FIRST_NAME            Person First Name
**               SURNAME               Surname
**               EMAIL                 Email
**               JOB_TITLE             Job Title
**               [USER_ID]             Person's user ID 
**
** [PRIMARY] identifies a row in the recordset
**
** Written:      25/11/05 SR
** Last Amended: 29/11/05 SB
**
*/
as

select
 P.PP_PRIMARY as [PRIMARY]
,P.PP_CODE
,coalesce(P.PP_KNOWN_AS,'') as PP_KNOWN_AS
,coalesce(P.PP_FIRST_NAME,'') as PP_FIRST_NAME
,coalesce(P.PP_SURNAME,'') as PP_SURNAME
,coalesce(P.PP_EMAIL,'') as PP_EMAIL
,coalesce(P.PP_JOB_TITLE,'') as PP_JOB_TITLE
,coalesce(P.PP_DEPARTMENT,'') as PP_DEPARTMENT
,coalesce(RT.PP_KNOWN_AS,'') as RESPONSIBLE_TO_NAME
,coalesce(P.PP_SALUTE,'') as PP_SALUTE
,coalesce(P.PP_USER_ID,'') as PP_USER_ID
,PR.PRCODE as RESOURCE_CODE
,coalesce(P.PP_PROJECT_LEADER,0) as PP_PROJECT_LEADER
,coalesce(RT.PP_CODE,'') as RESPONSIBLE_TO_CODE
,coalesce(P.PP_TITLE,'') as PP_TITLE
,coalesce(P.PP_INITIALS,'') as PP_INITIALS
,coalesce(P.PP_USRCHAR1,'') as PP_USRCHAR1
,coalesce(P.PP_USRCHAR2,'') as PP_USRCHAR2
,coalesce(P.PP_USRCHAR3,'') as PP_USRCHAR3
,coalesce(P.PP_USRCHAR4,'') as PP_USRCHAR4
,coalesce(P.PP_USRCHAR5,'') as PP_USRCHAR5
,coalesce(P.PP_USRCHAR6,'') as PP_USRCHAR6
,coalesce(P.PP_USRCHAR7,'') as PP_USRCHAR7
,coalesce(P.PP_USRCHAR8,'') as PP_USRCHAR8
,P.PP_USRDATE1
,P.PP_USRDATE2
,P.PP_USRDATE3
,P.PP_USRFLAG1  
,P.PP_USRFLAG2  
,P.PP_USRFLAG3  
,P.PP_USRNUM1   
,P.PP_USRNUM2   
,P.PP_USRNUM3 
,P.PP_DATE_PUTIN
,P.PP_DATE_EDITED
,P.PP_USER_PUTIN
,P.PP_USER_EDITED
,P.PP_DO_NOT_USE
--Extra Search Fields
,P.PP_KNOWN_AS as KNOWN_AS
,P.PP_FIRST_NAME as FIRST_NAME
,P.PP_SURNAME as SURNAME
,P.PP_EMAIL as EMAIL
,P.PP_JOB_TITLE as JOB_TITLE
,PR.PR_EMPLOYEE_CODE
,P.PP_USER_ID as [USER_ID]
,PR.PR_EMPLOYEE_CODE as EMPLOYEE_CODE
,P.PP_PROJECT_LEADER as PROJECT_LEADER 

from SYS_PEOPLE P
left outer join SYS_PEOPLE RT on P.PP_RESP_TO_LINK = RT.PP_PRIMARY
left outer join PRC_PRICE_RECS PR on PR.PR_PERSON_LINK = RT.PP_PRIMARY
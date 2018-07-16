create view AA_SYS_PEOPLE_SIMPLE_VIEW
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
**               PR_EMPLOYEE_CODE      Employee Code
**               PP_USER_ID            User ID
**               PP_DO_NOT_USE         Do not use flag
**               PP_DEPARTMENT         Department
**               RESPONSIBLE_TO_NAME   Name of whoever the person is responsible to
**               PP_SALUTE             Salute for person (eg. for mail)
**               PR_DATE_PUTIN         Date Entered
**               PR_DATE_EDITED        Date Last Modified
**               PP_PROJECT_LEADER     Flag to show if the person is a project leader
**               RESPONSIBLE_TO_CODE   Code of whoever the person is responsible to
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
** Last Amended: 29/11/05 SB, 16/02/06 SB
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
--Extra Search Fields
,P.PP_KNOWN_AS as KNOWN_AS
,P.PP_FIRST_NAME as FIRST_NAME
,P.PP_SURNAME as SURNAME
,P.PP_EMAIL as EMAIL
,P.PP_JOB_TITLE as JOB_TITLE
,PR.PR_EMPLOYEE_CODE
,P.PP_USER_ID as [USER_ID]
,P.PP_DATE_PUTIN
,P.PP_DATE_EDITED
,P.PP_DO_NOT_USE
,PR.PR_EMPLOYEE_CODE as EMPLOYEE_CODE
,P.PP_PROJECT_LEADER as PROJECT_LEADER

from SYS_PEOPLE P
left outer join SYS_PEOPLE RT on P.PP_RESP_TO_LINK = RT.PP_PRIMARY
left outer join PRC_PRICE_RECS PR on RT.PP_PRIMARY = PR.PR_PERSON_LINK
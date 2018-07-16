create view AA_CST_PROJECT_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_CST_PROJECT_LIST_S
**
** The following fields are intended to be displayed:
**               CH_CODE               Project Code
**               [NAME]                Project Name
**               STATUS                Project Status (A=Active, E=Estimate, S=Suspended, R=Reopened, X=Cancelled, C=Completed)
**               ACCOUNT               Customer Account
**               CH_DATE_START         Project Start Date
**               DURATION_HOURS        Project Duration in hours
**               MS_DATE               Date of Next Milestone
**               CH_DATE_DEADLINE      Deadline
**               PP_KNOWN_AS           Project Leader
**               CH_DATE_COMP          Date Completed
**               SORT                  Sort Key
**               USER1                 User Sort 1
**               USER2                 User Sort 2
**               USER3                 User Sort 3
**               USER4                 User Sort 4
**               USER5                 User Sort 5
**               USER6                 User Sort 6
**               CUST_SORT             Customer Sort Key
**               PROFILELEVEL          Security Level
**               CH_DATE_PUTIN         Date Entered
**               CH_DATE_EDITED        Date Last Modified
**               CH_DO_NOT_USE         Do not use flag
**
** The following extra fields are provided for searching:
**               CH_NAME               Project Name
**               CH_STATUS             Project Status
**               CH_ACCOUNT            Customer Account
**               CH_SORT               Sort Key
**               CH_USER1              User Sort 1
**               CH_USER2              User Sort 2
**               CH_USER3              User Sort 3
**               CUSORT                Customer Sort Key
**
** [PRIMARY] identifies a row in the recordset
**
** Written     :  20/05/2004 DG
** Last Amended:  27/05/2004 DG, 21/06/2004 DG, 13/07/2004 DG, 11/08/2004 DG, 17/11/2005 SB, 29/11/2005 SR, 11/01/2006 SH, 18/01/2006 SB, 30/04/07 NC
**
*/
as

select
 CH_PRIMARY as [PRIMARY]
--Display Fields
,CH_CODE
,coalesce(CH_NAME,'') as [NAME]
,coalesce(CH_STATUS,'') as STATUS
,coalesce(CH_ACCOUNT,'') as ACCOUNT
,CH_DATE_START
-- We are assuming an average month of 4.35 weeks and that there are 52 weeks in a year
,case CH_DUR_TYPE when 'H' then CH_DURATION
                  when 'D' then CH_DURATION * CST_WORKING_HOURS_IN_DAY
                  when 'W' then CH_DURATION * CST_WORKING_HOURS_IN_DAY * CST_WORKING_DAYS_IN_WEEK
                  when 'M' then CH_DURATION * CST_WORKING_HOURS_IN_DAY * CST_WORKING_DAYS_IN_WEEK * 4.35
                  when 'Y' then CH_DURATION * CST_WORKING_HOURS_IN_DAY * CST_WORKING_DAYS_IN_WEEK * 52.0
                  else 0.0 end DURATION_HOURS
,MS_DATE                                      -- Date of next Milestone
,CH_DATE_DEADLINE
,coalesce(PP_KNOWN_AS,'') as PP_KNOWN_AS      -- Project Leader
--,CH_DATE_REQ
,CH_DATE_COMP
,coalesce(CH_SORT,'') as SORT
,coalesce(CH_USER1,'') as USER1
,coalesce(CH_USER2,'') as USER2
,coalesce(CH_USER3,'') as USER3
,coalesce(CH_USER4,'') as USER4
,coalesce(CH_USER5,'') as USER5
,coalesce(CH_USER6,'') as USER6
,coalesce(CUSORT,'') CUST_SORT
,CH_LEVEL as PROFILELEVEL
,CH_DATE_PUTIN
,CH_DATE_EDITED
,coalesce(CH_DO_NOT_USE,0) CH_DO_NOT_USE
--Search Fields
,CH_NAME
,CH_STATUS
,CH_ACCOUNT
,CH_SORT
,CH_USER1
,CH_USER2
,CH_USER3
,CUSORT
,isnull(CH_TEMPLATE_LINK,0) as CH_TEMPLATE_LINK
,CH_TYPE
,CU_PRIMARY
from CST_COSTHEADER
left join SL_ACCOUNTS with (index(CUCODE), nolock) on CH_ACCOUNT = CUCODE and CH_ACCOUNT<>''
left join SYS_PEOPLE with (nolock) on CH_PERSON_LINK = PP_PRIMARY
left join CST_MILESTONES with (nolock) on CH_NEXT_MILESTONE_LINK = MS_PRIMARY
join SYS_DATAINFO3 with (nolock) on SYS_PRIMARY_3 = 1

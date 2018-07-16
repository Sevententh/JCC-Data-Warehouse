create view AA_CST_PROJECT_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_CST_PROJECT_LIST_S
**
** The following fields are intended to be displayed:
**               CH_CODE                  Project Code
**               [NAME]                   Project Name
**               STATUS                   Project Status (A=Active, E=Estimate, S=Suspended, R=Reopened, X=Cancelled, C=Completed)
**               ACCOUNT                  Customer Account
**               CH_DATE_START            Project Start Date
**               DURATION_HOURS           Project Duration in hours
**               MS_DATE                  Date of Next Milestone
**               CH_DATE_DEADLINE         Deadline
**               PP_KNOWN_AS              Project Leader
**               CH_DATE_COMP             Date Completed
**               SORT                     Sort Key
**               USER1                    User Sort 1
**               USER2                    User Sort 2
**               USER3                    User Sort 3
**               USER4                    User Sort 4
**               USER5                    User Sort 5
**               USER6                    User Sort 6
**               CUST_SORT                Customer Sort Key
**               PROFILELEVEL             Security Level
**               CUNAME                   Customer Name
**               CUCONTACT                Customer Contact
**               CH_DATE_USER1            User Definable Date 1
**               CH_DATE_USER2            User Definable Date 2
**               CH_DATE_USER3            User Definable Date 3
**               CH_TEMPLATE_LINK         Link to Project Structure
**               CH_USRCHAR1              User Definable String 1
**               CH_USRCHAR2              User Definable String 2
**               CH_USRCHAR3              User Definable String 3
**               CH_USRCHAR4              User Definable String 4
**               CH_USRCHAR5              User Definable String 5
**               CH_USRCHAR6              User Definable String 6
**               CH_USRCHAR7              User Definable String 7
**               CH_USRCHAR8              User Definable String 8
**               CH_USRFLAG1              User Definable Flag 1
**               CH_USRFLAG2              User Definable Flag 2
**               CH_USRFLAG3              User Definable Flag 3
**               CH_USRDATE1              User Definable Date 1
**               CH_USRDATE2              User Definable Date 2
**               CH_USRDATE3              User Definable Date 3
**               CH_USRNUM1               User Definable Number 1
**               CH_USRNUM2               User Definable Number 1
**               CH_USRNUM3               User Definable Number 1
**               CH_ACTUAL_COST           Actual Cost
**               CH_ACTUAL_SALES          Actual Sales
**               CH_ACTUAL_PROFIT         Actual Profit (Actual Sales - Actual Cost)
**               CH_ESTIMATED_COST        Estimated Cost
**               CH_ESTIMATED_SALES       Estimated Sales
**               CH_ESTIMATED_PROFIT      Estimated Profit (Estimated Sales - Estimated Cost)
**               CH_WIP                   WIP
**               CH_WIP_C                 Currency WIP
**               CH_DO_NOT_USE            Do not use flag
**               CH_DATE_PUTIN            Date Entered
**               CH_DATE_EDITED           Date Last Modified
**               CH_USER_PUTIN            User Entered By
**               CH_USER_EDITED           User Last Modified By
**               DURATION
**
** The following extra fields are provided for searching:
**               CH_NAME                  Project Name
**               CH_STATUS                Project Status
**               CH_ACCOUNT               Customer Account
**               CH_SORT                  Sort Key
**               CH_USER1                 User Sort 1
**               CH_USER2                 User Sort 2
**               CH_USER3                 User Sort 3
**               CUSORT                   Customer Sort Key
**               CH_BUDGET_CURRENCYSYMB   Currency Symbol
**
** [PRIMARY] identifies a row in the recordset
**
** Written     :  20/05/2004 DG
** Last Amended:  27/05/2004 DG, 21/06/2004 DG, 13/07/2004 DG, 11/08/2004 DG, 10/01/2004 SR, 05/11/2005 SB, 29/11/2005 SR, 13/12/2005 SB, 11/01/2006 SH, 18/01/06 SB, 30/04/07 NC
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
,coalesce(CUNAME,'') as CUNAME
,coalesce(CUCONTACT,'') as CUCONTACT
,CH_DATE_USER1                                  -- Project Date 1
,CH_DATE_USER2                                  -- Project Date 2
,CH_DATE_USER3                                  -- Project Date 3
,isnull(CH_TEMPLATE_LINK,0) as CH_TEMPLATE_LINK -- Project Structure
,coalesce(CH_USRCHAR1,'') as CH_USRCHAR1
,coalesce(CH_USRCHAR2,'') as CH_USRCHAR2
,coalesce(CH_USRCHAR3,'') as CH_USRCHAR3
,coalesce(CH_USRCHAR4,'') as CH_USRCHAR4
,coalesce(CH_USRCHAR5,'') as CH_USRCHAR5
,coalesce(CH_USRCHAR6,'') as CH_USRCHAR6
,coalesce(CH_USRCHAR7,'') as CH_USRCHAR7
,coalesce(CH_USRCHAR8,'') as CH_USRCHAR8
,cast(CH_USRFLAG1 as bit) as CH_USRFLAG1
,cast(CH_USRFLAG2 as bit) as CH_USRFLAG2
,cast(CH_USRFLAG3 as bit) as CH_USRFLAG3
,CH_USRDATE1
,CH_USRDATE2
,CH_USRDATE3
,dbo.AA_VALUE_DPS_F(CH_USRNUM1)as CH_USRNUM1
,dbo.AA_VALUE_DPS_F(CH_USRNUM2)as CH_USRNUM2
,dbo.AA_VALUE_DPS_F(CH_USRNUM3)as CH_USRNUM3
,dbo.AA_VALUE_DPS_F(CH_ACTUAL_COST)as CH_ACTUAL_COST
,dbo.AA_VALUE_DPS_F(CH_ACTUAL_SALES)as CH_ACTUAL_SALES
,dbo.AA_VALUE_DPS_F(CH_ACTUAL_SALES - CH_ACTUAL_COST)as CH_ACTUAL_PROFIT
,dbo.AA_VALUE_DPS_F(case isnull(CH_BUDGET_REVISED,0) when 0 then CH_COST_OBUDG1
                                                     else CH_COST_RBUDG2 end) as CH_ESTIMATED_COST
,dbo.AA_VALUE_DPS_F(case isnull(CH_BUDGET_REVISED,0) when 0 then CH_SALE_OBUDG1
                                                     else CH_SALE_RBUDG2 end) as CH_ESTIMATED_SALES
,dbo.AA_VALUE_DPS_F(case isnull(CH_BUDGET_REVISED,0) when 0 then CH_COST_OBUDG1 else CH_COST_RBUDG2 end
                  - case isnull(CH_BUDGET_REVISED,0) when 0 then CH_SALE_OBUDG1 else CH_SALE_RBUDG2 end) AS CH_ESTIMATED_PROFIT
,dbo.AA_VALUE_DPS_F(CH_WIP) CH_WIP
,coalesce(CH_DO_NOT_USE,0) CH_DO_NOT_USE
,CH_DATE_PUTIN
,CH_DATE_EDITED
,CH_USER_PUTIN
,CH_USER_EDITED
,case coalesce(CH_DURATION,0) when 1 then (cast(CH_DURATION AS varchar(10)) + ' ' + case CH_DUR_TYPE when 'H' then 'Hour' when 'D' then 'Day' when 'W' then 'Week' when 'M' then 'Month' when 'Y' then 'Year' else '' end)
   else (cast(CH_DURATION AS varchar(10)) + ' ' + case CH_DUR_TYPE when 'H' then 'Hours' when 'D' then 'Days' when 'W' then 'Weeks' when 'M' then 'Months' when 'Y' then 'Years' else '' end) end DURATION
--Search Fields
,CH_NAME
,CH_STATUS
,CH_ACCOUNT
,CH_SORT
,CH_USER1
,CH_USER2
,CH_USER3
,CUSORT
,CH_BUDGET_CURRENCYSYMB
,CH_TYPE
,CU_PRIMARY
from CST_COSTHEADER
join CST_COSTHEADER2 with (nolock) on CH_PRIMARY_2 = CH_PRIMARY
left join SL_ACCOUNTS with (index(CUCODE), nolock) on CH_ACCOUNT = CUCODE and CH_ACCOUNT<>''
left join SYS_PEOPLE with (nolock) on CH_PERSON_LINK = PP_PRIMARY
left join CST_MILESTONES with (nolock) on CH_NEXT_MILESTONE_LINK = MS_PRIMARY
join SYS_DATAINFO3 with (nolock) on SYS_PRIMARY_3 = 1

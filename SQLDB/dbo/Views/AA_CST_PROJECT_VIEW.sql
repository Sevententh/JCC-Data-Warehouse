create view AA_CST_PROJECT_VIEW
/*
**
** Intended to be called by AA_X_CST_PROJECT_RETRIEVE_S
** The following fields are intended to be displayed:
**          Project code                        - CH_CODE
**          Project name                        - CH_NAME
**          Project description                 - CH_DESCRIPTION
**          Project Status                      - CH_STATUS
**          Project Leader                      - PP_CODE
**          Project Leader Name                 - PP_KNOWN_AS
**          Project Start Date                  - CH_DATE_START
**          Next Milestone Date                 - MS_DATE
**          Deadline Date                       - CH_DATE_DEADLINE
**          Completed Date                      - CH_DATE_COMP
**          Project Style                       - CH_STYLE
**          Budget Type                         - CH_TYPE
**          Budget Currency Symbol              - CH_BUDGET_CURRENCYSYMB
**          Project Structure                   - CPS_CODE
**          Project Structure Name              - CPS_NAME
**          Duration                            - CH_DURATION
**          Duration Type                       - CH_DUR_TYPE
**          Fixed Price                         - CH_FIXED_PRICE
**          Invoice Style                       - CH_INVOICE_STYLE
**          Customer Code                       - CH_ACCOUNT
**          Customer Name                       - CUNAME
**          Contact Name                        - CUCONTACT
**          Security Level                      - CH_LEVEL
**          Default Invoicing Cost Centre       - CC_CODE
**          Default Invoicing Cost Centre Name  - CC_NAME
**          Exclude from Lists                  - CH_DO_NOT_USE
**          Notes                               - CH_NOTES
**          Created On                          - CH_DATE_PUTIN
**          Created By                          - CH_USER_PUTIN
**          Last Change                         - CH_DATE_EDITED
**          Changed By                          - CH_USER_EDITED
**          Last Invoice                        - CH_DATE_INV
**          Last Payment                        - CH_DATE_PAY
**          Date Estimated                      - CH_DATE_EST
**          Status Changed                      - CH_DATE_STAT
**          Sort Key                            - CH_SORT
**          User Sort 1                         - CH_USER1
**          User Sort 2                         - CH_USER2
**          User Sort 3                         - CH_USER3
**          User Sort 4                         - CH_USER4
**          User Sort 5                         - CH_USER5
**          User Sort 6                         - CH_USER6
**          Project Date 1                      - CH_DATE_USER1
**          Project Date 2                      - CH_DATE_USER2
**          Project Date 3                      - CH_DATE_USER3
**          Timesheet Analysis                  - TIMESHEET_ANALYSIS_CODE
**          Timesheet Analysis Name             - TIMESHEET_ANALYSIS_NAME
**          Income Analysis                     - INCOME_ANALYSIS_CODE
**          Income Analysis Name                - INCOME_ANALYSIS_NAME
**          Cost Analysis                       - COST_ANALYSIS_CODE
**          Cost Analysis Name                  - COST_ANALYSIS_NAME
**          Actual                              - CH_ACTUAL_COST
**          Committed                           - CH_COMITT_COST
**          Invoiced                            - CH_COST_INVTD
**          WIP                                 - CH_WIP_UPLIFT
**          Sales WIP                           - CH_SALES_WIP
**          User Char 1                         - CH_USRCHAR1
**          User Char 2                         - CH_USRCHAR2
**          User Char 3                         - CH_USRCHAR3
**          User Char 4                         - CH_USRCHAR4
**          User Char 5                         - CH_USRCHAR5
**          User Char 6                         - CH_USRCHAR6
**          User Char 7                         - CH_USRCHAR7
**          User Char 8                         - CH_USRCHAR8
**          User No. 1                          - CH_USRNUM1
**          User No. 2                          - CH_USRNUM2
**          User No. 3                          - CH_USRNUM3
**          User Flag 1                         - CH_USRFLAG1
**          User Flag 2                         - CH_USRFLAG2
**          User Flag 3                         - CH_USRFLAG3
**          User Date 1                         - CH_USRDATE1
**          User Date 2                         - CH_USRDATE2
**          User Date 3                         - CH_USRDATE3
**
** Other Fields:
**          DUPLICATE_FLAG: 1=Duplicate (Leave some fields blank) 0=Not Duplicate (Return all fields in the view)
**          CH_PRIMARY identifies a row in the result set
**
** Written     : 25/02/04 SR
** Last Amended: 09/06/04 NC, 03/11/04 SH, 30/11/05 SB, 05/12/05 SB, 09/12/05 SB, 18/01/06 SB, 20/01/06 ROBB
*/
as

select
   CH_PRIMARY
,  CH_CODE
,  CH_NAME
,  CH_DESCRIPTION
,  substring('012345',charindex(CH_STATUS,'EASRXC'),1) as CH_STATUS -- 0=Estimate,1=Active,2=Suspended,3=Reopened,4=Cancelled,5=Completed
,  PP_CODE
,  PP_KNOWN_AS
,  CH_DATE_START
,  MS_DATE
,  CH_DATE_DEADLINE
,  CH_DATE_COMP
,  substring('01',charindex(CH_STYLE,'PT'),1) as CH_STYLE -- 0=Profit and Loss,1=Tabular
,  substring('01',charindex(CH_TYPE,'TP'),1) as CH_TYPE -- 0=Transactional,1=Period
,  CH_BUDGET_CURRENCYSYMB
,  CPS_CODE
,  CPS_NAME
,  CH_DURATION
,  substring('01234',charindex(CH_DUR_TYPE,'HDWMY'),1) as CH_DUR_TYPE -- 0=Hours,1=Days,2=Weeks,3=Months,4=Years
,  CH_FIXED_PRICE
,  CH_INVOICE_STYLE -- 0=None,1=Time and Materials,2=Fixed Price
,  CH_ACCOUNT
,  SL_ACCOUNTS.CUNAME
,  SL_ACCOUNTS.CUCONTACT
,  CH_LEVEL
,  CC_CODE
,  CC_NAME
,  CH_DO_NOT_USE
,  CH_NOTES
,  CH_DATE_PUTIN
,  CH_USER_PUTIN
,  CH_DATE_EDITED
,  CH_USER_EDITED
,  CH_DATE_INV
,  CH_DATE_PAY
,  CH_DATE_EST
,  CH_DATE_STAT
,  CH_SORT
,  CH_USER1
,  CH_USER2
,  CH_USER3
,  CH_USER4
,  CH_USER5
,  CH_USER6
,  CH_DATE_USER1
,  CH_DATE_USER2
,  CH_DATE_USER3
,  TIMESHEET.PACODE TIMESHEET_ANALYSIS_CODE
,  TIMESHEET.PANAME TIMESHEET_ANALYSIS_NAME
,  INCOME.PACODE INCOME_ANALYSIS_CODE
,  INCOME.PANAME INCOME_ANALYSIS_NAME
,  COST.PACODE COST_ANALYSIS_CODE
,  COST.PANAME COST_ANALYSIS_NAME
,  CH_ACTUAL_COST
,  CH_COMITT_COST
,  CH_COST_INVTD
,  CH_WIP_UPLIFT
,  CH_SALES_WIP
,  CH_USRCHAR1
,  CH_USRCHAR2
,  CH_USRCHAR3
,  CH_USRCHAR4
,  CH_USRCHAR5
,  CH_USRCHAR6
,  CH_USRCHAR7
,  CH_USRCHAR8
,  CH_USRNUM1
,  CH_USRNUM2
,  CH_USRNUM3
,  CH_USRDATE1
,  CH_USRDATE2
,  CH_USRDATE3
,  CH_USRFLAG1
,  CH_USRFLAG2
,  CH_USRFLAG3
,  CH_PERSON_LINK
,  CH_NEXT_MILESTONE_LINK
,  CH_DEFAULT_INV_CC_LINK
,  CH_TIMETABLE_ANALYSIS_LINK
,  CH_INVOICE_ANALYSIS_LINK
,  CH_COST_ANALYSIS_LINK
,  CH_TEMPLATE_LINK
,  0 DUPLICATE_PRIMARY
,  CH_PRIMARY [PRIMARY]
from
   CST_COSTHEADER
   inner join CST_COSTHEADER2 on CST_COSTHEADER.CH_PRIMARY = CST_COSTHEADER2.CH_PRIMARY_2
   left join SYS_PEOPLE on CST_COSTHEADER.CH_PERSON_LINK = PP_PRIMARY
   left join CST_MILESTONES on CH_NEXT_MILESTONE_LINK = MS_PRIMARY
   left join SL_ACCOUNTS on CST_COSTHEADER.CH_ACCOUNT = SL_ACCOUNTS.CUCODE and isnull( CH_ACCOUNT, '' ) <> ''
   left join CST_COSTCENTRE on CST_COSTHEADER.CH_DEFAULT_INV_CC_LINK = CST_COSTCENTRE.CC_PRIMARY
   left join PL_ANALYSIS TIMESHEET on CST_COSTHEADER.CH_TIMETABLE_ANALYSIS_LINK = TIMESHEET.PA_PRIMARY
   left join PL_ANALYSIS INCOME on CST_COSTHEADER.CH_INVOICE_ANALYSIS_LINK = INCOME.PA_PRIMARY
   left join PL_ANALYSIS COST on CST_COSTHEADER.CH_COST_ANALYSIS_LINK = COST.PA_PRIMARY
   left join CST_PROJECT_STRUCTURE on CST_COSTHEADER.CH_TEMPLATE_LINK = CST_PROJECT_STRUCTURE.CPS_PRIMARY

union all   -- Top half is actual record, Bottom half is a duplicate record with relevant fields cleared
            -- where clause in retrieve procedure will ensure only one half of union is returned at a time.

select
   0 CH_PRIMARY
,  NULL CH_CODE
,  CH_NAME
,  CH_DESCRIPTION
,  substring('012345',charindex(CH_STATUS,'EASRXC'),1) as CH_STATUS -- 0=Estimate,1=Active,2=Suspended,3=Reopened,4=Cancelled,5=Completed
,  PP_CODE
,  PP_KNOWN_AS
,  CH_DATE_START
,  MS_DATE
,  CH_DATE_DEADLINE
,  NULL CH_DATE_COMP
,  substring('01',charindex(CH_STYLE,'PT'),1) as CH_STYLE -- 0=Profit and Loss,1=Tabular
,  substring('01',charindex(CH_TYPE,'TP'),1) as CH_TYPE -- 0=Transactional,1=Period
,  CH_BUDGET_CURRENCYSYMB
,  CPS_CODE
,  CPS_NAME
,  CH_DURATION
,  substring('01234',charindex(CH_DUR_TYPE,'HDWMY'),1) as CH_DUR_TYPE -- 0=Hours,1=Days,2=Weeks,3=Months,4=Years
,  CH_FIXED_PRICE
,  CH_INVOICE_STYLE -- 0=None,1=Time and Materials,2=Fixed Price
,  CH_ACCOUNT
,  SL_ACCOUNTS.CUNAME
,  SL_ACCOUNTS.CUCONTACT
,  CH_LEVEL
,  CC_CODE
,  CC_NAME
,  NULL CH_DO_NOT_USE
,  NULL CH_NOTES
,  NULL CH_DATE_PUTIN
,  NULL CH_USER_PUTIN
,  NULL CH_DATE_EDITED
,  NULL CH_USER_EDITED
,  NULL CH_DATE_INV
,  NULL CH_DATE_PAY
,  NULL CH_DATE_EST
,  NULL CH_DATE_STAT
,  CH_SORT
,  CH_USER1
,  CH_USER2
,  CH_USER3
,  CH_USER4
,  CH_USER5
,  CH_USER6
,  CH_DATE_USER1
,  CH_DATE_USER2
,  CH_DATE_USER3
,  TIMESHEET.PACODE TIMESHEET_ANALYSIS_CODE
,  TIMESHEET.PANAME TIMESHEET_ANALYSIS_NAME
,  INCOME.PACODE INCOME_ANALYSIS_CODE
,  INCOME.PANAME INCOME_ANALYSIS_NAME
,  COST.PACODE COST_ANALYSIS_CODE
,  COST.PANAME COST_ANALYSIS_NAME
,  NULL CH_ACTUAL_COST
,  NULL CH_COMITT_COST
,  NULL CH_COST_INVTD
,  NULL CH_WIP_UPLIFT
,  NULL CH_SALES_WIP
,  CH_USRCHAR1
,  CH_USRCHAR2
,  CH_USRCHAR3
,  CH_USRCHAR4
,  CH_USRCHAR5
,  CH_USRCHAR6
,  CH_USRCHAR7
,  CH_USRCHAR8
,  CH_USRNUM1
,  CH_USRNUM2
,  CH_USRNUM3
,  CH_USRDATE1
,  CH_USRDATE2
,  CH_USRDATE3
,  CH_USRFLAG1
,  CH_USRFLAG2
,  CH_USRFLAG3
,  CH_PERSON_LINK
,  NULL CH_NEXT_MILESTONE_LINK
,  CH_DEFAULT_INV_CC_LINK
,  CH_TIMETABLE_ANALYSIS_LINK
,  CH_INVOICE_ANALYSIS_LINK
,  CH_COST_ANALYSIS_LINK
,  CH_TEMPLATE_LINK
,  CH_PRIMARY DUPLICATE_PRIMARY
,  CH_PRIMARY [PRIMARY]
from
   CST_COSTHEADER
   inner join CST_COSTHEADER2 on CST_COSTHEADER.CH_PRIMARY = CST_COSTHEADER2.CH_PRIMARY_2
   left join SYS_PEOPLE on CST_COSTHEADER.CH_PERSON_LINK = PP_PRIMARY
   left join CST_MILESTONES on CH_NEXT_MILESTONE_LINK = MS_PRIMARY
   left join SL_ACCOUNTS on CST_COSTHEADER.CH_ACCOUNT = SL_ACCOUNTS.CUCODE and isnull( CH_ACCOUNT, '' ) <> ''
   left join CST_COSTCENTRE on CST_COSTHEADER.CH_DEFAULT_INV_CC_LINK = CST_COSTCENTRE.CC_PRIMARY
   left join PL_ANALYSIS TIMESHEET on CST_COSTHEADER.CH_TIMETABLE_ANALYSIS_LINK = TIMESHEET.PA_PRIMARY
   left join PL_ANALYSIS INCOME on CST_COSTHEADER.CH_INVOICE_ANALYSIS_LINK = INCOME.PA_PRIMARY
   left join PL_ANALYSIS COST on CST_COSTHEADER.CH_COST_ANALYSIS_LINK = COST.PA_PRIMARY
   left join CST_PROJECT_STRUCTURE on CST_COSTHEADER.CH_TEMPLATE_LINK = CST_PROJECT_STRUCTURE.CPS_PRIMARY

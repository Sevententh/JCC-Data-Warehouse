﻿CREATE VIEW AA_DASHBOARD_PIR_RESULT_ORDERED_VIEW

/*
**       
**  Written:	   Taken from AOI source code as at 25/10/07  
**  Last Amended:  N/A
*/

AS

SELECT     PL_ACCOUNTS.SUNAME, PL_TRANSACTIONS.PT_COPYSUPP, PL_TRANSACTIONS.PT_TRANTYPE,

                      PL_TRANSACTIONS.PT_HEADER_REF, PL_TRANSACTIONS.PT_DESCRIPTION, PL_TRANSACTIONS.PT_HEADER_KEY, 

                      AA_DASHBOARD_PIR_ORDERED_AUTH_LIST_VIEW.tStage, AA_DASHBOARD_PIR_ORDERED_AUTH_LIST_VIEW.tstatus, AA_DASHBOARD_PIR_ORDERED_AUTH_LIST_VIEW.tuser, 

                      CAST(PL_TRANSACTIONS.PT_DATE AS smalldatetime) AS PT_DATE , PL_TRANSACTIONS.PT_GROSS, PL_TRANSACTIONS.PT_PRIMARY,PL_TRANSACTIONS.PT_INVREG_MATCHEDKEY,PT_INVREG_APPROVESTATUS,PT_INVREG_TYPE,PT_CURRENCYCODE,PT_CURR_VALU

		,PT_INVREG_APPROVER1,PT_INVREG_APPROVER2,PT_INVREG_APPROVER3,PT_INVREG_APPROVEKEY1,PT_INVREG_APPROVEKEY2,PT_INVREG_APPROVEKEY3,PT_INVREG_FLAG

		

FROM         AA_DASHBOARD_PIR_ORDERED_AUTH_LIST_VIEW INNER JOIN

                      PL_TRANSACTIONS ON AA_DASHBOARD_PIR_ORDERED_AUTH_LIST_VIEW.tkey = PL_TRANSACTIONS.PT_HEADER_KEY INNER JOIN

                      PL_ACCOUNTS ON PL_TRANSACTIONS.PT_COPYSUPP = PL_ACCOUNTS.SUCODE
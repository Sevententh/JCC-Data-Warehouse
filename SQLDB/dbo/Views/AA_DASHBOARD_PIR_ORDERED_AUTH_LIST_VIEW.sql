CREATE VIEW AA_DASHBOARD_PIR_ORDERED_AUTH_LIST_VIEW

/*
**       
**  Written:	   Taken from AOI source code as at 25/10/07  
**  Last Amended:  N/A
*/

AS

SELECT     pt_header_key AS tkey, pt_invreg_approver1 AS tuser, 1 AS tStage, pt_invreg_approvekey1 AS tstatus

FROM         pl_transactions

WHERE     pt_invreg_approvekey1 = 'W' OR

                      pt_invreg_approvekey1 = 'R' AND pt_invreg_flag = 1

UNION

SELECT     pt_header_key AS tkey, pt_invreg_approver2 AS tuser, 2 AS tStage, pt_invreg_approvekey2 AS tstatus

FROM         pl_transactions

WHERE     (pt_invreg_approvekey2 = 'W' OR

                      pt_invreg_approvekey2 = 'R') AND pt_invreg_approvekey1 = 'A' AND pt_invreg_flag = 1

UNION

SELECT     pt_header_key AS tkey, pt_invreg_approver3 AS tuser, 3 AS tStage, pt_invreg_approvekey3 AS tstatus

FROM         pl_transactions

WHERE     (pt_invreg_approvekey3 = 'W' OR

                      pt_invreg_approvekey3 = 'R') AND pt_invreg_approvekey2 = 'A' AND pt_invreg_flag = 1




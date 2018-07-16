﻿CREATE VIEW AA_REP_SALES_TRAN_HEADER_VIEW
/*
** Written:     24/02/2005 RV   
** Last Amended: 08/03/05 RV added header key. 29/03/05 RV.
** Comments: returns all sales transaction headers for crystal reports
*/
AS
SELECT     
SL_ACCOUNTS.CUCODE, 
SL_ACCOUNTS.CUNAME, 
SL_ACCOUNTS.CUSORT,
 
SL_TRANSACTIONS.ST_DATE, 
SL_TRANSACTIONS.ST_YEAR, 
SL_TRANSACTIONS.ST_PERIODNUMBER, 
SL_TRANSACTIONS.ST_TRANTYPE, 
SL_TRANSACTIONS.ST_HEADER_REF, 
SL_TRANSACTIONS.ST_NETT, 
SL_TRANSACTIONS.ST_VAT, 
SL_TRANSACTIONS.ST_GROSS, 
SL_TRANSACTIONS.ST_PRIMARY, 
CAST (SL_TRANSACTIONS.ST_BATCH_FLAG AS BIT) AS ST_BATCH_FLAG, 
SL_TRANSACTIONS.ST_UNALLOCATED, 
SL_TRANSACTIONS.ST_ALOC_POINTER, 
CAST (SL_TRANSACTIONS.ST_QUERY_FLAG AS BIT) AS ST_QUERY_FLAG, 
CAST (SL_TRANSACTIONS.ST_DONOTCHASE AS BIT) AS ST_DONOTCHASE, 
SL_TRANSACTIONS.ST_BATCH_REF, 
SL_TRANSACTIONS.ST_CURRENCYCODE, 
SL_TRANSACTIONS.ST_CURRENCYRATE, 
SL_TRANSACTIONS.ST_CURR_VALU, 
SL_TRANSACTIONS.ST_TRI_RATE1, 
SL_TRANSACTIONS.ST_TRI_RATE2, 
SL_TRANSACTIONS.ST_CURR_TYPE, 
SL_TRANSACTIONS.ST_CURR_UNAL, 
SL_TRANSACTIONS.ST_CURR_NETT, 
SL_TRANSACTIONS.ST_CURR_TAX, 
SL_TRANSACTIONS.ST_CURRENCYRTCH, 
SL_TRANSACTIONS.ST_TRI_RATECHNG2,                       
SL_TRANSACTIONS.ST_NETT_BASE2, 
SL_TRANSACTIONS.ST_VAT_BASE2, 
SL_TRANSACTIONS.ST_GROSS_BASE2, 
SL_TRANSACTIONS.ST_L_DISC_BASE2, 
SL_TRANSACTIONS.ST_T_DISC_BASE2, 
SL_TRANSACTIONS.ST_BASE2_RATE, 
SL_TRANSACTIONS.ST_USER1, 
SL_TRANSACTIONS.ST_USER2, 
SL_TRANSACTIONS.ST_USER3, 
SL_TRANSACTIONS.ST_SUB_LEDGER, 
SL_TRANSACTIONS.ST_ORDER_NUMBER, 
SL_TRANSACTIONS.ST_DESCRIPTION, 
SL_TRANSACTIONS.ST_USER_PUTIN, 
SL_TRANSACTIONS.ST_DATE_PUTIN, 
SL_TRANSACTIONS.ST_DUEDATE, 
SL_TRANSACTIONS.ST_ANTICPAYDATE,
SL_TRANSACTIONS.ST_HEADER_KEY,
 
SL_ACCOUNTS2.CU_LEVEL

FROM SL_ACCOUNTS 

  INNER JOIN SL_TRANSACTIONS 
  ON SL_ACCOUNTS.CUCODE = SL_TRANSACTIONS.ST_COPYCUST 

  INNER JOIN SL_ACCOUNTS2 
  ON SL_ACCOUNTS.CU_PRIMARY = SL_ACCOUNTS2.CU_PRIMARY_2
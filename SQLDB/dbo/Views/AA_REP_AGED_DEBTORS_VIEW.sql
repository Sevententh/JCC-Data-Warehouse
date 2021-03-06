﻿CREATE VIEW AA_REP_AGED_DEBTORS_VIEW
/*
** Written:     07/04/2005 RV   
** Last Amended: 12/04/05 RV. 
** Comments: returns selected sales transaction for Aged Debtors crystal reports
*/
AS
SELECT
SL_TRANSACTIONS.ST_PRIMARY,     
SL_TRANSACTIONS.ST_TRANTYPE, 
CAST (SL_TRANSACTIONS.ST_BATCH_FLAG AS BIT) AS ST_BATCH_FLAG,                
SL_TRANSACTIONS.ST_CURRENCYCODE,  
SL_TRANSACTIONS.ST_YEAR, 
SL_TRANSACTIONS.ST_PERIODNUMBER,
SL_TRANSACTIONS.ST_DATE,
SL_TRANSACTIONS.ST_HEADER_REF,
SL_TRANSACTIONS.ST_SUB_LEDGER,
SL_ACCOUNTS.CUCODE, 
SL_ACCOUNTS.CUNAME,         
SL_ACCOUNTS.CUBALANCE, 
SL_ACCOUNTS.CUSORT, 
SL_ACCOUNTS.CUUSER1,                       
SL_ACCOUNTS.CUUSER2, 
SL_ACCOUNTS.CUUSER3, 
SL_ACCOUNTS.CUTURNOVERYTD, 
SL_ACCOUNTS.CUCURRENCYCODE,                       
CAST (SL_ACCOUNTS.CU_ON_STOP AS BIT) AS CU_ON_STOP, 
SL_ACCOUNTS.CU_CREDIT_LIMIT 

FROM SL_TRANSACTIONS 

  INNER JOIN SL_ACCOUNTS 
  ON SL_TRANSACTIONS.ST_COPYCUST = SL_ACCOUNTS.CUCODE

WHERE ST_BATCH_FLAG <> 1

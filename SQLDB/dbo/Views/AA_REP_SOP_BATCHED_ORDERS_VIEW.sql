﻿CREATE VIEW AA_REP_SOP_BATCHED_ORDERS_VIEW
/*
** Written:     13/01/2006 RV   
** Last Amended: 16/01/2006 RV
** Comments: returns batched sales orders for self audit crystal reports
*/
AS
SELECT
     
ORD_DETAIL.OD_ORDER_NUMBER, 
ORD_DETAIL.OD_DATE, 
ORD_DETAIL.OD_ACCOUNT, 
ORD_DETAIL.OD_TYPE,                      
ORD_DETAIL.OD_ORDER_REF, 
ORD_DETAIL.OD_ANALYSIS, 
ORD_DETAIL.OD_STOCK_CODE, 
ORD_DETAIL.OD_PRICE_CODE,                       
ORD_DETAIL.OD_NETT, 
ORD_DETAIL.OD_ENTRY_TYPE, 
ORD_DETAIL.OD_QTYORD,                      
ORD_DETAIL.OD_QTYINVD, 
ORD_DETAIL.OD_UNITCST,

ORD_HEADER.OH_STATUS, 
ORD_HEADER.OH_PRIORITY,                       
ORD_HEADER.OH_BATCH_REF,
ORD_HEADER.OH_YEAR,
ORD_HEADER.OH_PERIOD,
ORD_HEADER.OH_SUB_LEDGER,

SL_ACCOUNTS.CUNAME,

'ENGLISH   ' As LANGUAGE_LINK

FROM ORD_HEADER 
	
	INNER JOIN ORD_DETAIL 
	ON ORD_HEADER.OH_ORDER_NUMBER = ORD_DETAIL.OD_ORDER_NUMBER 

	INNER JOIN SL_ACCOUNTS 
	ON ORD_HEADER.OH_ACCOUNT = SL_ACCOUNTS.CUCODE

WHERE (ORD_HEADER.OH_STATUS < 2) AND (ORD_HEADER.OH_PRIORITY < 3)
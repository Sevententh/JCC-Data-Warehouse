﻿CREATE VIEW AA_REP_SYS_INTRASTAT_AUDIT_VIEW
AS
/*
** Written:      28/11/2005 RV  
** Last Amended: 29/11/2005 RV
** Comments: Returns Intrastat Details for crystal reports
*/
SELECT     

case when (DET_ORIGIN like 'S%') And DET_TYPE = 'CRN' then 'A'
     when (DET_ORIGIN like 'P%') And DET_TYPE = 'CRN' then 'D'
     when (DET_ORIGIN like 'S%') And DET_TYPE = 'INV' then 'D'
     when (DET_ORIGIN like 'P%') And DET_TYPE = 'INV' then 'A'
     else ''
end DISPATCH_FLAG,	-- D = Dispatch , A = Arrival
SL_PL_NL_DETAIL.DET_ECVAT_TYPE,
SL_PL_NL_DETAIL.DET_ORIGIN, 
SL_PL_NL_DETAIL.DET_LEDGER, 
SL_PL_NL_DETAIL.DET_PRIMARY,                       
SL_PL_NL_DETAIL.DET_HEADER_REF, 
SL_PL_NL_DETAIL.DET_COUNTRY_CDE, 
SL_PL_NL_DETAIL.DET_STOCK_CODE,                       
SL_PL_NL_DETAIL.DET_PRICE_CODE, 
Round (SL_PL_NL_DETAIL.DET_NETT,2) As ROUNDED_NET,
SL_PL_NL_DETAIL.DET_UNIT_QTY,                       
SL_PL_NL_DETAIL.DET_QUANTITY, 
SL_PL_NL_DETAIL.DET_EC_T_NATURE, 
SL_PL_NL_DETAIL.DET_TYPE, 
SL_PL_NL_DETAIL.DET_NOM_PERIOD, 
SL_PL_NL_DETAIL.DET_NOM_YEAR,

case when (DET_ORIGIN like 'S%') then SL_ADDRESSES.AD_VAT_REG_NO
     when (DET_ORIGIN like 'P%') then PL_ACCOUNTS.SU_VAT_REG_NO
     else ''
end VAT_REG_NO,

case when (Len (Isnull(SL_PL_NL_DETAIL.DET_STOCK_CODE,'')) > 0) then Isnull (STK_STOCK.STK_EC_KILOS,0) 
     when (Len (Isnull(SL_PL_NL_DETAIL.DET_PRICE_CODE,'')) > 0) then Isnull (PRC_PRICE_RECS.PR_EC_KILOS,0)
     else 0
end EC_KILOS,

case when (Len (Isnull(SL_PL_NL_DETAIL.DET_STOCK_CODE,'')) > 0) then Isnull (STK_STOCK.STK_EC_SUP_UNIT,0) 
     when (Len (Isnull(SL_PL_NL_DETAIL.DET_PRICE_CODE,'')) > 0) then Isnull (PRC_PRICE_RECS.PR_EC_SUP_UNIT,0)
     else 0
end EC_SUP_UNIT,

case when (Len (Isnull(SL_PL_NL_DETAIL.DET_STOCK_CODE,'')) > 0) then Isnull (SL_TRANSACTIONS.ST_EC_T_MODE,0) 
     when (Len (Isnull(SL_PL_NL_DETAIL.DET_PRICE_CODE,'')) > 0) then Isnull (PL_TRANSACTIONS.PT_EC_T_MODE,0)
     else 0
end EC_T_MODE,
                     
case when (Len (Isnull(SL_PL_NL_DETAIL.DET_STOCK_CODE,'')) > 0) then Isnull (STK_STOCK.STK_EC_ORIGIN,'') 
     when (Len (Isnull(SL_PL_NL_DETAIL.DET_PRICE_CODE,'')) > 0) then Isnull (PRC_PRICE_RECS.PR_EC_ORIGIN,'')
     else ''
end EC_ORIGIN,
 
case when (Len (Isnull(SL_PL_NL_DETAIL.DET_STOCK_CODE,'')) > 0) then Isnull (SL_TRANSACTIONS.ST_EC_DEL_TERMS,'') 
     when (Len (Isnull(SL_PL_NL_DETAIL.DET_PRICE_CODE,'')) > 0) then Isnull (PL_TRANSACTIONS.PT_EC_DEL_TERMS,'')
     else ''
end EC_DEL_TERMS,

case when (Len (Isnull(SL_PL_NL_DETAIL.DET_STOCK_CODE,'')) > 0) then Isnull (STK_STOCK.STK_EC_COM_CODE,'') 
     when (Len (Isnull(SL_PL_NL_DETAIL.DET_PRICE_CODE,'')) > 0) then Isnull (PRC_PRICE_RECS.PR_EC_COM_CODE,'')
     else ''
end EC_COM_CODE


FROM SL_PL_NL_DETAIL 

	LEFT OUTER JOIN PL_TRANSACTIONS 
	ON SL_PL_NL_DETAIL.DET_HEADER_KEY = PL_TRANSACTIONS.PT_HEADER_KEY 

	LEFT OUTER JOIN SL_TRANSACTIONS 
	ON SL_PL_NL_DETAIL.DET_HEADER_KEY = SL_TRANSACTIONS.ST_HEADER_KEY 

	LEFT OUTER JOIN PRC_PRICE_RECS 
	ON SL_PL_NL_DETAIL.DET_PRICE_CODE = PRC_PRICE_RECS.PRCODE 
	
	LEFT OUTER JOIN STK_STOCK 
        ON SL_PL_NL_DETAIL.DET_STOCK_CODE = STK_STOCK.STKCODE

	LEFT OUTER JOIN SL_ADDRESSES
	ON SL_PL_NL_DETAIL.DET_DELIVERY_ADDRESS = SL_ADDRESSES.AD_CON_CODE And DET_ORIGIN Like 'S%'

	LEFT OUTER JOIN PL_ACCOUNTS
	ON SL_PL_NL_DETAIL.DET_ACCOUNT = PL_ACCOUNTS.SUCODE And DET_ORIGIN Like 'P%'

WHERE     SL_PL_NL_DETAIL.DET_ORIGIN In ('SO', 'SI', 'PO') And 
	 (Len (DET_STOCK_CODE) > 0 Or Len (DET_PRICE_CODE) > 0) And
	  DET_ECVAT_TYPE >= 'A' And
	 (Len (SL_ADDRESSES.AD_VAT_REG_NO) > 0 Or Len (PL_ACCOUNTS.SU_VAT_REG_NO) > 0) And
	  DET_NOM_YEAR <> 'O'


UNION all
-- grab credit notes again to create reverse lines on arrivals and dispatches
Select
case when (DET_ORIGIN like 'S%') then 'D'
     when (DET_ORIGIN like 'P%') then 'A'
     else ''
end DISPATCH_FLAG,
SL_PL_NL_DETAIL.DET_ECVAT_TYPE,
SL_PL_NL_DETAIL.DET_ORIGIN, 
SL_PL_NL_DETAIL.DET_LEDGER, 
SL_PL_NL_DETAIL.DET_PRIMARY,                       
'' As DET_HEADER_REF, 
SL_PL_NL_DETAIL.DET_COUNTRY_CDE, 
SL_PL_NL_DETAIL.DET_STOCK_CODE,                       
SL_PL_NL_DETAIL.DET_PRICE_CODE, 
Round (SL_PL_NL_DETAIL.DET_NETT,2) * -1 As ROUNDED_NET,
SL_PL_NL_DETAIL.DET_UNIT_QTY,                       
SL_PL_NL_DETAIL.DET_QUANTITY, 
SL_PL_NL_DETAIL.DET_EC_T_NATURE, 
SL_PL_NL_DETAIL.DET_TYPE, 
SL_PL_NL_DETAIL.DET_NOM_PERIOD, 
SL_PL_NL_DETAIL.DET_NOM_YEAR,

case when (DET_ORIGIN like 'S%') then SL_ADDRESSES.AD_VAT_REG_NO
     when (DET_ORIGIN like 'P%') then PL_ACCOUNTS.SU_VAT_REG_NO
     else ''
end VAT_REG_NO,

0 AS EC_KILOS,

0 AS EC_SUP_UNIT,

0 AS EC_T_MODE,
                     
'' AS EC_ORIGIN,
 
'' As EC_DEL_TERMS,

'' AS  EC_COM_CODE


FROM SL_PL_NL_DETAIL 

	LEFT OUTER JOIN PL_TRANSACTIONS 
	ON SL_PL_NL_DETAIL.DET_HEADER_KEY = PL_TRANSACTIONS.PT_HEADER_KEY 

	LEFT OUTER JOIN SL_TRANSACTIONS 
	ON SL_PL_NL_DETAIL.DET_HEADER_KEY = SL_TRANSACTIONS.ST_HEADER_KEY 

	LEFT OUTER JOIN PRC_PRICE_RECS 
	ON SL_PL_NL_DETAIL.DET_PRICE_CODE = PRC_PRICE_RECS.PRCODE 
	
	LEFT OUTER JOIN STK_STOCK 
        ON SL_PL_NL_DETAIL.DET_STOCK_CODE = STK_STOCK.STKCODE

	LEFT OUTER JOIN SL_ADDRESSES
	ON SL_PL_NL_DETAIL.DET_DELIVERY_ADDRESS = SL_ADDRESSES.AD_CON_CODE And DET_ORIGIN Like 'S%'

	LEFT OUTER JOIN PL_ACCOUNTS
	ON SL_PL_NL_DETAIL.DET_ACCOUNT = PL_ACCOUNTS.SUCODE And DET_ORIGIN Like 'P%'

WHERE     SL_PL_NL_DETAIL.DET_ORIGIN In ('SO', 'SI', 'PO') And 
	 (Len (DET_STOCK_CODE) > 0 Or Len (DET_PRICE_CODE) > 0) And
	  DET_ECVAT_TYPE >= 'A' And
	 (Len (SL_ADDRESSES.AD_VAT_REG_NO) > 0 Or Len (PL_ACCOUNTS.SU_VAT_REG_NO) > 0) And
	  DET_NOM_YEAR <> 'O' And
	  DET_TYPE = 'CRN'

﻿CREATE VIEW AA_REP_CUSTOMER_DETAIL_VIEW
/*
** Written:     23/02/2005 RV   
** Last Amended: 02/03/05 RV filtered out prospects. 22/03/05 RV. 29/03/05 RV, 7/7/2010 RL
** Comments: returns sales ledger customer record details for crystal reports
*/
AS
SELECT     
SL_ACCOUNTS.CUCODE, 
SL_ACCOUNTS.CUNAME, 
CAST (SL_ACCOUNTS.CU_ON_STOP AS BIT) AS CU_ON_STOP,
SL_ACCOUNTS.CUBALANCE, 
SL_ACCOUNTS.CUBALANCE_C, 
SL_ACCOUNTS.CUTURNOVERYTD, 
SL_ACCOUNTS.CUTURNOVR_YTD_C, 
SL_ACCOUNTS.CUSORT, 
SL_ACCOUNTS.CUUSER1, 
SL_ACCOUNTS.CUUSER2, 
SL_ACCOUNTS.CUUSER3, 
SL_ACCOUNTS.CUADDRESS, 
SL_ACCOUNTS.CUPOSTCODE, 
SL_ACCOUNTS.CU_ADDRESS_USER1, 
SL_ACCOUNTS.CU_ADDRESS_USER2, 
SL_ACCOUNTS.CU_COUNTRY, 
SL_ACCOUNTS.CU_INV_ADD_CDE, 
SL_ACCOUNTS.CU_DEL_ADD_CDE, 
SL_ACCOUNTS.CU_STAT_ADD_CDE, 
SL_ACCOUNTS.CUPHONE, 
SL_ACCOUNTS.CUFAX, 
SL_ACCOUNTS.CUCONTACT, 
SL_ACCOUNTS.CUSALUTE, 
SL_ACCOUNTS.CU_EMAIL, 
SL_ACCOUNTS.CU_USERDATE1, 
SL_ACCOUNTS.CU_LINE_DISC, 
SL_ACCOUNTS.CU_TOT_DISC, 
SL_ACCOUNTS.CU_SETT_DISC_1, 
SL_ACCOUNTS.CU_SETT_DISC_2, 
SL_ACCOUNTS.CU_SETT_DAYS_1, 
SL_ACCOUNTS.CU_SETT_DAYS_2, 
SL_ACCOUNTS.CUCURRENCYCODE, 
SL_ACCOUNTS.CU_CREDIT_LIMIT, 
SL_ACCOUNTS.CU_TERMS, 
SL_ACCOUNTS.CU_DEL_CHARGE, 
SL_ACCOUNTS.CU_DEL_CHG_PCNT, 
SL_ACCOUNTS.CU_MIN_ORDR, 
SL_ACCOUNTS.CU_DUE_DAYS, 
SL_ACCOUNTS.CU_A_P_DAYS, 
SL_ACCOUNTS.CU_DUEDATE_TYPE, 
SL_ACCOUNTS.CU_PRICE_KEY, 
CAST (SL_ACCOUNTS.CU_MULTI_CURR AS BIT) AS CU_MULTI_CURR, 
CAST (SL_ACCOUNTS2.CU_HEAD_OFFICE AS BIT) AS CU_HEAD_OFFICE, 
SL_ACCOUNTS2.CU_HEAD_OFFICE_CODE, 
CAST (SL_ACCOUNTS2.CU_HEAD_OFFICE_DEFINVADDR AS BIT) AS CU_HEAD_OFFICE_DEFINVADDR, 
CAST (SL_ACCOUNTS2.CU_HEAD_OFFICE_DEFDELADDR AS BIT) AS CU_HEAD_OFFICE_DEFDELADDR, 
SL_ACC1.CUNAME AS HEAD_OFFICE_NAME, 
SL_ACCOUNTS2.CU_USRDATE1, 
SL_ACCOUNTS2.CU_USRDATE2,
SL_ACCOUNTS2.CU_USRDATE3, 
CAST (SL_ACCOUNTS2.CU_USRFLAG1 AS BIT) AS CU_USRFLAG1, 
CAST (SL_ACCOUNTS2.CU_USRFLAG2 AS BIT) AS CU_USRFLAG2, 
CAST (SL_ACCOUNTS2.CU_USRFLAG3 AS BIT) AS CU_USRFLAG3, 
SL_ACCOUNTS2.CU_USRCHAR1, 
SL_ACCOUNTS2.CU_USRCHAR2,
SL_ACCOUNTS2.CU_USRCHAR3,
SL_ACCOUNTS2.CU_USRCHAR4, 
SL_ACCOUNTS2.CU_USRCHAR5,
SL_ACCOUNTS2.CU_USRCHAR6, 
SL_ACCOUNTS2.CU_USRCHAR7, 
SL_ACCOUNTS2.CU_USRCHAR8,
SL_ACCOUNTS2.CU_USRNUM1, 
SL_ACCOUNTS2.CU_USRNUM2, 
SL_ACCOUNTS2.CU_USRNUM3, 
SL_ACCOUNTS2.CU_ISDN_NUMBER, 
SL_ACCOUNTS2.CU_EDI_ANA, 
SL_ACCOUNTS2.CU_EDI_CUSTIDN, 
SL_ACCOUNTS2.CU_BANK_SORT, 
SL_ACCOUNTS2.CU_BANK_AC_NO, 
SL_ACCOUNTS2.CU_BANK_AC_NAME, 
SL_ACCOUNTS2.CU_BANK_BACSREF, 
SL_ACCOUNTS2.CU_BANK_BANKNAME, 
SL_ACCOUNTS2.CU_IBAN_NO, 
SL_ACCOUNTS2.CU_OUR_ACCOUNT_CODE, 
SL_ACCOUNTS.CU_WEB_PASSWORD, 
SL_ACCOUNTS.CUAGED_1, 
SL_ACCOUNTS.CUAGED_2, 
SL_ACCOUNTS.CUAGED_3, 
SL_ACCOUNTS.CUAGED_4, 
SL_ACCOUNTS.CUAGED_UNALLOC, 
SL_ACCOUNTS.CU_DOC_DESTINATION,
isnull(SYS_DOCUMENT_LAYOUTS.SDL_DOC_NAME,'') as CU_INV_LAYOUT, 
SL_ACCOUNTS.CU_ANALYSIS, 
SL_ANALYSIS.SANAME AS SALES_ANALYSIS_NAME, 
SL_ACCOUNTS.CU_TAX_CODE, 
SL_ACCOUNTS.CU_BANK_ANALYS, 
SL_ACCOUNTS.CU_EXPORT_CODE, 
SL_ACCOUNTS.CU_COUNTRY_CODE, 
SYS_COUNTRY.CO_NAME, 
SL_ACCOUNTS.CU_VAT_REG_NO, 
SL_ACCOUNTS.CU_EC_DELIVERY, 
SL_ACCOUNTS.CU_EC_T_NATURE, 
SL_ACCOUNTS.CU_EC_T_MODE, 
SL_ACCOUNTS2.CU_LANG_CODE, 
SL_ACCOUNTS2.CU_STOCK_ALLOCATION_PRIORITY, 
SL_ACCOUNTS2.CU_LEVEL, 
SYS_VATCONTROL.VAT_RATE, 
SL_ANAL1.SANAME AS BANK_ANALYSIS_NAME, 
SL_ACCOUNTS2.CU_CONTACT_JOB, 
SL_ACCOUNTS2.CU_MOBILE_NUMBER, 
SL_ACCOUNTS2.CU_WEBSITE_ADDRESS,
SL_ACCOUNTS.CU_PRIMARY,
SYS_CURRENCY.CURR_SYMBOL

FROM SL_ACCOUNTS 

  INNER JOIN SL_ACCOUNTS2 
  ON SL_ACCOUNTS.CU_PRIMARY = SL_ACCOUNTS2.CU_PRIMARY_2

  LEFT OUTER JOIN SYS_COUNTRY 
  ON SL_ACCOUNTS.CU_COUNTRY_CODE = SYS_COUNTRY.CO_CODE 

  LEFT OUTER JOIN SL_ANALYSIS SL_ANAL1 
  ON SL_ACCOUNTS.CU_BANK_ANALYS = SL_ANAL1.SACODE 

  LEFT OUTER JOIN SYS_VATCONTROL 
  ON SL_ACCOUNTS.CU_TAX_CODE = SYS_VATCONTROL.VAT_CODE 

  LEFT OUTER JOIN SL_ANALYSIS 
  ON SL_ACCOUNTS.CU_ANALYSIS = SL_ANALYSIS.SACODE 

  LEFT OUTER JOIN SL_ACCOUNTS SL_ACC1 
  ON SL_ACCOUNTS2.CU_HEAD_OFFICE_CODE = SL_ACC1.CUCODE
  
  left join SYS_DOCUMENT_LAYOUTS 
  on SDL_PRIMARY = SL_ACCOUNTS.CU_INV_LAYOUT_LINK

  inner join SYS_CURRENCY on SYS_CURRENCY.CURR_CODE = SL_ACCOUNTS.CUCURRENCYCODE

WHERE SL_ACCOUNTS.CUCODE IS NOT NULL AND SL_ACCOUNTS.CUCODE <> ''






﻿CREATE VIEW AA_SL_DEBT_HISTORY_VIEW

/*
** Written: 23/08/04 DB
** Last Amended: 11/05/2005 WW, 13/06/05 NC, 23/1/2007 WW, 27/9/2007 WW, 1/10/08 NC
*/

(
  ST_PRIMARY,
  S_AL_PRIMARY,
  S_AL_DATE,
  S_AL_PERIOD,
  S_AL_YEAR,
  S_AL_VALUE_HOME,
  S_AL_VALUE_CURR,
  S_AL_REFERENCE,
  S_AL_HEADER_KEY,
  S_AL_USER_ID,
  S_AL_ACCOUNT_CODE,
  S_AL_FULLALLOC_PD,
  S_AL_FULLALLOC_DATE,
  ST_TRI_RATE1,
  ST_TRI_RATE2,
  ST_CURRENCYCODE,
  ST_TRANTYPE,
  ST_HEADER_REF,
  ST_DESCRIPTION,
  ST_DATE,
  ST_DUEDATE,
  ST_GROSS,
  ST_CURR_VALU,
  ST_YEAR,
  ST_PERIODNUMBER,
  ST_GROSS_BASE2,
  ST_QUERY_FLAG,
  ST_USER1,
  ST_USER2,
  ST_USER3,
  CUCODE,
  CUNAME,
  CU_CREDIT_LIMIT,
  CUCURRENCYCODE,
  CU_MULTI_CURR,
  CU_CURRENCY_CHANGED,
  CUCONTACT,
  CUPHONE,
  CUFAX,
  CU_TERMS,
  CU_DUE_DAYS,
  CU_DUEDATE_TYPE,
  CU_A_P_DAYS,
  CU_SETT_DAYS_1,
  CU_SETT_DAYS_2,
  CU_SETT_DISC_1,
  CU_SETT_DISC_2,
  CUUSER1,
  CUUSER2,
  CUUSER3,
  CU_NOTES,
  CUSORT,
  CUPOSTCODE,
  CUBALANCE,
  CUTURNOVERYTD,
  CU_ON_STOP,
  CU_PRIMARY,
  CU_DO_NOT_USE
)
as

select
   ST_PRIMARY
 , S_AL_PRIMARY
 , S_AL_DATE
 , S_AL_PERIOD
 , S_AL_YEAR
 , S_AL_VALUE_HOME
 , S_AL_VALUE_CURR
 , S_AL_REFERENCE
 , S_AL_HEADER_KEY
 , S_AL_USER_ID
 , S_AL_ACCOUNT_CODE
 , S_AL_FULLALLOC_PD
 , S_AL_FULLALLOC_DATE
 , ST_TRI_RATE1
 , ST_TRI_RATE2
 , ST_CURRENCYCODE
 , ST_TRANTYPE
 , ST_HEADER_REF
 , ST_DESCRIPTION
 , ST_DATE
 , ST_DUEDATE
 , ST_GROSS
 , ST_CURR_VALU
 , ST_YEAR
 , ST_PERIODNUMBER
 , ST_GROSS_BASE2
 , ST_QUERY_FLAG
 , ST_USER1
 , ST_USER2
 , ST_USER3
 , CUCODE
 , CUNAME
 , isnull(SLT_CREDIT_LIMIT,CU_CREDIT_LIMIT)
 , CUCURRENCYCODE
 , CU_MULTI_CURR
 , CU_CURRENCY_CHANGED
 , CUCONTACT
 , CUPHONE
 , CUFAX
 , isnull(SLT_TERMS,CU_TERMS)
 , isnull(SLT_DUE_DAYS,CU_DUE_DAYS)
 , isnull(SLT_DUEDATE_TYPE,CU_DUEDATE_TYPE)
 , CU_A_P_DAYS
 , isnull(SLT_SETT_DAYS_1,CU_SETT_DAYS_1)
 , isnull(SLT_SETT_DAYS_2,CU_SETT_DAYS_2)
 , isnull(SLT_SETT_DISC_1,CU_SETT_DISC_1)
 , isnull(SLT_SETT_DISC_2,CU_SETT_DISC_2)
 , CUUSER1
 , CUUSER2
 , CUUSER3
 , CU_NOTES
 , CUSORT
 , CUPOSTCODE
 , CUBALANCE
 , CUTURNOVERYTD
 , CU_ON_STOP
 , CU_PRIMARY
 , CU_DO_NOT_USE
from
  SL_ALLOC_HISTORY with (nolock)
  inner join SL_TRANSACTIONS on SL_TRANSACTIONS.ST_HEADER_KEY = SL_ALLOC_HISTORY.S_AL_HEADER_KEY
  inner join SL_ACCOUNTS with (nolock) on SL_ACCOUNTS.CUCODE = SL_ALLOC_HISTORY.S_AL_ACCOUNT_CODE
  left join SL_TERMS with (nolock) on SLT_PRIMARY = CU_TERMS_LINK and CU_CUSTOM_TERMS_TEMPLATE = 0
 
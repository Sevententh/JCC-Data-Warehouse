﻿CREATE VIEW NOM_DET_DEBIT_LEVEL1
/*
** Written:
** Last Amended: 22/10/02, 01/12/03 SR, 24/05/05 SR, 19/10/2010 CC
**
*/
(
DET_BATCH_REF,DET_SUB_LEDGER,DET_DATE,DET_NOM_PERSORT,DET_HEADER_REF,DET_CURR_CODE,DET_HEADER_KEY,DET_BATCH_FLAG,
DET_RECUR_FLAG,DET_CURR_RATE,DET_JNL_LINEREF,DET_ORIGIN,DET_TYPE,DET_NOM_PERIOD,DET_NOM_YEAR,DET_USER_PUTIN,
DET_DATE_PUTIN,DET_VAT_RULES,DET_NOMINALDR,DET_NOMINALCR,DET_NOMINALVAT,DET_ACCOUNT,DET_ANALYSIS,DET_COSTCENTRE,
DET_COSTHEADER,DET_GROSS,DET_VAT,DET_NETT,DET_CURR_TAX,DET_CURR_NETT,DET_ANALTYPE,DET_CHEQUE_PAYEE,
DET_TRI_RATE1,DET_TRI_RATE2,DET_DESCRIPTION,DET_NETT_BASE2,DET_VAT_BASE2,DET_GROSS_BASE2,DET_RECON_REF,DET_PL_INTERNAL,
DET_TRI_RATECHNG1,DET_TRI_RATECHNG2,DET_CURR_RTEFLG,DET_HEADER_REF2,DET_ORDER_LINK,DET_RECONCILED,DET_STOCK_CODE,DET_PRICE_CODE,
HOME_DEBIT_VALUE,CURRENCY_DEBIT_VALUE,BASE2_DEBIT_VALUE,HOME_CREDIT_VALUE,CURRENCY_CREDIT_VALUE,
BASE2_CREDIT_VALUE,TRANS_PRIMARY,NOMINAL_CODE,NOMINAL_TYPE,DET_QUANTITY,DET_DIMENSION1,DET_DIMENSION2,DET_DIMENSION3,DET_ARCHIVE_FLG,DET_VATCODE)
as select 
DET_BATCH_REF,DET_SUB_LEDGER,DET_DATE,DET_NOM_PERSORT,DET_HEADER_REF,DET_CURR_CODE,DET_HEADER_KEY,DET_BATCH_FLAG,
DET_RECUR_FLAG,DET_CURR_RATE,DET_JNL_LINEREF,DET_ORIGIN,DET_TYPE,DET_NOM_PERIOD,DET_NOM_YEAR,DET_USER_PUTIN,
DET_DATE_PUTIN,DET_VAT_RULES,DET_NOMINALDR,DET_NOMINALCR,DET_NOMINALVAT,DET_ACCOUNT,DET_ANALYSIS,DET_COSTCENTRE,
DET_COSTHEADER,DET_GROSS,DET_VAT,DET_NETT,DET_CURR_TAX,DET_CURR_NETT,DET_ANALTYPE,DET_CHEQUE_PAYEE,
DET_TRI_RATE1,DET_TRI_RATE2,DET_DESCRIPTION,DET_NETT_BASE2,DET_VAT_BASE2,DET_GROSS_BASE2,DET_RECON_REF,DET_PL_INTERNAL,
DET_TRI_RATECHNG1,DET_TRI_RATECHNG2,DET_CURR_RTEFLG,DET_HEADER_REF2,DET_ORDER_LINK,DET_RECONCILED,DET_STOCK_CODE,DET_PRICE_CODE,
(case when HOME_TEMP_VALUE > 0 then HOME_TEMP_VALUE else 0 end),
(case when CURRENCY_TEMP_VALUE > 0 then CURRENCY_TEMP_VALUE else 0 end),
(case when BASE2_TEMP_VALUE > 0 then BASE2_TEMP_VALUE else 0 end),
(case when HOME_TEMP_VALUE > 0 then 0 else -HOME_TEMP_VALUE end),
(case when CURRENCY_TEMP_VALUE > 0 then 0 else -CURRENCY_TEMP_VALUE end),
(case when BASE2_TEMP_VALUE > 0 then 0 else -BASE2_TEMP_VALUE end)
,DET_PRIMARY,NOMINAL_CODE,0,DET_QUANTITY,DET_DIMENSION1,DET_DIMENSION2,DET_DIMENSION3,DET_ARCHIVE_FLG,DET_VATCODE
from NOM_DET_DEBIT_LEVEL2 

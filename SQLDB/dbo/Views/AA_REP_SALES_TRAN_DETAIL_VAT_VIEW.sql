﻿create view AA_REP_SALES_TRAN_DETAIL_VAT_VIEW

/*
** Written     :  31/03/2005 RV
** Last Amended:  08/04/2005 RV, 12/04/2005 RV, 06/05/2005 SH, 03/06/2005 LM, 11/10/2005 RV, 13/10/2005, 14/08/2009 CC
** Comments    :  Returns selected sales transaction details for VAT exception reporting in crystal reports
**
** Used by     :  Disproportionate VAT Values - Sales Transactions.rpt
*/

as

select
SL_TRANSACTIONS.ST_COPYCUST,
SL_TRANSACTIONS.ST_YEAR,
SL_TRANSACTIONS.ST_PERIODNUMBER,
SL_TRANSACTIONS.ST_NETT,
SL_TRANSACTIONS.ST_VAT,
SL_TRANSACTIONS.ST_GROSS,
SL_TRANSACTIONS.ST_SETT_DISC_1,
SL_TRANSACTIONS.ST_SETT_DISC_2,
SL_TRANSACTIONS.ST_SETT_DAYS_1,
SL_TRANSACTIONS.ST_SETT_DAYS_2,
cast (SL_TRANSACTIONS.ST_BATCH_FLAG as bit) as ST_BATCH_FLAG,
SL_TRANSACTIONS.ST_HEADER_REF,
SL_TRANSACTIONS.ST_DATE,
cast (SL_TRANSACTIONS.ST_QUERY_FLAG as bit) as ST_QUERY_FLAG,
cast (SL_TRANSACTIONS.ST_CENTRALISED as bit) as ST_CENTRALISED,
SL_TRANSACTIONS.ST_HEADER_KEY,
SL_TRANSACTIONS.ST_SUB_LEDGER,
SL_PL_NL_DETAIL.DET_NETT,
SL_PL_NL_DETAIL.DET_VAT,
SL_PL_NL_DETAIL.DET_VATCODE,
SL_PL_NL_DETAIL.DET_GROSS,
SL_PL_NL_DETAIL.DET_TYPE,
SL_PL_NL_DETAIL.DET_L_DISCOUNT,
SL_PL_NL_DETAIL.DET_T_DISCOUNT,
SYS_VATCONTROL.VAT_RATE,
SL_TRANSACTIONS.ST_T_DISCVAL,
SL_TRANSACTIONS.ST_L_DISCVAL,
SL_PL_NL_DETAIL.DET_PRIMARY,
case when dbo.AA_VALUE_DPS_F( DET_GROSS - DET_NETT ) <> dbo.AA_VALUE_DPS_F( DET_VAT )
      then dbo.AA_VALUE_DPS_F( DET_GROSS - DET_NETT )
   when dbo.AA_VALUE_DPS_F( ( DET_NETT - ( ( isnull( ST_SETT_DISC_1, 0 ) / 100 ) * DET_NETT ) ) * ( VAT_RATE / 100 ) ) <> dbo.AA_VALUE_DPS_F( DET_VAT )
      then dbo.AA_VALUE_DPS_F( ( DET_NETT - ( ( isnull( ST_SETT_DISC_1, 0 ) / 100 ) * DET_NETT ) ) * ( VAT_RATE / 100 ) )
   else DET_VAT
end as HOME_VAT_RECALC,
case when dbo.AA_VALUE_DPS_F( DET_GROSS - DET_NETT ) <> dbo.AA_VALUE_DPS_F( DET_VAT )
      then dbo.AA_VALUE_DPS_F( DET_GROSS - DET_NETT )
   when dbo.AA_VALUE_DPS_F( DET_NETT * ( VAT_RATE / 100 ) ) <> dbo.AA_VALUE_DPS_F( DET_VAT )
      then dbo.AA_VALUE_DPS_F( DET_NETT * ( VAT_RATE / 100 ) )
   else DET_VAT
end as ROI_VAT_RECALC,
'ENGLISH' As LANGUAGE_LINK, --used to link to language view for Dimensions ACR's.
SL_PL_NL_DETAIL.DET_VAT_RATE

from SL_TRANSACTIONS

  inner join SL_PL_NL_DETAIL with(index(DET_HEADER_KEY))
  on SL_TRANSACTIONS.ST_HEADER_KEY = SL_PL_NL_DETAIL.DET_HEADER_KEY

  inner join SYS_VATCONTROL
  on SL_PL_NL_DETAIL.DET_VATCODE = SYS_VATCONTROL.VAT_CODE

where (SL_PL_NL_DETAIL.DET_TYPE not in ('MIN', 'MPA', 'MAD', 'MAC', 'MCR'))
   and DET_HEADER_KEY like 's%'
   and isnull( SYS_VATCONTROL.VAT_CODE, '' ) <> '' and (
   abs( DET_VAT - case when dbo.AA_VALUE_DPS_F( DET_GROSS - DET_NETT ) <> dbo.AA_VALUE_DPS_F( DET_VAT )
         then dbo.AA_VALUE_DPS_F( DET_GROSS - DET_NETT )
      when dbo.AA_VALUE_DPS_F( ( DET_NETT - ( ( isnull( ST_SETT_DISC_1, 0 ) / 100 ) * DET_NETT ) ) * ( VAT_RATE / 100 ) ) <> dbo.AA_VALUE_DPS_F( DET_VAT )
         then dbo.AA_VALUE_DPS_F( ( DET_NETT - ( ( isnull( ST_SETT_DISC_1, 0 ) / 100 ) * DET_NETT ) ) * ( VAT_RATE / 100 ) )
      else DET_VAT
   end ) > 0.005
   or -- ROI
   abs( DET_VAT - case when dbo.AA_VALUE_DPS_F( DET_GROSS - DET_NETT ) <> dbo.AA_VALUE_DPS_F( DET_VAT )
         then dbo.AA_VALUE_DPS_F( DET_GROSS - DET_NETT )
      when dbo.AA_VALUE_DPS_F( DET_NETT * ( VAT_RATE / 100 ) ) <> dbo.AA_VALUE_DPS_F( DET_VAT )
         then dbo.AA_VALUE_DPS_F( DET_NETT * ( VAT_RATE / 100 ) )
      else DET_VAT
   end ) > 0.005
   )
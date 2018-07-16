create view AA_SL_DETAIL_TRAN_VIEW

/*
** Written:      30/03/04 SR
** Last Amended: 22/10/04 ROBB, 09/11/04 ROBB, 29/03/05 ROBB, 19/05/05 NC, 14/09/05 ROBB, 27/03/2007 SB
*/
as

select top 100 percent
   DET_ANALYSIS,
   DET_VATCODE,
   dbo.AA_VALUE_DPS_F(DET_NETT) as DET_NETT,
   dbo.AA_VALUE_DPS_F(DET_VAT) as DET_VAT,
   (case when ST_CURR_TYPE = 'H' then dbo.AA_VALUE_DPS_F(DET_GROSS) else dbo.AA_VALUE_DPS_F(DET_CURR_GROSS) end) as CURRENCY_GROSS, -- Only return the Gross value for Home currency transactions
   dbo.AA_VALUE_DPS_F(DET_CURR_TAX) as DET_CURR_TAX,
   DET_COSTHEADER,
   DET_COSTCENTRE,
   DET_DESCRIPTION,
   DET_DIMENSION1,
   DET_DIMENSION2,
   DET_DIMENSION3,
   DET_PRIMARY,
   dbo.AA_TWO_DPS_F(SYS_VATCONTROL.VAT_RATE) as VAT_RATE,
   case SYS_VATCONTROL.EC_TYPE when '0' then ''
                when 'G' then '1'
                when 'S' then '2'
                when 'A' then '3'
                when 'R' then '4'
                when 'T' then '5'
                when 'U' then '6'
                else 0 end as VAT_EC_TYPE,
   SANAME,
   SA_FORCE_COSTING,
   DET_HEADER_KEY,
   CC_NAME,
   CH_NAME,
   isnull(NominalDebit.NCODE,'')  DEBIT_NOMINAL_CODE,
   isnull(NominalCredit.NCODE,'') CREDIT_NOMINAL_CODE,
   isnull(NominalTax.NCODE,'')    VAT_NOMINAL_CODE,
   isnull(NominalDebit.NNAME,'')  DEBIT_NOMINAL_NAME,
   isnull(NominalCredit.NNAME,'') CREDIT_NOMINAL_NAME,
   isnull(NominalTax.NNAME,'')    VAT_NOMINAL_NAME,
   DET_USRCHAR1,
   DET_USRCHAR2,
   DET_USRCHAR3,
   DET_USRCHAR4,
   DET_USRFLAG1,
   DET_USRFLAG2,
   DET_USRDATE1,
   DET_USRDATE2,
   DET_USRNUM1,
   DET_USRNUM2,
   DET_CURR_RTEFLG

from
   SL_PL_NL_DETAIL
   left outer join SL_ANALYSIS on SL_PL_NL_DETAIL.DET_ANALYSIS = SL_ANALYSIS.SACODE
   left outer join SL_TRANSACTIONS on SL_PL_NL_DETAIL.DET_HEADER_KEY = SL_TRANSACTIONS.ST_HEADER_KEY
   left outer join SYS_VATCONTROL on SL_PL_NL_DETAIL.DET_VATCODE = SYS_VATCONTROL.VAT_CODE
   left outer join SL_PL_NL_DETAIL2 on SL_PL_NL_DETAIL.DET_PRIMARY = SL_PL_NL_DETAIL2.DET_PRIMARY_2
   left outer join CST_COSTCENTRE on coalesce (convert(char(10), SL_PL_NL_DETAIL.DET_COSTHEADER) + convert(varchar,SL_PL_NL_DETAIL.DET_COSTCENTRE),'') = CST_COSTCENTRE.CC_CONCAT_CODES
   left outer join CST_COSTHEADER on coalesce (SL_PL_NL_DETAIL.DET_COSTHEADER,'') = CST_COSTHEADER.CH_CODE
   left outer join NL_ACCOUNTS NominalDebit on NominalDebit.NCODE = case when DET_TYPE='CRN' then DET_NOMINALCR when SATYPE_S_B_D='S' and DET_TYPE='ACR' then DET_NOMINALCR when SATYPE_S_B_D<>'S' and DET_TYPE='ADR' then DET_NOMINALCR else DET_NOMINALDR end
   left outer join NL_ACCOUNTS NominalCredit on NominalCredit.NCODE = case when DET_TYPE='CRN' then DET_NOMINALDR when SATYPE_S_B_D='S' and DET_TYPE='ACR' then DET_NOMINALDR when SATYPE_S_B_D<>'S' and DET_TYPE='ADR' then DET_NOMINALDR else DET_NOMINALCR end
   left outer join NL_ACCOUNTS NominalTax on NominalTax.NCODE = DET_NOMINALVAT
order by DET_PRIMARY

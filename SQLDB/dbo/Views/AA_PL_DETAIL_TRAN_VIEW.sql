create view AA_PL_DETAIL_TRAN_VIEW

/*
** Written: 30/03/04 SR
** Last Amended: 25/04/05 SR, 19/05/05 NC; 14/09/05 ROBB. 27/03/2007 SB
*/
as

select top 100 percent
   DET_ANALYSIS,
   DET_VATCODE,
   dbo.AA_VALUE_DPS_F(DET_NETT) as DET_NETT,
   (case when DET_VATCODE in ('A','R') then dbo.AA_VALUE_DPS_F(DET_PL_ACQ_TAX) else dbo.AA_VALUE_DPS_F(DET_VAT) end) as DET_VAT,
   (case when PT_CURR_TYPE = 'H' then dbo.AA_VALUE_DPS_F(DET_GROSS) else dbo.AA_VALUE_DPS_F(DET_CURR_GROSS) end) as CURRENCY_GROSS, -- only return the gross value for home currency transactions
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
   PANAME,
   PA_FORCE_COSTING,
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
   left outer join PL_ANALYSIS on SL_PL_NL_DETAIL.DET_ANALYSIS = PL_ANALYSIS.PACODE
   left outer join PL_TRANSACTIONS on SL_PL_NL_DETAIL.DET_HEADER_KEY = PL_TRANSACTIONS.PT_HEADER_KEY
   left outer join SYS_VATCONTROL on SL_PL_NL_DETAIL.DET_VATCODE = SYS_VATCONTROL.VAT_CODE
   left outer join SL_PL_NL_DETAIL2 on SL_PL_NL_DETAIL.DET_PRIMARY = SL_PL_NL_DETAIL2.DET_PRIMARY_2
   left outer join CST_COSTCENTRE on coalesce (convert(char(10), SL_PL_NL_DETAIL.DET_COSTHEADER) + convert(varchar,SL_PL_NL_DETAIL.DET_COSTCENTRE),'') = CST_COSTCENTRE.CC_CONCAT_CODES
   left outer join CST_COSTHEADER on coalesce (SL_PL_NL_DETAIL.DET_COSTHEADER,'') = CST_COSTHEADER.CH_CODE
   left outer join NL_ACCOUNTS NominalDebit on NominalDebit.NCODE = case when DET_TYPE='CRN' then DET_NOMINALCR when PATYPE_P_B_D='P' and DET_TYPE='ADR' then DET_NOMINALCR when PATYPE_P_B_D<>'P' and DET_TYPE='ACR' then DET_NOMINALCR else DET_NOMINALDR end
   left outer join NL_ACCOUNTS NominalCredit on NominalCredit.NCODE = case when DET_TYPE='CRN' then DET_NOMINALDR when PATYPE_P_B_D='P' and DET_TYPE='ADR' then DET_NOMINALDR when PATYPE_P_B_D<>'P' and DET_TYPE='ACR' then DET_NOMINALDR else DET_NOMINALCR end
   left outer join NL_ACCOUNTS NominalTax on NominalTax.NCODE = DET_NOMINALVAT
order by DET_PRIMARY

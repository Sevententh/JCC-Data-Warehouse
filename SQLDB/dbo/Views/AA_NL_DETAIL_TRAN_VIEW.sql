create view AA_NL_DETAIL_TRAN_VIEW

/*
** Written: 30/03/04 SR
** Last Amended: 13/05/2005 ROBB; 15/06/05 ROBB; 20/06/05 ROBB; 27/06/05 ROBB; 14/09/05 ROBB, 27/03/2007 SB
*/
as

select top 100 percent
   DET_TYPE,
   (case when DET_NOMINALDR IS NULL OR DET_NOMINALDR=''
         then
            1
         else
            0
         end)
   as DETAILTYPE,
   (case when DET_NOMINALDR IS NULL OR DET_NOMINALDR=''
         then
            DET_NOMINALCR
         else
            DET_NOMINALDR
         end)
   as NOMINALACCOUNTCODE,
   (case when DET_NOMINALDR IS NULL OR DET_NOMINALDR=''
         then
            NL_ACCOUNTS_CREDIT.NNAME
         else
            NL_ACCOUNTS_DEBIT.NNAME
         end)
   as NOMINALACCOUNTNAME,
   (case when DET_NOMINALDR IS NULL OR DET_NOMINALDR=''
         then
            NL_ACCOUNTS_CREDIT.NNOTES
         else
            NL_ACCOUNTS_DEBIT.NNOTES
         end)
   as NOMINALACCOUNTNOTES,
   (case when DET_NOMINALDR IS NULL OR DET_NOMINALDR=''
         then
            NL_ACCOUNTS_CREDIT.N_FORCE_COSTING
         else
            NL_ACCOUNTS_DEBIT.N_FORCE_COSTING
         end)
   as FORCECOSTING,
   DET_NOMINALVAT,
   DET_DATE,
   DET_ANALYSIS,
   DET_VATCODE,
   dbo.AA_VALUE_DPS_F(DET_NETT) as DET_NETT,
   (case when NT_CURR_TYPE = 'H' then dbo.AA_VALUE_DPS_F(DET_GROSS) else dbo.AA_VALUE_DPS_F(DET_CURR_GROSS) end) as CURRENCY_GROSS, -- only return the gross value for home currency transactions
   --DET_GROSS,
   (case when DET_VATCODE in ('A','R') then dbo.AA_VALUE_DPS_F(DET_PL_ACQ_TAX) else dbo.AA_VALUE_DPS_F(DET_VAT) end) as DET_VAT,
   --DET_CURR_GROSS,
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
   DET_JNL_LINEREF,
   DET_HEADER_KEY,
   CC_NAME,
   CH_NAME,
   DET_USRCHAR1,
   DET_USRCHAR2,
   DET_USRCHAR3,
   DET_USRCHAR4,
   DET_USRFLAG1,
   DET_USRFLAG2,
   DET_USRDATE1,
   DET_USRDATE2,
   DET_USRNUM1,
   DET_USRNUM2

from
   SL_PL_NL_DETAIL
   left outer join NL_TRANSACTIONS on SL_PL_NL_DETAIL.DET_HEADER_KEY = NL_TRANSACTIONS.NT_HEADER_KEY
   left outer join SYS_VATCONTROL on SL_PL_NL_DETAIL.DET_VATCODE = SYS_VATCONTROL.VAT_CODE
   left outer join NL_ACCOUNTS as NL_ACCOUNTS_DEBIT on SL_PL_NL_DETAIL.DET_NOMINALDR = NL_ACCOUNTS_DEBIT.NCODE
   left outer join NL_ACCOUNTS as NL_ACCOUNTS_CREDIT on SL_PL_NL_DETAIL.DET_NOMINALCR = NL_ACCOUNTS_CREDIT.NCODE
   left outer join SL_PL_NL_DETAIL2 on SL_PL_NL_DETAIL.DET_PRIMARY = SL_PL_NL_DETAIL2.DET_PRIMARY_2
   left outer join CST_COSTCENTRE on coalesce (convert(char(10), SL_PL_NL_DETAIL.DET_COSTHEADER) + convert(varchar,SL_PL_NL_DETAIL.DET_COSTCENTRE),'') = CST_COSTCENTRE.CC_CONCAT_CODES
   left outer join CST_COSTHEADER on coalesce (SL_PL_NL_DETAIL.DET_COSTHEADER,'') = CST_COSTHEADER.CH_CODE
   where SL_PL_NL_DETAIL.DET_BATCH_FLAG=1
order by DET_PRIMARY

create view AA_NL_CASHBOOK_ACCOUNT_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_NL_CASHBOOK_RECORD_LIST_S
** Written:      21/07/2004 DG
** Last Amended: 11/05/05 NC, 21/06/05 NC, 26/08/2005 SRB, 05/10/2005 SB
**
*/
as

select 
 n.N_PRIMARY as [PRIMARY]
,n.NCODE
,case n.NTYPE
      when 'N' then 0
      when 'B' then 1
      when 'C' then 2
      when 'D' then 3
      when 'P' then 4
      when 'R' then 5 end AS N_TYPE
,coalesce(n.NNAME,'') as NNAME
,case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
      when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
      when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
 end as OVERBUDGETFLAG
,n.NMAJORHEADCODE
,coalesce(n.NCURRENCYCODE,'') as NCURRENCYCODE
,dbo.AA_VALUE_DPS_F(n.NOPENBALMONTH+n.N_INCOME-n.N_EXPENSES)as HOME_BALANCE
,dbo.AA_VALUE_DPS_F(n.NOPENBALMTH_C+n.N_INCOME_C-n.N_EXPENSES_C) as CURRENCY_BALANCE
,dbo.AA_VALUE_DPS_F(isnull(DRsum,0) + isnull(CRsum,0) + isnull(VATsum,0) ) as HOME_BATCHED
,dbo.AA_VALUE_DPS_F(n.NOPENBALMONTH+n.N_INCOME-n.N_EXPENSES+isnull(DRsum,0) + isnull(CRsum,0) + isnull(VATsum,0)) as HOME_BALANCE_PLUS_BATCHED
,coalesce(n.NCATEGORYCODE1,'') as NCATEGORYCODE1
,coalesce(n.NCATEGORYCODE2,'') as NCATEGORYCODE2
,coalesce(n.NCATEGORYCODE3,'') as NCATEGORYCODE3
,coalesce(n.NCATEGORYCODE4,'') as NCATEGORYCODE4
,coalesce(n.NCATEGORYCODE5,'') as NCATEGORYCODE5
,coalesce(n.NCATEGORYCODE6,'') as NCATEGORYCODE6
,coalesce(n.NCATEGORYCODE7,'') as NCATEGORYCODE7
,coalesce(n.NCATEGORYCODE8,'') as NCATEGORYCODE8
,n.N_PROFILE_REC
,n.N_DATE_PUTIN
,n.N_DATE_EDITED
,dbo.AA_VALUE_DPS_F(n.NRECONBALANCE) RECONBALANCE
,dbo.AA_VALUE_DPS_F(n.NOPENBALMONTH + n.N_INCOME - n.N_EXPENSES - n.NRECONBALANCE) UNRECONBALANCE
from NL_ACCOUNTS n
inner join (select
             N_PRIMARY 
            , (case when NOMINAL_PERIOD > 0  then dbo.AA_VALUE_DPS_F(NBUDGET_C1)  else 0 end) 
            + (case when NOMINAL_PERIOD > 1  then dbo.AA_VALUE_DPS_F(NBUDGET_C2)  else 0 end) 
            + (case when NOMINAL_PERIOD > 2  then dbo.AA_VALUE_DPS_F(NBUDGET_C3)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 3  then dbo.AA_VALUE_DPS_F(NBUDGET_C4)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 4  then dbo.AA_VALUE_DPS_F(NBUDGET_C5)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 5  then dbo.AA_VALUE_DPS_F(NBUDGET_C6)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 6  then dbo.AA_VALUE_DPS_F(NBUDGET_C7)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 7  then dbo.AA_VALUE_DPS_F(NBUDGET_C8)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 8  then dbo.AA_VALUE_DPS_F(NBUDGET_C9)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 9  then dbo.AA_VALUE_DPS_F(NBUDGET_C10) else 0 end)                                   
            + (case when NOMINAL_PERIOD > 10 then dbo.AA_VALUE_DPS_F(NBUDGET_C11) else 0 end)                                   
            + (case when NOMINAL_PERIOD > 11 then dbo.AA_VALUE_DPS_F(NBUDGET_C12) else 0 end)                                   
            + (case when NOMINAL_PERIOD > 12 then dbo.AA_VALUE_DPS_F(NBUDGET_C13) else 0 end) BUDGET_YTD 
            from NL_ACCOUNTS ,SYS_DATAINFO where SYS_PRIMARY = 1) b
on b.N_PRIMARY = n.N_PRIMARY 
left outer join 
     (select
         sum (case when DET_GROSS <> 0
              then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                           or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                     then -DET_GROSS else DET_GROSS
                                                                     end
                                                  when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                           or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                     then -DET_NETT else DET_NETT
                                                                     end
                                                  when 'N' then DET_NETT
                                                  else 0 end
              else 0 end) DRsum
       , DET_NOMINALDR DR_NominalCode
          from SL_PL_NL_DETAIL-- with (index(DET_NOMINALDR))
          where DET_RECONCILED>=0
            and DET_BATCH_FLAG = 1 and DET_RECUR_FLAG=0
         group by DET_NOMINALDR
    ) BatchedDRSum on BatchedDRSum.DR_NominalCode = n.NCODE
left outer join 
     (select
         sum (case when DET_GROSS <> 0
                    then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                              or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                              or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                                           then -DET_NETT else DET_NETT
                                                                      end
                                                        when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                              or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                              or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                                           then -DET_GROSS else DET_GROSS
                                                                      end
                                                        when 'N' then -DET_NETT
                         end
                    else 0
               end) CRsum
       , DET_NOMINALCR CR_NominalCode
          from SL_PL_NL_DETAIL-- with (index(DET_NOMINALCR))
          where DET_RECONCILED>=0
            and DET_BATCH_FLAG = 1 and DET_RECUR_FLAG=0
         group by DET_NOMINALCR
    ) BatchedCRSum on BatchedCRSum.CR_NominalCode = n.NCODE 
left outer join 
     (select
          sum(case when DET_VAT <> 0 
                    then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                              or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                              or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                                           then -DET_VAT else DET_VAT
                                                                      end
                                                        when 'P' then case when ((DET_TYPE = 'CRN')
                                                                              or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                              or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                                           then -DET_VAT else DET_VAT
                                                                      end
                                                        when 'N' then 0
                         end
                    else 0
               end) VATsum
       , DET_NOMINALVAT VAT_NominalCode
          from SL_PL_NL_DETAIL-- with (index(DET_NOMINALVAT))
          where DET_RECONCILED>=0
            and DET_BATCH_FLAG = 1 and DET_RECUR_FLAG=0
            and DET_VAT <> 0-- and DET_NOMINALVAT<>''
         group by DET_NOMINALVAT
    ) BatchedVATSum on BatchedVATSum.VAT_NominalCode = n.NCODE

where n.NTYPE in ('B','P')
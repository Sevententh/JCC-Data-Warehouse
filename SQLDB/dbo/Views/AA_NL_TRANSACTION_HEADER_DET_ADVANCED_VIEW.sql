create view AA_NL_TRANSACTION_HEADER_DET_ADVANCED_VIEW
as
/* Primary key derived as a decimal(30,0) from concatenation as follows:-
     Position   Description
           1    Header key ledger prefix enumerated as a number where 'S' = 1, 'P' = 2, 'N' = 3
        2-11    Header ledger primary padded with leading zeros up to 10 digits
       12-16    Transaction date as an integer (5 digits)
       17-19    500 + Nominal Period Year (Persort)
       20-29    Nominal primary (up to 10 digits)
*/
select
 cast(convert(nvarchar,case substring(v.DET_HEADER_KEY,1,1) when 'S' then 1 when 'P' then 2 when 'N' then 3 end)
 + replicate('0',(10 - len(v.DET_HEADER_KEY) + 1)) + substring(v.DET_HEADER_KEY,2,len(v.DET_HEADER_KEY)-1)
 + convert(nvarchar,convert(int,v.DET_DATE))
 + convert(nvarchar,500 + v.DET_NOM_PERSORT)
 + convert(nvarchar,(N_PRIMARY))
as decimal(30,0)) as [PRIMARY]
,(coalesce(case substring(v.DET_HEADER_KEY,1,1) when 'S' then (ST_USER1)
                                                 when 'P' then (PT_USER1) else '' end,'')) as TRAN_USER_SORT1
,(coalesce(case substring(v.DET_HEADER_KEY,1,1) when 'S' then (ST_USER2)
                                                 when 'P' then (PT_USER2) else '' end,'')) as TRAN_USER_SORT2
,(coalesce(case substring(v.DET_HEADER_KEY,1,1) when 'S' then (ST_USER3)
                                                 when 'P' then (PT_USER3) else '' end,'')) as TRAN_USER_SORT3
,(coalesce(case substring(v.DET_HEADER_KEY,1,1) when 'S' then (CUUSER1)
                                                 when 'P' then (SUUSER1) else '' end,'')) as USER_SORT1
,(coalesce(case substring(v.DET_HEADER_KEY,1,1) when 'S' then (CUUSER2)
                                                 when 'P' then (SUUSER2) else '' end,'')) as USER_SORT2
,(coalesce(case substring(v.DET_HEADER_KEY,1,1) when 'S' then (CUUSER3)
                                                 when 'P' then (SUUSER3) else '' end,'')) as USER_SORT3
,(coalesce(case substring(v.DET_HEADER_KEY,1,1) when 'S' then sl.CUNAME
                                                 when 'P' then pl.SUNAME else '' end,''))  as NAME -- needed for search
,(coalesce(case substring(v.DET_HEADER_KEY,1,1) when 'S' then sl.CU_PRIMARY
                                                when 'P' then pl.SU_PRIMARY else '' end,''))  as ACCOUNT_PRIMARY
,(mh.NL_MAJORNAME) as NL_MAJORNAME
,(mh.NL_MAJORCODE) as NL_MAJORCODE
,(v.N_PRIMARY) as N_PRIMARY
,(v.NNAME) as NNAME
,(v.NTYPE) as NTYPE -- needed for search
,dbo.AA_VALUE_DPS_F((v.NBALANCE)) as NBALANCE
,(coalesce(v.NCATEGORYCODE1,'')) as NCATEGORYCODE1
,(coalesce(v.NCATEGORYCODE2,'')) as NCATEGORYCODE2
,(coalesce(v.NCATEGORYCODE3,'')) as NCATEGORYCODE3
,(coalesce(v.NCATEGORYCODE4,'')) as NCATEGORYCODE4
,(coalesce(v.NCATEGORYCODE5,'')) as NCATEGORYCODE5
,(coalesce(v.NCATEGORYCODE6,'')) as NCATEGORYCODE6
,(coalesce(v.NCATEGORYCODE7,'')) as NCATEGORYCODE7
,(coalesce(v.NCATEGORYCODE8,'')) as NCATEGORYCODE8

,case when HOME_DEBIT=0 then HOME_CREDIT else HOME_DEBIT end as HOME_ABSOLUTE_VALUE
,case when CURRENCY_DEBIT=0 then CURRENCY_CREDIT else CURRENCY_DEBIT end as CURRENCY_ABSOLUTE_VALUE
,case when BASE2_DEBIT=0 then BASE2_CREDIT else BASE2_DEBIT end as BASE2_ABSOLUTE_VALUE
,HOME_DEBIT
,HOME_CREDIT
,CURRENCY_DEBIT
,CURRENCY_CREDIT
,BASE2_DEBIT
,BASE2_CREDIT

,v.NCODE as NCODE
,DET_DATE
,DET_NOM_YEAR
,DET_NOM_PERIOD
,DET_NOM_PERSORT
,  case DET_ORIGIN
      when 'NKI'     then 'ST'
      when 'NKO'     then 'ST'
      when 'NSO'     then 'ST/SO'
      when 'NSC'     then 'ST/SO'
      when 'NPO'     then 'ST/PO'
      when 'NPC'     then 'ST/PO'
      when 'NCI'     then 'CT'      -- Costing Income                                  (Not WIP)      - Income Analysis          (SL)
      when 'NCUU'    then 'CT'      -- Transaction un-flagged as unrecoverable         (in to WIP)    - Transfer of WIP Analysis (SL) inverted
      when 'NCCRW'   then 'CT'      -- Transaction flagged as correct release from WIP (in to WIP)    - Transfer of WIP Analysis (SL) inverted
      when 'NCU'     then 'CT'      -- Transaction flagged as unrecoverable            (out of WIP)   - Transfer of WIP Analysis (SL)
      when 'NCRW'    then 'CT'      -- Transaction flagged as released from WIP        (out of WIP)   - Transfer of WIP Analysis (SL)
      when 'NCT'     then 'CT'      -- Costing Timesheet                               (in to WIP)    - Cost Analysis            (PL)
      when 'NCC'     then 'CT'      -- Costing Cost                                    (in to WIP)    - Cost Analysis            (PL)
      when 'NCND'    then 'CT/N'    -- Nominal Debit trans with costing detail         (in to WIP)    - Cost Analysis            (PL)
      when 'NCNC'    then 'CT/N'    -- Nominal Credit trans with costing detail        (out of WIP)   - Cost Analysis            (PL) inverted
      else
         DET_ORIGIN
   end                                                      as DET_ORIGIN
,DET_TYPE
,cast(DET_BATCH_FLAG as bit) as DET_BATCH_FLAG
,substring(DET_HEADER_KEY,2,len(DET_HEADER_KEY)-1) as DET_HEADER_NO
,DET_HEADER_KEY
,DET_HEADER_REF
,DET_CURR_CODE
,DET_BATCH_REF
,DET_PRIMARY
,DET_ACCOUNT
,DET_DATE_PUTIN -- needed for search
,DET_INCOME -- needed for Search
,DET_EXPENSES -- needed for Search
,DET_RECONCILED -- needed for Search

,NTURNOVERPTD
,NTURNOVERYTD
,NBUDGETPTD
,NBUDGETYTD
,dbo.AA_VALUE_DPS_F(commit_ptd.NLC_BUDGET)     as COMMITTEDPTD
,dbo.AA_VALUE_DPS_F(commit_ytd.COMMITTEDYTD)   as COMMITTEDYTD
,NBUDGETPTD - dbo.AA_VALUE_DPS_F(NTURNOVERPTD) as NDIFFERENCEPTD
,NBUDGETYTD - dbo.AA_VALUE_DPS_F(NTURNOVERYTD) as NDIFFERENCEYTD

,DET_USER_PUTIN as DET_USER_PUTIN
,coalesce(case substring(DET_HEADER_KEY,1,1) when 'S' then s.ST_DESCRIPTION
                                                 when 'P' then p.PT_DESCRIPTION
                                                 when 'N' then n.NT_DESCRIPTION end,'') as [DESCRIPTION]
,case substring(DET_HEADER_KEY,1,1) when 'S' then ST_ANTICPAYDATE
                                        when 'P' then PT_ANTICPAYDATE end as ANTICPAYDATE
,(DET_SUB_LEDGER) as DET_SUB_LEDGER
,dbo.AA_VALUE_DPS_F((case substring(DET_HEADER_KEY,1,1) when 'S' then ST_SETT_DISC_1
                                                           when 'P' then PT_SETT_DISC1 end)) as SETT_DISC1
,dbo.AA_VALUE_DPS_F((case substring(DET_HEADER_KEY,1,1) when 'S' then ST_SETT_DISC_2
                                                           when 'P' then PT_SETT_DISC2 end)) as SETT_DISC2
,(case substring(DET_HEADER_KEY,1,1) when 'S' then ST_SETT_DAYS_1
                                        when 'P' then PT_SETT_DAYS1 else 0 end) as SETT_DAYS1
,(case substring(DET_HEADER_KEY,1,1) when 'S' then ST_SETT_DAYS_2
                                        when 'P' then PT_SETT_DAYS2 else 0 end) as SETT_DAYS2
,(coalesce(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.STT_USRCHAR1
                                                 when 'P' then p2.PT_USRCHAR1
                                                 when 'N' then n2.NT_USRCHAR1 end,'')) as USRCHAR1
,(coalesce(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRCHAR2
                                                 when 'P' then p2.PT_USRCHAR2
                                                 when 'N' then n2.NT_USRCHAR2 end,'')) as USRCHAR2
,(coalesce(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRCHAR3
                                                 when 'P' then p2.PT_USRCHAR3
                                                 when 'N' then n2.NT_USRCHAR3 end,'')) as USRCHAR3
,(coalesce(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRCHAR4
                                                 when 'P' then p2.PT_USRCHAR4
                                                 when 'N' then n2.NT_USRCHAR4 end,'')) as USRCHAR4
,cast((coalesce(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRFLAG1
                                                 when 'P' then p2.PT_USRFLAG1
                                                 when 'N' then n2.NT_USRFLAG2 end,'')) as bit) as USRFLAG1
,cast((coalesce(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRFLAG2
                                                 when 'P' then p2.PT_USRFLAG2
                                                 when 'N' then n2.NT_USRFLAG2 end,'')) as bit) as USRFLAG2
,(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRDATE1
                                        when 'P' then p2.PT_USRDATE1
                                        when 'N' then n2.NT_USRDATE1 end) as USRDATE1
,(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRDATE2
                                        when 'P' then p2.PT_USRDATE2
                                        when 'N' then n2.NT_USRDATE2 end) as USRDATE2
,(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRNUM1
                                        when 'P' then p2.PT_USRNUM1
                                        when 'N' then n2.NT_USRNUM1 end) as USRNUM1
,(case substring(DET_HEADER_KEY,1,1) when 'S' then s2.ST_USRNUM2
                                        when 'P' then p2.PT_USRNUM2
                                        when 'N' then n2.NT_USRNUM2 end) as USRNUM2
--Used for 360 pane
,isnull(sl.CUCODE,'') as CUCODE
,isnull(sl.CUNAME,'') as CUNAME
,isnull(pl.SUCODE,'') as SUCODE
,isnull(pl.SUNAME,'') as SUNAME

from
(select
 max(nl.N_PRIMARY) as N_PRIMARY
,max(nl.NNAME) as NNAME
,max(nl.NTYPE) as NTYPE
,max(nl.NBALANCE) as NBALANCE
,max((nl.NCATEGORYCODE1)) as NCATEGORYCODE1
,max((nl.NCATEGORYCODE2)) as NCATEGORYCODE2
,max((nl.NCATEGORYCODE3)) as NCATEGORYCODE3
,max((nl.NCATEGORYCODE4)) as NCATEGORYCODE4
,max((nl.NCATEGORYCODE5)) as NCATEGORYCODE5
,max((nl.NCATEGORYCODE6)) as NCATEGORYCODE6
,max((nl.NCATEGORYCODE7)) as NCATEGORYCODE7
,max((nl.NCATEGORYCODE8)) as NCATEGORYCODE8
,max(nl.NMAJORHEADCODE) as NMAJORHEADCODE
,nl.NCODE as NCODE
,dbo.AA_VALUE_DPS_F(max(nl.NTURNOVERPTD)) as NTURNOVERPTD
,dbo.AA_VALUE_DPS_F(max(nl.NTURNOVERYTD)) as NTURNOVERYTD
,dbo.AA_VALUE_DPS_F(max(case NOMINAL_PERIOD
     when 1  then NBUDGET_C1
     when 2  then NBUDGET_C2
     when 3  then NBUDGET_C3
     when 4  then NBUDGET_C4
     when 5  then NBUDGET_C5
     when 6  then NBUDGET_C6
     when 7  then NBUDGET_C7
     when 8  then NBUDGET_C8
     when 9  then NBUDGET_C9
     when 10 then NBUDGET_C10
     when 11 then NBUDGET_C11
     when 12 then NBUDGET_C12
     when 13 then NBUDGET_C13
     end)) as NBUDGETPTD
,dbo.AA_VALUE_DPS_F(max(case  NOMINAL_PERIOD
     when 1  then NBUDGET_C1
     when 2  then NBUDGET_C1 + NBUDGET_C2
     when 3  then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3
     when 4  then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4
     when 5  then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5
     when 6  then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5 + NBUDGET_C6
     when 7  then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5 + NBUDGET_C6 + NBUDGET_C7
     when 8  then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5 + NBUDGET_C6 + NBUDGET_C7 + NBUDGET_C8
     when 9  then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5 + NBUDGET_C6 + NBUDGET_C7 + NBUDGET_C8 + NBUDGET_C9
     when 10 then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5 + NBUDGET_C6 + NBUDGET_C7 + NBUDGET_C8 + NBUDGET_C9 + NBUDGET_C10
     when 11 then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5 + NBUDGET_C6 + NBUDGET_C7 + NBUDGET_C8 + NBUDGET_C9 + NBUDGET_C10 + NBUDGET_C11
     when 12 then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5 + NBUDGET_C6 + NBUDGET_C7 + NBUDGET_C8 + NBUDGET_C9 + NBUDGET_C10 + NBUDGET_C11 + NBUDGET_C12
     when 13 then NBUDGET_C1 + NBUDGET_C2 + NBUDGET_C3 + NBUDGET_C4 + NBUDGET_C5 + NBUDGET_C6 + NBUDGET_C7 + NBUDGET_C8 + NBUDGET_C9 + NBUDGET_C10 + NBUDGET_C11 + NBUDGET_C12 + NBUDGET_C13
     end)) as NBUDGETYTD
,max(NOMINAL_PERIOD) as NOMINAL_PERIOD
,DET_DATE
,max(DET_NOM_YEAR) as DET_NOM_YEAR
,max(DET_NOM_PERIOD) as DET_NOM_PERIOD
,DET_NOM_PERSORT
,max(DET_ORIGIN) as DET_ORIGIN
,max(DET_TYPE) as DET_TYPE
,max(DET_BATCH_FLAG) as DET_BATCH_FLAG
,DET_HEADER_KEY
,max(DET_HEADER_REF) as DET_HEADER_REF
,max(DET_CURR_CODE) as DET_CURR_CODE
,max(DET_BATCH_REF) as DET_BATCH_REF
,min(DET_PRIMARY) as DET_PRIMARY
,max(DET_ACCOUNT) as DET_ACCOUNT
,max(DET_DATE_PUTIN) as DET_DATE_PUTIN
,max(DET_USER_PUTIN) as DET_USER_PUTIN
,max(DET_SUB_LEDGER) as DET_SUB_LEDGER
,sum(case
    when DET_NOMINALDR = NCODE
    then
      case when DET_GROSS <> 0
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                     or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                              then (case when -DET_GROSS>0 then -DET_GROSS else 0 end) else (case when DET_GROSS>0 then DET_GROSS else 0 end)
                                                         end
                                            when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                     or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                              then (case when -DET_NETT>0 then -DET_NETT else 0 end) else (case when DET_NETT>0 then DET_NETT else 0 end)
                                                         end
                                            when 'N' then (case when DET_NETT>0 then DET_NETT else 0 end)
            else 0 end
        else 0
        end
    when DET_NOMINALCR = NCODE
    then
      case when DET_GROSS <> 0
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                               then (case when -DET_NETT>0 then -DET_NETT else 0 end) else (case when DET_NETT>0 then DET_NETT else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                               then (case when -DET_GROSS>0 then -DET_GROSS else 0 end) else (case when DET_GROSS>0 then DET_GROSS else 0 end)
                                                          end
                                            when 'N' then (case when -DET_NETT>0 then -DET_NETT else 0 end)
             else 0 end
        else 0
        end
    when DET_NOMINALVAT = NCODE
    then
      case when DET_VAT <> 0
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                               then (case when -DET_VAT>0 then -DET_VAT else 0 end) else (case when DET_VAT>0 then DET_VAT else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE = 'CRN')
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                               then (case when -DET_VAT>0 then -DET_VAT else 0 end) else (case when DET_VAT>0 then DET_VAT else 0 end)
                                                          end
                                            else 0
             end
        else 0
        end
 end) HOME_DEBIT

,sum(case
    when DET_NOMINALDR = NCODE
    then
      case when DET_GROSS <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                        or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                 then (case when DET_GROSS>0 then DET_GROSS else 0 end) else (case when -DET_GROSS>0 then -DET_GROSS else 0 end)
                                                            end
                                              when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                        or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                 then (case when DET_NETT>0 then DET_NETT else 0 end) else (case when -DET_NETT>0 then -DET_NETT else 0 end)
                                                            end
                                              when 'N' then (case when -DET_NETT>0 then -DET_NETT else 0 end)
                                              else 0 end
           else 0
           end
    when DET_NOMINALCR = NCODE
    then
      case when DET_GROSS <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                               or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                               or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                            then (case when DET_NETT>0 then DET_NETT else 0 end) else (case when -DET_NETT>0 then -DET_NETT else 0 end)
                                                       end
                                               when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                               or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                               or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                            then (case when DET_GROSS>0 then DET_GROSS else 0 end) else (case when -DET_GROSS>0 then -DET_GROSS else 0 end)
                                                       end
                                               when 'N' then (case when DET_NETT>0 then DET_NETT else 0 end)
                                               else 0 end
           else 0
           end
    when DET_NOMINALVAT = NCODE
    then
      case when DET_VAT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                               then (case when DET_VAT>0 then DET_VAT else 0 end) else (case when -DET_VAT>0 then -DET_VAT else 0 end)
                                                          end
                                             when 'P' then case when ((DET_TYPE = 'CRN')
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                               then (case when DET_VAT>0 then DET_VAT else 0 end) else (case when -DET_VAT>0 then -DET_VAT else 0 end)
                                                          end
                                             else 0 end
           else 0
           end
  end) HOME_CREDIT

,sum(case
    when DET_NOMINALDR = NCODE
    then
      case when DET_CURR_NETT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                        or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                 then (case when -(DET_CURR_NETT + DET_CURR_TAX)>0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end) else (case when (DET_CURR_NETT + DET_CURR_TAX)>0 then (DET_CURR_NETT + DET_CURR_TAX) else 0 end)
                                                            end
                                               when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                        or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                 then (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end) else (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end)
                                                            end
                                               when 'N' then (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end)
                                               else 0 end
           else 0
           end
    when DET_NOMINALCR = NCODE
    then
      case when DET_CURR_NETT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                               then (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end) else (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end)
                                                          end
                                               when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                               then (case when -(DET_CURR_NETT + DET_CURR_TAX)>0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end) else (case when (DET_CURR_NETT + DET_CURR_TAX)>0 then (DET_CURR_NETT + DET_CURR_TAX) else 0 end)
                                                          end
                                               when 'N' then (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end)
                                               else 0 end
           else 0
           end
    when DET_NOMINALVAT = NCODE
    then
      case when DET_CURR_NETT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                                  then (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end) else (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE = 'CRN')
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                                  then (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end) else (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end)
                                                             end
                                               else 0
                end
           else 0
           end
    end) CURRENCY_DEBIT

,sum(case
    when DET_NOMINALDR = NCODE
    then
      case when DET_CURR_NETT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                         or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                  then (case when (DET_CURR_NETT + DET_CURR_TAX)>0 then (DET_CURR_NETT + DET_CURR_TAX) else 0 end) else (case when -(DET_CURR_NETT + DET_CURR_TAX)>0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                         or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                  then (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end) else (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end)
                                                             end
                                              when 'N' then (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end)
                                              else 0 end
           else 0
           end
    when DET_NOMINALCR = NCODE
    then
      case when DET_CURR_NETT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                                  then (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end) else (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                                  then (case when (DET_CURR_NETT + DET_CURR_TAX)>0 then (DET_CURR_NETT + DET_CURR_TAX) else 0 end) else (case when -(DET_CURR_NETT + DET_CURR_TAX)>0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end)
                                                             end
                                               when 'N' then (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end)
                else 0 end
           else 0
           end
    when DET_NOMINALVAT = NCODE
    then
      case when DET_CURR_NETT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                                  then (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end) else (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE = 'CRN')
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                                  then (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end) else (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end)
                                                             end
                                               else 0
                end
           else 0
           end
  end) CURRENCY_CREDIT

,sum(case
    when DET_NOMINALDR = NCODE
    then
     case when DET_NETT_BASE2 <> 0
          then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                        or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                 then (case when -(DET_GROSS_BASE2)>0 then -(DET_GROSS_BASE2) else 0 end) else (case when (DET_GROSS_BASE2)>0 then (DET_GROSS_BASE2) else 0 end)
                                                            end
                                              when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                        or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                 then (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end) else (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end)
                                                            end
                                              when 'N' then (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end)
               else 0 end
     else 0
     end
    when DET_NOMINALCR = NCODE
    then
      case when DET_GROSS_BASE2 <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                                  then (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end) else (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                                  then (case when -DET_GROSS_BASE2>0 then -DET_GROSS_BASE2 else 0 end) else (case when DET_GROSS_BASE2>0 then DET_GROSS_BASE2 else 0 end)
                                                             end
                                               when 'N' then (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end)
                else 0 end
           else 0
           end
    when DET_NOMINALVAT = NCODE
    then
      case when DET_CURR_NETT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                                  then (case when -DET_VAT_BASE2>0 then -DET_VAT_BASE2 else 0 end) else (case when DET_VAT_BASE2>0 then DET_VAT_BASE2 else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE = 'CRN')
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                                  then (case when -DET_VAT_BASE2>0 then -DET_VAT_BASE2 else 0 end) else (case when DET_VAT_BASE2>0 then DET_VAT_BASE2 else 0 end)
                                                             end
                                               else 0
                end
           else 0
           end
  end) BASE2_DEBIT

,sum(case
    when DET_NOMINALDR = NCODE
    then
      case when DET_NETT_BASE2 <> 0
             then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                           or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                    then (case when (DET_GROSS_BASE2)>0 then (DET_GROSS_BASE2) else 0 end) else (case when -(DET_GROSS_BASE2)>0 then -(DET_GROSS_BASE2) else 0 end)
                                                               end
                                                 when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                           or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                    then (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end) else (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end)
                                                               end
                                                 when 'N' then (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end)
                  else 0 end
        else 0
        end
    when DET_NOMINALCR = NCODE
    then
      case when DET_GROSS_BASE2 <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                                  then (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end) else (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                                  then (case when DET_GROSS_BASE2>0 then DET_GROSS_BASE2 else 0 end) else (case when -DET_GROSS_BASE2>0 then -DET_GROSS_BASE2 else 0 end)
                                                             end
                                               when 'N' then (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end)
                else 0 end
           else 0
           end
    when DET_NOMINALVAT = NCODE
    then
      case when DET_CURR_NETT <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                                  then (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end) else (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE = 'CRN')
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                                  then (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end) else (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end)
                                                             end
                                               else 0
                end
           else 0
           end
    end) as BASE2_CREDIT

,max(case
    when DET_NOMINALDR = NCODE
    then
       case substring(DET_ORIGIN,1,1) when 'S' then case when DET_TYPE in ('INV','PAY') then 1
                                                         when (DET_TYPE='ADR' and DET_ANALTYPE='S') then 1
                                                         when (DET_TYPE='ACR' and DET_ANALTYPE<>'S') then 1
                                                         else 0 end
                                      when 'P' then case when DET_TYPE in ('INV','PAY') then 1
                                                         when (DET_TYPE='ACR' and DET_ANALTYPE='P') then 1
                                                         when (DET_TYPE='ADR' and DET_ANALTYPE<>'P') then 1
                                                         else 0 end
                                      when 'N' then 1
                                      else 0 end
    when DET_NOMINALCR = NCODE
    then
       case substring(DET_ORIGIN,1,1) when 'S' then case when DET_TYPE='CRN' then 1
                                                         when (DET_TYPE='ACR' and DET_ANALTYPE='S') then 1
                                                         when (DET_TYPE='ADR' and DET_ANALTYPE<>'S') then 1
                                                         else 0 end
                                      when 'P' then case when DET_TYPE='CRN' then 1
                                                         when (DET_TYPE='ADR' and DET_ANALTYPE='P') then 1
                                                         when (DET_TYPE='ACR' and DET_ANALTYPE<>'P') then 1
                                                         else 0 end
                                      else 0 end
    when DET_NOMINALVAT = NCODE
    then
       case substring(DET_ORIGIN,1,1) when 'S' then case when DET_TYPE='CRN' then 1
                                                         else 0 end
                                      when 'P' then case when DET_TYPE in ('INV','PAY') then 1
                                                         else 0 end
                                      else 0 end
    else 0
    end
   ) as DET_INCOME -- needed for Search
,max(case
    when DET_NOMINALDR = NCODE
    then
      case substring(DET_ORIGIN,1,1) when 'S' then case when DET_TYPE='CRN' then 1
                                                         when (DET_TYPE='ACR' and DET_ANALTYPE='S') then 1
                                                         when (DET_TYPE='ADR' and DET_ANALTYPE<>'S') then 1
                                                         else 0 end
                                      when 'P' then case when DET_TYPE='CRN' then 1
                                                         when (DET_TYPE='ADR' and DET_ANALTYPE='P') then 1
                                                         when (DET_TYPE='ACR' and DET_ANALTYPE<>'P') then 1
                                                         else 0 end
                                      else 0 end
    when DET_NOMINALCR = NCODE
    then
       case substring(DET_ORIGIN,1,1) when 'S' then case when DET_TYPE in ('INV','PAY') then 1
                                                         when (DET_TYPE='ADR' and DET_ANALTYPE='S') then 1
                                                         when (DET_TYPE='ACR' and DET_ANALTYPE<>'S') then 1
                                                         else 0 end
                                      when 'P' then case when DET_TYPE in ('INV','PAY') then 1
                                                         when (DET_TYPE='ACR' and DET_ANALTYPE='P') then 1
                                                         when (DET_TYPE='ADR' and DET_ANALTYPE<>'P') then 1
                                                         else 0 end
                                      when 'N' then 1
                                      else 0 end
    when DET_NOMINALVAT = NCODE
    then
       case substring(DET_ORIGIN,1,1) when 'S' then case when DET_TYPE in ('INV','PAY') then 1
                                                         else 0 end
                                      when 'P' then case when DET_TYPE='CRN' then 1
                                                         else 0 end
                                      else 0 end
    else 0
    end   ) as DET_EXPENSES -- needed for Search
,max(DET_RECONCILED) as DET_RECONCILED -- needed for Search

   from SL_PL_NL_DETAIL d
      inner join NL_ACCOUNTS nl on (d.DET_NOMINALDR = nl.NCODE or d.DET_NOMINALCR = nl.NCODE or d.DET_NOMINALVAT = nl.NCODE)
      left outer join SYS_DATAINFO on SYS_PRIMARY = 1
   where
            not(                             -- exclude master copies of recurring journals
                        DET_BATCH_FLAG = 1
                  and   DET_RECUR_FLAG = 1
               )
      and   not(                             -- exclude zero value transactions unless they are SOP or POP debits or credits with a non-zero quantity
                        DET_GROSS                        = 0
                  and   DET_GROSS_BASE2                  = 0
                  and   (DET_CURR_NETT + DET_CURR_TAX)   = 0
                  and   DET_QUANTITY                     = 0
               )
      and   DET_TYPE not like 'M%'           -- exclude transactions related to centralised accounts (Belgium feature)
      and   DET_DATE is not null

   group by nl.NCODE
        ,d.DET_DATE
        ,d.DET_HEADER_KEY
        ,d.DET_NOM_PERSORT) v
   -- joins to get Account details
   left outer join SL_ACCOUNTS sl-- with (index(CUCODE))
         on sl.CUCODE = v.DET_ACCOUNT and substring(DET_HEADER_KEY,1,1) = 'S'
   left outer join PL_ACCOUNTS pl-- with (index(SUCODE))
         on pl.SUCODE = v.DET_ACCOUNT and substring(DET_HEADER_KEY,1,1) = 'P'
   left outer join  NL_MAJORHEADING mh-- with (index(NL_MAJORCODE))
         on mh.NL_MAJORCODE = v.NMAJORHEADCODE
   -- joins to get Transaction Header details
   left outer join (SL_TRANSACTIONS s left outer join SL_TRANSACTIONS2 s2 on s2.ST_PRIMARY_2 = s.ST_PRIMARY)
         on s.ST_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,99)) and substring(DET_HEADER_KEY,1,1) = 'S'
   left outer join (PL_TRANSACTIONS p left outer join PL_TRANSACTIONS2 p2 on p2.PT_PRIMARY_2 = p.PT_PRIMARY)
         on p.PT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,99)) and substring(DET_HEADER_KEY,1,1) = 'P'
   left outer join (NL_TRANSACTIONS n left outer join NL_TRANSACTIONS2 n2 on n2.NT_PRIMARY_2 = n.NT_PRIMARY)
         on n.NT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,99)) and substring(DET_HEADER_KEY,1,1) = 'N'

   left outer join NL_COMMITTED_BUDGETS commit_ptd on commit_ptd.NLC_CODE = v.NCODE and commit_ptd.NLC_YEAR = 'C' and commit_ptd.NLC_PERIOD = NOMINAL_PERIOD
   -- virtual table to get Nominal YTD Committed Budgets
   left outer join (select NLC_CODE
                    ,      sum(NLC_BUDGET) as COMMITTEDYTD
                    from NL_COMMITTED_BUDGETS, SYS_DATAINFO
                    where NLC_YEAR='C' and NLC_PERIOD <= NOMINAL_PERIOD and SYS_PRIMARY=1
                    group by NLC_CODE) commit_ytd
              on commit_ytd.NLC_CODE = v.NCODE

create view AA_PL_TRANSACTION_HEADER_ADVANCED_VIEW

/*
**
** Written     :  09/12/2004 DG
** Last Amended:  18/02/2005 SR, 21/02/2005 SR, 27/05/2005 NC, 08/07/2005 SH, 28/07/2005 MC, 17/08/2005 DB, 23/08/2005 SH, 31/10/2005 SH
**
*/

as

select
   PT_PRIMARY                          as [PRIMARY]
,  PT_COPYSUPP
,  isnull(SUNAME,'')                   as SUNAME
,  PT_DATE
,  PT_PERIODNUMBER
,  PT_YEAR
,  PT_TRANTYPE
,  cast(PT_BATCH_FLAG as bit)          as PT_BATCH_FLAG
,  isnull(PT_HEADER_REF,'')            as PT_HEADER_REF
,  isnull(PT_ORDER_NUMBER,'')          as PT_ORDER_NUMBER
,  case isnull(PT_INTERNAL_REF,0)
      when 0 then ''
      else
         convert(nvarchar,convert(decimal(38,0),PT_INTERNAL_REF))
   end                                 as PT_INTERNAL_REF
,  dbo.AA_VALUE_DPS_F(PT_NETT)         as PT_NETT
,  dbo.AA_VALUE_DPS_F(PT_NETT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end         as SIGN_PT_NETT
,  dbo.AA_VALUE_DPS_F(PT_NETT_BASE2) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end   as PT_NETT_BASE2
,  dbo.AA_VALUE_DPS_F(PT_CURR_NETT)    as PT_CURR_NETT
,  dbo.AA_VALUE_DPS_F(PT_CURR_NETT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end    as SIGN_PT_CURR_NETT
,  dbo.AA_VALUE_DPS_F(PT_VAT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end          as PT_VAT
,  dbo.AA_VALUE_DPS_F(PT_GROSS) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end        as PT_GROSS
,  dbo.AA_VALUE_DPS_F(PT_GROSS_BASE2) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end  as PT_GROSS_BASE2
,  dbo.AA_VALUE_DPS_F(PT_CURR_VALU) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end    as PT_CURR_VALU
,  dbo.AA_VALUE_DPS_F(PT_UNALLOCATED) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end  as PT_UNALLOCATED
,  case PT_RECONCILED
      when 1 then 'R'
      else
         ''
   end                                 as RECONCILED
,  cast(PT_PRIMARY as integer)         as PT_PRIMARY
,  PT_DUEDATE
,  PT_DATE_PUTIN
,  isnull(PT_BATCH_REF,'')             as PT_BATCH_REF
,  isnull(PT_DESCRIPTION,'')           as PT_DESCRIPTION
,  dbo.AA_VALUE_DPS_F(PT_REVALUED) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end     as PT_REVALUED
,  dbo.AA_VALUE_DPS_F(SUBALANCE)       as SUBALANCE
,  isnull(PT_USER1,'')                 as PT_USER1
,  isnull(PT_USER2,'')                 as PT_USER2
,  isnull(PT_USER3,'')                 as PT_USER3
,  isnull(SUSORT,'')                   as SUSORT
,  isnull(SUUSER1,'')                  as SUUSER1
,  isnull(SUUSER2,'')                  as SUUSER2
,  isnull(SUUSER3,'')                  as SUUSER3
,  PT_CURRENCYCODE
,  isnull(POH_ACCOUNT,'')              as POH_ACCOUNT
,  dbo.AA_VALUE_DPS_F(SUTURNOVERYTD)   as SUTURNOVERYTD
,  dbo.AA_VALUE_DPS_F(SU_CREDIT_LIMIT) as SU_CREDIT_LIMIT
,  isnull(SU_USRCHAR1,'')              as SU_USRCHAR1
,  isnull(SU_USRCHAR2,'')              as SU_USRCHAR2
,  isnull(SU_USRCHAR3,'')              as SU_USRCHAR3
,  isnull(SU_USRCHAR4,'')              as SU_USRCHAR4
,  isnull(SU_USRCHAR5,'')              as SU_USRCHAR5
,  isnull(SU_USRCHAR6,'')              as SU_USRCHAR6
,  cast(SU_USRFLAG1 as bit)            as SU_USRFLAG1
,  cast(SU_USRFLAG2 as bit)            as SU_USRFLAG2
,  cast(SU_USRFLAG3 as bit)            as SU_USRFLAG3
,  SU_USRDATE1
,  SU_USRDATE2
,  SU_USRDATE3
,  dbo.AA_VALUE_DPS_F(SU_USRNUM1)      as SU_USRNUM1
,  dbo.AA_VALUE_DPS_F(SU_USRNUM2)      as SU_USRNUM2
,  dbo.AA_VALUE_DPS_F(SU_USRNUM3)      as SU_USRNUM3
,  PT_USER_PUTIN
,  isnull([USER_NAME],'')              as [USER_NAME]
,  PT_ANTICPAYDATE
,  PT_SUB_LEDGER
,  PT_SETT_DISC1
,  PT_SETT_DISC2
,  PT_SETT_DAYS1
,  PT_SETT_DAYS2
,  PT_CURRENCYRATE
,  PT_BASE2_RATE
,  dbo.AA_VALUE_DPS_F(PT_L_DISCVAL) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end    as PT_L_DISCVAL
,  dbo.AA_VALUE_DPS_F(PT_L_DISCVAL_C) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end  as PT_L_DISCVAL_C
,  dbo.AA_VALUE_DPS_F(PT_T_DISCVAL) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end    as PT_T_DISCVAL
,  dbo.AA_VALUE_DPS_F(PT_T_DISCVAL_C) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end  as PT_T_DISCVAL_C
,  isnull(PT_USRCHAR1,'')              as PT_USRCHAR1
,  isnull(PT_USRCHAR2,'')              as PT_USRCHAR2
,  isnull(PT_USRCHAR3,'')              as PT_USRCHAR3
,  isnull(PT_USRCHAR4,'')              as PT_USRCHAR4
,  cast(PT_USRFLAG1 as bit)            as PT_USRFLAG1
,  cast(PT_USRFLAG2 as bit)            as PT_USRFLAG2
,  PT_USRDATE1
,  PT_USRDATE2
,  dbo.AA_VALUE_DPS_F(PT_USRNUM1)      as PT_USRNUM1
,  dbo.AA_VALUE_DPS_F(PT_USRNUM2)      as PT_USRNUM2
,  PT_NOTE
,  isnull(PT_INVREG_STATUS,'')         as PT_INVREG_STATUS
,  isnull(PT_INVREG_TYPE,'')           as PT_INVREG_TYPE
,  isnull(PT_INVREG_APPROVER1,'')      as PT_INVREG_APPROVER1
,  PT_INVREG_APPROVEDATE1
,  isnull(PT_INVREG_APPROVEKEY1,'')    as PT_INVREG_APPROVEKEY1
,  isnull(PT_INVREG_APPROVER2,'')      as PT_INVREG_APPROVER2
,  PT_INVREG_APPROVEDATE2
,  isnull(PT_INVREG_APPROVEKEY2,'')    as PT_INVREG_APPROVEKEY2
,  isnull(PT_INVREG_APPROVER3,'')      as PT_INVREG_APPROVER3
,  PT_INVREG_APPROVEDATE3
,  isnull(PT_INVREG_APPROVEKEY3,'')    as PT_INVREG_APPROVEKEY3
,  isnull(PT_INVREG_MATCHEDUSER,'')    as PT_INVREG_MATCHEDUSER
,  PT_INVREG_MATCHEDDATE
,  isnull(PT_INVREG_MATCHEDKEY,'')     as PT_INVREG_MATCHEDKEY
,  isnull(SU_PRIMARY,0)                as SU_PRIMARY

--Extra fields 
--,  PT_INTERNAL_REF                     as PT_INTERNAL_REF_SRCH  --The stored procedure does not search usong this field
,  PT_BATCH_REF                        as PT_BATCH_REF_SRCH
,  SUUSER1                             as SUUSER1_SRCH
,  SUUSER2                             as SUUSER2_SRCH
,  SUUSER3                             as SUUSER3_SRCH
,  POH_ACCOUNT                         as POH_ACCOUNT_SRCH
,  isnull(PT_ALLOC_USER1,'')           as PT_ALLOC_USER1 -- Required for 360 pane

   from
      PL_TRANSACTIONS
         inner join        PL_ACCOUNTS          on PT_COPYSUPP       = SUCODE
         left outer join   POP_HEADER           on POH_ORDER_NUMBR   = PT_ORDER_NUMBER
         left outer join   PL_ACCOUNTS2         on SU_PRIMARY_2      = SU_PRIMARY
         left outer join   SYS_USER             on [USER_ID]         = PT_USER_PUTIN
         left outer join   PL_TRANSACTIONS2     on PT_PRIMARY_2      = PT_PRIMARY
         left outer join   PL_TRANSACTION_NOTES on PT_COPY_HEADERKEY = 'P' + convert(nvarchar,PT_PRIMARY)
create view AA_PL_TRANSACTION_HEADER_SIMPLE_VIEW

/*
**
** Written     :  09/12/2004 DG
** Last Amended:  18/02/2005 SR, 21/02/2005 SR, 08/07/2005 SH, 17/08/2005 DB, 23/08/2005 SH, 28/09/2005 SB, 31/10/2005 SH
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
,  dbo.AA_VALUE_DPS_F(PT_CURR_NETT)    as PT_CURR_NETT
,  dbo.AA_VALUE_DPS_F(PT_CURR_NETT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end    as SIGN_PT_CURR_NETT
,  dbo.AA_VALUE_DPS_F(PT_VAT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end          as PT_VAT
,  dbo.AA_VALUE_DPS_F(PT_GROSS) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end        as PT_GROSS
,  dbo.AA_VALUE_DPS_F(PT_CURR_VALU) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end    as PT_CURR_VALU
,  dbo.AA_VALUE_DPS_F(PT_UNALLOCATED) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end  as PT_UNALLOCATED
,  case PT_RECONCILED
      when 1 then 'R'
      else ''
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
,  isnull(SU_PRIMARY,0)                as SU_PRIMARY

--Extra fields 
--,  PT_INTERNAL_REF                     as PT_INTERNAL_REF_SRCH  --The stored procedure does not search using this field
,  PT_BATCH_REF                        as PT_BATCH_REF_SRCH
,  SUUSER1                             as SUUSER1_SRCH
,  SUUSER2                             as SUUSER2_SRCH
,  SUUSER3                             as SUUSER3_SRCH
,  POH_ACCOUNT                         as POH_ACCOUNT_SRCH
,  isnull(PT_ALLOC_USER1,'')           as PT_ALLOC_USER1 -- Required for 360 pane

   from
      PL_TRANSACTIONS
      inner join        PL_ACCOUNTS on PT_COPYSUPP       = SUCODE
      left outer join   POP_HEADER  on POH_ORDER_NUMBR   = PT_ORDER_NUMBER

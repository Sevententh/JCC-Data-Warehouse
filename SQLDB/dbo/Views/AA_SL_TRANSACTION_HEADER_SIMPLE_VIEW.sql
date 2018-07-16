create view AA_SL_TRANSACTION_HEADER_SIMPLE_VIEW
/*
**
** Written     :  26/07/2004 DG
** Last Amended:  30/07/2004 DG, 07/12/2004 DG, 17/12/2004 PT, 28/04/2005 SH, 25/05/2005 NC, 08/07/2005 SH, 17/08/2005 DB, 23/08/2005 SH, 27/09/2005 SB, 29/09/2005 SH
**
*/
as

select
   ST_PRIMARY                          as [PRIMARY]
,  ST_COPYCUST
,  isnull(CUNAME,'')                   as CUNAME
,  ST_DATE
,  ST_PERIODNUMBER
,  ST_YEAR
,  ST_TRANTYPE
,  cast(ST_BATCH_FLAG as bit)          as ST_BATCH_FLAG
,  isnull(ST_HEADER_REF,'')            as ST_HEADER_REF
,  case isnull(ST_ORDER_NUMBER,0)
      when 0 then ''
      else
         convert(nvarchar,convert(decimal(38,0),ST_ORDER_NUMBER))
   end                                 as ST_ORDER_NUMBER
,  dbo.AA_VALUE_DPS_F(ST_NETT)         as ST_NETT
,  dbo.AA_VALUE_DPS_F(ST_NETT) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end         as SIGN_ST_NETT
,  dbo.AA_VALUE_DPS_F(ST_CURR_NETT)    as ST_CURR_NETT
,  dbo.AA_VALUE_DPS_F(ST_CURR_NETT) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end    as SIGN_ST_CURR_NETT
,  dbo.AA_VALUE_DPS_F(ST_VAT) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end          as ST_VAT
,  dbo.AA_VALUE_DPS_F(ST_VAT_BASE2) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end    as ST_VAT_BASE2
,  dbo.AA_VALUE_DPS_F(ST_CURR_TAX) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end     as ST_CURR_TAX
,  dbo.AA_VALUE_DPS_F(ST_GROSS) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end        as ST_GROSS
,  dbo.AA_VALUE_DPS_F(ST_CURR_VALU) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end    as ST_CURR_VALU
,  dbo.AA_VALUE_DPS_F(ST_UNALLOCATED) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end  as ST_UNALLOCATED
,  dbo.AA_VALUE_DPS_F(ST_CURR_UNAL) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end    as ST_CURR_UNAL
,  case ST_RECONCILED
      when 1 then 'R'
      else
         ''
   end                                 as RECONCILED
,  ST_PRIMARY
,  ST_DUEDATE
,  ST_DATE_PUTIN
,  isnull(ST_BATCH_REF,'')             as ST_BATCH_REF
,  isnull(ST_DESCRIPTION,'')           as ST_DESCRIPTION
,  dbo.AA_VALUE_DPS_F(ST_REVALUED) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end     as ST_REVALUED
,  dbo.AA_VALUE_DPS_F(CUBALANCE)       as CUBALANCE
,  isnull(ST_USER1,'')                 as ST_USER1
,  isnull(ST_USER2,'')                 as ST_USER2
,  isnull(ST_USER3,'')                 as ST_USER3
,  isnull(CUSORT,'')                   as CUSORT
,  isnull(CUUSER1,'')                  as CUUSER1
,  isnull(CUUSER2,'')                  as CUUSER2
,  isnull(CUUSER3,'')                  as CUUSER3
,  ST_CURRENCYCODE
,  isnull(OH_ACCOUNT_ORDER,'')         as OH_ACCOUNT_ORDER
,  isnull(CU_PRIMARY,0)                as CU_PRIMARY
--Extra fields 
,  ST_BATCH_REF                        as ST_BATCH_REF_SRCH
,  CUSORT                              as CUSORT_SRCH
,  CUUSER1                             as CUUSER1_SRCH
,  CUUSER2                             as CUUSER2_SRCH
,  CUUSER3                             as CUUSER3_SRCH
,  isnull(ST_ALLOC_USER1,'')           as ST_ALLOC_USER1 -- Required for 360 pane
   from
      SL_TRANSACTIONS
         inner join        SL_ACCOUNTS                               on ST_COPYCUST       = CUCODE
         left outer join   ORD_HEADER with(index(OH_ORDER_NUMBER))   on OH_ORDER_NUMBER   = ST_ORDER_NUMBER
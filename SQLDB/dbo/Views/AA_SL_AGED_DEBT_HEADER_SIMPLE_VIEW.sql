create view AA_SL_AGED_DEBT_HEADER_SIMPLE_VIEW
/*
** 
** Written:
** Last Amended: 21/04/2005 SR, 12/07/2005 SH, 23/08/2005 SH, 27/09/2005 SB, 30/05/2006 SH
**
*/
as

select
 ST_PRIMARY as [PRIMARY]
,ST_COPYCUST
,isnull(CUNAME,'') as CUNAME
,isnull(CU_PRIMARY,0) as CU_PRIMARY
,ST_DATE
,ST_YEAR + convert(nvarchar,ST_PERIODNUMBER) YEAR_PERIOD
,ST_TRANTYPE
,isnull(ST_HEADER_REF,'') as ST_HEADER_REF
, case isnull(ST_ORDER_NUMBER,0)
      when 0 then ''
      else
         convert(nvarchar,convert(decimal(38,0),ST_ORDER_NUMBER))
  end as ST_ORDER_NUMBER
,cast(ST_QUERY_FLAG as bit) as ST_QUERY_FLAG
,dbo.AA_VALUE_DPS_F(ST_GROSS) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_GROSS
,dbo.AA_VALUE_DPS_F(ST_UNALLOCATED) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_UNALLOCATED
,case ST_RECONCILED when 1 then 'R' else '' end RECONCILED 
,ST_DUEDATE
,isnull(ST_DESCRIPTION,'') as ST_DESCRIPTION
,dbo.AA_VALUE_DPS_F(ST_REVALUED) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_REVALUED
,isnull(OH_ACCOUNT_ORDER,'') as OH_ACCOUNT_ORDER
,ST_PRIMARY
,ST_YEAR
,ST_PERIODNUMBER
,ST_DATE_PUTIN
,dbo.AA_VALUE_DPS_F(ST_NETT) as ST_NETT
,dbo.AA_VALUE_DPS_F(ST_NETT) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as SIGN_ST_NETT
,dbo.AA_VALUE_DPS_F(ST_VAT) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_VAT
,ST_CURRENCYCODE
,dbo.AA_VALUE_DPS_F(ST_CURR_NETT) as ST_CURR_NETT
,dbo.AA_VALUE_DPS_F(ST_CURR_NETT) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as SIGN_ST_CURR_NETT
,dbo.AA_VALUE_DPS_F(ST_CURR_VALU) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_CURR_VALU
,dbo.AA_VALUE_DPS_F(ST_CURR_UNAL) * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_CURR_UNAL
,dbo.AA_VALUE_DPS_F(CUBALANCE) as CUBALANCE
,dbo.AA_VALUE_DPS_F(CU_CREDIT_LIMIT) as CU_CREDIT_LIMIT
,CU_DATE_PAY
,CU_DATE_INV
,isnull(CUSORT,'') as CUSORT
,isnull(CUUSER1,'') as CUUSER1
,isnull(CUUSER2,'') as CUUSER2
,isnull(CUUSER3,'') as CUUSER3
,isnull(ST_USER1,'') as ST_USER1
,isnull(ST_USER2,'') as ST_USER2
,isnull(ST_USER3,'') as ST_USER3

--Extra fields 
,CUSORT as CUSORT_SRCH
,CUUSER1 as CUUSER1_SRCH
,CUUSER2 as CUUSER2_SRCH
,CUUSER3 as CUUSER3_SRCH

from SL_TRANSACTIONS 
join SL_ACCOUNTS on ST_COPYCUST = CUCODE 
left outer join ORD_HEADER on OH_ORDER_NUMBER = ST_ORDER_NUMBER 
where ST_BATCH_FLAG = 0 and (ST_ALOC_POINTER like '0%')

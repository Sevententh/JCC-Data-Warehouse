create view AA_SL_ANAL_TRANSACTION_DETAIL_SIMPLE_VIEW
/*
** 
** Written:
** Last Amended: 13/10/05 NC, 01/12/2005 JC, 06/12/2005 JC
**
*/
as
select
 cast(d1.DET_PRIMARY as int) as [PRIMARY]
,convert(int,substring(d1.DET_HEADER_KEY,2,len(d1.DET_HEADER_KEY)-1)) as HEADER_PRIMARY
--Analysis
,isnull(d1.DET_COSTHEADER,'') as DET_COSTHEADER
,isnull(d1.DET_COSTCENTRE,'') as DET_COSTCENTRE
--Account
,d1.DET_ACCOUNT as INVOICE_ACCOUNT
,isnull(OH_ACCOUNT_ORDER,'') as OH_ACCOUNT_ORDER
,isnull(OH_ACCOUNT_DELIVERY,'') as OH_ACCOUNT_DELIVERY
,dbo.AA_VALUE_DPS_F(CUBALANCE) as CUBALANCE
,dbo.AA_VALUE_DPS_F(CUTURNOVERYTD) as CUTURNOVERYTD
,isnull(CUSORT,'') as CUSORT
,dbo.AA_VALUE_DPS_F(CU_CREDIT_LIMIT) as CU_CREDIT_LIMIT
--Product
,dbo.AA_QUANTITY_DPS_F(d1.DET_QUANTITY) as DET_QUANTITY
,isnull(d1.DET_STOCK_CODE, '') as DET_STOCK_CODE
,isnull(d1.DET_PRICE_CODE, '') as DET_PRICE_CODE
,isnull(d1.DET_STOCK_CODE,'') + isnull(d1.DET_PRICE_CODE,'') as DET_STOCK_PRICE_CODE
,isnull(STKNAME,'') + isnull(PRNAME,'') as STKNAME_PRNAME
,dbo.AA_PRICE_DPS_F(d1.DET_UNIT_PRICE) as DET_UNIT_PRICE
,dbo.AA_PRICE_DPS_F(d1.DET_COSTPRICE) as DET_COSTPRICE
--Currency
,dbo.AA_VALUE_DPS_F(d1.DET_NETT) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_NETT
,dbo.AA_VALUE_DPS_F(d1.DET_GROSS) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_GROSS
,dbo.AA_VALUE_DPS_F(d1.DET_UNALLOCATED) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_UNALLOCATED
--General
,isnull(d1.DET_DESCRIPTION,'') as DET_DESCRIPTION
,d1.DET_PRIMARY
--VAT
,dbo.AA_VALUE_DPS_F(d1.DET_VAT) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_VAT

,isnull(d1.DET_NOMINALVAT,'') as SANOMINALVAT
,isnull(case when d1.DET_ORIGIN in ('NSO','NSC','NKO') then d2.DET_NOMINALDR else d1.DET_NOMINALDR end,'') as SANOMINALDR
,isnull(d1.DET_NOMINALCR,'') as SANOMINALCR

from SL_PL_NL_DETAIL d1
left outer join SL_TRANSACTIONS on ST_PRIMARY = convert(int,substring(d1.DET_HEADER_KEY,2,len(d1.DET_HEADER_KEY)-1)) and substring(d1.DET_HEADER_KEY,1,1) = 'S'
left outer join ORD_DETAIL on OD_PRIMARY = d1.DET_ORDER_LINK
left outer join ORD_HEADER on OH_ORDER_NUMBER = OD_ORDER_NUMBER 
left outer join STK_STOCK on STKCODE = d1.DET_STOCK_CODE
left outer join PRC_PRICE_RECS on PRCODE = d1.DET_PRICE_CODE
left outer join SL_ACCOUNTS on CUCODE = d1.DET_ACCOUNT and CUCODE<>''
left outer join SL_PL_NL_DETAIL d2 on d2.DET_HEADER_KEY=d1.DET_HEADER_KEY
                                      and d1.DET_ORIGIN in ('NSO','NSC','NKO')
                                      and isnull(d2.DET_NOMINALCR,'')=''
                                      and isnull(d2.DET_ANALYSIS,'')<>'' -- avoids profiles and Assemblies
where d1.DET_ORIGIN in ('S','SO','NSO', 'NSC','NKO')
   and isnull(d1.DET_NOMINALCR,'')<>'' -- This prevents both sides of the double entry of the stock journals from showing up.
   and isnull(d1.DET_ANALYSIS,'')<>'' -- avoids profiles and Assemblies



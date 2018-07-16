create view AA_PL_ANAL_TRANSACTION_DETAIL_SIMPLE_VIEW
/*
** 
** Written:
** Last Amended: 08/03/2005 SR, 12/07/2005 SH, 23/08/2005 SH, 01/12/2005 JC, 06/12/2005 JC
**
*/
as

select
 cast(DET_PRIMARY as int) as [PRIMARY]
,convert(int,substring(DET_HEADER_KEY,2,len(DET_HEADER_KEY)-1)) as HEADER_PRIMARY
--Analysis
,isnull(DET_COSTHEADER,'') as DET_COSTHEADER
,isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE
--Account
,DET_ACCOUNT as DET_ACCOUNT
,isnull(SUNAME,'') as SUNAME
,dbo.AA_VALUE_DPS_F(SUBALANCE) as SUBALANCE
,dbo.AA_VALUE_DPS_F(SUTURNOVERYTD) as SUTURNOVERYTD
,isnull(SUSORT,'') as SUSORT
,dbo.AA_VALUE_DPS_F(SU_CREDIT_LIMIT) as SU_CREDIT_LIMIT
--Product
,dbo.AA_QUANTITY_DPS_F(DET_QUANTITY) as DET_QUANTITY
,isnull(DET_STOCK_CODE, '') as DET_STOCK_CODE
,isnull(DET_PRICE_CODE, '') as DET_PRICE_CODE
,isnull(DET_STOCK_CODE,'') + isnull(DET_PRICE_CODE,'') as DET_STOCK_PRICE_CODE
,isnull(STKNAME,'') + isnull(PRNAME,'') as STKNAME_PRNAME
,dbo.AA_PRICE_DPS_F(DET_UNIT_PRICE) as DET_UNIT_PRICE
--Currency
,dbo.AA_VALUE_DPS_F(DET_NETT) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_NETT
,dbo.AA_VALUE_DPS_F(DET_GROSS) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_GROSS
,dbo.AA_VALUE_DPS_F(DET_UNALLOCATED) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_UNALLOCATED
--General
,isnull(DET_DESCRIPTION,'') as DET_DESCRIPTION
,cast(DET_PRIMARY as int) as DET_PRIMARY
--VAT
,dbo.AA_VALUE_DPS_F(DET_VAT) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_VAT
,isnull(pa1.PANOMINALVAT,'') as PANOMINALVAT
,isnull(pa1.PANOMINALDR,'') as PANOMINALDR
,isnull(pa1.PANOMINALCR,'') as PANOMINALCR

from SL_PL_NL_DETAIL d1
left outer join PL_TRANSACTIONS on PT_PRIMARY = convert(int,substring(d1.DET_HEADER_KEY,2,len(d1.DET_HEADER_KEY)-1)) and substring(d1.DET_HEADER_KEY,1,1) = 'P'
left outer join POP_DETAIL on POD_PRIMARY = DET_ORDER_LINK
left outer join POP_HEADER on POH_ORDER_NUMBR = POD_ORDER_NO 
left outer join STK_STOCK on STKCODE = DET_STOCK_CODE
left outer join PRC_PRICE_RECS on PRCODE = DET_PRICE_CODE
left outer join PL_ACCOUNTS on SUCODE = DET_ACCOUNT
left outer join PL_ANALYSIS pa1 on pa1.PACODE = DET_ANALYSIS 
where
            DET_ORIGIN in ('P','PO','NPO', 'NPC','NKI')
      and   DET_NOMINALDR <> ''
      and   isnull(DET_ANALYSIS,'') <> ''

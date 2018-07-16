create view AA_PL_BATCH_DETAIL_ADVANCED_VIEW
as

select
 DET_PRIMARY as [PRIMARY]
,PT_PRIMARY as HEADER_PRIMARY
,isnull(DET_ANALYSIS,'') as DET_ANALYSIS
,isnull(pa.PANAME,'') as PANAME
,isnull(DET_COSTHEADER,'') as DET_COSTHEADER
,isnull(CH_NAME,'') as CH_NAME
,isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE 
,isnull(CC_NAME,'') as CC_NAME
,dbo.AA_VALUE_DPS_F(DET_NETT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_NETT 
,dbo.AA_VALUE_DPS_F(DET_VAT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_VAT 
,dbo.AA_VALUE_DPS_F(DET_GROSS) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_GROSS 
,isnull(DET_VATCODE,'') as DET_VATCODE
,DET_DATE_PUTIN
,isnull(DET_BATCH_REF,'') as DET_BATCH_REF
,isnull(DET_DESCRIPTION,'') as DET_DESCRIPTION
,DET_DATE 
,DET_YEAR
,DET_PERIODNUMBR

from PL_TRANSACTIONS
join SL_PL_NL_DETAIL with (index(DET_HEADER_KEY)) on DET_HEADER_KEY='P'+convert(varchar,convert(int,PT_PRIMARY))
left outer join CST_COSTHEADER on CH_CODE = DET_COSTHEADER
left outer join CST_COSTCENTRE on CC_CONCAT_CODES = DET_COSTHEADER + space(10 - len(DET_COSTHEADER)) + DET_COSTCENTRE 
left outer join PL_ANALYSIS pa on pa.PACODE = DET_ANALYSIS 
where PT_BATCH_FLAG = 1 
and (PT_ORIGIN <> 'PO' or PT_SRV_STATUS=0) 
and (PT_INVREG_FLAG <> 1 or PT_INVREG_FLAG is null) 
and ((PT_INVREG_STATUS <> 'W' and PT_INVREG_STATUS <> 'R') or (PT_INVREG_STATUS is null))




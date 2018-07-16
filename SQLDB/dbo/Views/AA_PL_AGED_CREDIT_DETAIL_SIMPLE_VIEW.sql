create view AA_PL_AGED_CREDIT_DETAIL_SIMPLE_VIEW
/*
**
** Written:      
** Last Amended: 18/04/06 NC
**
*/
as
select
 DET_PRIMARY as [PRIMARY]
,PT_PRIMARY as HEADER_PRIMARY
--Analysis
,isnull(DET_ANALYSIS,'') as DET_ANALYSIS
,isnull(pa1.PANAME,'') as PANAME
,isnull(POD_STOCK_ANALYSIS,'') as STOCK_ANALYSIS
,isnull(DET_COSTHEADER,'') as DET_COSTHEADER
,isnull(CH_NAME,'') as CH_NAME
,isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE 
,isnull(CC_NAME,'') as CC_NAME
,isnull(pa1.PANOMINALDR,'') as PANOMINALDR
,isnull(pa1.PANOMINALCR,'') as PANOMINALCR
,isnull(pa1.PANOMINALVAT,'') as PANOMINALVAT
,isnull(pa2.PANOMINALDR,'') as STK_NOMINALDR
,isnull(pa2.PANOMINALCR,'') as STK_NOMINALCR
--Product
,isnull(DET_STOCK_CODE, '') as DET_STOCK_CODE
,isnull(DET_PRICE_CODE, '') as DET_PRICE_CODE
,isnull(DET_STOCK_CODE,'') + isnull(DET_PRICE_CODE,'') as DET_STOCK_PRICE_CODE
,isnull(STKNAME,'') + isnull(PRNAME,'') as STKNAME_PRNAME
,dbo.AA_PRICE_DPS_F(DET_UNIT_PRICE) as DET_UNIT_PRICE
,dbo.AA_QUANTITY_DPS_F(DET_QUANTITY) as DET_QUANTITY
--Currency
,dbo.AA_VALUE_DPS_F(DET_GROSS) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_GROSS 
,dbo.AA_VALUE_DPS_F(DET_NETT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_NETT 
,dbo.AA_VALUE_DPS_F(DET_CURR_GROSS) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_CURR_GROSS 
,dbo.AA_VALUE_DPS_F(DET_CURR_NETT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_CURR_NETT
,dbo.AA_VALUE_DPS_F(DET_GROSS_BASE2) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_GROSS_BASE2
,dbo.AA_VALUE_DPS_F(DET_NETT_BASE2) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_NETT_BASE2
,dbo.AA_VALUE_DPS_F(DET_L_DISCOUNT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_L_DISCOUNT
,dbo.AA_VALUE_DPS_F(DET_L_DISC_BASE2) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_L_DISC_BASE2
,dbo.AA_VALUE_DPS_F(DET_CURR_L_DISC) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_CURR_L_DISC
--VAT
,isnull(DET_VATCODE,'') as DET_VATCODE
,dbo.AA_VALUE_DPS_F(DET_VAT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_VAT 
,dbo.AA_VALUE_DPS_F(DET_CURR_TAX) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end as DET_CURR_TAX
--General
,case DET_RECONCILED when 1 then 'R' else '' end RECONCILED
,DET_DATE_PUTIN
,isnull(DET_DESCRIPTION,'') as DET_DESCRIPTION
,POD_ORDER_NO
,PT_CURRENCYCODE

from PL_TRANSACTIONS
join SL_PL_NL_DETAIL with (index(DET_HEADER_KEY)) on DET_HEADER_KEY='P'+convert(varchar,convert(int,PT_PRIMARY))
left outer join POP_DETAIL on POD_PRIMARY = DET_ORDER_LINK  
left outer join CST_COSTHEADER on CH_CODE = DET_COSTHEADER
left outer join CST_COSTCENTRE on CC_CONCAT_CODES = DET_COSTHEADER + space(10 - len(DET_COSTHEADER)) + DET_COSTCENTRE 
left outer join STK_STOCK on STKCODE = DET_STOCK_CODE
left outer join PRC_PRICE_RECS on PRCODE = DET_PRICE_CODE
left outer join PL_ANALYSIS pa1 on pa1.PACODE = DET_ANALYSIS 
left outer join PL_ANALYSIS pa2 on pa2.PACODE = POD_STOCK_ANALYSIS
where PT_BATCH_FLAG = 0 and PT_ALOC_POINTER like '0%'
and isnull(DET_ANALYSIS,'')<>''
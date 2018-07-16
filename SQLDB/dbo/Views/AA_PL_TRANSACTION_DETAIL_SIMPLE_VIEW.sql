create view AA_PL_TRANSACTION_DETAIL_SIMPLE_VIEW
/*
** Written: 
** Last Amended: 21/04/2005 SR, 27/05/05 NC, 25/05/05 NC, 08/07/2005 SH, 07/9/2005 SH, 26/10/2005 JC, 01/12/2005 JC, 06/12/2005 JC, 18/04/06 NC
**
*/
as
select
    DET_PRIMARY                                           as [PRIMARY]
   ,PT_PRIMARY                                            as HEADER_PRIMARY
   ,isnull(DET_ANALYSIS,'')                               as DET_ANALYSIS
   ,isnull(pa1.PANAME,'')                                 as PANAME
   ,isnull(DET_STOCK_CODE,'')                             as DET_STOCK_CODE
   ,isnull(DET_PRICE_CODE,'')                             as DET_PRICE_CODE
   ,isnull(DET_STOCK_CODE,'') + isnull(DET_PRICE_CODE,'') as DET_STOCK_PRICE_CODE
   ,isnull(STKNAME,'') + isnull(PRNAME,'')                as STKNAME_PRNAME
   ,isnull(DET_COSTHEADER,'')                             as DET_COSTHEADER
   ,isnull(CH_NAME,'')                                    as CH_NAME
   ,isnull(DET_COSTCENTRE,'')                             as DET_COSTCENTRE
   ,isnull(CC_NAME,'')                                    as CC_NAME
   ,dbo.AA_VALUE_DPS_F(DET_NETT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end                      as DET_NETT 
   ,dbo.AA_VALUE_DPS_F(DET_VAT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end                       as DET_VAT 
   ,dbo.AA_VALUE_DPS_F(DET_GROSS) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end                     as DET_GROSS 
   ,dbo.AA_VALUE_DPS_F(DET_UNALLOCATED) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end               as DET_UNALLOCATED 
   ,case DET_RECONCILED when 1 then 'R' else '' end       as RECONCILED
   ,cast(DET_PRIMARY as int)                              as DET_PRIMARY
   ,DET_DATE_PUTIN                                        as DET_DATE_PUTIN
   ,isnull(DET_BATCH_REF,'')                              as DET_BATCH_REF
   ,isnull(DET_DESCRIPTION,'')                            as DET_DESCRIPTION
   ,DET_DATE                                              as DET_DATE 
   ,DET_YEAR                                              as DET_YEAR
   ,DET_PERIODNUMBR                                       as DET_PERIODNUMB
   ,POD_ORDER_NO                                          as POD_ORDER_NO
   ,isnull(POH_ACCOUNT,'')                                as POH_ORDER_ACCOUNT
   ,isnull(p1.SUNAME,'')                                  as ORDER_ACCOUNT_NAME
   ,isnull(POD_STOCK_ANALYSIS,'')                         as STOCK_ANALYSIS
   ,isnull(pa2.PANOMINALDR,'')                            as STK_NOMINALDR
   ,isnull(pa2.PANOMINALCR,'')                            as STK_NOMINALCR
   ,dbo.AA_PRICE_DPS_F(DET_UNIT_PRICE)                    as DET_UNIT_PRICE
   ,dbo.AA_QUANTITY_DPS_F(DET_QUANTITY)                   as DET_QUANTITY
   ,dbo.AA_VALUE_DPS_F(DET_NETT_BASE2) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end                as DET_NETT_BASE2
   ,dbo.AA_VALUE_DPS_F(DET_GROSS_BASE2) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end               as DET_GROSS_BASE2
   ,dbo.AA_VALUE_DPS_F(DET_CURR_NETT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end                 as DET_CURR_NETT
   ,dbo.AA_VALUE_DPS_F(DET_CURR_GROSS) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end                as DET_CURR_GROSS 
   ,dbo.AA_VALUE_DPS_F(DET_L_DISCOUNT) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end                as DET_L_DISCOUNT
   ,dbo.AA_VALUE_DPS_F(DET_L_DISC_BASE2) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end              as DET_L_DISC_BASE2
   ,dbo.AA_VALUE_DPS_F(DET_CURR_L_DISC) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end               as DET_CURR_L_DISC
   ,isnull(DET_VATCODE,'')                                as DET_VATCODE
   ,isnull(pa1.PANOMINALDR,'')                            as PANOMINALDR
   ,isnull(pa1.PANOMINALCR,'')                            as PANOMINALCR
   ,isnull(pa1.PANOMINALVAT,'')                           as PANOMINALVAT
   ,dbo.AA_VALUE_DPS_F(DET_PL_ACQ_TAX) * case when PT_TRANTYPE in ('INV','ACR','JCR') then 1 else -1 end                as DET_PL_ACQ_TAX
   ,PT_CURRENCYCODE
from 
   PL_TRANSACTIONS 
   join SL_PL_NL_DETAIL with (index(DET_HEADER_KEY)) on DET_HEADER_KEY='P'+convert(varchar,convert(int,PT_PRIMARY))
   left outer join POP_DETAIL      on POD_PRIMARY = DET_ORDER_LINK  
   left outer join POP_HEADER      on POH_ORDER_NUMBR = POD_ORDER_NO
   left outer join PL_ACCOUNTS p1  on p1.SUCODE = POH_ACCOUNT
   left outer join CST_COSTHEADER  on CH_CODE = DET_COSTHEADER
   left outer join CST_COSTCENTRE  on CC_CONCAT_CODES = convert(char(10),DET_COSTHEADER) + DET_COSTCENTRE
   left outer join STK_STOCK       on STKCODE = DET_STOCK_CODE
   left outer join PRC_PRICE_RECS  on PRCODE = DET_PRICE_CODE
   left outer join PL_ANALYSIS pa1 on pa1.PACODE = DET_ANALYSIS 
   left outer join PL_ANALYSIS pa2 on pa2.PACODE = POD_STOCK_ANALYSIS
where isnull(DET_ANALYSIS,'')<>''
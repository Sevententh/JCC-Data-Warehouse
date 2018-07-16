create view AA_PL_ANAL_TRANSACTION_DETAIL_ADVANCED_VIEW
/*
**
** Written     :
** Last Amended: 08/03/2005 SR, 25/04/2005 SH, 12/07/2005 SH, 23/08/2005 SH, 15/09/2005 DB, 01/12/2005 JC, 06/12/2005 JC
**
*/
as

select
   cast(DET_PRIMARY as int) as [PRIMARY]
,  convert(int,substring(DET_HEADER_KEY,2,len(DET_HEADER_KEY)-1)) as HEADER_PRIMARY
--Analysis
,  isnull(DET_COSTHEADER,'') as DET_COSTHEADER
,  isnull(CH_NAME,'') as CH_NAME
,  isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE
,  isnull(CC_NAME,'') as CC_NAME
--Account
,  DET_ACCOUNT as DET_ACCOUNT
,  isnull(SUNAME,'') as SUNAME
,  dbo.AA_VALUE_DPS_F(SUBALANCE) as SUBALANCE
,  dbo.AA_VALUE_DPS_F(SUTURNOVERYTD) as SUTURNOVERYTD
,  isnull(SUSORT,'') as SUSORT
,  dbo.AA_VALUE_DPS_F(SU_CREDIT_LIMIT) as SU_CREDIT_LIMIT
--Product
,  dbo.AA_QUANTITY_DPS_F(DET_QUANTITY) as DET_QUANTITY
,  isnull(DET_STOCK_CODE, '') as DET_STOCK_CODE
,  isnull(DET_PRICE_CODE, '') as DET_PRICE_CODE
,  isnull(DET_STOCK_CODE,'') + isnull(DET_PRICE_CODE,'') as DET_STOCK_PRICE_CODE
,  isnull(STKNAME,'') + isnull(PRNAME,'') as STKNAME_PRNAME
,  dbo.AA_PRICE_DPS_F(DET_UNIT_PRICE) as DET_UNIT_PRICE
,  isnull(DET_STKSORTKEY,'') as DET_STKSORTKEY
,  isnull(DET_STKSORTKEY1,'') as DET_STKSORTKEY1
,  isnull(DET_STKSORTKEY2,'') as DET_STKSORTKEY2
,  isnull(DET_STKSORTKEY3,'') as DET_STKSORTKEY3
,  isnull(POD_LOCATN,'') as POD_LOCATN
,  isnull(DET_SERIALNO,'') as DET_SERIALNO
--Currency
,  dbo.AA_VALUE_DPS_F(DET_NETT) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_NETT
,  dbo.AA_VALUE_DPS_F(DET_GROSS) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_GROSS
,  dbo.AA_VALUE_DPS_F(DET_UNALLOCATED) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_UNALLOCATED
--General
,  isnull(DET_DESCRIPTION,'') as DET_DESCRIPTION
,  isnull(DET_DIMENSION1,'') as DET_DIMENSION1
,  isnull(DET_DIMENSION2,'') as DET_DIMENSION2
,  isnull(DET_DIMENSION3,'') as DET_DIMENSION3
,  dbo.AA_VALUE_DPS_F(DET_L_DISCOUNT) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_L_DISCOUNT
,  dbo.AA_VALUE_DPS_F(DET_T_DISCOUNT) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_T_DISCOUNT
,  DET_SUB_AUDIT_NO
,  isnull(DET_RECON_REF,'') as DET_RECON_REF
,  cast(DET_PRIMARY as int) as DET_PRIMARY
--VAT
,  isnull(DET_VATCODE,'') as DET_VATCODE
,  dbo.AA_VALUE_DPS_F(DET_VAT) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_VAT
,  dbo.AA_VALUE_DPS_F(DET_VAT_BASE2) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_VAT_BASE2
,  dbo.AA_VALUE_DPS_F(DET_CURR_TAX) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_CURR_TAX
,  isnull(pa1.PANOMINALVAT,'') as PANOMINALVAT
,  isnull(pa1.PANOMINALDR,'') as PANOMINALDR
,  isnull(pa1.PANOMINALCR,'') as PANOMINALCR
,  isnull(NNAME,'') as NNAME
,  isnull(VAT_RATE,0) as VAT_RATE
,  isnull(DET_IMPEXP_CODE,'') as DET_IMPEXP_CODE
,  isnull(STK_EC_COM_CODE,'') as STK_EC_COM_CODE
,  isnull(PT_EC_DEL_TERMS,'') as PT_EC_DEL_TERMS
,  isnull(PT_EC_T_MODE,'') as PT_EC_T_MODE
,  isnull(STK_EC_ORIGIN,'') as STK_EC_ORIGIN
,  isnull(PT_EC_T_NATURE,'') as PT_EC_T_NATURE
,  isnull(DET_ECVAT_TYPE,'') as DET_ECVAT_TYPE
,  dbo.AA_VALUE_DPS_F(DET_PL_ACQ_TAX) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NPC' then -1 else 1 end)) as DET_PL_ACQ_TAX
--Custom
,  isnull(DET_USRCHAR1,'') as DET_USRCHAR1
,  isnull(DET_USRCHAR2,'') as DET_USRCHAR2
,  isnull(DET_USRCHAR3,'') as DET_USRCHAR3
,  isnull(DET_USRCHAR4,'') as DET_USRCHAR4
,  DET_USRFLAG1
,  DET_USRFLAG2
,  DET_USRDATE1
,  DET_USRDATE2
,  dbo.AA_VALUE_DPS_F(DET_USRNUM1) as DET_USRNUM1
,  dbo.AA_VALUE_DPS_F(DET_USRNUM2) as DET_USRNUM2
   from
      SL_PL_NL_DETAIL d1
         left outer join PL_TRANSACTIONS  on       PT_PRIMARY                       = convert(int,substring(DET_HEADER_KEY,2,len(DET_HEADER_KEY)-1))
                                             and   substring(DET_HEADER_KEY,1,1) = 'P'
         left outer join POP_DETAIL       on       POD_PRIMARY                      = DET_ORDER_LINK
         left outer join STK_STOCK        on       STKCODE                          = DET_STOCK_CODE
         left outer join PRC_PRICE_RECS   on       PRCODE                           = DET_PRICE_CODE
         left outer join CST_COSTHEADER   on       CH_CODE                          = DET_COSTHEADER
         left outer join CST_COSTCENTRE   on       CC_CONCAT_CODES                  = DET_COSTHEADER + space(10 - len(DET_COSTHEADER)) + DET_COSTCENTRE
         left outer join SYS_VATCONTROL   on       VAT_CODE                         = DET_VATCODE
         left outer join PL_ANALYSIS pa1  on       pa1.PACODE                       = DET_ANALYSIS
         left outer join PL_ACCOUNTS      on       SUCODE                           = DET_ACCOUNT
         left outer join SL_PL_NL_DETAIL2 on       DET_PRIMARY_2                    = DET_PRIMARY
         left outer join NL_ACCOUNTS      on       NCODE                            = PANOMINALVAT
   where
            DET_ORIGIN in ('P','PO','NPO', 'NPC','NKI')
      and   DET_NOMINALDR <> ''
      and   isnull(DET_ANALYSIS,'') <> ''

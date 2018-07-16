create view AA_SL_ANAL_TRANSACTION_DETAIL_ADVANCED_VIEW
/*
**
** Written     :
** Last Amended: 21/02/2005 SR, 25/04/2005 SH, 11/07/2005 SH, 23/08/2005 SH, 15/09/2005 DB, 13/10/05 NC, 01/12/2005 JC, 06/12/2005 JC
**
*/
as

select
   cast(d1.DET_PRIMARY as int) as [PRIMARY]
,  convert(int,substring(d1.DET_HEADER_KEY,2,len(d1.DET_HEADER_KEY)-1)) as HEADER_PRIMARY
--Analysis
,  isnull(d1.DET_COSTHEADER,'') as DET_COSTHEADER
,  isnull(CH_NAME,'') as CH_NAME
,  isnull(d1.DET_COSTCENTRE,'') as DET_COSTCENTRE
,  isnull(CC_NAME,'') as CC_NAME
--Account
,  d1.DET_ACCOUNT as INVOICE_ACCOUNT
,  isnull(ia.CUNAME,'') as INVOICE_ACCOUNT_NAME
,  isnull(OH_ACCOUNT_ORDER,'') as OH_ACCOUNT_ORDER
,  isnull(oa.CUNAME,'') as ACCOUNT_ORDER_NAME
,  isnull(OH_ACCOUNT_DELIVERY,'') as OH_ACCOUNT_DELIVERY
,  isnull(da.CUNAME,'') as ACCOUNT_DELIVERY_NAME
,  dbo.AA_VALUE_DPS_F(ia.CUBALANCE) as CUBALANCE
,  dbo.AA_VALUE_DPS_F(ia.CUTURNOVERYTD) as CUTURNOVERYTD
,  isnull(ia.CUSORT,'') as CUSORT
,  dbo.AA_VALUE_DPS_F(ia.CU_CREDIT_LIMIT) as CU_CREDIT_LIMIT
--Product
,  dbo.AA_QUANTITY_DPS_F(d1.DET_QUANTITY) as DET_QUANTITY
,  isnull(d1.DET_STOCK_CODE, '') as DET_STOCK_CODE
,  isnull(d1.DET_PRICE_CODE, '') as DET_PRICE_CODE
,  isnull(d1.DET_STOCK_CODE,'') + isnull(d1.DET_PRICE_CODE,'') as DET_STOCK_PRICE_CODE
,  isnull(STKNAME,'') + isnull(PRNAME,'') as STKNAME_PRNAME
,  dbo.AA_PRICE_DPS_F(d1.DET_UNIT_PRICE) as DET_UNIT_PRICE
,  dbo.AA_PRICE_DPS_F(d1.DET_COSTPRICE) as DET_COSTPRICE
,  isnull(d1.DET_STKSORTKEY,'') as DET_STKSORTKEY
,  isnull(d1.DET_STKSORTKEY1,'') as DET_STKSORTKEY1
,  isnull(d1.DET_STKSORTKEY2,'') as DET_STKSORTKEY2
,  isnull(d1.DET_STKSORTKEY3,'') as DET_STKSORTKEY3
,  isnull(OD_LOCATN,'') as OD_LOCATN
,  isnull(d1.DET_SERIALNO,'') as DET_SERIALNO
--Currency
,  dbo.AA_VALUE_DPS_F(d1.DET_NETT) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_NETT
,  dbo.AA_VALUE_DPS_F(d1.DET_GROSS) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_GROSS
,  dbo.AA_VALUE_DPS_F(d1.DET_UNALLOCATED) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_UNALLOCATED
--General
,  isnull(d1.DET_DESCRIPTION,'') as DET_DESCRIPTION
,  isnull(d1.DET_DIMENSION1,'') as DET_DIMENSION1
,  isnull(d1.DET_DIMENSION2,'') as DET_DIMENSION2
,  isnull(d1.DET_DIMENSION3,'') as DET_DIMENSION3
,  dbo.AA_VALUE_DPS_F(d1.DET_L_DISCOUNT) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_L_DISCOUNT
,  dbo.AA_VALUE_DPS_F(d1.DET_T_DISCOUNT) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_T_DISCOUNT
,  d1.DET_SUB_AUDIT_NO
,  isnull(d1.DET_RECON_REF,'') as DET_RECON_REF
,  d1.DET_PRIMARY
--VAT
,  isnull(d1.DET_VATCODE,'') as DET_VATCODE
,  dbo.AA_VALUE_DPS_F(d1.DET_VAT) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_VAT
,  dbo.AA_VALUE_DPS_F(d1.DET_VAT_BASE2) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_VAT_BASE2
,  dbo.AA_VALUE_DPS_F(d1.DET_CURR_TAX) * (case when d1.DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when d1.DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when d1.DET_ORIGIN='NSC' then -1 else 1 end)) as DET_CURR_TAX
,  isnull(d1.DET_NOMINALVAT,'') as SANOMINALVAT
,  isnull(case when d1.DET_ORIGIN in ('NSO','NSC','NKO') then d2.DET_NOMINALDR else d1.DET_NOMINALDR end,'') as SANOMINALDR
,  isnull(d1.DET_NOMINALCR,'') as SANOMINALCR
,  isnull(NNAME,'') as NNAME
,  isnull(VAT_RATE,0) as VAT_RATE
,  isnull(d1.DET_IMPEXP_CODE,'') as DET_IMPEXP_CODE
,  isnull(STK_EC_COM_CODE,'') as STK_EC_COM_CODE
,  isnull(ST_EC_DEL_TERMS,'') as ST_EC_DEL_TERMS
,  isnull(ST_EC_T_MODE,'') as ST_EC_T_MODE
,  isnull(STK_EC_ORIGIN,'') as STK_EC_ORIGIN
,  isnull(ST_EC_T_NATURE,'') as ST_EC_T_NATURE
,  isnull(d1.DET_ECVAT_TYPE,'') as DET_ECVAT_TYPE
--Custom
,  isnull(DET_USRCHAR1,'') as DET_USRCHAR1
,  isnull(DET_USRCHAR2,'') as DET_USRCHAR2
,  isnull(DET_USRCHAR3,'') as DET_USRCHAR3
,  isnull(DET_USRCHAR4,'') as DET_USRCHAR4
,  cast(DET_USRFLAG1 as bit) as DET_USRFLAG1
,  cast(DET_USRFLAG2 as bit) as DET_USRFLAG2
,  DET_USRDATE1
,  DET_USRDATE2
,  dbo.AA_VALUE_DPS_F(DET_USRNUM1) as DET_USRNUM1
,  dbo.AA_VALUE_DPS_F(DET_USRNUM2) as DET_USRNUM2
   from
      SL_PL_NL_DETAIL d1
         left outer join SL_TRANSACTIONS     on       ST_PRIMARY                       =  convert(int,substring(d1.DET_HEADER_KEY,2,len(d1.DET_HEADER_KEY)-1))
                                                and   substring(d1.DET_HEADER_KEY,1,1) =  'S'
         left outer join ORD_DETAIL          on       OD_PRIMARY                       =  d1.DET_ORDER_LINK
         left outer join ORD_HEADER          on       OH_ORDER_NUMBER                  =  OD_ORDER_NUMBER
         left outer join STK_STOCK           on       STKCODE                          =  d1.DET_STOCK_CODE
         left outer join PRC_PRICE_RECS      on       PRCODE                           =  d1.DET_PRICE_CODE
         left outer join SL_ACCOUNTS ia      on       ia.CUCODE                        =  d1.DET_ACCOUNT and ia.CUCODE<>''
         left outer join SL_ACCOUNTS oa      on       oa.CUCODE                        =  OH_ACCOUNT_ORDER and oa.CUCODE<>''
         left outer join SL_ACCOUNTS da      on       da.CUCODE                        =  OH_ACCOUNT_DELIVERY and da.CUCODE<>''
         left outer join CST_COSTHEADER      on       CH_CODE                          =  d1.DET_COSTHEADER
         left outer join CST_COSTCENTRE      on       CC_CONCAT_CODES                  =  convert(char(10),d1.DET_COSTHEADER) + d1.DET_COSTCENTRE
         left outer join SYS_VATCONTROL      on       VAT_CODE                         =  d1.DET_VATCODE
         left outer join SL_PL_NL_DETAIL2    on       DET_PRIMARY_2                    =  d1.DET_PRIMARY
         left outer join SL_PL_NL_DETAIL d2  on       d2.DET_HEADER_KEY                =  d1.DET_HEADER_KEY
                                                and   d1.DET_ORIGIN                    in ('NSO','NSC','NKO')
                                                and   isnull(d2.DET_NOMINALCR,'')      =  ''
                                                and   isnull(d2.DET_ANALYSIS,'')       <> '' -- avoids profiles and Assemblies
         left outer join NL_ACCOUNTS         on       NCODE                            =  d1.DET_NOMINALVAT
   where
            d1.DET_ORIGIN              in ('S','SO','NSO', 'NSC','NKO')
      and   isnull(d1.DET_NOMINALCR,'')<> '' -- This prevents both sides of the double entry of the stock journals from showing up.
      and   isnull(d1.DET_ANALYSIS,'') <> '' -- avoids profiles and Assemblies

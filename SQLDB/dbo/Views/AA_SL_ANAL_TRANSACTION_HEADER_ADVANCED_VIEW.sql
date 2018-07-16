create view AA_SL_ANAL_TRANSACTION_HEADER_ADVANCED_VIEW
/*
**
** Written     :
** Last Amended:  21/02/2005 SR, 11/07/2005 SH, 23/08/2005 SH, 07/09/2005 SH, 13/10/2005 NC, 21/09/2006 DB, 20/07/07 NC
**
*/
as

select
   cast(DET_PRIMARY as int)      as [PRIMARY]
,  DET_ANALYSIS
,  isnull(SANAME,'')             as SANAME
,  DET_DATE
,  DET_YEAR
,  DET_PERIODNUMBR
,  DET_TYPE
,  cast(DET_BATCH_FLAG as bit)   as DET_BATCH_FLAG
,  isnull
   (
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then ST_COPYCUST
         when 'N' then OH_ACCOUNT
         else
            ''
      end
   ,  ''
   )                                as CUSTOMER
,  isnull(DET_HEADER_REF,'')        as DET_HEADER_REF
,  OD_ORDER_NUMBER
,  dbo.AA_VALUE_DPS_F(DET_NETT)        * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as DET_NETT
,  dbo.AA_VALUE_DPS_F(DET_VAT)         * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as DET_VAT
,  dbo.AA_VALUE_DPS_F(DET_GROSS)       * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as DET_GROSS
,  dbo.AA_VALUE_DPS_F(DET_UNALLOCATED) * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as DET_UNALLOCATED
,  DET_HEADER_KEY
,  DET_PRIMARY
,  DET_DATE_PUTIN                   as DATE_PUTIN
,  SATYPE_S_B_D
,  isnull(SANOMINALDR,'')           as SANOMINALDR
,  dr.NNAME                         as SANOMINALDRNAME
,  isnull(SANOMINALCR,'')           as SANOMINALCR
,  cr.NNAME                         as SANOMINALCRNAME
,  isnull(SANOMINALVAT,'')          as SANOMINALVAT
,  isnull(vt.NNAME,'')              as SANOMINALVATNAME
,  SAVATCODE
,  isnull(ST_USER1,'')              as ST_USER1
,  isnull(ST_USER2,'')              as ST_USER2
,  isnull(ST_USER3,'')              as ST_USER3
,  DET_USER_PUTIN                   as USER_PUTIN
,  isnull([USER_NAME],'')           as [USER_NAME]
,  isnull(ST_DESCRIPTION,'')        as ST_DESCRIPTION
,  ST_DUEDATE
,  ST_ANTICPAYDATE
,  isnull(ST_BATCH_REF,'')          as ST_BATCH_REF
,  isnull(ST_SUB_LEDGER,'')         as ST_SUB_LEDGER
,  ST_SETT_DISC_1
,  ST_SETT_DISC_2
,  ST_SETT_DAYS_1
,  ST_SETT_DAYS_2
,  dbo.AA_VALUE_DPS_F(DET_CURR_NETT)   * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as ST_CURR_NETT
,  dbo.AA_VALUE_DPS_F(DET_NETT_BASE2)  * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as ST_NETT_BASE2
,  dbo.AA_VALUE_DPS_F(DET_CURR_GROSS)  * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as ST_CURR_VALU
,  dbo.AA_VALUE_DPS_F(DET_GROSS_BASE2) * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as ST_GROSS_BASE2
,  dbo.AA_VALUE_DPS_F(DET_L_DISCOUNT)  * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as ST_L_DISCVAL
,  dbo.AA_VALUE_DPS_F(DET_CURR_L_DISC) * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as ST_L_DISCVAL_C
,  dbo.AA_VALUE_DPS_F(DET_T_DISCOUNT)  * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as ST_T_DISCVAL
,  dbo.AA_VALUE_DPS_F(DET_CURR_T_DISC) * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as ST_T_DISCVAL_C
,  ST_CURRENCYRATE
,  ST_BASE2_RATE
,  isnull(STT_USRCHAR1,'')          as ST_USRCHAR1
,  isnull(ST_USRCHAR2,'')           as ST_USRCHAR2
,  isnull(ST_USRCHAR3,'')           as ST_USRCHAR3
,  isnull(ST_USRCHAR4,'')           as ST_USRCHAR4
,  cast(ST_USRFLAG1 as bit)         as ST_USRFLAG1
,  cast(ST_USRFLAG2 as bit)         as ST_USRFLAG2
,  ST_USRDATE1
,  ST_USRDATE2
,  dbo.AA_VALUE_DPS_F(ST_USRNUM1)   as ST_USRNUM1
,  dbo.AA_VALUE_DPS_F(ST_USRNUM2)   as ST_USRNUM2
,  cast
   (
      substring
      (
         DET_HEADER_KEY
      ,  2
      ,  len(DET_HEADER_KEY)-1
      )
      as integer
   )                                as HEADER_PRIMARY
,  isnull(CU_PRIMARY,0)             as CU_PRIMARY
,  isnull(SA_PRIMARY,0)             as SA_PRIMARY
,  DET_STOCK_CODE  -- required for search
,  DET_PRICE_CODE  -- required for search
,  DET_COSTHEADER  -- required for search
,  DET_COSTCENTRE  -- required for search
,  DET_DIMENSION1  -- required for search
,  DET_DIMENSION2  -- required for search
,  DET_DIMENSION3  -- required for search
,  DET_RECON_REF                    as STATEMENT_REFERENCE
   from
      SL_PL_NL_DETAIL
         left  join SL_TRANSACTIONS       on ST_PRIMARY        = convert(int,substring(DET_HEADER_KEY,2,len(DET_HEADER_KEY)-1)) and substring(DET_HEADER_KEY,1,1) = 'S'
         left  join ORD_DETAIL            on OD_PRIMARY        = DET_ORDER_LINK
         left  join ORD_HEADER            on OH_ORDER_NUMBER   = OD_ORDER_NUMBER
         inner join SL_ANALYSIS           on SACODE            = DET_ANALYSIS
         left  join NL_ACCOUNTS        dr on SANOMINALDR       = dr.NCODE
         left  join NL_ACCOUNTS        cr on SANOMINALCR       = cr.NCODE
         left  join NL_ACCOUNTS        vt on SANOMINALVAT      = vt.NCODE
         left  join SYS_USER              on [USER_ID]         = DET_USER_PUTIN
         left  join SL_TRANSACTIONS2      on ST_PRIMARY_2      = ST_PRIMARY
         left  join SL_ACCOUNTS        c  on c.CUCODE          = DET_ACCOUNT and CUCODE<>''
   where
            DET_ORIGIN  in
                        (
                           'S'
                        ,  'SO'
                        ,  'NSO'
                        ,  'NSC'
                        ,  'NKO'
                        ,  'NCI'    -- Costing Income Transaction                      (Not WIP)      - Income Analysis (SL)
                        ,  'NCU'    -- Transaction flagged as unrecoverable            (out of WIP)   - WIP Analysis    (SL)
                        ,  'NCUU'   -- Transaction un-flagged as unrecoverable         (in to WIP)    - WIP Analysis    (SL)
                        ,  'NCRW'   -- Transaction flagged as released from WIP        (out of WIP)   - WIP Analysis    (SL)
                        ,  'NCCRW'  -- Transaction flagged as correct release from WIP (in to WIP)    - WIP Analysis    (SL)
                        )
      and   isnull(DET_NOMINALCR,'')   <>'' -- This prevents both sides of the double entry of the stock journals from showing up.
      and   isnull(DET_ANALYSIS,'')    <>'' -- avoids profiles and Assemblies
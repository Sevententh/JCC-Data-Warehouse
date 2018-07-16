create view AA_PL_ANAL_TRANSACTION_HEADER_ADVANCED_VIEW
/*
**
** Written:
** Last Amended: 08/03/2005 SR, 23/08/2005 SH, 07/09/2005 SH, 20/09/2006 DB, 07/02/2007 DB, 20/07/07 NC
**
*/
as

select
   cast(DET_PRIMARY as int)               as [PRIMARY]
,  DET_ANALYSIS
,  isnull(PANAME,'')                      as PANAME
,  DET_DATE
,  DET_YEAR
,  DET_PERIODNUMBR
,  DET_TYPE
,  cast(DET_BATCH_FLAG as bit)            as DET_BATCH_FLAG
,  isnull
   (
      case substring(DET_HEADER_KEY,1,1)
         when 'P' then PT_COPYSUPP
         when 'N' then POH_ACCOUNT
         else
            ''
      end
   ,  ''
   )                                      as SUPPLIER
,  isnull(DET_HEADER_REF,'')              as DET_HEADER_REF
,  POD_ORDER_NO
,  dbo.AA_VALUE_DPS_F(DET_NETT)        * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as DET_NETT
,  dbo.AA_VALUE_DPS_F(DET_VAT)         * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as DET_VAT
,  dbo.AA_VALUE_DPS_F(DET_GROSS)       * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as DET_GROSS
,  dbo.AA_VALUE_DPS_F(DET_UNALLOCATED) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as DET_UNALLOCATED
,  DET_HEADER_KEY
,  DET_PRIMARY
,  case substring(DET_HEADER_KEY,1,1)
      when 'P' then PT_DATE_PUTIN
      when 'N' then NT_DATE_PUTIN
      else
         ''
   end                                    as DATE_PUTIN
,  PATYPE_P_B_D
,  isnull(PANOMINALDR,'')                 as PANOMINALDR
,  dr.NNAME                               as PANOMINALDRNAME
,  isnull(PANOMINALCR,'')                 as PANOMINALCR
,  cr.NNAME                               as PANOMINALCRNAME
,  isnull(PANOMINALVAT,'')                as PANOMINALVAT
,  isnull(vt.NNAME,'')                    as SANOMINALVATNAME
,  PAVATCODE
,  isnull(PT_USER1,'')                    as PT_USER1
,  isnull(PT_USER2,'')                    as PT_USER2
,  isnull(PT_USER3,'')                    as PT_USER3
,  case substring(DET_HEADER_KEY,1,1)
      when 'P' then PT_USER_PUTIN
      when 'N' then NT_USER_PUTIN
      else
         ''
   end                                    as USER_PUTIN
,  isnull([USER_NAME],'')                 as [USER_NAME]
,  isnull(PT_DESCRIPTION,'')              as PT_DESCRIPTION
,  PT_DUEDATE
,  PT_ANTICPAYDATE
,  isnull(PT_BATCH_REF,'')                as PT_BATCH_REF
,  isnull(PT_SUB_LEDGER,'')               as PT_SUB_LEDGER
,  PT_SETT_DISC1
,  PT_SETT_DISC2
,  PT_SETT_DAYS1
,  PT_SETT_DAYS2
,  dbo.AA_VALUE_DPS_F(DET_CURR_NETT)   * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as PT_CURR_NETT
,  dbo.AA_VALUE_DPS_F(DET_NETT_BASE2)  * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as PT_NETT_BASE2
,  dbo.AA_VALUE_DPS_F(DET_CURR_GROSS)  * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as PT_CURR_VALU
,  dbo.AA_VALUE_DPS_F(DET_GROSS_BASE2) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as PT_GROSS_BASE2
,  dbo.AA_VALUE_DPS_F(DET_L_DISCOUNT)  * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as PT_L_DISCVAL
,  dbo.AA_VALUE_DPS_F(DET_CURR_L_DISC) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as PT_L_DISCVAL_C
,  dbo.AA_VALUE_DPS_F(DET_T_DISCOUNT)  * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as PT_T_DISCVAL
,  dbo.AA_VALUE_DPS_F(DET_CURR_T_DISC) * (case when DET_TYPE in ('JNL','INV','ACR') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN in('NPC','NCNC') then -1 else 1 end)) as PT_T_DISCVAL_C
,  PT_CURRENCYRATE
,  PT_BASE2_RATE
,  isnull(PT_USRCHAR1,'')                 as PT_USRCHAR1
,  isnull(PT_USRCHAR2,'')                 as PT_USRCHAR2
,  isnull(PT_USRCHAR3,'')                 as PT_USRCHAR3
,  isnull(PT_USRCHAR4,'')                 as PT_USRCHAR4
,  cast(PT_USRFLAG1 as bit)               as PT_USRFLAG1
,  cast(PT_USRFLAG2 as bit)               as PT_USRFLAG2
,  PT_USRDATE1
,  PT_USRDATE2
,  dbo.AA_VALUE_DPS_F(PT_USRNUM1)         as PT_USRNUM1
,  dbo.AA_VALUE_DPS_F(PT_USRNUM2)         as PT_USRNUM2
,  cast(substring(DET_HEADER_KEY,2,len(DET_HEADER_KEY)-1) as integer) as HEADER_PRIMARY
,  isnull(SU_PRIMARY,0)                   as SU_PRIMARY
,  isnull(PA_PRIMARY,0)                   as PA_PRIMARY
,  DET_STOCK_CODE  -- required for search
,  DET_PRICE_CODE  -- required for search
,  DET_COSTHEADER  -- required for search
,  DET_COSTCENTRE  -- required for search
,  DET_DIMENSION1  -- required for search
,  DET_DIMENSION2  -- required for search
,  DET_DIMENSION3  -- required for search
,  DET_RECON_REF                          as STATEMENT_REFERENCE
   from
      SL_PL_NL_DETAIL
         left  join PL_TRANSACTIONS    on PT_PRIMARY        = convert(int,substring(DET_HEADER_KEY,2,len(DET_HEADER_KEY)-1)) and substring(DET_HEADER_KEY,1,1) = 'P'
         left  join NL_TRANSACTIONS    on NT_PRIMARY        = convert(int,substring(DET_HEADER_KEY,2,len(DET_HEADER_KEY)-1)) and substring(DET_HEADER_KEY,1,1) = 'N'
         left  join POP_DETAIL         on POD_PRIMARY       = DET_ORDER_LINK
         left  join POP_HEADER         on POH_ORDER_NUMBR   = POD_ORDER_NO
         inner join PL_ANALYSIS        on PACODE            = DET_ANALYSIS
         left  join NL_ACCOUNTS     dr on PANOMINALDR       = dr.NCODE
         left  join NL_ACCOUNTS     cr on PANOMINALCR       = cr.NCODE
         left  join NL_ACCOUNTS     vt on PANOMINALVAT      = vt.NCODE
         left  join SYS_USER           on [USER_ID]         =  case substring(DET_HEADER_KEY,1,1)
                                                                  when 'P' then PT_USER_PUTIN
                                                                  when 'N' then NT_USER_PUTIN
                                                                  else
                                                                     ''
                                                               end
         left  join PL_ACCOUNTS s      on s.SUCODE          =  case substring(DET_HEADER_KEY,1,1)
                                                                  when 'P' then PT_COPYSUPP
                                                                  when 'N' then POH_ACCOUNT
                                                                  else
                                                                     ''
                                                               end
         left  join PL_TRANSACTIONS2   on PT_PRIMARY_2      = PT_PRIMARY
   where
            DET_ORIGIN  in
                        (
                           'P'
                        ,  'PO'
                        ,  'NPO'
                        ,  'NPC'
                        ,  'NKI'
                        ,  'NCT'    -- Costing Timesheet                         (in to WIP)    - Cost Analysis   (PL)
                        ,  'NCC'    -- Costing Cost                              (in to WIP)    - Cost Analysis   (PL)
                        ,  'NCND'   -- Nominal Debit trans with costing detail   (in to WIP)    - Cost Analysis   (PL)
                        ,  'NCNC'   -- Nominal Credit trans with costing detail  (out of WIP)   - Cost Analysis   (PL)
                        )
      and   DET_NOMINALDR <> ''
      and   isnull(DET_ANALYSIS,'') <> ''
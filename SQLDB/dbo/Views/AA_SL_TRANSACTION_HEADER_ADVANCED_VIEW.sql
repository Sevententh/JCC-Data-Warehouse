create view AA_SL_TRANSACTION_HEADER_ADVANCED_VIEW

/*
**
** Written     :  26/07/2004 DG
** Last Amended:  30/07/2004 DG, 07/12/2004 DG, 17/12/2004 PT, 28/04/2005 SH, 08/07/2005 SH, 28/07/2005 MC, 17/08/2005 DB, 27/09/2005 SB, 29/09/2005 SH, 21/09/2006 DB
**
*/

as

select
   ST_PRIMARY                                   as [PRIMARY]
,  ST_COPYCUST
,  isnull(CUNAME,'')                            as CUNAME
,  ST_DATE
,  ST_PERIODNUMBER
,  ST_YEAR
,  ST_TRANTYPE
,  cast(ST_BATCH_FLAG as bit)                   as ST_BATCH_FLAG
,  isnull(ST_HEADER_REF,'')                     as ST_HEADER_REF
,  case isnull(ST_ORDER_NUMBER,0)
      when 0 then ''
      else
         convert(nvarchar,convert(decimal(38,0),ST_ORDER_NUMBER))
   end                                          as ST_ORDER_NUMBER
,  dbo.AA_VALUE_DPS_F(ST_NETT)                  as ST_NETT
,  dbo.AA_VALUE_DPS_F(ST_NETT)         * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as SIGN_ST_NETT
,  dbo.AA_VALUE_DPS_F(ST_NETT_BASE2)   * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_NETT_BASE2
,  dbo.AA_VALUE_DPS_F(ST_CURR_NETT)             as ST_CURR_NETT
,  dbo.AA_VALUE_DPS_F(ST_CURR_NETT)    * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as SIGN_ST_CURR_NETT
,  dbo.AA_VALUE_DPS_F(ST_VAT)          * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_VAT
,  dbo.AA_VALUE_DPS_F(ST_VAT_BASE2)    * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_VAT_BASE2
,  dbo.AA_VALUE_DPS_F(ST_CURR_TAX)     * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_CURR_TAX
,  dbo.AA_VALUE_DPS_F(ST_GROSS)        * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_GROSS
,  dbo.AA_VALUE_DPS_F(ST_GROSS_BASE2)  * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_GROSS_BASE2
,  dbo.AA_VALUE_DPS_F(ST_CURR_VALU)    * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_CURR_VALU
,  dbo.AA_VALUE_DPS_F(ST_UNALLOCATED)  * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_UNALLOCATED
,  dbo.AA_VALUE_DPS_F(ST_CURR_UNAL)    * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_CURR_UNAL
,  case ST_RECONCILED
      when 1 then 'R'
      else
         ''
   end                                          as RECONCILED
,  ST_PRIMARY
,  ST_DUEDATE
,  ST_DATE_PUTIN
,  isnull(ST_BATCH_REF,'')                      as ST_BATCH_REF
,  isnull(ST_DESCRIPTION,'')                    as ST_DESCRIPTION
,  dbo.AA_VALUE_DPS_F(ST_REVALUED)     * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_REVALUED
,  dbo.AA_VALUE_DPS_F(CUBALANCE)                as CUBALANCE
,  isnull(ST_USER1,'')                          as ST_USER1
,  isnull(ST_USER2,'')                          as ST_USER2
,  isnull(ST_USER3,'')                          as ST_USER3
,  isnull(CUSORT,'')                            as CUSORT
,  isnull(CUUSER1,'')                           as CUUSER1
,  isnull(CUUSER2,'')                           as CUUSER2
,  isnull(CUUSER3,'')                           as CUUSER3
,  ST_CURRENCYCODE
,  isnull(OH_ACCOUNT_ORDER,'')                  as OH_ACCOUNT_ORDER
,  dbo.AA_VALUE_DPS_F(CUTURNOVERYTD)            as CUTURNOVERYTD
,  dbo.AA_VALUE_DPS_F(CU_CREDIT_LIMIT)          as CU_CREDIT_LIMIT
,  CU_DATE_PAY
,  CU_DATE_INV
,  isnull(CU_USRCHAR1,'')                       as CU_USRCHAR1
,  isnull(CU_USRCHAR2,'')                       as CU_USRCHAR2
,  isnull(CU_USRCHAR3,'')                       as CU_USRCHAR3
,  isnull(CU_USRCHAR4,'')                       as CU_USRCHAR4
,  isnull(CU_USRCHAR5,'')                       as CU_USRCHAR5
,  isnull(CU_USRCHAR6,'')                       as CU_USRCHAR6
,  cast(CU_USRFLAG1 as bit)                     as CU_USRFLAG1
,  cast(CU_USRFLAG2 as bit)                     as CU_USRFLAG2
,  cast(CU_USRFLAG3 as bit)                     as CU_USRFLAG3
,  CU_USRDATE1
,  CU_USRDATE2
,  CU_USRDATE3
,  dbo.AA_VALUE_DPS_F(CU_USRNUM1)               as CU_USRNUM1
,  dbo.AA_VALUE_DPS_F(CU_USRNUM2)               as CU_USRNUM2
,  dbo.AA_VALUE_DPS_F(CU_USRNUM3)               as CU_USRNUM3
,  ST_USER_PUTIN
,  isnull([USER_NAME],'')                       as [USER_NAME]
,  ST_ANTICPAYDATE
,  ST_SUB_LEDGER
,  ST_SETT_DISC_1
,  ST_SETT_DISC_2
,  ST_SETT_DAYS_1
,  ST_SETT_DAYS_2
,  ST_CURRENCYRATE
,  ST_BASE2_RATE
,  dbo.AA_VALUE_DPS_F(ST_L_DISCVAL)    * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_L_DISCVAL
,  dbo.AA_VALUE_DPS_F(ST_L_DISCVAL_C)  * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_L_DISCVAL_C
,  dbo.AA_VALUE_DPS_F(ST_T_DISCVAL)    * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_T_DISCVAL
,  dbo.AA_VALUE_DPS_F(ST_T_DISCVAL_C)  * case when ST_TRANTYPE in ('INV','ADR','JDR') then 1 else -1 end as ST_T_DISCVAL_C
,  isnull(STT_USRCHAR1,'')                      as ST_USRCHAR1
,  isnull(ST_USRCHAR2,'')                       as ST_USRCHAR2
,  isnull(ST_USRCHAR3,'')                       as ST_USRCHAR3
,  isnull(ST_USRCHAR4,'')                       as ST_USRCHAR4
,  cast(isnull(ST_USRFLAG1,0) as bit)           as ST_USRFLAG1
,  cast(isnull(ST_USRFLAG2,0) as bit)           as ST_USRFLAG2
,  ST_USRDATE1
,  ST_USRDATE2
,  dbo.AA_VALUE_DPS_F(ST_USRNUM1)               as ST_USRNUM1
,  dbo.AA_VALUE_DPS_F(ST_USRNUM2)               as ST_USRNUM2
,  ST_NOTE
,  isnull(CU_PRIMARY,0)                         as CU_PRIMARY
--Extra fields
,  ST_BATCH_REF                                 as ST_BATCH_REF_SRCH
,  CUSORT                                       as CUSORT_SRCH
,  CUUSER1                                      as CUUSER1_SRCH
,  CUUSER2                                      as CUUSER2_SRCH
,  CUUSER3                                      as CUUSER3_SRCH
,  isnull(ST_ALLOC_USER1,'')                    as ST_ALLOC_USER1 -- Required for 360 pane
from
   SL_TRANSACTIONS
      inner join SL_ACCOUNTS           on ST_COPYCUST       = CUCODE
      left  join ORD_HEADER            on OH_ORDER_NUMBER   = ST_ORDER_NUMBER
      left  join SL_ACCOUNTS2          on CU_PRIMARY_2      = CU_PRIMARY
      left  join SYS_USER              on [USER_ID]         = ST_USER_PUTIN
      left  join SL_TRANSACTIONS2      on ST_PRIMARY_2      = ST_PRIMARY
      left  join SL_TRANSACTION_NOTES  on ST_COPY_HEADERKEY = 'S' + convert(nvarchar,ST_PRIMARY)
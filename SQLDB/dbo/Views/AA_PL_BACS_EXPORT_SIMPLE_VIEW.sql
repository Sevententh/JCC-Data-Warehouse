create view AA_PL_BACS_EXPORT_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_PL_BACS_EXPORT_LIST_S
**
** Written     :  20/05/2005 LM
** Last Amended:  26/05/2005 LM, 26/08/2005 SRB, 02/10/2007 DB
*/
as

select
   PT_PRIMARY                       as [PRIMARY]
,  isnull(PT_USER_PUTIN, '')        as [USER]
,  SU_LEVEL                         as PROFILELEVEL
,  SUCODE                           as ACCOUNT_CODE
,  isnull
   (
      nullif(SU_BANK_AC_NAME,'')
   ,  isnull(SUNAME,'')
   )                                as ACCOUNT_NAME
,  PT_DATE                          as REMITTANCE_DATE
,  DET_GROSS                        as REMITTANCE_VALUE
,  isnull
   (
      nullif(DET_CURR_CODE,'')
   ,  HOME_CURR_SYMBL
   )                                as CURRENCY_SYMBOL
,  DET_CURR_GROSS                   as CURRENCY_VALUE
,  case isnull(PT_CURR_TYPE, 'H')
      when 'H' then 0
      when 'D' then PT_CURRENCYRATE
      else
         PT_TRI_RATE2
   end                              as CURRENCY_RATE
,  PT_HEADER_REF                    as REMITTANCE_REF
,  SU_BANK_BACSREF                  as ACCOUNT_BACS_REF
   from
      PL_TRANSACTIONS
         inner join SL_PL_NL_DETAIL with(nolock)   on       DET_HEADER_KEY = 'P' + cast(PT_PRIMARY as varchar(9))
                                                      and   DET_TYPE       = 'PAY'
                                                      and   DET_ANALTYPE   = 'B'
         inner join PL_ACCOUNTS     with(nolock)   on       SUCODE         = PT_COPYSUPP
         inner join PL_ACCOUNTS2    with(nolock)   on       SU_PRIMARY_2   = SU_PRIMARY
         inner join SYS_DATAINFO    with(nolock)   on       SYS_PRIMARY    = 1
   where
            PT_PAYMENT_FLAG   = 'B'
      and   PT_BATCH_FLAG    <> 1
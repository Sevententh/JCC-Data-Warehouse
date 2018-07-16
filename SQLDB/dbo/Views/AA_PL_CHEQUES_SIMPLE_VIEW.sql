create view AA_PL_CHEQUES_SIMPLE_VIEW

/*
**
** Returns a table to be used specifically with AA_PL_CHEQUES_LIST_S
**
** Written     : 20/05/2005 LM
** Last Amended: 26/05/2005 LM, 20/10/2005 JC, 03/04/2006 DB, 04/05/2006 SB, 14/06/2006 SB, 10/12/2007 SH
**
** SB: Note    : When we add the Sales Ledger cheques to this view I am planning to
**               use ST_PRIMARY*10 + 2 as the [PRIMARY] field on the Sales section.
**               This should allow the Sales cheques to be identified easily.
**               Purchase Ledger cheque primaries end with 0
**               Nominal Ledger cheque primaries end with 1
**               Sales Ledger cheque primaries should end with 2 when they are added to the view.
**               If any further plans are made, this view can be expanded to accommodate them.
**
*/

as

select
   PT_PRIMARY*10                    as [PRIMARY]      --same effect as concatenating the source but quicker
,  isnull(PT_USER_PUTIN, '')        as [USER]
,  SU_LEVEL                         as PROFILELEVEL
,  SUCODE                           as PAYEE_CODE
,  isnull(SUNAME, '')               as PAYEE_NAME
,  isnull(PT_DESCRIPTION, '')       as DESCRIPTION
,  PT_DATE                          as REMITTANCE_DATE
,  DET_GROSS                        as REMITTANCE_VALUE
,  isnull(PT_CURRENCYCODE, '')      as CURRENCY_SYMBOL
,  DET_CURR_GROSS                   as CURRENCY_VALUE
,  case isnull(PT_CURR_TYPE, 'H')
      when 'H' then 0
      when 'D' then PT_CURRENCYRATE
      else
         PT_TRI_RATE2
   end                              as CURRENCY_RATE
,  DET_ANALYSIS                     as BANK_ANALYSIS
,  PANAME                           as BANK_ANALYSIS_NAME
,  DET_NOMINALCR                    as ACCOUNT_CODE
,  NNAME                            as ACCOUNT_NAME
,  SUSORT                           as SORTKEY
,  SUUSER1                          as USERSORT1
,  SUUSER2                          as USERSORT2
,  SUUSER3                          as USERSORT3
,  0                                as SOURCE
   from
      PL_TRANSACTIONS
         inner join SL_PL_NL_DETAIL on       DET_HEADER_KEY = 'P' + cast(PT_PRIMARY as varchar(9))
                                       and   DET_TYPE       = 'PAY'
                                       and   DET_ANALTYPE   = 'B'
         inner join PL_ANALYSIS     on       PACODE         = DET_ANALYSIS
         inner join PL_ACCOUNTS     on       PT_COPYSUPP    = SUCODE
         inner join PL_ACCOUNTS2    on       SU_PRIMARY_2   = SU_PRIMARY
         inner join NL_ACCOUNTS     on       NCODE          = DET_NOMINALCR
   where
            PT_PAYMENT_FLAG   = 'C'
      and   PT_BATCH_FLAG     <> 1

union all

select
   NT_PRIMARY*10 + 1                as [PRIMARY]      --same effect as concatenating the source but quicker
,  isnull(NT_USER_PUTIN, '')        as [USER]
,  N_LEVEL                          as PROFILELEVEL
,  ''                               as PAYEE_CODE
,  isnull(NT_CHEQUE_PAYEE, '')      as PAYEE_NAME
,  isnull(NT_DESCRIPTION, '')       as [DESCRIPTION]
,  NT_DATE                          as REMITTANCE_DATE
,  NT_POST_VALUE                    as REMITTANCE_VALUE
,  isnull(NT_CURRENCYSYMB, '')      as CURRENCY_SYMBOL
,  NT_CURR_VALUE                    as CURRENCY_VALUE
,  case isnull(NT_CURR_TYPE, 'H')
      when 'H' then 0
      when 'D' then NT_CURRENCYRATE
      else
         NT_TRI_RATE2
   end                              as CURRENCY_RATE
,  ''                               as BANK_ANALYSIS
,  ''                               as BANK_ANALYSIS_NAME
,  NT_GROSS_CONTRA                  as ACCOUNT_CODE
,  NNAME                            as ACCOUNT_NAME
,  NCATEGORYCODE1                   as SORTKEY
,  NCATEGORYCODE2                   as USERSORT1
,  NCATEGORYCODE3                   as USERSORT2
,  NCATEGORYCODE4                   as USERSORT3
,  1                                as SOURCE
   from
      NL_TRANSACTIONS
         inner join NL_ACCOUNTS     on       NCODE          = NT_GROSS_CONTRA
         inner join NL_ACCOUNTS2    on       N_PRIMARY_2    = N_PRIMARY
   where
            NT_PAYMENT_FLAG   =  1
      and   NT_BATCH_FLAG     <> 1

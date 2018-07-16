create view AA_SL_DD_TRANSACTIONS_ALLOCATED_VIEW
/*
**
** Written     : 16/01/2014 CC
** Last Amended: 29/01/2014 NC
**
*/
as

with CTE
as
(select min(S_AL_REFERENCE) PAYMENT_ALLOC_REF, S_AL_HEADER_KEY PAYMENT_ALLOC_HEADER_KEY, min(S_AL_ACCOUNT_CODE) PAYMENT_ALLOC_AC_CODE
from
SL_ALLOC_HISTORY 
where S_AL_REFERENCE>0
group by S_AL_HEADER_KEY )

select 
  ALLOC_TRANS.S_AL_REFERENCE                                                                       as ALLOC_REFERENCE
, PAYMENT.ST_PRIMARY                                                                               as PAYMENT_PRIMARY
, TRANS.ST_PRIMARY                                                                                 as TRANS_PRIMARY
, TRANS.ST_HEADER_REF                                                                              as TRANS_HEADER_REF
, TRANS.ST_TRANTYPE                                                                                as TRANS_TYPE
, TRANS.ST_CURRENCYCODE                                                                            as TRANS_CURRENCY_SYMBOL
, ALLOC_TRANS.S_AL_VALUE_HOME                                                                      as ALLOCATED_HOME_VALUE
, ALLOC_TRANS.S_AL_VALUE_CURR                                                                      as ALLOCATED_CURR_VALUE
, TRANS.ST_DATE                                                                                    as TRANS_DATE
, case PAYMENT.ST_PRIMARY when TRANS.ST_PRIMARY then 1 else 0 end                                  as IsPayment
, row_number()over (partition by PAYMENT.ST_PRIMARY order by case PAYMENT.ST_PRIMARY when TRANS.ST_PRIMARY then 1 else 0 end, TRANS.ST_DATE,TRANS.ST_PRIMARY)       as TRANS_ROW_NUMBER
   from 
      SL_TRANSACTIONS PAYMENT with(nolock)
         join CTE ALLOC_PAYMENT with(nolock) on ALLOC_PAYMENT.PAYMENT_ALLOC_HEADER_KEY = PAYMENT.ST_HEADER_KEY 
         join SL_ALLOC_HISTORY ALLOC_TRANS with(nolock) on ALLOC_TRANS.S_AL_REFERENCE = ALLOC_PAYMENT.PAYMENT_ALLOC_REF and ALLOC_TRANS.S_AL_ACCOUNT_CODE = ALLOC_PAYMENT.PAYMENT_ALLOC_AC_CODE 
         join SYS_DATAINFO on SYS_PRIMARY = 1
         join SL_TRANSACTIONS TRANS with(nolock) on TRANS.ST_HEADER_KEY = ALLOC_TRANS.S_AL_HEADER_KEY
            and not(TRANS.ST_CURRENCYCODE <> HOME_CURR_SYMBL and TRANS.ST_CURR_VALU = 0 and TRANS.ST_TRANTYPE in ('ADR','ACR'))
            and not(TRANS.ST_CURRENCYCODE = HOME_CURR_SYMBL and TRANS.ST_GROSS = 0 and TRANS.ST_TRANTYPE in ('ADR','ACR'))
   where 
      ALLOC_TRANS.S_AL_REFERENCE<>0
         and PAYMENT.ST_PRIMARY <> TRANS.ST_PRIMARY
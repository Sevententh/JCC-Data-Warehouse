create view AA_PL_ALLOCATION_HISTORY_VIEW
/*
** Returns a table to be used specifically with AA_PL_ALLOCATION_HISTORY_LIST_S
**
** Written     : 08/03/2005 SH
** Last Amended: 03/05/2005 SRB, 20/09/2005 DB, 17/10/2007 DB
*/
as

select
   H.P_AL_PRIMARY as [PRIMARY]
,  H.P_AL_DATE
,  H.P_AL_YEAR
,  H.P_AL_PERIOD
,  (H.P_AL_YEAR   + convert(varchar(3),H.P_AL_PERIOD)    ) as ALLOCATION_PERIOD_YEAR
,  (P.PT_YEAR     + convert(varchar(3),P.PT_PERIODNUMBER)) as TRAN_PERIOD_YEAR
,  P.PT_TRANTYPE
,  P.PT_HEADER_REF
,  case
      when P.PT_TRANTYPE in ('PAY', 'CRN', 'ADR') then P.PT_GROSS * -1
      else
         P.PT_GROSS
   end as PT_GROSS
,  case
      when P.PT_TRANTYPE in ('PAY', 'CRN', 'ADR') then P.PT_CURR_VALU * -1
      else
         P.PT_CURR_VALU
   end as PT_CURR_VALU
,  H.P_AL_USER_ID
,  H.P_AL_REFERENCE
,  H.P_AL_VALUE_HOME
,  H.P_AL_VALUE_CURR
,  P.PT_DATE
,  P.PT_YEAR
,  P.PT_PERIODNUMBER
,  S.SUCODE
,  S.SUNAME
,  P.PT_PRIMARY
,  S2.SU_LEVEL as PROFILELEVEL
,  P.PT_CURRENCYCODE
   from
      PL_TRANSACTIONS P
         inner join PL_ACCOUNTS        S  with(nolock)   on S.SUCODE          = P.PT_COPYSUPP
         inner join PL_ACCOUNTS2       S2 with(nolock)   on S2.SU_PRIMARY_2   = S.SU_PRIMARY
         inner join PL_ALLOC_HISTORY   H  with(nolock)   on H.P_AL_HEADER_KEY = P.PT_HEADER_KEY
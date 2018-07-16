create view AA_SL_ALLOCATION_HISTORY_VIEW
/*
** Returns a table to be used specifically with AA_SL_ALLOCATION_HISTORY_LIST_S
**
** Written     : 07/03/2005 SH
** Last Amended: 03/05/2005 SRB, 20/09/2005 DB, 17/10/2007 DB
*/
as

select
   H.S_AL_PRIMARY as [PRIMARY]
,  H.S_AL_DATE
,  H.S_AL_YEAR
,  H.S_AL_PERIOD
,  (H.S_AL_YEAR   + convert(varchar(3),H.S_AL_PERIOD)    ) as ALLOCATION_PERIOD_YEAR
,  (S.ST_YEAR     + convert(varchar(3),S.ST_PERIODNUMBER)) as TRAN_PERIOD_YEAR
,  S.ST_TRANTYPE
,  S.ST_HEADER_REF
,  case
      when S.ST_TRANTYPE in ('PAY', 'CRN', 'ACR') then S.ST_GROSS * -1
      else
         S.ST_GROSS
   end as ST_GROSS
,  case
      when S.ST_TRANTYPE in ('PAY', 'CRN', 'ACR') then S.ST_CURR_VALU * -1
      else
         S.ST_CURR_VALU
   end as ST_CURR_VALU
,  H.S_AL_USER_ID
,  H.S_AL_REFERENCE
,  H.S_AL_VALUE_HOME
,  H.S_AL_VALUE_CURR
,  S.ST_DATE
,  S.ST_YEAR
,  S.ST_PERIODNUMBER
,  C.CUCODE
,  C.CUNAME
,  S.ST_PRIMARY
,  C2.CU_LEVEL as PROFILELEVEL
,  S.ST_CURRENCYCODE
   from
      SL_TRANSACTIONS S
         inner join SL_ACCOUNTS        C  with(nolock)   on C.CUCODE          = S.ST_COPYCUST
         inner join SL_ACCOUNTS2       C2 with(nolock)   on C2.CU_PRIMARY_2   = C.CU_PRIMARY
         inner join SL_ALLOC_HISTORY   H  with(nolock)   on H.S_AL_HEADER_KEY = ST_HEADER_KEY
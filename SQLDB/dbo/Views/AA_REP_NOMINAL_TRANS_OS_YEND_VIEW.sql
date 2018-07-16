create view AA_REP_NOMINAL_TRANS_OS_YEND_VIEW

As

/*
** Written     :  06/11/2006 SB
** Last Amended:
** Comments    :  Returns outstanding journal transactions for crystal reports
*/

select
   V.*
,  N.NT_PERIOD_MAXC
,  N.NT_POST_VALUE
,  0 AS NR_COUNT

   from
   (
      select PERIOD
         from
         (
            select 1 as PERIOD
               union
            select 2 as PERIOD
               union
            select 3 as PERIOD
               union
            select 4 as PERIOD
               union
            select 5 as PERIOD
               union
            select 6 as PERIOD
               union
            select 7 as PERIOD
               union
            select 8 as PERIOD
               union
            select 9 as PERIOD
               union
            select 10 as PERIOD
               union
            select 11 as PERIOD
               union
            select 12 as PERIOD
               union
            select 13 as PERIOD
         ) PERIODS
         inner join SYS_DATAINFO D with(nolock)
            on D.SYS_PRIMARY = 1
         inner join SYS_DATAINFO2 D2 with(nolock)
            on D2.SYS_PRIMARY_2 = 1
         where
            PERIOD between D.NOMINAL_PERIOD and D2.NO_OF_PERIODS
   ) REMPERIODS
   cross join NL_TRANSACTIONS N
   inner join AA_REP_NOMINAL_TRANS_VIEW V
      On V.NT_PRIMARY = N.NT_PRIMARY

   where
      N.NT_RECUR_FLAG   = 1
   and N.NT_YEAR        = 'C'
   and N.NT_PERIOD_MAXC > 0
   and
   (
      N.NT_POSTINGS_CNT < N.NT_MAX_POSTINGS
   )
   and
   (
      N.NT_POSTINGS_CNT = 0 or not exists
      (
         select 1
         from NL_RECURJNL_COUNT NR
         where
            NR.NR_TRANSACTION_LINK  = N.NT_PRIMARY
         and NR.NR_YEAR             = 'C'
         and NR.NR_PERIOD           = PERIOD
      )
   )
union
select
   V.*
,  N.NT_PERIOD_MAXC
,  N.NT_POST_VALUE
,  NRC.NR_COUNT

   from NL_RECURJNL_COUNT NRC
      inner join NL_TRANSACTIONS N
         on NRC.NR_TRANSACTION_LINK = N.NT_PRIMARY and
            (
               NRC.NR_COUNT < N.NT_PERIOD_MAXC
            )
      inner join AA_REP_NOMINAL_TRANS_VIEW V
         On V.NT_PRIMARY = N.NT_PRIMARY
      inner join SYS_DATAINFO D with(nolock)
         on D.SYS_PRIMARY = 1
      inner join SYS_DATAINFO2 D2 with(nolock)
         on D2.SYS_PRIMARY_2 = 1

   where
      N.NT_RECUR_FLAG   = 1
   and N.NT_YEAR        = 'C'
   and N.NT_PERIOD_MAXC > 0
   and NRC.NR_YEAR      = 'C'
   and
   (
      NRC.NR_PERIOD between D.NOMINAL_PERIOD and D2.NO_OF_PERIODS
   )
   and
   (
      N.NT_POSTINGS_CNT < N.NT_MAX_POSTINGS
   )

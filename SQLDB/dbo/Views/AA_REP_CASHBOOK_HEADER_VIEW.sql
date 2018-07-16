create view AA_REP_CASHBOOK_HEADER_VIEW
as
select
   BANK_COPYNCODE
,  isnull(sum(BANK_SUM_OF_RECONCILED),0)           BANK_SUM_OF_RECONCILED
,  isnull(sum(BANK_SUM_OF_RECONCILED_C),0)         BANK_SUM_OF_RECONCILED_C
,  ((charindex(BANK_YEAR,'LCN')-1)*13)+BANK_PERIOD BANK_PERSORT
   from
      NL_BANK_TRNS
   where
      BANK_YEAR      <> 'O'
   group by
      BANK_COPYNCODE
   ,  BANK_YEAR
   ,  BANK_PERIOD
union all
select
   NCODE BANK_COPYNCODE
,  0     BANK_SUM_OF_RECONCILED
,  0     BANK_SUM_OF_RECONCILED_C
,  255   BANK_PERSORT
   from
      NL_ACCOUNTS with(nolock)
   where
      NTYPE in ('P','B')
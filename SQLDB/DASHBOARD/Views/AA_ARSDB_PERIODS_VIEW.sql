create view    DASHBOARD.AA_ARSDB_PERIODS_VIEW
as
/*
** Written     :  27/08/2009 NC
** Last Amended:
** Comments    :  Returns one row for each period.
*/
select Period
   from
      (
         Select 1 Period
         union all
         Select 2 Period
         union all
         Select 3 Period
         union all
         Select 4 Period
         union all
         Select 5 Period
         union all
         Select 6 Period
         union all
         Select 7 Period
         union all
         Select 8 Period
         union all
         Select 9 Period
         union all
         Select 10 Period
         union all
         Select 11 Period
         union all
         Select 12 Period
         union all
         Select 13 Period
      ) periods
      join SYS_DATAINFO2 with (nolock) on SYS_PRIMARY_2 = 1
   where NO_OF_PERIODS >= Period
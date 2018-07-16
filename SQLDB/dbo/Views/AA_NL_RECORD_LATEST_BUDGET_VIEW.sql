create view AA_NL_RECORD_LATEST_BUDGET_VIEW

/*
** Written     :  14/2/11 NC
** Last Amended:
*/
as
with years as (
            select -1 as y
            union all
            select y+1 from years where y<1
            )
select
   NCODE
,  case y when 0 then NBUDGET_C1  when -1 then NBUDGET_L1  else NBUDGET_N1  end NBUDGET_1
,  case y when 0 then NBUDGET_C2  when -1 then NBUDGET_L2  else NBUDGET_N2  end NBUDGET_2
,  case y when 0 then NBUDGET_C3  when -1 then NBUDGET_L3  else NBUDGET_N3  end NBUDGET_3
,  case y when 0 then NBUDGET_C4  when -1 then NBUDGET_L4  else NBUDGET_N4  end NBUDGET_4
,  case y when 0 then NBUDGET_C5  when -1 then NBUDGET_L5  else NBUDGET_N5  end NBUDGET_5
,  case y when 0 then NBUDGET_C6  when -1 then NBUDGET_L6  else NBUDGET_N6  end NBUDGET_6
,  case y when 0 then NBUDGET_C7  when -1 then NBUDGET_L7  else NBUDGET_N7  end NBUDGET_7
,  case y when 0 then NBUDGET_C8  when -1 then NBUDGET_L8  else NBUDGET_N8  end NBUDGET_8
,  case y when 0 then NBUDGET_C9  when -1 then NBUDGET_L9  else NBUDGET_N9  end NBUDGET_9
,  case y when 0 then NBUDGET_C10 when -1 then NBUDGET_L10 else NBUDGET_N10 end NBUDGET_10
,  case y when 0 then NBUDGET_C11 when -1 then NBUDGET_L11 else NBUDGET_N11 end NBUDGET_11
,  case y when 0 then NBUDGET_C12 when -1 then NBUDGET_L12 else NBUDGET_N12 end NBUDGET_12
,  case y when 0 then NBUDGET_C13 when -1 then NBUDGET_L13 else NBUDGET_N13 end NBUDGET_13
,  y [YEAR]
,  N_USER_EDITED
,  N_DATE_EDITED
,  N_SOURCE
,  NULL as REVISION
,  N_PRIMARY
   from
      NL_ACCOUNTS
      cross join years

GO
create trigger AA_NL_RECORD_LATEST_BUDGET_VIEW_IOUT
/*
** Trigger for updating/inserting nominal budgets.
**
** Written:       14/2/11 NC
** Last Amended:  15/2/11 NC, 16/5/11 NC
*/
on AA_NL_RECORD_LATEST_BUDGET_VIEW
instead of update
as
set nocount on
declare @LS_BudgetRevision int

if exists (select 1 from inserted where REVISION is NULL)
   select top 1
         @LS_BudgetRevision = B_REVISION_NUMBER
      from SYS_BUDGETS with (nolock)
         join inserted on B_ACCOUNT_CODE = NCODE
                      and B_RECORD_TYPE  = 'N'
                      and B_BUDGET_TYPE  = 'B'
                      and B_YEAR         = [YEAR]
      order by B_REVISION_NUMBER desc;

update SYS_BUDGETS
  set
      B_VALUE           = Budget
    , B_USERID          = N_USER_EDITED
    , B_DATE_ENTERED    = N_DATE_EDITED
    , B_SOURCE          = N_SOURCE
   from
(select NCODE
         ,N_USER_EDITED
         ,N_DATE_EDITED
         ,N_SOURCE
         ,coalesce(@LS_BudgetRevision,REVISION,0) REVISION
         ,[YEAR]
         ,period
         ,Budget
   from
   (select NCODE
         ,N_USER_EDITED
         ,N_DATE_EDITED
         ,N_SOURCE
         ,REVISION
         ,[YEAR]
         ,NBUDGET_1  [1]
         ,NBUDGET_2  [2]
         ,NBUDGET_3  [3]
         ,NBUDGET_4  [4]
         ,NBUDGET_5  [5]
         ,NBUDGET_6  [6]
         ,NBUDGET_7  [7]
         ,NBUDGET_8  [8]
         ,NBUDGET_9  [9]
         ,NBUDGET_10 [10]
         ,NBUDGET_11 [11]
         ,NBUDGET_12 [12]
         ,NBUDGET_13 [13]
    from inserted
   ) as Budgets
unpivot
   (Budget for period in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )unpvt
) inpt
  join SYS_BUDGETS b on
                            b.B_ACCOUNT_CODE    = inpt.NCODE
                        and b.B_RECORD_TYPE     = 'N'
                        and b.B_BUDGET_TYPE     = 'B'
                        and b.B_PERIOD          = inpt.period
                        and b.B_YEAR            = inpt.[YEAR]
                        and b.B_REVISION_NUMBER = inpt.REVISION

insert into SYS_BUDGETS
   (  B_ACCOUNT_CODE
    , B_RECORD_TYPE
    , B_PERIOD
    , B_YEAR
    , B_BUDGET_TYPE
    , B_VALUE
    , B_USERID
    , B_DATE_ENTERED
    , B_SOURCE
    , B_REVISION_NUMBER
    , B_YEAR_LINK
   )
select NCODE
      ,'N'
      ,period
      ,[YEAR]
      ,'B'
      ,Budget
      ,N_USER_EDITED
      ,N_DATE_EDITED
      ,N_SOURCE
      ,coalesce(@LS_BudgetRevision,REVISION,0)
      ,dbo.AA_SYS_YEAR_SEQUENCE_TO_LINK_F([YEAR], 'NL')
   from
   (select NCODE
         ,N_USER_EDITED
         ,N_DATE_EDITED
         ,N_SOURCE
         ,REVISION
         ,[YEAR]
         ,NBUDGET_1  [1]
         ,NBUDGET_2  [2]
         ,NBUDGET_3  [3]
         ,NBUDGET_4  [4]
         ,NBUDGET_5  [5]
         ,NBUDGET_6  [6]
         ,NBUDGET_7  [7]
         ,NBUDGET_8  [8]
         ,NBUDGET_9  [9]
         ,NBUDGET_10 [10]
         ,NBUDGET_11 [11]
         ,NBUDGET_12 [12]
         ,NBUDGET_13 [13]
    from inserted
   ) as Budgets
unpivot
   (Budget for period in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )unpvt
  where not exists
   (select 1 from SYS_BUDGETS b
                      where b.B_ACCOUNT_CODE    = NCODE
                        and b.B_RECORD_TYPE     = 'N'
                        and b.B_BUDGET_TYPE     = 'B'
                        and b.B_PERIOD          = period
                        and b.B_YEAR            = [YEAR]
                        and b.B_REVISION_NUMBER = coalesce(@LS_BudgetRevision,REVISION,0)
   )

GO
create trigger AA_NL_RECORD_LATEST_BUDGET_VIEW_IOIT
/*
** Trigger for updating/inserting nominal budgets.
**
** Written:       14/2/11 NC
** Last Amended:  15/2/11 NC, 16/5/11 NC
*/
on AA_NL_RECORD_LATEST_BUDGET_VIEW
instead of insert
as
set nocount on
declare @LS_BudgetRevision int

if exists (select 1 from inserted where REVISION is NULL)
   select top 1
         @LS_BudgetRevision = B_REVISION_NUMBER
      from SYS_BUDGETS with (nolock)
         join inserted on B_ACCOUNT_CODE = NCODE
                      and B_RECORD_TYPE  = 'N'
                      and B_BUDGET_TYPE  = 'B'
                      and B_YEAR         = [YEAR]
      order by B_REVISION_NUMBER desc;

update SYS_BUDGETS
  set
      B_VALUE           = Budget
    , B_USERID          = N_USER_EDITED
    , B_DATE_ENTERED    = N_DATE_EDITED
    , B_SOURCE          = N_SOURCE
   from
(select NCODE
         ,N_USER_EDITED
         ,N_DATE_EDITED
         ,N_SOURCE
         ,coalesce(@LS_BudgetRevision,REVISION,0) REVISION
         ,[YEAR]
         ,period
         ,Budget
   from
   (select NCODE
         ,N_USER_EDITED
         ,N_DATE_EDITED
         ,N_SOURCE
         ,REVISION
         ,[YEAR]
         ,NBUDGET_1  [1]
         ,NBUDGET_2  [2]
         ,NBUDGET_3  [3]
         ,NBUDGET_4  [4]
         ,NBUDGET_5  [5]
         ,NBUDGET_6  [6]
         ,NBUDGET_7  [7]
         ,NBUDGET_8  [8]
         ,NBUDGET_9  [9]
         ,NBUDGET_10 [10]
         ,NBUDGET_11 [11]
         ,NBUDGET_12 [12]
         ,NBUDGET_13 [13]
    from inserted
   ) as Budgets
unpivot
   (Budget for period in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )unpvt
) inpt
  join SYS_BUDGETS b on
                            b.B_ACCOUNT_CODE    = inpt.NCODE
                        and b.B_RECORD_TYPE     = 'N'
                        and b.B_BUDGET_TYPE     = 'B'
                        and b.B_PERIOD          = inpt.period
                        and b.B_YEAR            = inpt.[YEAR]
                        and b.B_REVISION_NUMBER = inpt.REVISION

insert into SYS_BUDGETS
   (  B_ACCOUNT_CODE
    , B_RECORD_TYPE
    , B_PERIOD
    , B_YEAR
    , B_BUDGET_TYPE
    , B_VALUE
    , B_USERID
    , B_DATE_ENTERED
    , B_SOURCE
    , B_REVISION_NUMBER
    , B_YEAR_LINK
   )
select NCODE
      ,'N'
      ,period
      ,[YEAR]
      ,'B'
      ,Budget
      ,N_USER_EDITED
      ,N_DATE_EDITED
      ,N_SOURCE
      ,coalesce(@LS_BudgetRevision,REVISION,0)
      ,dbo.AA_SYS_YEAR_SEQUENCE_TO_LINK_F([YEAR], 'NL')
   from
   (select NCODE
         ,N_USER_EDITED
         ,N_DATE_EDITED
         ,N_SOURCE
         ,REVISION
         ,[YEAR]
         ,NBUDGET_1  [1]
         ,NBUDGET_2  [2]
         ,NBUDGET_3  [3]
         ,NBUDGET_4  [4]
         ,NBUDGET_5  [5]
         ,NBUDGET_6  [6]
         ,NBUDGET_7  [7]
         ,NBUDGET_8  [8]
         ,NBUDGET_9  [9]
         ,NBUDGET_10 [10]
         ,NBUDGET_11 [11]
         ,NBUDGET_12 [12]
         ,NBUDGET_13 [13]
    from inserted
   ) as Budgets
unpivot
   (Budget for period in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )unpvt
  where not exists
   (select 1 from SYS_BUDGETS b
                      where b.B_ACCOUNT_CODE    = NCODE
                        and b.B_RECORD_TYPE     = 'N'
                        and b.B_BUDGET_TYPE     = 'B'
                        and b.B_PERIOD          = period
                        and b.B_YEAR            = [YEAR]
                        and b.B_REVISION_NUMBER = coalesce(@LS_BudgetRevision,REVISION,0)
   )

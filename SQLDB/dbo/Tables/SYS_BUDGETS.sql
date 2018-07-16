CREATE TABLE [dbo].[SYS_BUDGETS] (
    [B_PRIMARY]         INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [B_ACCOUNT_CODE]    VARCHAR (25)  NOT NULL,
    [B_SECONDARY_CODE]  VARCHAR (25)  NULL,
    [B_RECORD_TYPE]     VARCHAR (2)   NOT NULL,
    [B_PERIOD]          TINYINT       CONSTRAINT [DF_SYS_BUDGETS_B_PERIOD] DEFAULT ((0)) NOT NULL,
    [B_YEAR]            INT           CONSTRAINT [DF_SYS_BUDGETS_B_YEAR] DEFAULT ((0)) NOT NULL,
    [B_BUDGET_TYPE]     VARCHAR (1)   CONSTRAINT [DF_SYS_BUDGETS_B_BUDGET_TYPE] DEFAULT ('B') NULL,
    [B_VALUE]           FLOAT (53)    DEFAULT ((0)) NULL,
    [B_STK_SELL_QTY]    FLOAT (53)    DEFAULT ((0)) NULL,
    [B_STK_BUY_QTY]     FLOAT (53)    DEFAULT ((0)) NULL,
    [B_USERID]          VARCHAR (4)   NULL,
    [B_DATE_ENTERED]    DATETIME      NULL,
    [B_SOURCE]          VARCHAR (2)   NULL,
    [B_NOTES]           VARCHAR (240) NULL,
    [B_REVISION_NUMBER] SMALLINT      CONSTRAINT [DF_SYS_BUDGETS_B_REVISION_NUMBER] DEFAULT ((0)) NOT NULL,
    [B_YEAR_LINK]       SMALLINT      NULL,
    [B_LATEST_REVISION] BIT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [B_PRIMARY_PK] PRIMARY KEY CLUSTERED ([B_PRIMARY] ASC),
    CONSTRAINT [B_YEAR_LINK_CK] CHECK ([B_YEAR] IS NOT NULL AND [B_YEAR_LINK] IS NOT NULL OR [B_YEAR] IS NULL AND [B_YEAR_LINK] IS NULL),
    CONSTRAINT [B_YEAR_LINK_FK] FOREIGN KEY ([B_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [B_ACCOUNT_CODE]
    ON [dbo].[SYS_BUDGETS]([B_RECORD_TYPE] ASC, [B_BUDGET_TYPE] ASC, [B_ACCOUNT_CODE] ASC, [B_YEAR] ASC, [B_PERIOD] ASC, [B_REVISION_NUMBER] ASC, [B_LATEST_REVISION] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SYS_BUDGETS_REVISION_NUMBER_UC]
    ON [dbo].[SYS_BUDGETS]([B_RECORD_TYPE] ASC, [B_BUDGET_TYPE] ASC, [B_YEAR] ASC, [B_PERIOD] ASC, [B_ACCOUNT_CODE] ASC, [B_SECONDARY_CODE] ASC, [B_REVISION_NUMBER] ASC)
    INCLUDE([B_VALUE]) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [B_LATEST_REVISION]
    ON [dbo].[SYS_BUDGETS]([B_RECORD_TYPE] ASC, [B_BUDGET_TYPE] ASC, [B_YEAR] ASC, [B_LATEST_REVISION] ASC, [B_ACCOUNT_CODE] ASC, [B_PERIOD] ASC)
    INCLUDE([B_VALUE], [B_REVISION_NUMBER]) WITH (FILLFACTOR = 33);


GO
create trigger AA_SYS_BUDGETS_IOUT
/*
** Trigger for enforcing Nominal Budgets business rules.
**
** Written:       2/2/11 NC
** Last Amended:  23/3/11 NC, 16/5/11 NC, 07/11/2012 SB
*/
on SYS_BUDGETS
instead of update
as
set nocount on
declare @LT_PERIOD_END_OPTN varchar(2)

update SYS_BUDGETS
  set B_ACCOUNT_CODE    = i.B_ACCOUNT_CODE
    , B_SECONDARY_CODE  = i.B_SECONDARY_CODE
    , B_RECORD_TYPE     = i.B_RECORD_TYPE
    , B_PERIOD          = i.B_PERIOD
    , B_YEAR            = i.B_YEAR
    , B_BUDGET_TYPE     = i.B_BUDGET_TYPE
    , B_VALUE           = i.B_VALUE
    , B_STK_SELL_QTY    = i.B_STK_SELL_QTY
    , B_STK_BUY_QTY     = i.B_STK_BUY_QTY
    , B_USERID          = i.B_USERID
    , B_DATE_ENTERED    = i.B_DATE_ENTERED
    , B_SOURCE          = i.B_SOURCE
    , B_NOTES           = i.B_NOTES
    , B_REVISION_NUMBER = i.B_REVISION_NUMBER
    , B_YEAR_LINK       = i.B_YEAR_LINK
    , B_LATEST_REVISION = i.B_LATEST_REVISION
   from inserted i join SYS_BUDGETS on SYS_BUDGETS.B_PRIMARY = i.B_PRIMARY
   where not(i.B_RECORD_TYPE = 'N' and i.B_BUDGET_TYPE = 'B');

if update(B_ACCOUNT_CODE)
or update(B_SECONDARY_CODE)
or update(B_RECORD_TYPE)
or update(B_PERIOD)
or update(B_YEAR)
or update(B_BUDGET_TYPE)
or update(B_REVISION_NUMBER)
   begin
      with cte as
      (
      select   b.B_PRIMARY
            ,  b.B_ACCOUNT_CODE
            ,  b.B_SECONDARY_CODE
            ,  b.B_RECORD_TYPE
            ,  b.B_PERIOD
            ,  b.B_YEAR
            ,  b.B_BUDGET_TYPE
            ,  b.B_REVISION_NUMBER
            ,  row_number() over (partition by B_ACCOUNT_CODE, B_RECORD_TYPE, B_PERIOD, B_YEAR, B_BUDGET_TYPE, isnull(B_SECONDARY_CODE,'') order by B_REVISION_NUMBER desc)
               as rnk
         from SYS_BUDGETS b
         where
            exists ( select 1
                           from inserted i
                           where
                                  b.B_ACCOUNT_CODE                = i.B_ACCOUNT_CODE
                              and b.B_RECORD_TYPE                 = i.B_RECORD_TYPE
                              and isnull(b.B_SECONDARY_CODE,'')   = isnull(i.B_SECONDARY_CODE,'')
                              and b.B_BUDGET_TYPE                 = i.B_BUDGET_TYPE
                              and b.B_PERIOD                      = i.B_PERIOD
                              and b.B_YEAR                        = i.B_YEAR
                       )
            or
            exists ( select 1
                           from deleted d
                           where
                                  b.B_ACCOUNT_CODE                = d.B_ACCOUNT_CODE
                              and b.B_RECORD_TYPE                 = d.B_RECORD_TYPE
                              and isnull(b.B_SECONDARY_CODE,'')   = isnull(d.B_SECONDARY_CODE,'')
                              and b.B_BUDGET_TYPE                 = d.B_BUDGET_TYPE
                              and b.B_PERIOD                      = d.B_PERIOD
                              and b.B_YEAR                        = d.B_YEAR
                       )
      )
      update SYS_BUDGETS
         set B_LATEST_REVISION  = case rnk
                                    when 1 then 1
                                    else 0
                                  end
         from cte
            join SYS_BUDGETS on cte.B_PRIMARY = SYS_BUDGETS.B_PRIMARY
         where B_LATEST_REVISION  <> case rnk
                                       when 1 then 1
                                       else 0
                                     end
   end

if not exists (select 1 from inserted where B_RECORD_TYPE = 'N' and B_BUDGET_TYPE = 'B')
   and not(update(B_RECORD_TYPE))
   and not(update(B_BUDGET_TYPE))
   return

select @LT_PERIOD_END_OPTN = PERIOD_END_OPTN from SYS_DATAINFO with (nolock) where SYS_PRIMARY = 1
if @LT_PERIOD_END_OPTN in ('SL','PL','NL')
   begin
      update SYS_BUDGETS
        set B_ACCOUNT_CODE    = i.B_ACCOUNT_CODE
          , B_SECONDARY_CODE  = i.B_SECONDARY_CODE
          , B_RECORD_TYPE     = i.B_RECORD_TYPE
          , B_PERIOD          = i.B_PERIOD
          , B_YEAR            = i.B_YEAR
          , B_BUDGET_TYPE     = i.B_BUDGET_TYPE
          , B_VALUE           = i.B_VALUE
          , B_STK_SELL_QTY    = i.B_STK_SELL_QTY
          , B_STK_BUY_QTY     = i.B_STK_BUY_QTY
          , B_USERID          = i.B_USERID
          , B_DATE_ENTERED    = i.B_DATE_ENTERED
          , B_SOURCE          = i.B_SOURCE
          , B_NOTES           = i.B_NOTES
          , B_REVISION_NUMBER = i.B_REVISION_NUMBER
          , B_YEAR_LINK       = i.B_YEAR_LINK
          , B_LATEST_REVISION = i.B_LATEST_REVISION
         from inserted i join SYS_BUDGETS on SYS_BUDGETS.B_PRIMARY = i.B_PRIMARY
         where i.B_RECORD_TYPE = 'N' and i.B_BUDGET_TYPE = 'B'
      return
   end

if    update(B_ACCOUNT_CODE)
   or update(B_RECORD_TYPE)
   or update(B_PERIOD)
   or update(B_YEAR)
   or update(B_REVISION_NUMBER)
   or update(B_LATEST_REVISION) -- check this so can trust insert value of this
   or update(B_BUDGET_TYPE)
   begin
      if exists (select 1 from inserted i join deleted d on d.B_PRIMARY = i.B_PRIMARY
                          where (i.B_RECORD_TYPE = 'N' and i.B_BUDGET_TYPE = 'B'
                                 and d.B_RECORD_TYPE <> 'N' and isnull(d.B_BUDGET_TYPE,'') <> 'B'
                                )
                                or
                                (d.B_RECORD_TYPE = 'N' and d.B_BUDGET_TYPE = 'B'
                                 and i.B_RECORD_TYPE <> 'N' and isnull(i.B_BUDGET_TYPE,'') <> 'B'
                                )
                )
         begin
            raiserror('It is not possible to change the Budget or Record type of existing budget records.',16,1)
            rollback tran
            return
         end

      create table #budgets
         (
            B_PRIMARY         int            null
         ,  B_ACCOUNT_CODE    varchar(25)    collate database_default not null
         ,  B_SECONDARY_CODE  varchar(25)    collate database_default null
         ,  B_RECORD_TYPE     varchar(2)     collate database_default not null
         ,  B_PERIOD          tinyint        not null
         ,  B_YEAR            int            not null
         ,  B_BUDGET_TYPE     varchar(1)     collate database_default null
         ,  B_VALUE           float          null
         ,  B_STK_SELL_QTY    float          null
         ,  B_STK_BUY_QTY     float          null
         ,  B_USERID          varchar(4)     collate database_default null
         ,  B_DATE_ENTERED    datetime       null
         ,  B_SOURCE          varchar(2)     collate database_default null
         ,  B_NOTES           varchar(240)   collate database_default null
         ,  B_REVISION_NUMBER smallint       not null
         ,  B_YEAR_LINK       smallint       null
         ,  B_LATEST_REVISION bit            not null
         ,  newBdgt           bit            null
         ,  ident             int            not null identity PRIMARY KEY
         )
      create index newBdgt on #budgets(newBdgt,B_LATEST_REVISION);

      with cte as
      (
      select   i.B_PRIMARY
            ,  i.B_ACCOUNT_CODE
            ,  i.B_SECONDARY_CODE
            ,  i.B_RECORD_TYPE
            ,  i.B_PERIOD
            ,  i.B_YEAR
            ,  i.B_BUDGET_TYPE
            ,  i.B_VALUE
            ,  i.B_STK_SELL_QTY
            ,  i.B_STK_BUY_QTY
            ,  i.B_USERID
            ,  i.B_DATE_ENTERED
            ,  i.B_SOURCE
            ,  i.B_NOTES
            ,  i.B_REVISION_NUMBER
            ,  i.B_YEAR_LINK
            ,  i.B_LATEST_REVISION
            ,  1 as newBdgt
         from inserted i
         where i.B_RECORD_TYPE = 'N' and i.B_BUDGET_TYPE = 'B'
      union all
      select   b.B_PRIMARY          -- connected records which are not themseves being updated.
            ,  b.B_ACCOUNT_CODE
            ,  null
            ,  b.B_RECORD_TYPE
            ,  b.B_PERIOD
            ,  b.B_YEAR
            ,  b.B_BUDGET_TYPE
            ,  b.B_VALUE
            ,  null
            ,  null
            ,  null
            ,  null
            ,  null
            ,  null
            ,  b.B_REVISION_NUMBER
            ,  null
            ,  b.B_LATEST_REVISION
            ,  0 as newBdgt
         from SYS_BUDGETS b
         where exists ( select 1
                           from inserted i
                           where
                                  b.B_ACCOUNT_CODE = i.B_ACCOUNT_CODE
                              and b.B_RECORD_TYPE  = i.B_RECORD_TYPE
                              and b.B_BUDGET_TYPE  = i.B_BUDGET_TYPE
                              and b.B_PERIOD       = i.B_PERIOD
                              and b.B_YEAR         = i.B_YEAR
                              and i.B_RECORD_TYPE = 'N'
                              and i.B_BUDGET_TYPE = 'B'
                        union all
                        select 1
                           from deleted d
                           where
                                  b.B_ACCOUNT_CODE = d.B_ACCOUNT_CODE
                              and b.B_RECORD_TYPE  = d.B_RECORD_TYPE
                              and b.B_BUDGET_TYPE  = d.B_BUDGET_TYPE
                              and b.B_PERIOD       = d.B_PERIOD
                              and b.B_YEAR         = d.B_YEAR
                              and d.B_RECORD_TYPE = 'N'
                              and d.B_BUDGET_TYPE = 'B'
                       )
            and not exists ( select 1
                                from inserted i
                                where b.B_PRIMARY = i.B_PRIMARY
                           )
      )
      , cte2 as      -- rank cte by revision number
      (
      select
         B_PRIMARY
       , B_ACCOUNT_CODE
       , B_SECONDARY_CODE
       , B_RECORD_TYPE
       , B_PERIOD
       , B_YEAR
       , B_BUDGET_TYPE
       , B_VALUE
       , B_STK_SELL_QTY
       , B_STK_BUY_QTY
       , B_USERID
       , B_DATE_ENTERED
       , B_SOURCE
       , B_NOTES
       , B_REVISION_NUMBER
       , B_YEAR_LINK
       , B_LATEST_REVISION
       , newBdgt
       , row_number() over (partition by B_ACCOUNT_CODE, B_RECORD_TYPE, B_PERIOD, B_YEAR order by B_REVISION_NUMBER desc)
         as rnk
      from
      cte
      )
      insert into #budgets
      (
         B_PRIMARY
       , B_ACCOUNT_CODE
       , B_SECONDARY_CODE
       , B_RECORD_TYPE
       , B_PERIOD
       , B_YEAR
       , B_BUDGET_TYPE
       , B_VALUE
       , B_STK_SELL_QTY
       , B_STK_BUY_QTY
       , B_USERID
       , B_DATE_ENTERED
       , B_SOURCE
       , B_NOTES
       , B_REVISION_NUMBER
       , B_YEAR_LINK
       , B_LATEST_REVISION
       , newBdgt
      )
      select
         B_PRIMARY
       , B_ACCOUNT_CODE
       , B_SECONDARY_CODE
       , B_RECORD_TYPE
       , B_PERIOD
       , B_YEAR
       , B_BUDGET_TYPE
       , B_VALUE
       , B_STK_SELL_QTY
       , B_STK_BUY_QTY
       , B_USERID
       , B_DATE_ENTERED
       , B_SOURCE
       , B_NOTES
       , B_REVISION_NUMBER
       , B_YEAR_LINK
       , case rnk when 1 then 1 else 0 end
       , case
              when newBdgt = 1                       then 1
              when rnk = 1 and B_LATEST_REVISION = 0 then 0
              when rnk > 1 and B_LATEST_REVISION = 1 then 0
         end   -- newBdgt (leave as NULL if no update required)
      from
      cte2

      update SYS_BUDGETS
         set B_LATEST_REVISION = b.B_LATEST_REVISION
         from #budgets b
            join SYS_BUDGETS on b.B_PRIMARY = SYS_BUDGETS.B_PRIMARY
         where b.newBdgt=0

      update SYS_BUDGETS
        set B_ACCOUNT_CODE    = b.B_ACCOUNT_CODE
          , B_SECONDARY_CODE  = b.B_SECONDARY_CODE
          , B_RECORD_TYPE     = b.B_RECORD_TYPE
          , B_PERIOD          = b.B_PERIOD
          , B_YEAR            = b.B_YEAR
          , B_BUDGET_TYPE     = b.B_BUDGET_TYPE
          , B_VALUE           = b.B_VALUE
          , B_STK_SELL_QTY    = b.B_STK_SELL_QTY
          , B_STK_BUY_QTY     = b.B_STK_BUY_QTY
          , B_USERID          = b.B_USERID
          , B_DATE_ENTERED    = b.B_DATE_ENTERED
          , B_SOURCE          = b.B_SOURCE
          , B_NOTES           = b.B_NOTES
          , B_REVISION_NUMBER = b.B_REVISION_NUMBER
          , B_YEAR_LINK       = b.B_YEAR_LINK
          , B_LATEST_REVISION = b.B_LATEST_REVISION
         from #budgets b join SYS_BUDGETS on SYS_BUDGETS.B_PRIMARY = b.B_PRIMARY
         where b.newBdgt = 1

      update NL_ACCOUNTS
         set NBUDGET_L1 = isnull(L1 ,NBUDGET_L1 )
            ,NBUDGET_L2 = isnull(L2 ,NBUDGET_L2 )
            ,NBUDGET_L3 = isnull(L3 ,NBUDGET_L3 )
            ,NBUDGET_L4 = isnull(L4 ,NBUDGET_L4 )
            ,NBUDGET_L5 = isnull(L5 ,NBUDGET_L5 )
            ,NBUDGET_L6 = isnull(L6 ,NBUDGET_L6 )
            ,NBUDGET_L7 = isnull(L7 ,NBUDGET_L7 )
            ,NBUDGET_L8 = isnull(L8 ,NBUDGET_L8 )
            ,NBUDGET_L9 = isnull(L9 ,NBUDGET_L9 )
            ,NBUDGET_L10= isnull(L10,NBUDGET_L10)
            ,NBUDGET_L11= isnull(L11,NBUDGET_L11)
            ,NBUDGET_L12= isnull(L12,NBUDGET_L12)
            ,NBUDGET_L13= isnull(L13,NBUDGET_L13)
            ,NBUDGET_C1 = isnull(C1 ,NBUDGET_C1 )
            ,NBUDGET_C2 = isnull(C2 ,NBUDGET_C2 )
            ,NBUDGET_C3 = isnull(C3 ,NBUDGET_C3 )
            ,NBUDGET_C4 = isnull(C4 ,NBUDGET_C4 )
            ,NBUDGET_C5 = isnull(C5 ,NBUDGET_C5 )
            ,NBUDGET_C6 = isnull(C6 ,NBUDGET_C6 )
            ,NBUDGET_C7 = isnull(C7 ,NBUDGET_C7 )
            ,NBUDGET_C8 = isnull(C8 ,NBUDGET_C8 )
            ,NBUDGET_C9 = isnull(C9 ,NBUDGET_C9 )
            ,NBUDGET_C10= isnull(C10,NBUDGET_C10)
            ,NBUDGET_C11= isnull(C11,NBUDGET_C11)
            ,NBUDGET_C12= isnull(C12,NBUDGET_C12)
            ,NBUDGET_C13= isnull(C13,NBUDGET_C13)
            ,NBUDGET_N1 = isnull(N1 ,NBUDGET_N1 )
            ,NBUDGET_N2 = isnull(N2 ,NBUDGET_N2 )
            ,NBUDGET_N3 = isnull(N3 ,NBUDGET_N3 )
            ,NBUDGET_N4 = isnull(N4 ,NBUDGET_N4 )
            ,NBUDGET_N5 = isnull(N5 ,NBUDGET_N5 )
            ,NBUDGET_N6 = isnull(N6 ,NBUDGET_N6 )
            ,NBUDGET_N7 = isnull(N7 ,NBUDGET_N7 )
            ,NBUDGET_N8 = isnull(N8 ,NBUDGET_N8 )
            ,NBUDGET_N9 = isnull(N9 ,NBUDGET_N9 )
            ,NBUDGET_N10= isnull(N10,NBUDGET_N10)
            ,NBUDGET_N11= isnull(N11,NBUDGET_N11)
            ,NBUDGET_N12= isnull(N12,NBUDGET_N12)
            ,NBUDGET_N13= isnull(N13,NBUDGET_N13)
          from NL_ACCOUNTS join
            (select B_ACCOUNT_CODE,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13
               from
               ( select B_ACCOUNT_CODE,B_VALUE
                  ,case B_YEAR when -1 then 'L' when 0 then 'C' else 'N' end + convert(varchar,B_PERIOD) YearPeriod
                from #budgets
                where B_RECORD_TYPE = 'N'
                  and B_LATEST_REVISION = 1
                  and B_YEAR between -1 and 1
                  and newBdgt >= 0
                ) as src
               pivot
               (max(B_VALUE)
               for YearPeriod in (L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13)
               ) as pivotTable
            ) budgets on NCODE = B_ACCOUNT_CODE

      -- zero any that nolonger exist
      update NL_ACCOUNTS
         set NBUDGET_L1 = isnull(0*L1 ,NBUDGET_L1 )
            ,NBUDGET_L2 = isnull(0*L2 ,NBUDGET_L2 )
            ,NBUDGET_L3 = isnull(0*L3 ,NBUDGET_L3 )
            ,NBUDGET_L4 = isnull(0*L4 ,NBUDGET_L4 )
            ,NBUDGET_L5 = isnull(0*L5 ,NBUDGET_L5 )
            ,NBUDGET_L6 = isnull(0*L6 ,NBUDGET_L6 )
            ,NBUDGET_L7 = isnull(0*L7 ,NBUDGET_L7 )
            ,NBUDGET_L8 = isnull(0*L8 ,NBUDGET_L8 )
            ,NBUDGET_L9 = isnull(0*L9 ,NBUDGET_L9 )
            ,NBUDGET_L10= isnull(0*L10,NBUDGET_L10)
            ,NBUDGET_L11= isnull(0*L11,NBUDGET_L11)
            ,NBUDGET_L12= isnull(0*L12,NBUDGET_L12)
            ,NBUDGET_L13= isnull(0*L13,NBUDGET_L13)
            ,NBUDGET_C1 = isnull(0*C1 ,NBUDGET_C1 )
            ,NBUDGET_C2 = isnull(0*C2 ,NBUDGET_C2 )
            ,NBUDGET_C3 = isnull(0*C3 ,NBUDGET_C3 )
            ,NBUDGET_C4 = isnull(0*C4 ,NBUDGET_C4 )
            ,NBUDGET_C5 = isnull(0*C5 ,NBUDGET_C5 )
            ,NBUDGET_C6 = isnull(0*C6 ,NBUDGET_C6 )
            ,NBUDGET_C7 = isnull(0*C7 ,NBUDGET_C7 )
            ,NBUDGET_C8 = isnull(0*C8 ,NBUDGET_C8 )
            ,NBUDGET_C9 = isnull(0*C9 ,NBUDGET_C9 )
            ,NBUDGET_C10= isnull(0*C10,NBUDGET_C10)
            ,NBUDGET_C11= isnull(0*C11,NBUDGET_C11)
            ,NBUDGET_C12= isnull(0*C12,NBUDGET_C12)
            ,NBUDGET_C13= isnull(0*C13,NBUDGET_C13)
            ,NBUDGET_N1 = isnull(0*N1 ,NBUDGET_N1 )
            ,NBUDGET_N2 = isnull(0*N2 ,NBUDGET_N2 )
            ,NBUDGET_N3 = isnull(0*N3 ,NBUDGET_N3 )
            ,NBUDGET_N4 = isnull(0*N4 ,NBUDGET_N4 )
            ,NBUDGET_N5 = isnull(0*N5 ,NBUDGET_N5 )
            ,NBUDGET_N6 = isnull(0*N6 ,NBUDGET_N6 )
            ,NBUDGET_N7 = isnull(0*N7 ,NBUDGET_N7 )
            ,NBUDGET_N8 = isnull(0*N8 ,NBUDGET_N8 )
            ,NBUDGET_N9 = isnull(0*N9 ,NBUDGET_N9 )
            ,NBUDGET_N10= isnull(0*N10,NBUDGET_N10)
            ,NBUDGET_N11= isnull(0*N11,NBUDGET_N11)
            ,NBUDGET_N12= isnull(0*N12,NBUDGET_N12)
            ,NBUDGET_N13= isnull(0*N13,NBUDGET_N13)
          from NL_ACCOUNTS join
            (select B_ACCOUNT_CODE,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13
               from
               ( select B_ACCOUNT_CODE,B_VALUE
                  ,case B_YEAR when -1 then 'L' when 0 then 'C' else 'N' end + convert(varchar,B_PERIOD) YearPeriod
                from deleted d
                where d.B_RECORD_TYPE = 'N'
                  and d.B_BUDGET_TYPE = 'B'
                  and d.B_LATEST_REVISION = 1
                  and d.B_YEAR between -1 and 1
                  and not exists
                     (
                        select 1
                           from #budgets b
                           where     b.B_ACCOUNT_CODE = d.B_ACCOUNT_CODE
                                 and b.B_RECORD_TYPE  = d.B_RECORD_TYPE
                                 and b.B_BUDGET_TYPE  = d.B_BUDGET_TYPE
                                 and b.B_PERIOD       = d.B_PERIOD
                                 and b.B_YEAR         = d.B_YEAR
                                 and b.newBdgt = 1
                     )
                ) as src
               pivot
               (max(B_VALUE)
               for YearPeriod in (L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13)
               ) as pivotTable
            ) budgets on NCODE = B_ACCOUNT_CODE

      drop table #budgets

   end
else
   begin
      update SYS_BUDGETS
        set B_ACCOUNT_CODE    = b.B_ACCOUNT_CODE
          , B_SECONDARY_CODE  = b.B_SECONDARY_CODE
          , B_RECORD_TYPE     = b.B_RECORD_TYPE
          , B_PERIOD          = b.B_PERIOD
          , B_YEAR            = b.B_YEAR
          , B_BUDGET_TYPE     = b.B_BUDGET_TYPE
          , B_VALUE           = b.B_VALUE
          , B_STK_SELL_QTY    = b.B_STK_SELL_QTY
          , B_STK_BUY_QTY     = b.B_STK_BUY_QTY
          , B_USERID          = b.B_USERID
          , B_DATE_ENTERED    = b.B_DATE_ENTERED
          , B_SOURCE          = b.B_SOURCE
          , B_NOTES           = b.B_NOTES
          , B_REVISION_NUMBER = b.B_REVISION_NUMBER
          , B_YEAR_LINK       = b.B_YEAR_LINK
         from inserted b
         where
            SYS_BUDGETS.B_PRIMARY = b.B_PRIMARY
            and b.B_RECORD_TYPE = 'N'
            and b.B_BUDGET_TYPE = 'B'

      if update(B_VALUE)
         update NL_ACCOUNTS
            set NBUDGET_L1 = isnull(L1 ,NBUDGET_L1 )
               ,NBUDGET_L2 = isnull(L2 ,NBUDGET_L2 )
               ,NBUDGET_L3 = isnull(L3 ,NBUDGET_L3 )
               ,NBUDGET_L4 = isnull(L4 ,NBUDGET_L4 )
               ,NBUDGET_L5 = isnull(L5 ,NBUDGET_L5 )
               ,NBUDGET_L6 = isnull(L6 ,NBUDGET_L6 )
               ,NBUDGET_L7 = isnull(L7 ,NBUDGET_L7 )
               ,NBUDGET_L8 = isnull(L8 ,NBUDGET_L8 )
               ,NBUDGET_L9 = isnull(L9 ,NBUDGET_L9 )
               ,NBUDGET_L10= isnull(L10,NBUDGET_L10)
               ,NBUDGET_L11= isnull(L11,NBUDGET_L11)
               ,NBUDGET_L12= isnull(L12,NBUDGET_L12)
               ,NBUDGET_L13= isnull(L13,NBUDGET_L13)
               ,NBUDGET_C1 = isnull(C1 ,NBUDGET_C1 )
               ,NBUDGET_C2 = isnull(C2 ,NBUDGET_C2 )
               ,NBUDGET_C3 = isnull(C3 ,NBUDGET_C3 )
               ,NBUDGET_C4 = isnull(C4 ,NBUDGET_C4 )
               ,NBUDGET_C5 = isnull(C5 ,NBUDGET_C5 )
               ,NBUDGET_C6 = isnull(C6 ,NBUDGET_C6 )
               ,NBUDGET_C7 = isnull(C7 ,NBUDGET_C7 )
               ,NBUDGET_C8 = isnull(C8 ,NBUDGET_C8 )
               ,NBUDGET_C9 = isnull(C9 ,NBUDGET_C9 )
               ,NBUDGET_C10= isnull(C10,NBUDGET_C10)
               ,NBUDGET_C11= isnull(C11,NBUDGET_C11)
               ,NBUDGET_C12= isnull(C12,NBUDGET_C12)
               ,NBUDGET_C13= isnull(C13,NBUDGET_C13)
               ,NBUDGET_N1 = isnull(N1 ,NBUDGET_N1 )
               ,NBUDGET_N2 = isnull(N2 ,NBUDGET_N2 )
               ,NBUDGET_N3 = isnull(N3 ,NBUDGET_N3 )
               ,NBUDGET_N4 = isnull(N4 ,NBUDGET_N4 )
               ,NBUDGET_N5 = isnull(N5 ,NBUDGET_N5 )
               ,NBUDGET_N6 = isnull(N6 ,NBUDGET_N6 )
               ,NBUDGET_N7 = isnull(N7 ,NBUDGET_N7 )
               ,NBUDGET_N8 = isnull(N8 ,NBUDGET_N8 )
               ,NBUDGET_N9 = isnull(N9 ,NBUDGET_N9 )
               ,NBUDGET_N10= isnull(N10,NBUDGET_N10)
               ,NBUDGET_N11= isnull(N11,NBUDGET_N11)
               ,NBUDGET_N12= isnull(N12,NBUDGET_N12)
               ,NBUDGET_N13= isnull(N13,NBUDGET_N13)
             from NL_ACCOUNTS join
               (select B_ACCOUNT_CODE,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13
                  from
                  ( select B_ACCOUNT_CODE,B_VALUE
                     ,case B_YEAR when -1 then 'L' when 0 then 'C' else 'N' end + convert(varchar,B_PERIOD) YearPeriod
                   from inserted
                   where B_RECORD_TYPE = 'N'
                     and B_BUDGET_TYPE = 'B'
                     and B_LATEST_REVISION = 1
                     and B_YEAR between -1 and 1
                   ) as src
                  pivot
                  (max(B_VALUE)
                  for YearPeriod in (L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13)
                  ) as pivotTable
               ) budgets on NCODE = B_ACCOUNT_CODE
   end

GO
create trigger AA_SYS_BUDGETS_IODT
/*
** Trigger for enforcing Nominal Budgets business rules.
**
** Written:       2/2/11 NC
** Last Amended:  23/2/11 NC, 16/5/11 NC, 06/11/1012 SB
*/
on SYS_BUDGETS
instead of delete
as
set nocount on
declare @LT_PERIOD_END_OPTN varchar(2)

delete SYS_BUDGETS from deleted d join SYS_BUDGETS on d.B_PRIMARY = SYS_BUDGETS.B_PRIMARY

select @LT_PERIOD_END_OPTN = PERIOD_END_OPTN from SYS_DATAINFO with (nolock) where SYS_PRIMARY = 1
if @LT_PERIOD_END_OPTN in ('SL','PL','NL')
   return

;with cte as
(
select   b.B_PRIMARY
      ,  b.B_ACCOUNT_CODE
      ,  b.B_SECONDARY_CODE
      ,  b.B_RECORD_TYPE
      ,  b.B_BUDGET_TYPE
      ,  b.B_PERIOD
      ,  b.B_YEAR
      ,  b.B_VALUE
      ,  b.B_REVISION_NUMBER
      ,  b.B_LATEST_REVISION
      ,  row_number() over (partition by b.B_ACCOUNT_CODE, b.B_RECORD_TYPE, b.B_PERIOD, b.B_YEAR, b.B_BUDGET_TYPE, isnull(b.B_SECONDARY_CODE,'') order by b.B_REVISION_NUMBER desc)
           as rnk
   from SYS_BUDGETS b
   where exists ( select 1
                     from deleted d
                     where
                            b.B_ACCOUNT_CODE                = d.B_ACCOUNT_CODE
                        and isnull(b.B_SECONDARY_CODE,'')   = isnull(d.B_SECONDARY_CODE,'')
                        and b.B_RECORD_TYPE                 = d.B_RECORD_TYPE
                        and b.B_PERIOD                      = d.B_PERIOD
                        and b.B_YEAR                        = d.B_YEAR
                        and b.B_BUDGET_TYPE                 = d.B_BUDGET_TYPE
                        and d.B_LATEST_REVISION             = 1
                        and d.B_RECORD_TYPE                 <> 'N'
                 )
         and b.B_RECORD_TYPE <> 'N'
)
update SYS_BUDGETS
   set B_LATEST_REVISION = 1
   from cte
      join SYS_BUDGETS on cte.B_PRIMARY = SYS_BUDGETS.B_PRIMARY
   where rnk = 1

if not exists (select 1 from deleted where B_RECORD_TYPE = 'N' and B_BUDGET_TYPE = 'B')
   return

create table #budgets
   (
      B_PRIMARY         int            null
   ,  B_ACCOUNT_CODE    varchar(25)    collate database_default not null
   ,  B_SECONDARY_CODE  varchar(25)    collate database_default null
   ,  B_RECORD_TYPE     varchar(2)     collate database_default not null
   ,  B_PERIOD          tinyint        not null
   ,  B_YEAR            int            not null
   ,  B_BUDGET_TYPE     varchar(1)     collate database_default null
   ,  B_VALUE           float          null
   ,  B_STK_SELL_QTY    float          null
   ,  B_STK_BUY_QTY     float          null
   ,  B_USERID          varchar(4)     collate database_default null
   ,  B_DATE_ENTERED    datetime       null
   ,  B_SOURCE          varchar(2)     collate database_default null
   ,  B_NOTES           varchar(240)   collate database_default null
   ,  B_REVISION_NUMBER smallint       not null
   ,  B_YEAR_LINK       smallint       null
   ,  B_LATEST_REVISION bit            not null
   ,  newBdgt           bit            null
   ,  ident             int            not null identity PRIMARY KEY
   )
create index newBdgt on #budgets(newBdgt,B_LATEST_REVISION);

with cte as
(
select   b.B_PRIMARY
      ,  b.B_ACCOUNT_CODE
      ,  b.B_RECORD_TYPE
      ,  b.B_BUDGET_TYPE
      ,  b.B_PERIOD
      ,  b.B_YEAR
      ,  b.B_VALUE
      ,  b.B_REVISION_NUMBER
      ,  b.B_LATEST_REVISION
      ,  0 as newBdgt
      ,  row_number() over (partition by b.B_ACCOUNT_CODE, b.B_RECORD_TYPE, b.B_PERIOD, b.B_YEAR order by b.B_REVISION_NUMBER desc)
           as rnk
   from SYS_BUDGETS b
   where exists ( select 1
                     from deleted d
                     where
                            b.B_ACCOUNT_CODE = d.B_ACCOUNT_CODE
                        and b.B_RECORD_TYPE  = d.B_RECORD_TYPE
                        and b.B_PERIOD       = d.B_PERIOD
                        and b.B_YEAR         = d.B_YEAR
                        and b.B_BUDGET_TYPE  = d.B_BUDGET_TYPE
                 )
         and B_RECORD_TYPE = 'N' and B_BUDGET_TYPE = 'B'
)
insert into #budgets
(
   B_PRIMARY
 , B_ACCOUNT_CODE
 , B_RECORD_TYPE
 , B_BUDGET_TYPE
 , B_PERIOD
 , B_YEAR
 , B_VALUE
 , B_REVISION_NUMBER
 , B_LATEST_REVISION
 , newBdgt
)
select
   B_PRIMARY
 , B_ACCOUNT_CODE
 , B_RECORD_TYPE
 , B_BUDGET_TYPE
 , B_PERIOD
 , B_YEAR
 , B_VALUE
 , B_REVISION_NUMBER
 , case rnk when 1 then 1 else 0 end
 , case
        when rnk = 1 and B_LATEST_REVISION = 0 then 0
   end   -- newBdgt (leave as NULL if no update required
from
cte

update SYS_BUDGETS
   set B_LATEST_REVISION = b.B_LATEST_REVISION
   from #budgets b
      join SYS_BUDGETS on b.B_PRIMARY = SYS_BUDGETS.B_PRIMARY
   where b.newBdgt=0

update NL_ACCOUNTS
         set NBUDGET_L1 = isnull(L1 ,NBUDGET_L1 )
            ,NBUDGET_L2 = isnull(L2 ,NBUDGET_L2 )
            ,NBUDGET_L3 = isnull(L3 ,NBUDGET_L3 )
            ,NBUDGET_L4 = isnull(L4 ,NBUDGET_L4 )
            ,NBUDGET_L5 = isnull(L5 ,NBUDGET_L5 )
            ,NBUDGET_L6 = isnull(L6 ,NBUDGET_L6 )
            ,NBUDGET_L7 = isnull(L7 ,NBUDGET_L7 )
            ,NBUDGET_L8 = isnull(L8 ,NBUDGET_L8 )
            ,NBUDGET_L9 = isnull(L9 ,NBUDGET_L9 )
            ,NBUDGET_L10= isnull(L10,NBUDGET_L10)
            ,NBUDGET_L11= isnull(L11,NBUDGET_L11)
            ,NBUDGET_L12= isnull(L12,NBUDGET_L12)
            ,NBUDGET_L13= isnull(L13,NBUDGET_L13)
            ,NBUDGET_C1 = isnull(C1 ,NBUDGET_C1 )
            ,NBUDGET_C2 = isnull(C2 ,NBUDGET_C2 )
            ,NBUDGET_C3 = isnull(C3 ,NBUDGET_C3 )
            ,NBUDGET_C4 = isnull(C4 ,NBUDGET_C4 )
            ,NBUDGET_C5 = isnull(C5 ,NBUDGET_C5 )
            ,NBUDGET_C6 = isnull(C6 ,NBUDGET_C6 )
            ,NBUDGET_C7 = isnull(C7 ,NBUDGET_C7 )
            ,NBUDGET_C8 = isnull(C8 ,NBUDGET_C8 )
            ,NBUDGET_C9 = isnull(C9 ,NBUDGET_C9 )
            ,NBUDGET_C10= isnull(C10,NBUDGET_C10)
            ,NBUDGET_C11= isnull(C11,NBUDGET_C11)
            ,NBUDGET_C12= isnull(C12,NBUDGET_C12)
            ,NBUDGET_C13= isnull(C13,NBUDGET_C13)
            ,NBUDGET_N1 = isnull(N1 ,NBUDGET_N1 )
            ,NBUDGET_N2 = isnull(N2 ,NBUDGET_N2 )
            ,NBUDGET_N3 = isnull(N3 ,NBUDGET_N3 )
            ,NBUDGET_N4 = isnull(N4 ,NBUDGET_N4 )
            ,NBUDGET_N5 = isnull(N5 ,NBUDGET_N5 )
            ,NBUDGET_N6 = isnull(N6 ,NBUDGET_N6 )
            ,NBUDGET_N7 = isnull(N7 ,NBUDGET_N7 )
            ,NBUDGET_N8 = isnull(N8 ,NBUDGET_N8 )
            ,NBUDGET_N9 = isnull(N9 ,NBUDGET_N9 )
            ,NBUDGET_N10= isnull(N10,NBUDGET_N10)
            ,NBUDGET_N11= isnull(N11,NBUDGET_N11)
            ,NBUDGET_N12= isnull(N12,NBUDGET_N12)
            ,NBUDGET_N13= isnull(N13,NBUDGET_N13)
          from NL_ACCOUNTS join
            (select B_ACCOUNT_CODE,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13
               from
               ( select B_ACCOUNT_CODE,B_VALUE
                  ,case B_YEAR when -1 then 'L' when 0 then 'C' else 'N' end + convert(varchar,B_PERIOD) YearPeriod
                from #budgets
                where B_RECORD_TYPE = 'N'
                  and B_LATEST_REVISION = 1
                  and B_YEAR between -1 and 1
                  and newBdgt = 0
                ) as src
               pivot
               (max(B_VALUE)
               for YearPeriod in (L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13)
               ) as pivotTable
            ) budgets on NCODE = B_ACCOUNT_CODE

-- zero any that nolonger exist
update NL_ACCOUNTS
         set NBUDGET_L1 = isnull(0*L1 ,NBUDGET_L1 )
            ,NBUDGET_L2 = isnull(0*L2 ,NBUDGET_L2 )
            ,NBUDGET_L3 = isnull(0*L3 ,NBUDGET_L3 )
            ,NBUDGET_L4 = isnull(0*L4 ,NBUDGET_L4 )
            ,NBUDGET_L5 = isnull(0*L5 ,NBUDGET_L5 )
            ,NBUDGET_L6 = isnull(0*L6 ,NBUDGET_L6 )
            ,NBUDGET_L7 = isnull(0*L7 ,NBUDGET_L7 )
            ,NBUDGET_L8 = isnull(0*L8 ,NBUDGET_L8 )
            ,NBUDGET_L9 = isnull(0*L9 ,NBUDGET_L9 )
            ,NBUDGET_L10= isnull(0*L10,NBUDGET_L10)
            ,NBUDGET_L11= isnull(0*L11,NBUDGET_L11)
            ,NBUDGET_L12= isnull(0*L12,NBUDGET_L12)
            ,NBUDGET_L13= isnull(0*L13,NBUDGET_L13)
            ,NBUDGET_C1 = isnull(0*C1 ,NBUDGET_C1 )
            ,NBUDGET_C2 = isnull(0*C2 ,NBUDGET_C2 )
            ,NBUDGET_C3 = isnull(0*C3 ,NBUDGET_C3 )
            ,NBUDGET_C4 = isnull(0*C4 ,NBUDGET_C4 )
            ,NBUDGET_C5 = isnull(0*C5 ,NBUDGET_C5 )
            ,NBUDGET_C6 = isnull(0*C6 ,NBUDGET_C6 )
            ,NBUDGET_C7 = isnull(0*C7 ,NBUDGET_C7 )
            ,NBUDGET_C8 = isnull(0*C8 ,NBUDGET_C8 )
            ,NBUDGET_C9 = isnull(0*C9 ,NBUDGET_C9 )
            ,NBUDGET_C10= isnull(0*C10,NBUDGET_C10)
            ,NBUDGET_C11= isnull(0*C11,NBUDGET_C11)
            ,NBUDGET_C12= isnull(0*C12,NBUDGET_C12)
            ,NBUDGET_C13= isnull(0*C13,NBUDGET_C13)
            ,NBUDGET_N1 = isnull(0*N1 ,NBUDGET_N1 )
            ,NBUDGET_N2 = isnull(0*N2 ,NBUDGET_N2 )
            ,NBUDGET_N3 = isnull(0*N3 ,NBUDGET_N3 )
            ,NBUDGET_N4 = isnull(0*N4 ,NBUDGET_N4 )
            ,NBUDGET_N5 = isnull(0*N5 ,NBUDGET_N5 )
            ,NBUDGET_N6 = isnull(0*N6 ,NBUDGET_N6 )
            ,NBUDGET_N7 = isnull(0*N7 ,NBUDGET_N7 )
            ,NBUDGET_N8 = isnull(0*N8 ,NBUDGET_N8 )
            ,NBUDGET_N9 = isnull(0*N9 ,NBUDGET_N9 )
            ,NBUDGET_N10= isnull(0*N10,NBUDGET_N10)
            ,NBUDGET_N11= isnull(0*N11,NBUDGET_N11)
            ,NBUDGET_N12= isnull(0*N12,NBUDGET_N12)
            ,NBUDGET_N13= isnull(0*N13,NBUDGET_N13)
          from NL_ACCOUNTS join
            (select B_ACCOUNT_CODE,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13
               from
               ( select B_ACCOUNT_CODE,B_VALUE
                  ,case B_YEAR when -1 then 'L' when 0 then 'C' else 'N' end + convert(varchar,B_PERIOD) YearPeriod
                from deleted d
                where d.B_RECORD_TYPE = 'N'
                  and d.B_BUDGET_TYPE = 'B'
                  and d.B_LATEST_REVISION = 1
                  and d.B_YEAR between -1 and 1
                  and not exists
                     (
                        select 1
                           from SYS_BUDGETS b
                           where     b.B_ACCOUNT_CODE = d.B_ACCOUNT_CODE
                                 and b.B_RECORD_TYPE  = d.B_RECORD_TYPE
                                 and b.B_BUDGET_TYPE  = d.B_BUDGET_TYPE
                                 and b.B_PERIOD       = d.B_PERIOD
                                 and b.B_YEAR         = d.B_YEAR
                     )
                ) as src
               pivot
               (max(B_VALUE)
               for YearPeriod in (L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13)
               ) as pivotTable
            ) budgets on NCODE = B_ACCOUNT_CODE

drop table #budgets

GO
create trigger AA_SYS_BUDGETS_IOIT
/*
** Trigger for enforcing Nominal Budgets business rules.
**
** Written:       2/2/11 NC
** Last Amended:  16/5/11 NC, 07/11/2012 SB
*/
on SYS_BUDGETS
instead of insert
as
set nocount on
declare @LS_NOMINAL_BUDGETS_HAVE_REVISIONS bit;

insert into SYS_BUDGETS
   (  B_ACCOUNT_CODE
    , B_SECONDARY_CODE
    , B_RECORD_TYPE
    , B_PERIOD
    , B_YEAR
    , B_BUDGET_TYPE
    , B_VALUE
    , B_STK_SELL_QTY
    , B_STK_BUY_QTY
    , B_USERID
    , B_DATE_ENTERED
    , B_SOURCE
    , B_NOTES
    , B_REVISION_NUMBER
    , B_YEAR_LINK
    , B_LATEST_REVISION
   )
select B_ACCOUNT_CODE
     , B_SECONDARY_CODE
     , B_RECORD_TYPE
     , B_PERIOD
     , B_YEAR
     , isnull(B_BUDGET_TYPE,'B')
     , B_VALUE
     , B_STK_SELL_QTY
     , B_STK_BUY_QTY
     , B_USERID
     , B_DATE_ENTERED
     , B_SOURCE
     , B_NOTES
     , B_REVISION_NUMBER
     , B_YEAR_LINK
     , 0
   from inserted
   where B_RECORD_TYPE <> 'N';

with cte as
(
select   b.B_PRIMARY
      ,  b.B_ACCOUNT_CODE
      ,  b.B_SECONDARY_CODE
      ,  b.B_RECORD_TYPE
      ,  b.B_PERIOD
      ,  b.B_YEAR
      ,  b.B_BUDGET_TYPE
      ,  b.B_REVISION_NUMBER
      ,  row_number() over (partition by B_ACCOUNT_CODE, B_RECORD_TYPE, B_PERIOD, B_YEAR, B_BUDGET_TYPE, isnull(B_SECONDARY_CODE,'') order by B_REVISION_NUMBER desc)
         as rnk
   from SYS_BUDGETS b
   where
      exists ( select 1
                     from inserted i
                     where
                            b.B_ACCOUNT_CODE                = i.B_ACCOUNT_CODE
                        and b.B_RECORD_TYPE                 = i.B_RECORD_TYPE
                        and isnull(b.B_SECONDARY_CODE,'')   = isnull(i.B_SECONDARY_CODE,'')
                        and b.B_BUDGET_TYPE                 = i.B_BUDGET_TYPE
                        and b.B_PERIOD                      = i.B_PERIOD
                        and b.B_YEAR                        = i.B_YEAR
                 )
)
update SYS_BUDGETS
   set B_LATEST_REVISION  = case rnk
                              when 1 then 1
                              else 0
                            end
   from cte
      join SYS_BUDGETS on cte.B_PRIMARY = SYS_BUDGETS.B_PRIMARY
   where B_LATEST_REVISION  <> case rnk
                                 when 1 then 1
                                 else 0
                               end

if not exists (select 1 from inserted where B_RECORD_TYPE = 'N' and B_BUDGET_TYPE = 'B')
   return

create table #budgets
   (
      B_PRIMARY         int            null
   ,  B_ACCOUNT_CODE    varchar(25)    collate database_default not null
   ,  B_SECONDARY_CODE  varchar(25)    collate database_default null
   ,  B_RECORD_TYPE     varchar(2)     collate database_default not null
   ,  B_PERIOD          tinyint        not null
   ,  B_YEAR            int            not null
   ,  B_BUDGET_TYPE     varchar(1)     collate database_default null
   ,  B_VALUE           float          null
   ,  B_STK_SELL_QTY    float          null
   ,  B_STK_BUY_QTY     float          null
   ,  B_USERID          varchar(4)     collate database_default null
   ,  B_DATE_ENTERED    datetime       null
   ,  B_SOURCE          varchar(2)     collate database_default null
   ,  B_NOTES           varchar(240)   collate database_default null
   ,  B_REVISION_NUMBER smallint       not null
   ,  B_YEAR_LINK       smallint       null
   ,  B_LATEST_REVISION bit            not null
   ,  newBdgt           bit            null
   ,  ident             int            not null identity PRIMARY KEY
   )
create index newBdgt on #budgets(newBdgt,B_LATEST_REVISION);

with cte as
(
select   i.B_PRIMARY
      ,  i.B_ACCOUNT_CODE
      ,  i.B_SECONDARY_CODE
      ,  i.B_RECORD_TYPE
      ,  i.B_PERIOD
      ,  i.B_YEAR
      ,  i.B_BUDGET_TYPE
      ,  i.B_VALUE
      ,  i.B_STK_SELL_QTY
      ,  i.B_STK_BUY_QTY
      ,  i.B_USERID
      ,  i.B_DATE_ENTERED
      ,  i.B_SOURCE
      ,  i.B_NOTES
      ,  i.B_REVISION_NUMBER
      ,  i.B_YEAR_LINK
      ,  i.B_LATEST_REVISION
      ,  1 as newBdgt
   from inserted i
   where i.B_RECORD_TYPE = 'N' and i.B_BUDGET_TYPE = 'B'
union all
select   b.B_PRIMARY
      ,  b.B_ACCOUNT_CODE
      ,  null
      ,  b.B_RECORD_TYPE
      ,  b.B_PERIOD
      ,  b.B_YEAR
      ,  b.B_BUDGET_TYPE
      ,  b.B_VALUE
      ,  null
      ,  null
      ,  null
      ,  null
      ,  null
      ,  null
      ,  b.B_REVISION_NUMBER
      ,  null
      ,  b.B_LATEST_REVISION
      ,  0 as newBdgt
   from SYS_BUDGETS b
   where b.B_RECORD_TYPE = 'N' and b.B_BUDGET_TYPE = 'B'
      and exists ( select 1
                     from inserted i
                     where
                            b.B_ACCOUNT_CODE = i.B_ACCOUNT_CODE
                        and b.B_PERIOD       = i.B_PERIOD
                        and b.B_YEAR         = i.B_YEAR
                        and i.B_RECORD_TYPE = 'N' and i.B_BUDGET_TYPE = 'B'
                 )
)
, cte2 as
(
select
   B_PRIMARY
 , B_ACCOUNT_CODE
 , B_SECONDARY_CODE
 , B_RECORD_TYPE
 , B_PERIOD
 , B_YEAR
 , B_BUDGET_TYPE
 , B_VALUE
 , B_STK_SELL_QTY
 , B_STK_BUY_QTY
 , B_USERID
 , B_DATE_ENTERED
 , B_SOURCE
 , B_NOTES
 , B_REVISION_NUMBER
 , B_YEAR_LINK
 , B_LATEST_REVISION
 , newBdgt
 , row_number() over (partition by B_ACCOUNT_CODE, B_RECORD_TYPE, B_PERIOD, B_YEAR order by B_REVISION_NUMBER desc)
   as rnk
from
cte
)
insert into #budgets
(
   B_PRIMARY
 , B_ACCOUNT_CODE
 , B_SECONDARY_CODE
 , B_RECORD_TYPE
 , B_PERIOD
 , B_YEAR
 , B_BUDGET_TYPE
 , B_VALUE
 , B_STK_SELL_QTY
 , B_STK_BUY_QTY
 , B_USERID
 , B_DATE_ENTERED
 , B_SOURCE
 , B_NOTES
 , B_REVISION_NUMBER
 , B_YEAR_LINK
 , B_LATEST_REVISION
 , newBdgt
)
select
   B_PRIMARY
 , B_ACCOUNT_CODE
 , B_SECONDARY_CODE
 , B_RECORD_TYPE
 , B_PERIOD
 , B_YEAR
 , B_BUDGET_TYPE
 , B_VALUE
 , B_STK_SELL_QTY
 , B_STK_BUY_QTY
 , B_USERID
 , B_DATE_ENTERED
 , B_SOURCE
 , B_NOTES
 , B_REVISION_NUMBER
 , B_YEAR_LINK
 , case rnk when 1 then 1 else 0 end
 , case
        when newBdgt = 1                       then 1
        when rnk = 1 and B_LATEST_REVISION = 0 then 0
        when rnk > 1 and B_LATEST_REVISION = 1 then 0
   end   -- newBdgt (leave as NULL if no update required
from
cte2

update SYS_BUDGETS
   set B_LATEST_REVISION = b.B_LATEST_REVISION
   from #budgets b
      join SYS_BUDGETS on b.B_PRIMARY = SYS_BUDGETS.B_PRIMARY
   where newBdgt=0

insert into SYS_BUDGETS
   (  B_ACCOUNT_CODE
    , B_SECONDARY_CODE
    , B_RECORD_TYPE
    , B_PERIOD
    , B_YEAR
    , B_BUDGET_TYPE
    , B_VALUE
    , B_STK_SELL_QTY
    , B_STK_BUY_QTY
    , B_USERID
    , B_DATE_ENTERED
    , B_SOURCE
    , B_NOTES
    , B_REVISION_NUMBER
    , B_YEAR_LINK
    , B_LATEST_REVISION
   )
select B_ACCOUNT_CODE
     , B_SECONDARY_CODE
     , B_RECORD_TYPE
     , B_PERIOD
     , B_YEAR
     , B_BUDGET_TYPE
     , B_VALUE
     , B_STK_SELL_QTY
     , B_STK_BUY_QTY
     , B_USERID
     , B_DATE_ENTERED
     , B_SOURCE
     , B_NOTES
     , B_REVISION_NUMBER
     , B_YEAR_LINK
     , B_LATEST_REVISION
   from #budgets
   where newBdgt = 1

update NL_ACCOUNTS
   set NBUDGET_L1 = isnull(L1 ,NBUDGET_L1 )
      ,NBUDGET_L2 = isnull(L2 ,NBUDGET_L2 )
      ,NBUDGET_L3 = isnull(L3 ,NBUDGET_L3 )
      ,NBUDGET_L4 = isnull(L4 ,NBUDGET_L4 )
      ,NBUDGET_L5 = isnull(L5 ,NBUDGET_L5 )
      ,NBUDGET_L6 = isnull(L6 ,NBUDGET_L6 )
      ,NBUDGET_L7 = isnull(L7 ,NBUDGET_L7 )
      ,NBUDGET_L8 = isnull(L8 ,NBUDGET_L8 )
      ,NBUDGET_L9 = isnull(L9 ,NBUDGET_L9 )
      ,NBUDGET_L10= isnull(L10,NBUDGET_L10)
      ,NBUDGET_L11= isnull(L11,NBUDGET_L11)
      ,NBUDGET_L12= isnull(L12,NBUDGET_L12)
      ,NBUDGET_L13= isnull(L13,NBUDGET_L13)
      ,NBUDGET_C1 = isnull(C1 ,NBUDGET_C1 )
      ,NBUDGET_C2 = isnull(C2 ,NBUDGET_C2 )
      ,NBUDGET_C3 = isnull(C3 ,NBUDGET_C3 )
      ,NBUDGET_C4 = isnull(C4 ,NBUDGET_C4 )
      ,NBUDGET_C5 = isnull(C5 ,NBUDGET_C5 )
      ,NBUDGET_C6 = isnull(C6 ,NBUDGET_C6 )
      ,NBUDGET_C7 = isnull(C7 ,NBUDGET_C7 )
      ,NBUDGET_C8 = isnull(C8 ,NBUDGET_C8 )
      ,NBUDGET_C9 = isnull(C9 ,NBUDGET_C9 )
      ,NBUDGET_C10= isnull(C10,NBUDGET_C10)
      ,NBUDGET_C11= isnull(C11,NBUDGET_C11)
      ,NBUDGET_C12= isnull(C12,NBUDGET_C12)
      ,NBUDGET_C13= isnull(C13,NBUDGET_C13)
      ,NBUDGET_N1 = isnull(N1 ,NBUDGET_N1 )
      ,NBUDGET_N2 = isnull(N2 ,NBUDGET_N2 )
      ,NBUDGET_N3 = isnull(N3 ,NBUDGET_N3 )
      ,NBUDGET_N4 = isnull(N4 ,NBUDGET_N4 )
      ,NBUDGET_N5 = isnull(N5 ,NBUDGET_N5 )
      ,NBUDGET_N6 = isnull(N6 ,NBUDGET_N6 )
      ,NBUDGET_N7 = isnull(N7 ,NBUDGET_N7 )
      ,NBUDGET_N8 = isnull(N8 ,NBUDGET_N8 )
      ,NBUDGET_N9 = isnull(N9 ,NBUDGET_N9 )
      ,NBUDGET_N10= isnull(N10,NBUDGET_N10)
      ,NBUDGET_N11= isnull(N11,NBUDGET_N11)
      ,NBUDGET_N12= isnull(N12,NBUDGET_N12)
      ,NBUDGET_N13= isnull(N13,NBUDGET_N13)
    from NL_ACCOUNTS join
      (select B_ACCOUNT_CODE,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13
         from
         ( select B_ACCOUNT_CODE,B_VALUE
            ,case B_YEAR when -1 then 'L' when 0 then 'C' else 'N' end + convert(varchar,B_PERIOD) YearPeriod
          from #budgets
          where B_LATEST_REVISION = 1
            and B_YEAR between -1 and 1
            and newBdgt >= 0
          ) as src
         pivot
         (max(B_VALUE)
         for YearPeriod in (L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13)
         ) as pivotTable
      ) budgets on NCODE = B_ACCOUNT_CODE

select @LS_NOMINAL_BUDGETS_HAVE_REVISIONS = NOMINAL_BUDGETS_HAVE_REVISIONS
   from SYS_DATAINFO with (nolock)
   where SYS_PRIMARY = 1

if @LS_NOMINAL_BUDGETS_HAVE_REVISIONS = 0
   begin
      if exists (select 1
                     from #budgets
                     where B_REVISION_NUMBER > 0
                )
         update SYS_DATAINFO set NOMINAL_BUDGETS_HAVE_REVISIONS = 1 where SYS_PRIMARY = 1
   end
drop table #budgets
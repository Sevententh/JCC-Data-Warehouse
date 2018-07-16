CREATE TABLE [dbo].[CO2_BUDGETS] (
    [CBDG_PRIMARY]           INT         IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CBDG_CLASS_LINK]        INT         NOT NULL,
    [CBDG_1ST_CATEGORY_LINK] INT         NULL,
    [CBDG_2ND_CATEGORY_LINK] INT         NULL,
    [CBDG_YEAR]              SMALLINT    NOT NULL,
    [CBDG_PERIOD]            TINYINT     NOT NULL,
    [CBDG_CO2]               INT         NOT NULL,
    [CBDG_USER_PUTIN]        VARCHAR (4) NOT NULL,
    [CBDG_DATE_PUTIN]        DATETIME    DEFAULT (getdate()) NOT NULL,
    [CBDG_USER_EDITED]       VARCHAR (4) NULL,
    [CBDG_DATE_EDITED]       DATETIME    NULL,
    [CBDG_SOURCE]            VARCHAR (1) NULL,
    [CBDG_YEAR_LINK]         SMALLINT    NULL,
    CONSTRAINT [CBDG_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CBDG_PRIMARY] ASC),
    CONSTRAINT [CBDG_PERIOD_CK] CHECK ([CBDG_PERIOD]>=(1) AND [CBDG_PERIOD]<=(13)),
    CONSTRAINT [CBDG_YEAR_LINK_CK] CHECK ([CBDG_YEAR] IS NOT NULL AND [CBDG_YEAR_LINK] IS NOT NULL OR [CBDG_YEAR] IS NULL AND [CBDG_YEAR_LINK] IS NULL),
    CONSTRAINT [CBDG_1ST_CATEGORY_LINK_FK] FOREIGN KEY ([CBDG_1ST_CATEGORY_LINK]) REFERENCES [dbo].[NL_CATEGORIES] ([NCAT_PRIMARY]),
    CONSTRAINT [CBDG_2ND_CATEGORY_LINK_FK] FOREIGN KEY ([CBDG_2ND_CATEGORY_LINK]) REFERENCES [dbo].[NL_CATEGORIES] ([NCAT_PRIMARY]),
    CONSTRAINT [CBDG_CLASS_LINK_FK] FOREIGN KEY ([CBDG_CLASS_LINK]) REFERENCES [dbo].[CO2_CLASSIFICATIONS] ([CCLS_PRIMARY]),
    CONSTRAINT [CBDG_YEAR_LINK_FK] FOREIGN KEY ([CBDG_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [CBDG_CLASS_LINK]
    ON [dbo].[CO2_BUDGETS]([CBDG_CLASS_LINK] ASC);


GO
CREATE NONCLUSTERED INDEX [CBDG_1ST_CATEGORY_LINK]
    ON [dbo].[CO2_BUDGETS]([CBDG_1ST_CATEGORY_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CBDG_2ND_CATEGORY_LINK]
    ON [dbo].[CO2_BUDGETS]([CBDG_2ND_CATEGORY_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CBDG_YEAR_CBDG_PERIOD]
    ON [dbo].[CO2_BUDGETS]([CBDG_YEAR] ASC, [CBDG_PERIOD] ASC, [CBDG_CLASS_LINK] ASC, [CBDG_1ST_CATEGORY_LINK] ASC, [CBDG_2ND_CATEGORY_LINK] ASC, [CBDG_CO2] ASC) WITH (FILLFACTOR = 70);


GO
create trigger AA_CO2_BUDGETS_IOUT
/*
** Trigger to validate:
**    1) Validate link to row in NL_CATEGORIES for First Analysis Category. Because NL_CATEGORIES is a multi-purpose table it isn't
**       sufficient to check that the row exists in NL_CATEGORIES - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as a First Analysis Category which is identified by the
**       NCAT_NUMBER field. In order to implement this via a foriegn key would have required a computed column on
**       the CO2_BUDGETS table containing the constant "1". It was decided in discussion with NC & JS that an
**       instead of trigger would be preferable.
**    2) Validate link to row in NL_CATEGORIES for Second Analysis Category. Because NL_CATEGORIES is a multi-purpose table it
**       isn't sufficient to check that the row exists in NL_CATEGORIES - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as a Second Analysis Category which is identified by the
**       NCAT_NUMBER field. In order to implement this via a foriegn key would have required a computed column on
**       the CO2_BUDGETS table containing the constant "1". It was decided in discussion with NC & JS that an
**       instead of trigger would be preferable.
**
** The trigger fires instead of the update so it must explicitly perform the update if the test is passed.
**
** Written     :  15/01/2008 DB
** Last Amended:  30/10/2008 SM, 17/11/2008 SM, 07/06/2010 SM
*/
on CO2_BUDGETS
instead of update

as

declare
   @LT_Error                        bit
,  @LS_CO2_OPT_1ST_CATEGORY_GROUP   tinyint
,  @LS_CO2_OPT_2ND_CATEGORY_GROUP   tinyint

begin
   set @LT_Error = 0

   select
      @LS_CO2_OPT_1ST_CATEGORY_GROUP = CO2_OPT_1ST_CATEGORY_GROUP
   ,  @LS_CO2_OPT_2ND_CATEGORY_GROUP = CO2_OPT_2ND_CATEGORY_GROUP
      from
         SYS_CO2_OPTIONS with(nolock)
      where
         CO2_OPT_PRIMARY = 1
   if @@error <> 0
      or
      @@rowcount = 0
      begin
         set @LT_Error = 1
         raiserror('Unable to retrieve carbon system options',16,1)
         if @@trancount > 0
            rollback tran
      end

   if exists   -- Check that the First Analysis Category category link refers to a First Analysis Category
      (
         select
            1
            from
               inserted
                  inner join NL_CATEGORIES with(nolock) on NCAT_PRIMARY = CBDG_1ST_CATEGORY_LINK
            where
               NCAT_NUMBER <> @LS_CO2_OPT_1ST_CATEGORY_GROUP
      )
      begin
         set @LT_Error = 1
         raiserror('The First Analysis Category link doesn''t exists in NL_CATEGORIES as a First Analysis Category',16,1)
         if @@trancount>0
            rollback tran
      end

   if exists   -- Check that the Second Analysis Category category link refers to a Second Analysis Category
      (
         select
            1
            from
               inserted
                  inner join NL_CATEGORIES with(nolock) on NCAT_PRIMARY = CBDG_2ND_CATEGORY_LINK
            where
               NCAT_NUMBER <> @LS_CO2_OPT_2ND_CATEGORY_GROUP
      )
      begin
         set @LT_Error = 1
         raiserror('The Second Analysis Category link doesn''t exists in NL_CATEGORIES as a Second Analysis Category',16,1)
         if @@trancount>0
            rollback tran
      end

   if exists   -- Check that Year Link is populated
      (
         select
            1
            from
               inserted
            where
               CBDG_YEAR_LINK is null
               or
               CBDG_YEAR_LINK = 0
      )
      begin
         set @LT_Error = 1
         raiserror('Year Link must be poplated for Carbon Budgets',16,1)
         if @@trancount>0
            rollback tran
      end

   if @LT_Error = 0
      update CO2_BUDGETS
         set
            CBDG_CLASS_LINK            = inserted.CBDG_CLASS_LINK
         ,  CBDG_1ST_CATEGORY_LINK     = inserted.CBDG_1ST_CATEGORY_LINK
         ,  CBDG_2ND_CATEGORY_LINK     = inserted.CBDG_2ND_CATEGORY_LINK
         ,  CBDG_YEAR                  = inserted.CBDG_YEAR
         ,  CBDG_YEAR_LINK             = inserted.CBDG_YEAR_LINK
         ,  CBDG_PERIOD                = inserted.CBDG_PERIOD
         ,  CBDG_CO2                   = inserted.CBDG_CO2
         ,  CBDG_USER_EDITED           = inserted.CBDG_USER_EDITED
         ,  CBDG_DATE_EDITED           = inserted.CBDG_DATE_EDITED
            from
               inserted
                  inner join CO2_BUDGETS BDG  on BDG.CBDG_PRIMARY = inserted.CBDG_PRIMARY
end
GO
create trigger AA_CO2_BUDGETS_IOIT
/*
** Trigger to validate:
**    1) Validate link to row in NL_CATEGORIES for First Analysis Category. Because NL_CATEGORIES is a multi-purpose table it isn't
**       sufficient to check that the row exists in NL_CATEGORIES - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as a First Analysis Category which is identified by the
**       NCAT_NUMBER field. In order to implement this via a foriegn key would have required a computed column on
**       the CO2_BUDGETS table containing the constant "1". It was decided in discussion with NC & JS that an
**       instead of trigger would be preferable.
**    2) Validate link to row in NL_CATEGORIES for Second Analysis Category. Because NL_CATEGORIES is a multi-purpose table it
**       isn't sufficient to check that the row exists in NL_CATEGORIES - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as a Second Analysis Category which is identified by the
**       NCAT_NUMBER field. In order to implement this via a foriegn key would have required a computed column on
**       the CO2_BUDGETS table containing the constant "1". It was decided in discussion with NC & JS that an
**       instead of trigger would be preferable.
**
** The trigger fires instead of the insert so it must explicitly perform the insert if the test is passed.
**
** Written     :  15/01/2008 DB
** Last Amended:  30/10/2008 SM, 17/11/2008 SM, 07/06/2010 SM, 16/06/2010 DB
*/
on CO2_BUDGETS
instead of insert

as

declare
   @LT_Error                        bit
,  @LS_CO2_OPT_1ST_CATEGORY_GROUP   tinyint
,  @LS_CO2_OPT_2ND_CATEGORY_GROUP   tinyint

begin
   set @LT_Error = 0

   select
      @LS_CO2_OPT_1ST_CATEGORY_GROUP = CO2_OPT_1ST_CATEGORY_GROUP
   ,  @LS_CO2_OPT_2ND_CATEGORY_GROUP = CO2_OPT_2ND_CATEGORY_GROUP
      from
         SYS_CO2_OPTIONS with(nolock)
      where
         CO2_OPT_PRIMARY = 1
   if @@error <> 0
      or
      @@rowcount = 0
      begin
         set @LT_Error = 1
         raiserror('Unable to retrieve carbon system options',16,1)
         if @@trancount > 0
            rollback tran
      end
   
   if exists   -- Check that the First Analysis Category category link refers to a First Analysis Category
      (
         select
            1
            from
               inserted
                  inner join NL_CATEGORIES with(nolock) on NCAT_PRIMARY = CBDG_1ST_CATEGORY_LINK
            where
               NCAT_NUMBER <> @LS_CO2_OPT_1ST_CATEGORY_GROUP
      )
      begin
         set @LT_Error = 1
         raiserror('The First Analysis Category link doesn''t exists in NL_CATEGORIES as a First Analysis Category',16,1)
         if @@trancount > 0
            rollback tran
      end

   if exists   -- Check that the Second Analysis Category category link refers to a Second Analysis Category
      (
         select
            1
            from
               inserted
                  inner join NL_CATEGORIES with(nolock) on NCAT_PRIMARY = CBDG_2ND_CATEGORY_LINK
            where
               NCAT_NUMBER <> @LS_CO2_OPT_2ND_CATEGORY_GROUP
      )
      begin
         set @LT_Error = 1
         raiserror('The Second Analysis Category link doesn''t exists in NL_CATEGORIES as a Second Analysis Category',16,1)
         if @@trancount > 0
            rollback tran
      end

   if exists   -- Check that Year Link is populated
      (
         select
            1
            from
               inserted
            where
               CBDG_YEAR_LINK is null
               or
               CBDG_YEAR_LINK = 0
      )
      begin
         set @LT_Error = 1
         raiserror('Year Link must be poplated for Carbon Budgets',16,1)
         if @@trancount > 0
            rollback tran
      end

   if @LT_Error = 0
      insert into CO2_BUDGETS
      (
         CBDG_CLASS_LINK
      ,  CBDG_1ST_CATEGORY_LINK
      ,  CBDG_2ND_CATEGORY_LINK
      ,  CBDG_YEAR
      ,  CBDG_YEAR_LINK
      ,  CBDG_PERIOD
      ,  CBDG_CO2
      ,  CBDG_USER_PUTIN
      ,  CBDG_DATE_PUTIN
      ,  CBDG_SOURCE
      )
      select
         CBDG_CLASS_LINK
      ,  CBDG_1ST_CATEGORY_LINK
      ,  CBDG_2ND_CATEGORY_LINK
      ,  CBDG_YEAR
      ,  CBDG_YEAR_LINK
      ,  CBDG_PERIOD
      ,  CBDG_CO2
      ,  CBDG_USER_PUTIN
      ,  CBDG_DATE_PUTIN
      ,  CBDG_SOURCE
         from
            inserted
end
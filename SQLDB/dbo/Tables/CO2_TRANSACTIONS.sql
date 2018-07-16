CREATE TABLE [dbo].[CO2_TRANSACTIONS] (
    [CTRN_PRIMARY]              INT           NOT NULL,
    [CTRN_TYPE]                 VARCHAR (2)   NOT NULL,
    [CTRN_DETAIL_LINK]          FLOAT (53)    NULL,
    [CTRN_CST_DETAIL_LINK]      FLOAT (53)    NULL,
    [CTRN_POP_DETAIL_LINK]      FLOAT (53)    NULL,
    [CTRN_BATCHED]              BIT           DEFAULT ((0)) NOT NULL,
    [CTRN_CLASS_LINK]           INT           NOT NULL,
    [CTRN_1ST_CATEGORY_LINK]    INT           NULL,
    [CTRN_2ND_CATEGORY_LINK]    INT           NULL,
    [CTRN_DATE]                 DATETIME      NULL,
    [CTRN_YEAR]                 SMALLINT      NOT NULL,
    [CTRN_PERIOD]               TINYINT       NOT NULL,
    [CTRN_QUANTITY]             FLOAT (53)    NOT NULL,
    [CTRN_CONVERSION]           FLOAT (53)    NOT NULL,
    [CTRN_CO2]                  FLOAT (53)    NOT NULL,
    [CTRN_UOM_LINK]             FLOAT (53)    NOT NULL,
    [CTRN_NOTES]                VARCHAR (240) NULL,
    [CTRN_USER_PUTIN]           VARCHAR (4)   NOT NULL,
    [CTRN_DATE_PUTIN]           DATETIME      DEFAULT (getdate()) NOT NULL,
    [CTRN_USER_EDITED]          VARCHAR (4)   NULL,
    [CTRN_DATE_EDITED]          DATETIME      NULL,
    [CTRN_SOURCE]               VARCHAR (1)   NULL,
    [CTRN_INVERT_SIGN]          BIT           DEFAULT ((0)) NOT NULL,
    [CTRN_NL_ACCOUNT_LINK]      FLOAT (53)    NULL,
    [CTRN_ORIGINAL_DETAIL_LINK] FLOAT (53)    NULL,
    [CTRN_YEAR_LINK]            SMALLINT      NULL,
    [CTRN_GHG_SCOPE_LINK]       TINYINT       NOT NULL,
    [CTRN_SORT_KEY_1_LINK]      INT           NULL,
    [CTRN_SORT_KEY_2_LINK]      INT           NULL,
    [CTRN_SORT_KEY_3_LINK]      INT           NULL,
    [CTRN_SORT_KEY_4_LINK]      INT           NULL,
    [CTRN_CO2_SIGNED]           AS            ([dbo].[AA_VALUE_DPS_F]([CTRN_CO2]*case [CTRN_INVERT_SIGN] when (0) then (1.0) else (-1.0) end)),
    CONSTRAINT [CTRN_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CTRN_PRIMARY] ASC),
    CONSTRAINT [CTRN_DETAIL_LINK_CK] CHECK (upper([CTRN_TYPE])='CT' AND [CTRN_DETAIL_LINK] IS NULL AND [CTRN_POP_DETAIL_LINK] IS NULL AND [CTRN_CST_DETAIL_LINK] IS NOT NULL OR (upper([CTRN_TYPE])='PL' OR upper([CTRN_TYPE])='NL') AND [CTRN_DETAIL_LINK] IS NOT NULL AND [CTRN_CST_DETAIL_LINK] IS NULL AND [CTRN_POP_DETAIL_LINK] IS NULL OR upper([CTRN_TYPE])='C' AND [CTRN_CST_DETAIL_LINK] IS NULL AND [CTRN_DETAIL_LINK] IS NULL AND [CTRN_POP_DETAIL_LINK] IS NULL OR upper([CTRN_TYPE])='PO' AND [CTRN_CST_DETAIL_LINK] IS NULL AND ([CTRN_POP_DETAIL_LINK] IS NOT NULL AND [CTRN_BATCHED]=(1) OR [CTRN_DETAIL_LINK] IS NOT NULL AND [CTRN_BATCHED]=(0))),
    CONSTRAINT [CTRN_NL_ACCOUNT_LINK_CK] CHECK (upper([CTRN_TYPE])='C' AND [CTRN_NL_ACCOUNT_LINK] IS NULL OR upper([CTRN_TYPE])<>'C' AND [CTRN_NL_ACCOUNT_LINK] IS NOT NULL),
    CONSTRAINT [CTRN_ORIGINAL_DETAIL_LINK_CK] CHECK ([CTRN_DETAIL_LINK] IS NULL AND [CTRN_ORIGINAL_DETAIL_LINK] IS NULL OR [CTRN_DETAIL_LINK] IS NOT NULL AND [CTRN_ORIGINAL_DETAIL_LINK] IS NOT NULL),
    CONSTRAINT [CTRN_PERIOD_CK] CHECK ([CTRN_PERIOD]>=(1) AND [CTRN_PERIOD]<=(13)),
    CONSTRAINT [CTRN_YEAR_LINK_CK] CHECK ([CTRN_YEAR] IS NOT NULL AND [CTRN_YEAR_LINK] IS NOT NULL OR [CTRN_YEAR] IS NULL AND [CTRN_YEAR_LINK] IS NULL),
    CONSTRAINT [CTRN_1ST_CATEGORY_LINK_FK] FOREIGN KEY ([CTRN_1ST_CATEGORY_LINK]) REFERENCES [dbo].[NL_CATEGORIES] ([NCAT_PRIMARY]),
    CONSTRAINT [CTRN_2ND_CATEGORY_LINK_FK] FOREIGN KEY ([CTRN_2ND_CATEGORY_LINK]) REFERENCES [dbo].[NL_CATEGORIES] ([NCAT_PRIMARY]),
    CONSTRAINT [CTRN_CLASS_LINK_FK] FOREIGN KEY ([CTRN_CLASS_LINK]) REFERENCES [dbo].[CO2_CLASSIFICATIONS] ([CCLS_PRIMARY]),
    CONSTRAINT [CTRN_CST_DETAIL_LINK_FK] FOREIGN KEY ([CTRN_CST_DETAIL_LINK]) REFERENCES [dbo].[CST_DETAIL] ([CT_PRIMARY]) ON DELETE CASCADE,
    CONSTRAINT [CTRN_DETAIL_LINK_FK] FOREIGN KEY ([CTRN_DETAIL_LINK]) REFERENCES [dbo].[SL_PL_NL_DETAIL] ([DET_PRIMARY]) ON DELETE CASCADE,
    CONSTRAINT [CTRN_GHG_SCOPE_LINK_FK] FOREIGN KEY ([CTRN_GHG_SCOPE_LINK]) REFERENCES [dbo].[CO2_GHG_SCOPE] ([CGHGS_PRIMARY]),
    CONSTRAINT [CTRN_NL_ACCOUNT_LINK_FK] FOREIGN KEY ([CTRN_NL_ACCOUNT_LINK]) REFERENCES [dbo].[NL_ACCOUNTS] ([N_PRIMARY]),
    CONSTRAINT [CTRN_ORIGINAL_DETAIL_LINK_FK] FOREIGN KEY ([CTRN_ORIGINAL_DETAIL_LINK]) REFERENCES [dbo].[SL_PL_NL_DETAIL] ([DET_PRIMARY]),
    CONSTRAINT [CTRN_POP_DETAIL_LINK_FK] FOREIGN KEY ([CTRN_POP_DETAIL_LINK]) REFERENCES [dbo].[POP_DETAIL] ([POD_PRIMARY]),
    CONSTRAINT [CTRN_SORT_KEY_1_LINK_FK] FOREIGN KEY ([CTRN_SORT_KEY_1_LINK]) REFERENCES [dbo].[CO2_SORT_KEYS_1] ([CSK1_PRIMARY]),
    CONSTRAINT [CTRN_SORT_KEY_2_LINK_FK] FOREIGN KEY ([CTRN_SORT_KEY_2_LINK]) REFERENCES [dbo].[CO2_SORT_KEYS_2] ([CSK2_PRIMARY]),
    CONSTRAINT [CTRN_SORT_KEY_3_LINK_FK] FOREIGN KEY ([CTRN_SORT_KEY_3_LINK]) REFERENCES [dbo].[CO2_SORT_KEYS_3] ([CSK3_PRIMARY]),
    CONSTRAINT [CTRN_SORT_KEY_4_LINK_FK] FOREIGN KEY ([CTRN_SORT_KEY_4_LINK]) REFERENCES [dbo].[CO2_SORT_KEYS_4] ([CSK4_PRIMARY]),
    CONSTRAINT [CTRN_UOM_LINK_FK] FOREIGN KEY ([CTRN_UOM_LINK]) REFERENCES [dbo].[SYS_LOOKUP_TEXT] ([TXT_PRIMARY]),
    CONSTRAINT [CTRN_YEAR_LINK_FK] FOREIGN KEY ([CTRN_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [CTRN_CLASS_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_CLASS_LINK] ASC);


GO
CREATE NONCLUSTERED INDEX [CTRN_CST_DETAIL_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_CST_DETAIL_LINK] ASC);


GO
CREATE NONCLUSTERED INDEX [CTRN_DATE]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_DATE] ASC);


GO
CREATE NONCLUSTERED INDEX [CTRN_DETAIL_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_DETAIL_LINK] ASC);


GO
CREATE NONCLUSTERED INDEX [CTRN_1ST_CATEGORY_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_1ST_CATEGORY_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CTRN_2ND_CATEGORY_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_2ND_CATEGORY_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CTRN_POP_DETAIL_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_POP_DETAIL_LINK] ASC);


GO
CREATE NONCLUSTERED INDEX [CTRN_UOM_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_UOM_LINK] ASC);


GO
CREATE NONCLUSTERED INDEX [CTRN_NL_ACCOUNT_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_NL_ACCOUNT_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CTRN_SORT_KEY_1_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_SORT_KEY_1_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CTRN_SORT_KEY_2_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_SORT_KEY_2_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CTRN_SORT_KEY_3_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_SORT_KEY_3_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CTRN_SORT_KEY_4_LINK]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_SORT_KEY_4_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CTRN_YEAR_CTRN_PERIOD]
    ON [dbo].[CO2_TRANSACTIONS]([CTRN_YEAR] ASC, [CTRN_PERIOD] ASC, [CTRN_CLASS_LINK] ASC, [CTRN_1ST_CATEGORY_LINK] ASC, [CTRN_2ND_CATEGORY_LINK] ASC, [CTRN_BATCHED] ASC, [CTRN_INVERT_SIGN] ASC, [CTRN_CO2] ASC) WITH (FILLFACTOR = 70);


GO
create trigger AA_CO2_TRANSACTIONS_IOIT
/*
** Trigger to validate:
**    1) Validate link to row in NL_CATEGORIES for First Analysis Category. Because NL_CATEGORIES is a multi-purpose table it isn't
**       sufficient to check that the row exists in NL_CATEGORIES - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as a First Analysis Category which is identified by the
**       NCAT_NUMBER field. In order to implement this via a foriegn key would have required a computed column on
**       the CO2_TRANSACTIONS table containing the constant "1". It was decided in discussion with NC & JS that an
**       instead of trigger would be preferable.
**    2) Validate link to row in NL_CATEGORIES for Second Analysis Category. Because NL_CATEGORIES is a multi-purpose table it
**       isn't sufficient to check that the row exists in NL_CATEGORIES - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as a Second Analysis Category which is identified by the
**       NCAT_NUMBER field. In order to implement this via a foriegn key would have required a computed column on
**       the CO2_TRANSACTIONS table containing the constant "1". It was decided in discussion with NC & JS that an
**       instead of trigger would be preferable.
**    3) Validate link to row in SYS_LOOKUP_TEXT. Because SYS_LOOKUP_TEXT is a multi-purpose table it isn't
**       sufficient to check that the row exists in SYS_LOOKUP_TEXT - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as an Accounting for Carbon Emissions Unit of Measure which
**       is identified by the TXT_ORIGIN field. In order to implement this via a foriegn key would have required
**       a computed column on the CO2_TRANSACTIONS table containing the constant "CO2UOM". It was decided in discussion
**       with NC & JS that an instead of trigger would be preferable.
**
** The trigger fires instead of the insert so it must explicitly perform the insert if the test is passed.
**
** Written     :  08/01/2008 DB
** Last Amended:  10/06/2008 WW, 11/07/2008 SM, 28/08/2008 DB, 30/10/2008 SM, 17/11/2008 SM, 27/10/2009 RL, 11/05/2010 SM, 07/06/2010 SM
*/
on CO2_TRANSACTIONS
instead of insert

as

declare
   @LT_Error                        bit
,  @LT_CO2_OPT_1ST_CATEGORY_GROUP   tinyint
,  @LT_CO2_OPT_2ND_CATEGORY_GROUP   tinyint

begin
   set @LT_Error = 0

   select
      @LT_CO2_OPT_1ST_CATEGORY_GROUP   = isnull(CO2_OPT_1ST_CATEGORY_GROUP,0)
   ,  @LT_CO2_OPT_2ND_CATEGORY_GROUP   = isnull(CO2_OPT_2ND_CATEGORY_GROUP,0)
      from
         SYS_CO2_OPTIONS with(nolock)
      where
         CO2_OPT_PRIMARY = 1

   if exists   -- Check that the First Analysis Category link refers to a First Analysis Category
      (
         select
            1
            from
               inserted
                  inner join  NL_CATEGORIES     with(nolock)   on NCAT_PRIMARY   =  CTRN_1ST_CATEGORY_LINK
            where
               NCAT_NUMBER <> @LT_CO2_OPT_1ST_CATEGORY_GROUP
      )
      begin
         set @LT_Error = 1
         raiserror('The First Analysis Category link doesn''t exist in NL_CATEGORIES as a First Analysis Category',16,1)
      end
   
   if       @LT_CO2_OPT_1ST_CATEGORY_GROUP <> 0   -- Check that the First Analysis Category link is populated if option is on
      and   exists
      (
         select
            1
            from
               inserted
            where
               CTRN_1ST_CATEGORY_LINK is null
      )
      begin
         set @LT_Error = 1
         raiserror('The First Analysis Category must be populated as the system option is on',16,1)
      end

   if exists   -- Check that the Second Analysis Category link refers to a Second Analysis Category
      (
         select
            1
            from
               inserted
                  inner join  NL_CATEGORIES     with(nolock)   on NCAT_PRIMARY   =  CTRN_2ND_CATEGORY_LINK
            where
               NCAT_NUMBER <> @LT_CO2_OPT_2ND_CATEGORY_GROUP
      )
      begin
         set @LT_Error = 1
         raiserror('The Second Analysis Category link doesn''t exist in NL_CATEGORIES as a Second Analysis Category',16,1)
      end

   if       @LT_CO2_OPT_2ND_CATEGORY_GROUP <> 0   -- Check that the Second Analysis Category link is populated if option is on
      and   exists
      (
         select
            1
            from
               inserted
            where
               CTRN_2ND_CATEGORY_LINK is null
      )
      begin
         set @LT_Error = 1
         raiserror('The Second Analysis Category must be populated as the system option is on',16,1)
      end

   if exists   -- Check that the row linked to in SYS_LOOKUP_TEXT is an Accounting for Carbon Emissions Unit of Measure
      (
         select
            1
            from
               inserted
                  inner join SYS_LOOKUP_TEXT with(nolock)   on       TXT_PRIMARY =  CTRN_UOM_LINK
                                                               and   TXT_ORIGIN  <> 'CO2UOM'
      )
      begin
         set @LT_Error = 1
         raiserror('The Unit of Measure link doesn''t exist in SYS_LOOKUP_TEXT as a Unit of Measure',16,1)
      end

   if exists   -- Check that the batch status of the attached transaction matches the Carbon transaction
      (
         select
            1
            from
               inserted
                  inner join POP_DETAIL with(nolock)  on       POD_PRIMARY       = CTRN_POP_DETAIL_LINK
                                                         and   CTRN_TYPE         = 'PO'
                                                         and   (
                                                                  (
                                                                           CTRN_BATCHED   =  1
                                                                     and   POD_STATUS     =  2
                                                                  )
                                                               or
                                                                  (
                                                                           CTRN_BATCHED   =  0
                                                                     and   POD_STATUS     <> 2
                                                                  )
                                                               )
            where CTRN_DETAIL_LINK is NULL
         )
      begin
         set @LT_Error = 1
         raiserror('The batch status of the Carbon transaction must match the batch status of the associated Purchase Order',16,1)
      end

   if exists   -- Check that the batch status of the attached transaction matches the Carbon transaction
      (
         select
            1
            from
               inserted
                  inner join SL_PL_NL_DETAIL with(nolock)   on       DET_PRIMARY    =  CTRN_DETAIL_LINK
                                                               and   DET_BATCH_FLAG <> CTRN_BATCHED
                                                               and   CTRN_TYPE      in ('PL','NL')
      )
      begin
         set @LT_Error = 1
         raiserror('The batch status of the Carbon transaction must match the batch status of the associated transaction',16,1)
      end

   if exists   -- Check that the batch status of the attached transaction matches the Carbon transaction
      (
         select
            1
            from
               inserted
                  inner join CST_DETAIL with(nolock)  on       CT_PRIMARY     =  CTRN_CST_DETAIL_LINK
                                                         and   CT_BATCH_FLAG  <> CTRN_BATCHED
                                                         and   CTRN_TYPE      =  'CT'
      )
      begin
         set @LT_Error = 1
         raiserror('The batch status of the Carbon transaction must match the batch status of the associated Costing transaction',16,1)
      end

   if exists   -- Check if carbon transaction is batched
      (
         select
            1
            from
               inserted
            where
                     CTRN_BATCHED         = 1
               and   CTRN_TYPE            = 'C'
      )
      begin
         set @LT_Error = 1
         raiserror('Stand-alone transaction cannot be batched',16,1)
      end

   if exists   -- Check that Year Link is populated
      (
         select
            1
            from
               inserted
            where
               CTRN_YEAR_LINK is null
               or
               CTRN_YEAR_LINK = 0
      )
      begin
         set @LT_Error = 1
         raiserror('Year Link must be populated for Carbon Transactions',16,1)
         if @@trancount>0
            rollback tran
      end

   if @LT_Error = 0
      begin
         insert into CO2_TRANSACTIONS
         (
            CTRN_PRIMARY   -- This is a sequence so needs to be here
         ,  CTRN_TYPE
         ,  CTRN_DETAIL_LINK
         ,  CTRN_CST_DETAIL_LINK
         ,  CTRN_POP_DETAIL_LINK
         ,  CTRN_BATCHED
         ,  CTRN_CLASS_LINK
         ,  CTRN_1ST_CATEGORY_LINK
         ,  CTRN_2ND_CATEGORY_LINK
         ,  CTRN_DATE
         ,  CTRN_YEAR
         ,  CTRN_YEAR_LINK
         ,  CTRN_PERIOD
         ,  CTRN_QUANTITY
         ,  CTRN_CONVERSION
         ,  CTRN_CO2
         ,  CTRN_UOM_LINK
         ,  CTRN_NOTES
         ,  CTRN_USER_PUTIN
         ,  CTRN_DATE_PUTIN
         ,  CTRN_SOURCE
         ,  CTRN_INVERT_SIGN
         ,  CTRN_NL_ACCOUNT_LINK
         ,  CTRN_ORIGINAL_DETAIL_LINK
         ,  CTRN_GHG_SCOPE_LINK 
         ,  CTRN_SORT_KEY_1_LINK
         ,  CTRN_SORT_KEY_2_LINK
         ,  CTRN_SORT_KEY_3_LINK
         ,  CTRN_SORT_KEY_4_LINK
         )
         select
            CTRN_PRIMARY   -- This is a sequence so needs to be here
         ,  CTRN_TYPE
         ,  CTRN_DETAIL_LINK
         ,  CTRN_CST_DETAIL_LINK
         ,  CTRN_POP_DETAIL_LINK
         ,  CTRN_BATCHED
         ,  CTRN_CLASS_LINK
         ,  CTRN_1ST_CATEGORY_LINK
         ,  CTRN_2ND_CATEGORY_LINK
         ,  CTRN_DATE
         ,  CTRN_YEAR
         ,  CTRN_YEAR_LINK
         ,  CTRN_PERIOD
         ,  CTRN_QUANTITY
         ,  CTRN_CONVERSION
         ,  CTRN_CO2
         ,  CTRN_UOM_LINK
         ,  nullif(CTRN_NOTES,'')
         ,  CTRN_USER_PUTIN
         ,  CTRN_DATE_PUTIN
         ,  CTRN_SOURCE
         ,  CTRN_INVERT_SIGN
         ,  CTRN_NL_ACCOUNT_LINK
         ,  CTRN_ORIGINAL_DETAIL_LINK
         ,  CTRN_GHG_SCOPE_LINK 
         ,  CTRN_SORT_KEY_1_LINK
         ,  CTRN_SORT_KEY_2_LINK
         ,  CTRN_SORT_KEY_3_LINK
         ,  CTRN_SORT_KEY_4_LINK
            from
               inserted
      end
   else
      begin
         if @@trancount>0
            rollback tran
      end
end
GO
create trigger AA_CO2_TRANSACTIONS_IOUT
/*
** Trigger to validate:
**    1) Validate link to row in NL_CATEGORIES for First Analysis Category. Because NL_CATEGORIES is a multi-purpose table it isn't
**       sufficient to check that the row exists in NL_CATEGORIES - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as a First Analysis Category which is identified by the
**       NCAT_NUMBER field. In order to implement this via a foriegn key would have required a computed column on
**       the CO2_TRANSACTIONS table containing the constant "1". It was decided in discussion with NC & JS that an
**       instead of trigger would be preferable.
**    2) Validate link to row in NL_CATEGORIES for Second Analysis Category. Because NL_CATEGORIES is a multi-purpose table it
**       isn't sufficient to check that the row exists in NL_CATEGORIES - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as a Second Analysis Category which is identified by the
**       NCAT_NUMBER field. In order to implement this via a foriegn key would have required a computed column on
**       the CO2_TRANSACTIONS table containing the constant "1". It was decided in discussion with NC & JS that an
**       instead of trigger would be preferable.
**    3) Validate link to row in SYS_LOOKUP_TEXT. Because SYS_LOOKUP_TEXT is a multi-purpose table it isn't
**       sufficient to check that the row exists in SYS_LOOKUP_TEXT - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as an Accounting for Carbon Emissions Unit of Measure which
**       is identified by the TXT_ORIGIN field. In order to implement this via a foriegn key would have required
**       a computed column on the CO2_TRANSACTIONS table containing the constant "CO2UOM". It was decided in discussion
**       with NC & JS that an instead of trigger would be preferable.
**
** The trigger fires instead of the update so it must explicitly perform the update if the test is passed.
**
** Written     :  08/01/2008 DB
** Last Amended:  10/06/2008 WW, 28/08/2008 DB, 30/10/2008 SM, 17/11/2008 SM, 27/10/2009 RL, 11/05/2010 SM, 07/06/2010 SM, 16/11/10 NC
*/
on CO2_TRANSACTIONS
instead of update

as

declare
   @LT_Error                        bit
,  @LT_CO2_OPT_1ST_CATEGORY_GROUP   tinyint
,  @LT_CO2_OPT_2ND_CATEGORY_GROUP   tinyint

begin
   set @LT_Error = 0

   select
      @LT_CO2_OPT_1ST_CATEGORY_GROUP   = isnull(CO2_OPT_1ST_CATEGORY_GROUP,0)
   ,  @LT_CO2_OPT_2ND_CATEGORY_GROUP   = isnull(CO2_OPT_2ND_CATEGORY_GROUP,0)
      from
         SYS_CO2_OPTIONS with(nolock)
      where
         CO2_OPT_PRIMARY = 1

   if @LT_CO2_OPT_1ST_CATEGORY_GROUP <> 0
      and exists   -- Check that the First Analysis Category link refers to a First Analysis Category
      (
         select
            1
            from
               inserted
                  left join  NL_CATEGORIES     with(nolock)   on NCAT_PRIMARY   =  CTRN_1ST_CATEGORY_LINK
            where
               isnull(NCAT_NUMBER,0) <> @LT_CO2_OPT_1ST_CATEGORY_GROUP
      )
      begin
         set @LT_Error = 1
         raiserror('The First Analysis Category specified is not a First Analysis Category',16,1)
      end

   if @LT_CO2_OPT_1ST_CATEGORY_GROUP = 0
      and exists   -- Check that the First Analysis Category link has not been changed when not turned on
      (
         select
            1
            from
               inserted
                  join deleted on deleted.CTRN_PRIMARY = inserted.CTRN_PRIMARY
            where
               inserted.CTRN_1ST_CATEGORY_LINK is not null
               and isnull(inserted.CTRN_1ST_CATEGORY_LINK,0) <> isnull(deleted.CTRN_1ST_CATEGORY_LINK,0)
      )
      begin
         set @LT_Error = 1
         raiserror('The First Analysis Category cannot be changed as the system option for this is off',16,1)
      end

   if       @LT_CO2_OPT_1ST_CATEGORY_GROUP <> 0   -- Check that the First Analysis Category link is populated if option is on
      and   exists
      (
         select
            1
            from
               inserted
            where
               CTRN_1ST_CATEGORY_LINK is null
      )
      begin
         set @LT_Error = 1
         raiserror('The First Analysis Category must be populated as the system option for this is on',16,1)
      end

   if @LT_CO2_OPT_2ND_CATEGORY_GROUP <> 0
      and exists   -- Check that the Second Analysis Category link refers to a Second Analysis Category
      (
         select
            1
            from
               inserted
                  left join  NL_CATEGORIES     with(nolock)   on NCAT_PRIMARY   =  inserted.CTRN_2ND_CATEGORY_LINK
            where
               isnull(NCAT_NUMBER,0) <> @LT_CO2_OPT_2ND_CATEGORY_GROUP
      )
      begin
         set @LT_Error = 1
         raiserror('The Second Analysis Category doesn''t exist in NL_CATEGORIES as a Second Analysis Category',16,1)
      end

   if @LT_CO2_OPT_2ND_CATEGORY_GROUP = 0
      and exists   -- Check that the second Analysis Category link has not been changed when not turned on
      (
         select
            1
            from
               inserted
                  join deleted on deleted.CTRN_PRIMARY = inserted.CTRN_PRIMARY
            where
               inserted.CTRN_2ND_CATEGORY_LINK is not null
               and isnull(inserted.CTRN_2ND_CATEGORY_LINK,0) <> isnull(deleted.CTRN_2ND_CATEGORY_LINK,0)
      )
      begin
         set @LT_Error = 1
         raiserror('The Second Analysis Category cannot be changed as the system option for this is off',16,1)
      end

   if @LT_CO2_OPT_2ND_CATEGORY_GROUP <> 0   -- Check that the Second Analysis Category link is populated if option is on
      and   exists
      (
         select
            1
            from
               inserted
            where
               CTRN_2ND_CATEGORY_LINK is null
      )
      begin
         set @LT_Error = 1
         raiserror('The Second Analysis Category must be populated as the system option for this is on',16,1)
      end

   if exists   -- Check that the row linked to in SYS_LOOKUP_TEXT is an Accounting for Carbon Emissions Unit of Measure
      (
         select
            1
            from
               inserted
                  inner join SYS_LOOKUP_TEXT with(nolock) on         TXT_PRIMARY = CTRN_UOM_LINK
                                                               and   TXT_ORIGIN <> 'CO2UOM'
      )
      begin
         set @LT_Error = 1
         raiserror('The Unit of Measure link doesn''t exist in SYS_LOOKUP_TEXT as a Unit of Measure',16,1)
      end

   if exists   -- Check that Year Link is populated
      (
         select
            1
            from
               inserted
            where
               CTRN_YEAR_LINK is null
               or
               CTRN_YEAR_LINK = 0
      )
      begin
         set @LT_Error = 1
         raiserror('Year Link must be populated for Carbon Transactions',16,1)
         if @@trancount>0
            rollback tran
      end

   if @LT_Error = 0
      begin
         update CO2_TRANSACTIONS
            set
               CTRN_TYPE                  = inserted.CTRN_TYPE
            ,  CTRN_DETAIL_LINK           = inserted.CTRN_DETAIL_LINK
            ,  CTRN_CST_DETAIL_LINK       = inserted.CTRN_CST_DETAIL_LINK
            ,  CTRN_POP_DETAIL_LINK       = inserted.CTRN_POP_DETAIL_LINK
            ,  CTRN_BATCHED               = inserted.CTRN_BATCHED
            ,  CTRN_CLASS_LINK            = inserted.CTRN_CLASS_LINK
            ,  CTRN_1ST_CATEGORY_LINK     = inserted.CTRN_1ST_CATEGORY_LINK
            ,  CTRN_2ND_CATEGORY_LINK     = inserted.CTRN_2ND_CATEGORY_LINK
            ,  CTRN_DATE                  = inserted.CTRN_DATE
            ,  CTRN_YEAR                  = inserted.CTRN_YEAR
            ,  CTRN_YEAR_LINK             = inserted.CTRN_YEAR_LINK
            ,  CTRN_PERIOD                = inserted.CTRN_PERIOD
            ,  CTRN_QUANTITY              = inserted.CTRN_QUANTITY
            ,  CTRN_CONVERSION            = inserted.CTRN_CONVERSION
            ,  CTRN_CO2                   = inserted.CTRN_CO2
            ,  CTRN_UOM_LINK              = inserted.CTRN_UOM_LINK
            ,  CTRN_NOTES                 = nullif(inserted.CTRN_NOTES,'')
            ,  CTRN_USER_EDITED           = inserted.CTRN_USER_EDITED
            ,  CTRN_DATE_EDITED           = inserted.CTRN_DATE_EDITED
            ,  CTRN_INVERT_SIGN           = inserted.CTRN_INVERT_SIGN
            ,  CTRN_NL_ACCOUNT_LINK       = inserted.CTRN_NL_ACCOUNT_LINK
            ,  CTRN_ORIGINAL_DETAIL_LINK  = inserted.CTRN_ORIGINAL_DETAIL_LINK
            ,  CTRN_GHG_SCOPE_LINK        = inserted.CTRN_GHG_SCOPE_LINK
            ,  CTRN_SORT_KEY_1_LINK       = inserted.CTRN_SORT_KEY_1_LINK
            ,  CTRN_SORT_KEY_2_LINK       = inserted.CTRN_SORT_KEY_2_LINK
            ,  CTRN_SORT_KEY_3_LINK       = inserted.CTRN_SORT_KEY_3_LINK
            ,  CTRN_SORT_KEY_4_LINK       = inserted.CTRN_SORT_KEY_4_LINK
               from
                  inserted
                     inner join CO2_TRANSACTIONS TRN  on TRN.CTRN_PRIMARY = inserted.CTRN_PRIMARY
      end
   else
      begin
         if @@trancount>0
            rollback tran
      end
end
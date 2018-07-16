CREATE TABLE [dbo].[SL_TRANSACTIONS] (
    [ST_TRANTYPE]             VARCHAR (3)  NULL,
    [ST_HEADER_REF]           VARCHAR (10) NULL,
    [ST_DESCRIPTION]          VARCHAR (30) NULL,
    [ST_DATE]                 DATETIME     NULL,
    [ST_DUEDATE]              DATETIME     NULL,
    [ST_ANTICPAYDATE]         DATETIME     NULL,
    [ST_SETT_DISC_1]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_SETT_DISC_2]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_SETT_DAYS_1]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_SETT_DAYS_2]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_NETT]                 FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_VAT]                  FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_GROSS]                FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_UNALLOCATED]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_BATCH_FLAG]           TINYINT      DEFAULT ((0)) NULL,
    [ST_BATCH_REF]            VARCHAR (10) NULL,
    [ST_ARCHIVE_FLAG]         TINYINT      DEFAULT ((0)) NULL,
    [ST_ALOC_POINTER]         VARCHAR (11) NULL,
    [ST_ORIGIN]               VARCHAR (2)  NULL,
    [ST_REVALUE_RATE]         FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_CURRENCYRATE]         FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_CURRENCYCODE]         VARCHAR (4)  NULL,
    [ST_CURR_VALU]            FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_CURR_UNAL]            FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_CURRENCYRTCH]         TINYINT      DEFAULT ((0)) NULL,
    [ST_CURRENCYEXDF]         FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_EXPORT_CODE]          VARCHAR (1)  NULL,
    [ST_EC_DEL_TERMS]         VARCHAR (3)  NULL,
    [ST_EC_T_NATURE]          VARCHAR (2)  NULL,
    [ST_EC_T_MODE]            VARCHAR (1)  NULL,
    [ST_REVALUED]             FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_REVALUE_DATE]         DATETIME     NULL,
    [ST_QUERY_FLAG]           TINYINT      DEFAULT ((0)) NULL,
    [ST_DONOTCHASE]           TINYINT      DEFAULT ((0)) NULL,
    [ST_CHASE1]               TINYINT      DEFAULT ((0)) NULL,
    [ST_CHASE2]               TINYINT      DEFAULT ((0)) NULL,
    [ST_CHASE3]               TINYINT      DEFAULT ((0)) NULL,
    [ST_PERIODNUMBER]         TINYINT      DEFAULT ((0)) NULL,
    [ST_YEAR]                 VARCHAR (1)  NULL,
    [ST_ALLOC_USER1]          VARCHAR (4)  NULL,
    [ST_ALLOC_USER2]          VARCHAR (4)  NULL,
    [ST_ALLOC_USER3]          VARCHAR (4)  NULL,
    [ST_ALLOC_DATE1]          DATETIME     NULL,
    [ST_ALLOC_DATE2]          DATETIME     NULL,
    [ST_ALLOC_DATE3]          DATETIME     NULL,
    [ST_ALLOC_VALU1]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_ALLOC_VALU2]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_ALLOC_VALU3]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_ALLOC_REF1]           VARCHAR (10) NULL,
    [ST_ALLOC_REF2]           VARCHAR (10) NULL,
    [ST_ALLOC_REF3]           VARCHAR (10) NULL,
    [ST_ALLOC_PERIOD]         TINYINT      DEFAULT ((0)) NULL,
    [ST_ALLOC_YEAR]           VARCHAR (1)  NULL,
    [ST_T_DISCVAL]            FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_T_DISCVAL_C]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_L_DISCVAL]            FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_L_DISCVAL_C]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_COST_VALUE]           FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_USER_PUTIN]           VARCHAR (4)  NULL,
    [ST_DATE_PUTIN]           DATETIME     NULL,
    [ST_MU_STATUS]            VARCHAR (1)  NULL,
    [ST_USER1]                VARCHAR (20) NULL,
    [ST_USER2]                VARCHAR (20) NULL,
    [ST_USER3]                VARCHAR (20) NULL,
    [ST_BATCH_POSTED]         VARCHAR (1)  NULL,
    [ST_PRINTED_FLAG]         TINYINT      DEFAULT ((0)) NULL,
    [ST_CON_REFTYPE]          VARCHAR (11) NULL,
    [ST_ORDER_NUMBER]         FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_COPYCUST]             VARCHAR (10) NULL,
    [ST_REBUILDNUM]           FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_PRIMARY]              FLOAT (53)   NOT NULL,
    [ST_HEADER_KEY]           VARCHAR (20) NULL,
    [ST_SUB_LEDGER]           VARCHAR (10) NULL,
    [ST_ALLOC_CBREF]          VARCHAR (10) NULL,
    [ST_CENTRALISED]          TINYINT      DEFAULT ((0)) NULL,
    [ST_RECONCILED]           TINYINT      DEFAULT ((0)) NULL,
    [ST_ALLOC_XREF]           VARCHAR (15) NULL,
    [ST_NETT_BASE2]           FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_VAT_BASE2]            FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_GROSS_BASE2]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_L_DISC_BASE2]         FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_T_DISC_BASE2]         FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_BASE2_RATE]           FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_TRI_RATE1]            FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_BASE2_RATECHNG]       TINYINT      DEFAULT ((0)) NULL,
    [ST_TRI_RATECHNG1]        TINYINT      DEFAULT ((0)) NULL,
    [ST_RND_DIFF_BASE1]       FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_COSTVALUE_BASE2]      FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_CURR_NETT]            FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_CURR_TAX]             FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_CURR_TYPE]            VARCHAR (1)  NULL,
    [ST_TRI_RATE2]            FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_TRI_RATECHNG2]        TINYINT      DEFAULT ((0)) NULL,
    [ST_RND_DIFF_POSTED]      TINYINT      DEFAULT ((0)) NULL,
    [ST_SPCL_TRANTYPE]        VARCHAR (20) NULL,
    [ST_SRV_STATUS]           TINYINT      DEFAULT ((0)) NULL,
    [ST_RND_DIFF_BASE2]       FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_SOURCE]               VARCHAR (1)  NULL,
    [ST_TRAN_OPTIONS]         VARCHAR (30) NULL,
    [ST_REVERSE_VAT]          FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_REVERSE_VAT_BASE2]    FLOAT (53)   DEFAULT ((0)) NULL,
    [ST_DEBT_STATUS_LINK]     INT          DEFAULT ((0)) NULL,
    [ST_CREDIT_CONTROLLER]    VARCHAR (4)  NULL,
    [ST_WRITE_OFF_STATUS]     TINYINT      DEFAULT ((0)) NULL,
    [ST_NOM_CAT_LINK]         INT          NULL,
    [ST_YEAR_LINK]            SMALLINT     NULL,
    [ST_ALLOC_YEAR_LINK]      SMALLINT     NULL,
    [ST_WFF_APPROVAL_STATUS]  SMALLINT     DEFAULT ((0)) NULL,
    [ST_DD_COLLECTION_STATUS] VARCHAR (1)  NULL,
    [ST_QUERIED_IN_ACLOUD]    BIT          DEFAULT ((0)) NOT NULL,
    [ST_SETT_DISC_CRN_FLAG]   BIT          DEFAULT ((0)) NULL,
    CONSTRAINT [ST_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ST_PRIMARY] ASC),
    CONSTRAINT [ST_ALLOC_YEAR_LINK_CK] CHECK ([ST_ALLOC_YEAR] IS NOT NULL AND (upper([ST_ALLOC_YEAR])='O' OR upper([ST_ALLOC_YEAR])='N' OR upper([ST_ALLOC_YEAR])='C' OR upper([ST_ALLOC_YEAR])='L') AND [ST_ALLOC_YEAR_LINK] IS NOT NULL OR ([ST_ALLOC_YEAR] IS NULL OR (upper([ST_ALLOC_YEAR])='O' OR upper([ST_ALLOC_YEAR])='')) AND [ST_ALLOC_YEAR_LINK] IS NULL),
    CONSTRAINT [ST_DD_COLLECTION_STATUS_CK] CHECK ([ST_DD_COLLECTION_STATUS]='R' OR [ST_DD_COLLECTION_STATUS]='X' OR [ST_DD_COLLECTION_STATUS]='B' OR [ST_DD_COLLECTION_STATUS]=''),
    CONSTRAINT [ST_YEAR_LINK_CK] CHECK ([ST_YEAR] IS NOT NULL AND (upper([ST_YEAR])='O' OR upper([ST_YEAR])='N' OR upper([ST_YEAR])='C' OR upper([ST_YEAR])='L') AND [ST_YEAR_LINK] IS NOT NULL OR ([ST_YEAR] IS NULL OR (upper([ST_YEAR])='O' OR upper([ST_YEAR])='')) AND [ST_YEAR_LINK] IS NULL),
    CONSTRAINT [ST_ALLOC_YEAR_LINK_FK] FOREIGN KEY ([ST_ALLOC_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY]),
    CONSTRAINT [ST_NOM_CAT_LINK_FK] FOREIGN KEY ([ST_NOM_CAT_LINK]) REFERENCES [dbo].[NL_CATEGORIES] ([NCAT_PRIMARY]),
    CONSTRAINT [ST_YEAR_LINK_FK] FOREIGN KEY ([ST_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [ST_ALOC_POINTER]
    ON [dbo].[SL_TRANSACTIONS]([ST_ALOC_POINTER] ASC);


GO
CREATE NONCLUSTERED INDEX [ST_BATCH_FLAG]
    ON [dbo].[SL_TRANSACTIONS]([ST_BATCH_FLAG] ASC);


GO
CREATE NONCLUSTERED INDEX [ST_BATCH_POSTED]
    ON [dbo].[SL_TRANSACTIONS]([ST_BATCH_POSTED] ASC);


GO
CREATE NONCLUSTERED INDEX [ST_BATCH_REF]
    ON [dbo].[SL_TRANSACTIONS]([ST_BATCH_REF] ASC);


GO
CREATE NONCLUSTERED INDEX [ST_CON_REFTYPE]
    ON [dbo].[SL_TRANSACTIONS]([ST_CON_REFTYPE] ASC);


GO
CREATE NONCLUSTERED INDEX [ST_COPYCUST]
    ON [dbo].[SL_TRANSACTIONS]([ST_COPYCUST] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ST_HEADER_KEY]
    ON [dbo].[SL_TRANSACTIONS]([ST_HEADER_KEY] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [ST_HEADER_REF]
    ON [dbo].[SL_TRANSACTIONS]([ST_HEADER_REF] ASC);


GO
CREATE NONCLUSTERED INDEX [ST_PERIODNUMBER]
    ON [dbo].[SL_TRANSACTIONS]([ST_PERIODNUMBER] ASC);


GO
CREATE NONCLUSTERED INDEX [ST_TRANTYPE]
    ON [dbo].[SL_TRANSACTIONS]([ST_TRANTYPE] ASC, [ST_ALOC_POINTER] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SL_TRANSACTIONS_ST_COPYCUST_ST_UNALLOCATED_ST_BATCH_FLAG_ST_ALOC_POINTER_ST_CURRENCYCODE]
    ON [dbo].[SL_TRANSACTIONS]([ST_COPYCUST] ASC, [ST_UNALLOCATED] ASC, [ST_BATCH_FLAG] ASC, [ST_ALOC_POINTER] ASC, [ST_CURRENCYCODE] ASC)
    INCLUDE([ST_TRANTYPE], [ST_HEADER_REF], [ST_DESCRIPTION], [ST_DATE], [ST_SETT_DISC_1], [ST_SETT_DISC_2], [ST_SETT_DAYS_1], [ST_SETT_DAYS_2], [ST_NETT], [ST_VAT], [ST_GROSS], [ST_CURRENCYRATE], [ST_CURR_VALU], [ST_CURR_UNAL], [ST_QUERY_FLAG], [ST_PERIODNUMBER], [ST_YEAR], [ST_ALLOC_PERIOD], [ST_ALLOC_YEAR], [ST_ORDER_NUMBER], [ST_PRIMARY], [ST_SUB_LEDGER], [ST_GROSS_BASE2], [ST_BASE2_RATE], [ST_TRI_RATE1], [ST_CURR_NETT], [ST_CURR_TAX], [ST_CURR_TYPE], [ST_TRI_RATE2]);


GO
CREATE NONCLUSTERED INDEX [IX_SL_TRANSACTIONS_ST_COPYCUST_ST_BATCH_FLAG]
    ON [dbo].[SL_TRANSACTIONS]([ST_COPYCUST] ASC, [ST_BATCH_FLAG] ASC)
    INCLUDE([ST_TRANTYPE], [ST_HEADER_REF], [ST_DESCRIPTION], [ST_DATE], [ST_DUEDATE], [ST_NETT], [ST_VAT], [ST_GROSS], [ST_UNALLOCATED], [ST_BATCH_REF], [ST_PERIODNUMBER], [ST_YEAR], [ST_DATE_PUTIN], [ST_ORDER_NUMBER], [ST_PRIMARY], [ST_HEADER_KEY], [ST_RECONCILED], [ST_REVERSE_VAT]);


GO
CREATE TRIGGER [dbo].[AA_SL_TRAN_INSERT_T]
    ON [dbo].[SL_TRANSACTIONS]
    WITH ENCRYPTION
    AFTER INSERT, UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
create trigger AA_SL_TRANSACTIONS_IODT
/*
** Trigger for enforcing Sales transaction delete business rules.
** The trigger fires whenever an attempt is made to delete a Sales
** transaction.
**
** Written     :  14/06/2007 DB
** Last Amended: 17/5/11 JS, 16/6/11 NC, 6/7/11 NC
*/
on SL_TRANSACTIONS
instead of delete

as

set nocount on

declare
   @LT_ErrorPrimary        int
,  @LT_ErrorType           tinyint
,  @LT_ErrorText           varchar(255)
,  @LT_TriggerName         sysname
,  @LT_BATCH_FLAG          bit
,  @LT_JumpCode            varchar(25)
,  @LT_ST_Primary          int
,  @LT_ParameterList       nvarchar(max)
,  @LT_DeleteParameterList nvarchar(max)
,  @LT_SqlText             nvarchar(max)
,  @LT_SqlDeleteText       nvarchar(max)
,  @LT_LinkColumn          sysname
,  @LT_ApprovalRecType     varchar(60)
,  @LT_IdColumn            sysname
,  @LT_TableName           sysname
,  @LT_LastTableName       sysname


set @LT_TriggerName = 'AA_SL_TRANSACTIONS_IODT'

begin
   if exists(select 1 from deleted where ST_BATCH_FLAG = 1)
      set @LT_BATCH_FLAG = 1
   else
      set @LT_BATCH_FLAG = 0

   if       @LT_BATCH_FLAG = 1                                    -- Much quicker than count because
      and   exists(select 1 from deleted where ST_BATCH_FLAG = 0) -- exists seeks on index where as count scans
      begin
         if @@trancount>0
            rollback tran
         raiserror
         (
            '%s: Batched and non-batched transactions cannot be deleted at the same time.'
         ,  16
         ,  1
         ,  @LT_TriggerName
         )
         return
      end

   if @LT_BATCH_FLAG = 0
      begin
         select
            @LT_ErrorPrimary  = ErrorPrimary
         ,  @LT_ErrorType     = ErrorType
            from
               (
                  select top 1   -- Encourage index seek
                     ST_PRIMARY  ErrorPrimary
                  ,  1           ErrorType
                     from
                        deleted
                     where
                              ST_BATCH_FLAG     = 0
                        and   ST_ARCHIVE_FLAG   = 1
                  union all
                  select top 1   -- Encourage index seek
                     ST_PRIMARY  ErrorPrimary
                  ,  2           ErrorType
                     from
                        deleted
                     where
                              ST_BATCH_FLAG     = 0
                        and   ST_ALOC_POINTER   like '0%'
               )  Errors

         if @LT_ErrorType is null   -- Perform separately as can only scan
            select top 1
               @LT_ErrorPrimary  = ST_PRIMARY
            ,  @LT_ErrorType     = 3
               from
                  deleted
                     inner join SL_PL_NL_DETAIL with(nolock)   on       DET_HEADER_KEY = ST_HEADER_KEY
                                                                  and   DET_LEDGER    <> 'NL'
               where
                  ST_BATCH_FLAG  = 0
      end

   if @LT_ErrorType is null   -- Perform separately as can only scan
      select top 1
         @LT_ErrorPrimary  = ST_PRIMARY
      ,  @LT_ErrorType     = 4
         from
            deleted
         where
            ST_SRV_STATUS <> 0

   if @LT_ErrorType is not null
      begin
         if @@trancount > 0
            rollback tran

         set @LT_ErrorText =  'Sales transaction with audit number '+convert(varchar,@LT_ErrorPrimary)+' '
                              +
                              case @LT_ErrorType
                                 when 1 then 'has not been allocated.'
                                 when 2 then 'has been archived.'
                                 when 3 then 'is not in the batch and therefore cannot be deleted, except as part of a Year End purge.'
                                 when 4 then 'cannot be deleted as it is being processed by another user!'
                                 else
                                    'has an unknown error.'
                              end
         raiserror
         (
            '%s: %s'
         ,  16
         ,  1
         ,  @LT_TriggerName
         ,  @LT_ErrorText
         )
         return
      end

   begin tran
      if exists(select 1 from sys.tables where name = 'TS_CUSTOM_FORM_NAV')
         begin
            /* Cursor to loop through the delted table*/
            declare CSR_Deleted_Trans_Lines cursor local fast_forward for
            select
               ST_PRIMARY
            from
               deleted
            order by
               ST_PRIMARY

            open CSR_Deleted_Trans_Lines
            while 0 = 0
               begin
                  fetch next from CSR_Deleted_Trans_Lines
                     into
                        @LT_ST_Primary
                  if @@fetch_Status <> 0
                     break

                  set @LT_SqlText =
                  'select top 1
                     @PT_LinkColumn      = max(CFSH_PREFIX) + ''_'' + max(CFSD_COLUMN_NAME)
                  ,  @PT_ApprovalRecType = max(CFSH_UNIQUE_CODE)
                  ,  @PT_IdColumn        = max(CFSH_PREFIX) + ''_ID''
                  ,  @PT_TableName       = max(CFSH_TABLE_NAME)
                  from       TS_CUSTOM_FORM_NAV with(nolock)
                  inner join TS_CUSTOM_FORM_SETUP_HEAD with(nolock) on CFSH_UNIQUE_CODE = NAV_CFSH_UNIQUE_CODE
                  inner join TS_CUSTOM_FORM_SETUP_DETAIL with(nolock) on CFSH_PRIMARY = CFSD_CFSH_PRIMARY
                  where
                  NAV_APPLICATION = ''DIM''
                  and
                  NAV_RUN_FROM in (''TRANSACTION-H'',''TRANSACTION-S'')
                  and
                  NAV_CODE in (''SL-TRN-ADJ-DEB'',''SL-TRN-ADJ-CRE'',''SL-TRN-RCT'',''SL-TRN-INV'',''SL-TRN-CRN'')
                  and
                  CFSD_IS_KEY = 1
                  and
                  CFSD_COL_TYPE = 1
                  group by
                  CFSH_PRIMARY
                  having max(CFSH_TABLE_NAME) > @PT_LastTableName
                  order by max(CFSH_TABLE_NAME)
                  '
                  set @LT_ParameterList = N'@PT_LinkColumn       sysname output,
                                            @PT_ApprovalRecType  varchar(60) output,
                                            @PT_IdColumn         sysname output,
                                            @PT_TableName        sysname output,
                                            @PT_LastTableName    sysname'

                  select @LT_LastTableName = '', @LT_TableName = ''

                  while (1 = 1) --@LT_LastTableName <> '' or @LT_TableName <> ''
                     begin
                        exec sp_executesql @LT_SqlText
                           , @LT_ParameterList
                           , @PT_LinkColumn      = @LT_LinkColumn       output
                           , @PT_ApprovalRecType = @LT_ApprovalRecType  output
                           , @PT_IdColumn        = @LT_IdColumn         output
                           , @PT_TableName       = @LT_TableName        output
                           , @PT_LastTableName   = @LT_LastTableName
                        if @LT_TableName = @LT_LastTableName or @@error <> 0
                           break
                        set @LT_LastTableName = @LT_TableName

                        set @LT_SqlDeleteText = 'delete from TS_APPROVAL_LOG '
                                                + 'where APAL_RECORD_TYPE = ''' + @LT_ApprovalRecType
                                                + ''' and APAL_RECORD_LINK in '
                                                   + '(select ' + @LT_IdColumn
                                                      + ' from ' + @LT_TableName
                                                      + ' where ' + @LT_LinkColumn + ' = ''SLH-' + cast(@LT_ST_Primary as varchar)
                                                   + ''')'
                                            + '; delete from ' + @LT_TableName
                                                   + ' where ' + @LT_LinkColumn + ' = ''SLH-' +  cast(@LT_ST_Primary as varchar)
                                                   + ''''
                        exec sp_executesql @LT_SqlDeleteText;
                     end
               end
             deallocate CSR_Deleted_Trans_Lines
        end
      /* Delete existing de+tail lines if deleting from batch otherwise raise a message to this effect */
      if @LT_BATCH_FLAG = 1
         delete from SL_PL_NL_DETAIL
            from
               deleted
                  inner join SL_PL_NL_DETAIL    on DET_HEADER_KEY    = ST_HEADER_KEY

      /* Delete secondary record */
      delete from SL_TRANSACTIONS2
         from
            deleted
               inner join SL_TRANSACTIONS2      on ST_PRIMARY_2      = ST_PRIMARY

      /* Delete any transaction notes */
      delete from SL_TRANSACTION_NOTES
         from
            deleted
               inner join SL_TRANSACTION_NOTES  on ST_COPY_HEADERKEY = ST_HEADER_KEY

      /* Delete any notes */
      delete from SL_NOTES    -- Cascading Foreign Key will remove links as well
         from
            deleted
               inner join SL_NOTES_LINK         on SLN_LINK_TRANSACTION = ST_PRIMARY
               inner join SL_NOTES              on SLN_PRIMARY          = SLN_LINK_NOTE

      /* Delete the Allocation history records */
      delete from SL_ALLOC_HISTORY
         from
            deleted
               inner join SL_ALLOC_HISTORY      on S_AL_HEADER_KEY   = ST_HEADER_KEY

      delete from SL_TRANSACTIONS
         from
            deleted
               inner join SL_TRANSACTIONS ST    on ST.ST_PRIMARY     = deleted.ST_PRIMARY


   commit tran
end
CREATE TABLE [dbo].[POP_DETAIL] (
    [POD_HEADER_REF]           VARCHAR (25)  NULL,
    [POD_ORDER_REF]            VARCHAR (20)  NULL,
    [POD_TYPE]                 VARCHAR (1)   NULL,
    [POD_STATUS]               TINYINT       DEFAULT ((0)) NULL,
    [POD_ENTRY_TYPE]           VARCHAR (1)   NULL,
    [POD_DATE]                 DATETIME      NULL,
    [POD_REQDATE]              DATETIME      NULL,
    [POD_DETAIL]               VARCHAR (240) NULL,
    [POD_QTYORD]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_QTYDELVD]             FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_QTYINVD]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_QTYUNIT]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_QTYRESERVED]          FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_QTYPRINTED]           FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_UNITCST]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_UNITCST_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_NETT]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_NETT_C]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_VATCODE]              VARCHAR (4)   NULL,
    [POD_VATAMNT]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_TAX_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_ACQ_TAX]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_GROSS]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_GROSS_C]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POP_SD_MEMO]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_MATRIXCODE]           VARCHAR (20)  NULL,
    [POD_TABLECODE]            VARCHAR (3)   NULL,
    [POD_LINEDISC]             FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_L_DISCVAL]            FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_L_DISCVAL_C]          FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_T_DISCVAL]            FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_T_DISCVAL_C]          FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_SERIALTRACK]          TINYINT       DEFAULT ((0)) NULL,
    [POD_SERIALNO]             VARCHAR (40)  NULL,
    [POD_LOCATN]               VARCHAR (25)  NULL,
    [POD_QUERY]                TINYINT       DEFAULT ((0)) NULL,
    [POD_ARCHIVE]              TINYINT       DEFAULT ((0)) NULL,
    [POD_PERIOD]               TINYINT       DEFAULT ((0)) NULL,
    [POD_YEAR]                 VARCHAR (1)   NULL,
    [POD_BATCH_FLAG]           TINYINT       DEFAULT ((0)) NULL,
    [POD_BATCH_REF]            VARCHAR (10)  NULL,
    [POD_BATCH_POSTD]          TINYINT       DEFAULT ((0)) NULL,
    [POD_LEDGER]               VARCHAR (2)   NULL,
    [POD_LAST_ACTION]          VARCHAR (1)   NULL,
    [POD_USER_PUTIN]           VARCHAR (4)   NULL,
    [POD_DATE_PUTIN]           DATETIME      NULL,
    [POD_MU_STATUS]            VARCHAR (1)   NULL,
    [POD_ORDER_NO]             VARCHAR (10)  NULL,
    [POD_ACCOUNT]              VARCHAR (10)  NULL,
    [POD_ANALYSIS]             VARCHAR (25)  NULL,
    [POD_STOCK_CODE]           VARCHAR (25)  NULL,
    [POD_PRICE_CODE]           VARCHAR (16)  NULL,
    [POD_COSTHEADER]           VARCHAR (10)  NULL,
    [POD_COSTCENTRE]           VARCHAR (10)  NULL,
    [POD_PRIMARY]              FLOAT (53)    NOT NULL,
    [POD_VATNONDEDUCT]         FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_BUDGET_NL]            TINYINT       DEFAULT ((0)) NULL,
    [POD_BUDGET_CST]           TINYINT       DEFAULT ((0)) NULL,
    [POD_RTP_USERID]           VARCHAR (4)   NULL,
    [POD_RTP_EXCEED_BUDGET]    TINYINT       DEFAULT ((0)) NULL,
    [POD_BUDGET_INDICATOR]     TINYINT       DEFAULT ((0)) NULL,
    [POD_AUTHORISED_BYUSER]    VARCHAR (4)   NULL,
    [POD_RTPFLAG]              TINYINT       DEFAULT ((0)) NULL,
    [POD_SOPFLAG]              TINYINT       DEFAULT ((0)) NULL,
    [POD_GROSS_MEMO]           FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_LANDED_COST]          TINYINT       DEFAULT ((0)) NULL,
    [POD_DIMENSION1]           VARCHAR (20)  NULL,
    [POD_DIMENSION2]           VARCHAR (20)  NULL,
    [POD_DIMENSION3]           VARCHAR (20)  NULL,
    [POD_UNITCST_BASE2]        FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_NETT_BASE2]           FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_VAT_BASE2]            FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_GROSS_BASE2]          FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_L_DISC_BASE2]         FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_T_DISC_BASE2]         FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_ACQUISTN_BASE2]       FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_LINE_NUMBER]          FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_STOCK_ANALYSIS]       VARCHAR (25)  NULL,
    [POD_DELIVERY_CHARGE_FLAG] TINYINT       DEFAULT ((0)) NULL,
    [POD_CURR_RTEFLG]          BIT           DEFAULT ((0)) NULL,
    [POD_TRI_RATECHNG1]        BIT           DEFAULT ((0)) NULL,
    [POD_TRI_RATECHNG2]        BIT           DEFAULT ((0)) NULL,
    [POD_BASE2_RATECHNG]       BIT           DEFAULT ((0)) NULL,
    [POD_CURR_RATE]            FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_TRI_RATE1]            FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_TRI_RATE2]            FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_BASE2_RATE]           FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_YEAR_LINK]            SMALLINT      NULL,
    [POD_VAT_RATE]             FLOAT (53)    NULL,
    [POD_SERVICE]              BIT           DEFAULT ((0)) NOT NULL,
    [POD_CURRENCY_PRICE_ENTRY] BIT           DEFAULT ((0)) NULL,
    CONSTRAINT [POD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([POD_PRIMARY] ASC),
    CONSTRAINT [POD_YEAR_LINK_CK] CHECK ([POD_YEAR] IS NOT NULL AND (upper([POD_YEAR])='O' OR upper([POD_YEAR])='N' OR upper([POD_YEAR])='C' OR upper([POD_YEAR])='L') AND [POD_YEAR_LINK] IS NOT NULL OR ([POD_YEAR] IS NULL OR (upper([POD_YEAR])='O' OR upper([POD_YEAR])='')) AND [POD_YEAR_LINK] IS NULL),
    CONSTRAINT [POD_YEAR_LINK_FK] FOREIGN KEY ([POD_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [POD_ANALYSIS]
    ON [dbo].[POP_DETAIL]([POD_ANALYSIS] ASC);


GO
CREATE NONCLUSTERED INDEX [POD_COSTHEADER]
    ON [dbo].[POP_DETAIL]([POD_COSTHEADER] ASC);


GO
CREATE NONCLUSTERED INDEX [POD_ORDER_NO]
    ON [dbo].[POP_DETAIL]([POD_ORDER_NO] ASC);


GO
CREATE NONCLUSTERED INDEX [POD_PRICE_CODE]
    ON [dbo].[POP_DETAIL]([POD_PRICE_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [POD_STOCK_CODE]
    ON [dbo].[POP_DETAIL]([POD_STOCK_CODE] ASC, [POD_LOCATN] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_POP_DETAIL_POD_ENTRY_TYPE_POD_STATUS]
    ON [dbo].[POP_DETAIL]([POD_ENTRY_TYPE] ASC, [POD_STATUS] ASC)
    INCLUDE([POD_DETAIL], [POD_QTYORD], [POD_QTYDELVD], [POD_NETT], [POD_ORDER_NO], [POD_STOCK_CODE], [POD_DIMENSION2]);


GO
CREATE NONCLUSTERED INDEX [IX_POP_DETAIL_POD_STATUS]
    ON [dbo].[POP_DETAIL]([POD_STATUS] ASC)
    INCLUDE([POD_REQDATE], [POD_QTYORD], [POD_STOCK_CODE]);


GO
CREATE NONCLUSTERED INDEX [POD_BATCH_FLAG]
    ON [dbo].[POP_DETAIL]([POD_BATCH_FLAG] ASC, [POD_STOCK_CODE] ASC)
    INCLUDE([POD_TYPE], [POD_QTYRESERVED], [POD_ORDER_NO]) WITH (FILLFACTOR = 70);


GO
create trigger AA_POP_DETAIL_DT
/*
** Trigger for enforcing the account business rules when a purchase order detail line
** is deleted.
**
**
** Written     :  23/11/1999 ??
** Last Amended:  17/11/2003 NC, 18/12/2003 RL, 10/02/2004 DG, 24/06/2004 WW, 24/11/2004 WW, 18/02/2005 WW, 18/05/2005 RL, 23/11/2005 WW, 20/07/2006 RL, 16/01/2008 DB, 03/04/2008 DB, 20/08/2009 SM, 10/8/10 NC, 26/10/2010 CC, 6/7/11 NC
*/
on POP_DETAIL
instead of delete
as
declare
   @LT_POH_ORDER_NUMBR           varchar(10)
,  @LT_POH_STATUS                tinyint   -- 0 = not used, 1 = part processed, 2 = complete
,  @LT_POH_PERIOD                tinyint
,  @LT_POH_YEAR                  varchar(1)
,  @LT_POD_BATCH_FLAG            tinyint
,  @LT_POH_PRIMARY               int
,  @LT_POH_ORIGINAL_USER_PUTIN   varchar(4)

,  @LT_POD_DATE                  datetime
,  @LT_POD_ORDER_NO              varchar(10)
,  @LT_POD_STATUS                tinyint
,  @LT_POD_QTYORD                decimal(24,8)
,  @LT_POD_QTYUNIT               decimal(24,8)
,  @LT_POD_QTYDELVD              decimal(24,8)
,  @LT_POD_QTYINVD               decimal(24,8)
,  @LT_POD_UNITCST               decimal(24,8)
,  @LT_POD_QTYRESERVED           decimal(24,8)
,  @LT_POD_NETT                  decimal(24,8)
,  @LT_POD_NETT_C                decimal(24,8)
,  @LT_POD_NETT_BASE2            decimal(24,8)
,  @LT_POD_VATAMNT               decimal(24,8)
,  @LT_POD_TAX_C                 decimal(24,8)
,  @LT_POD_VATAMNT_BASE2         decimal(24,8)
,  @LT_POD_GROSS                 decimal(24,8)
,  @LT_POD_GROSS_C               decimal(24,8)
,  @LT_POD_GROSS_BASE2           decimal(24,8)
,  @LT_POD_L_DISCVAL             decimal(24,8)
,  @LT_POD_L_DISCVAL_C           decimal(24,8)
,  @LT_POD_L_DISC_BASE2          decimal(24,8)
,  @LT_POD_T_DISCVAL             decimal(24,8)
,  @LT_POD_T_DISCVAL_C           decimal(24,8)
,  @LT_POD_T_DISC_BASE2          decimal(24,8)
,  @LT_POD_ACQ_TAX               decimal(24,8)
,  @LT_POD_ACQUISTN_BASE2        decimal(24,8)
,  @LT_POD_TYPE                  char(1)
,  @LT_POD_ENTRY_TYPE            char(1)
,  @LT_POD_STOCK_CODE            varchar(25)
,  @LT_POD_LOCATN                varchar(25)
,  @LT_POD_SERIALNO              varchar(40)
,  @LT_POD_SERIALTRACK           tinyint
,  @LT_POD_COSTHEADER            varchar(10)
,  @LT_POD_COSTCENTRE            varchar(10)
,  @LT_POD_PRIMARY               int
,  @LT_POD_LINE_NUMBER           int
,  @LT_POD_PERIOD                tinyint
,  @LT_POD_YEAR                  varchar(1)
,  @LT_POD_ANALYSIS              varchar(25)
,  @LT_POD_USER_PUTIN            varchar(4)

,  @LT_Update_Fixed_Cost         bit
,  @LT_Landed_Quantity           decimal(24,8)
,  @LT_Landed_Value              decimal(24,8)
,  @LT_VALUE_DPS                 tinyint
,  @LT_QUANTITY_DPS              tinyint
,  @LT_PRICE_DPS                 tinyint
,  @LT_LOC_PRIMARY               int
,  @LT_STK_BUY_UNIT1             decimal(24,8)
,  @LT_Quantity                  decimal(24,8)
,  @LT_Costing_Value             decimal(24,8)
,  @LT_ProcedureError             int /*Stored procedure return status */
,  @LT_PURCH_UPDTEYEAR           varchar(1)
,  @LT_Nominal_Year              varchar(1)
,  @LT_PANOMINALDR               varchar(25)
,  @LT_Budget_Value              decimal(24,8)
,  @LT_EC_TYPE                   varchar(1)
,  @LT_ROUND_ORDER_VAT_TO_5DP    bit

,  @LT_ParameterList       nvarchar(max)
,  @LT_DeleteParameterList nvarchar(max)
,  @LT_SqlText             nvarchar(max)
,  @LT_SqlDeleteText       nvarchar(max)
,  @LT_LinkColumn          sysname
,  @LT_ApprovalRecType     varchar(60)
,  @LT_IdColumn            sysname
,  @LT_TableName           sysname
,  @LT_LastTableName       sysname
,  @WFF_Installed          bit

if not exists
   (
      select top 1
         1
         from
            deleted
   )
   return /* quit trigger if nothing deleted*/

if exists   -- Spec 1374.  Disassociate deleted purchase order detail lines from carbon transactions
   (
      select top 1
         1
         from
            deleted
               inner join CO2_TRANSACTIONS on CTRN_POP_DETAIL_LINK = POD_PRIMARY
   )
   begin
      update CO2_TRANSACTIONS
         set
            CTRN_POP_DETAIL_LINK = null
         from
            deleted
               inner join CO2_TRANSACTIONS on CTRN_POP_DETAIL_LINK = POD_PRIMARY
      if @@error <> 0
         begin
            rollback transaction
            raiserror('An error occurred whilst updating CO2_TRANSACTIONS.', 16, 1)
            return
         end
   end

/* delete lines here to trick old code in to thinking it's a normal trigger (SAT 68692) */
delete from POP_DETAIL
   from
      deleted
         inner join POP_DETAIL PD on PD.POD_PRIMARY = deleted.POD_PRIMARY
if @@error <> 0
   begin
      rollback transaction
      raiserror('An error occurred whilst deleting from POP_DETAIL.', 16, 1)
      return
   end

-- Delete linked records
delete POP_DETAIL2
   from
      deleted
         inner join POP_DETAIL2 on POD_PRIMARY_2 = deleted.POD_PRIMARY
if @@error <> 0
   begin
      rollback transaction
      raiserror('An error occurred whilst deleting from POP_DETAIL2.', 16, 1)
      return
   end

if exists(select 1 from sys.tables where name = 'TS_CUSTOM_FORM_NAV')
   set @WFF_Installed = 1
else
   set @WFF_Installed = 0

/* Check whether there are batched detail lines being deleted */
/* If so we need to update totals on relevant records/budgets */
if exists
   (
      select top 1
         1
         from
            deleted
         where
            POD_STATUS < 2 -- 1 = Part Processed (Batched), 0 = Unprocessed (Batched)
   )
   or @WFF_Installed = 1
   begin
      /*Retrieve system information */
      select
         @LT_VALUE_DPS              = VALUE_DPS
      ,  @LT_QUANTITY_DPS           = QUANTITY_DPS
      ,  @LT_PRICE_DPS              = PRICE_DPS
      ,  @LT_PURCH_UPDTEYEAR        = PURCH_UPDTEYEAR
      ,  @LT_ROUND_ORDER_VAT_TO_5DP = ROUND_ORDER_VAT_TO_5DP
         from
            SYS_DATAINFO with(nolock)
         where
            SYS_PRIMARY = 1

      /*Retrieve deleted lines */
      declare CSR_deleted_lines cursor local fast_forward for
         select
            POD_ORDER_NO
         ,  POD_TYPE
         ,  POD_ENTRY_TYPE
         ,  POD_QTYRESERVED
         ,  POD_UNITCST
         ,  POD_QTYORD
         ,  POD_QTYUNIT
         ,  POD_QTYDELVD
         ,  POD_QTYINVD
         ,  POD_NETT
         ,  POD_NETT_C
         ,  POD_NETT_BASE2
         ,  POD_VATAMNT
         ,  POD_TAX_C
         ,  POD_VAT_BASE2
         ,  POD_GROSS
         ,  POD_GROSS_C
         ,  POD_GROSS_BASE2
         ,  POD_L_DISCVAL
         ,  POD_L_DISCVAL_C
         ,  POD_L_DISC_BASE2
         ,  POD_T_DISCVAL
         ,  POD_T_DISCVAL_C
         ,  POD_T_DISC_BASE2
         ,  POD_ACQ_TAX
         ,  POD_ACQUISTN_BASE2
         ,  POD_STOCK_CODE
         ,  POD_LOCATN
         ,  POD_SERIALNO
         ,  POD_COSTHEADER
         ,  POD_COSTCENTRE
         ,  POD_BATCH_FLAG
         ,  POD_SERIALTRACK
         ,  POD_L_DISCVAL
         ,  POD_STATUS
         ,  POD_PRIMARY
         ,  POD_DATE
         ,  POD_LINE_NUMBER
         ,  POD_PERIOD
         ,  POD_YEAR
         ,  POD_ANALYSIS
         ,  POD_USER_PUTIN
         ,  EC_TYPE
            from
               deleted
                  left join SYS_VATCONTROL with(nolock) on POD_VATCODE = VAT_CODE
            order by
               POD_PRIMARY
      open CSR_deleted_Lines
      while 0 = 0
         begin
            fetch next
               from
                  CSR_deleted_lines
               into
                  @LT_POD_ORDER_NO
               ,  @LT_POD_TYPE
               ,  @LT_POD_ENTRY_TYPE
               ,  @LT_POD_QTYRESERVED
               ,  @LT_POD_UNITCST
               ,  @LT_POD_QTYORD
               ,  @LT_POD_QTYUNIT
               ,  @LT_POD_QTYDELVD
               ,  @LT_POD_QTYINVD
               ,  @LT_POD_NETT
               ,  @LT_POD_NETT_C
               ,  @LT_POD_NETT_BASE2
               ,  @LT_POD_VATAMNT
               ,  @LT_POD_TAX_C
               ,  @LT_POD_VATAMNT_BASE2
               ,  @LT_POD_GROSS
               ,  @LT_POD_GROSS_C
               ,  @LT_POD_GROSS_BASE2
               ,  @LT_POD_L_DISCVAL
               ,  @LT_POD_L_DISCVAL_C
               ,  @LT_POD_L_DISC_BASE2
               ,  @LT_POD_T_DISCVAL
               ,  @LT_POD_T_DISCVAL_C
               ,  @LT_POD_T_DISC_BASE2
               ,  @LT_POD_ACQ_TAX
               ,  @LT_POD_ACQUISTN_BASE2
               ,  @LT_POD_STOCK_CODE
               ,  @LT_POD_LOCATN
               ,  @LT_POD_SERIALNO
               ,  @LT_POD_COSTHEADER
               ,  @LT_POD_COSTCENTRE
               ,  @LT_POD_BATCH_FLAG
               ,  @LT_POD_SERIALTRACK
               ,  @LT_POD_L_DISCVAL
               ,  @LT_POD_STATUS
               ,  @LT_POD_PRIMARY
               ,  @LT_POD_DATE
               ,  @LT_POD_LINE_NUMBER
               ,  @LT_POD_PERIOD
               ,  @LT_POD_YEAR
               ,  @LT_POD_ANALYSIS
               ,  @LT_POD_USER_PUTIN
               ,  @LT_EC_TYPE
            if @@fetch_status <> 0
               break

            save tran   @LT_POD_ORDER_NO
            begin tran  @LT_POD_ORDER_NO

            /*Retrieve header value */
            if @LT_POH_ORDER_NUMBR is null
               or
               @LT_POD_ORDER_NO <> @LT_POH_ORDER_NUMBR
               begin
                  select
                     @LT_POH_ORDER_NUMBR  = @LT_POD_ORDER_NO
                  ,  @LT_POH_PRIMARY      = null
                  select
                     @LT_POH_PRIMARY               = POH_PRIMARY
                  ,  @LT_POH_STATUS                = POH_STATUS
                  ,  @LT_POH_ORIGINAL_USER_PUTIN   = POH_ORIGINAL_USER_PUTIN
                  ,  @LT_POH_PERIOD                = POH_PERIOD
                  ,  @LT_POH_YEAR                  = POH_YEAR
                     from
                        POP_HEADER
                     where
                        POH_ORDER_NUMBR = @LT_POH_ORDER_NUMBR

                  -- If the header has already been deleted, use the detail line year and period values.
                  if @@rowcount = 0
                     select
                        @LT_POH_YEAR   = @LT_POD_YEAR
                     ,  @LT_POH_PERIOD = @LT_POD_PERIOD
               end

            /*Determine if the Order is not partly processed*/
            if       (
                        @LT_POD_QTYDELVD  <> 0
                        or
                        @LT_POD_QTYINVD   <> 0
                     )
               and   @LT_POH_STATUS = 1
               begin
                  deallocate CSR_deleted_lines
                  rollback tran @LT_POD_ORDER_NO
                  raiserror('Line Number %i has been used and cannot therefore be deleted!',16,1,@LT_POD_LINE_NUMBER)
                  return
               end

            /*
            ** If Amongst the batched detail lines being deleted there are some completed lines also being deleted then stop processing
            ** that order no. because it implies someone is trying to delete directly from the table. Completed lines can only be removed
            ** by the Purchase Order Purge (Due to the need to update figures elsewhere)
            **
            ** A proper Purchase Order Purge would not get in here because it would not be trying to delete batched transactions at the
            ** same time (See condition prior to cursor loop).
            */
            if @LT_POD_STATUS = 2
               begin
                  if @LT_POH_PRIMARY is not null  /* Check if header exists */
                     begin
                        deallocate CSR_deleted_lines
                        rollback tran @LT_POD_ORDER_NO
                        raiserror('Complete Purchase Order detail lines cannot be deleted unless during a Purchase Order Purge.',16,1)
                        return
                     end
               end

            /*Deleted Order is used by a Project/Costcenter*/
            if       @LT_POD_COSTHEADER  <> ''
               and   @LT_POD_STATUS       < 2
               begin
                  /*Update Project comitted cost values*/
                  select
                     @LT_Costing_Value =  round
                                          (
                                             (
                                                (
                                                   case @LT_POD_QTYORD
                                                      when 0 then 1
                                                      else
                                                         @LT_POD_QTYORD
                                                   end
                                                   -
                                                   @LT_POD_QTYINVD
                                                )
                                                *
                                                @LT_POD_UNITCST
                                             )
                                             -
                                             @LT_POD_L_DISCVAL
                                          ,  @LT_VALUE_DPS
                                          )
                  if @LT_POD_TYPE = 'C'
                     set @LT_Costing_Value = @LT_Costing_Value * -1

                  update CST_COSTHEADER
                     set
                        CH_COMITT_COST = CH_COMITT_COST - @LT_Costing_Value
                     where
                        CH_CODE = @LT_POD_COSTHEADER
                  if @@error <> 0
                     begin
                        deallocate CSR_deleted_lines
                        rollback tran @LT_POD_ORDER_NO
                        raiserror('Unable to update table CST_COSTHEADER.',16,1)
                        return
                     end

                  /*Update Centre comitted cost values*/
                  update CST_COSTCENTRE
                     set
                        CC_COMITT_COST = CC_COMITT_COST - @LT_Costing_Value
                     where
                        CC_CONCAT_CODES = convert(char(10),@LT_POD_COSTHEADER) + @LT_POD_COSTCENTRE
                  if @@error <> 0
                     begin
                        deallocate CSR_deleted_lines
                        rollback tran @LT_POD_ORDER_NO
                        raiserror('Unable to update table CST_COSTCENTRE.',16,1)
                        return
                     end
               end

            /* Deleting a batched unprocessed Order */
            if @LT_POD_STATUS = 0
               begin
                  if @LT_POD_TYPE <> 'O'
                     set @LT_Budget_Value = @LT_POD_NETT - @LT_POD_T_DISCVAL
                  else
                     set @LT_Budget_Value = @LT_POD_T_DISCVAL - @LT_POD_NETT

                  if @LT_POH_PRIMARY is null
                     set @LT_POH_ORIGINAL_USER_PUTIN = @LT_POD_USER_PUTIN

                  if       isnull(@LT_POH_ORIGINAL_USER_PUTIN,'') <> ''
                     and   @LT_POH_YEAR in('L','C','N')
                     and   @LT_POD_USER_PUTIN is not null
                     and   @LT_POD_TYPE = 'O'
                     begin -- test on @LT_POD_USER_PUTIN to allow dimensions to an improved version of the following without some of it being done twice.
                        exec @LT_ProcedureError = AA_POP_UPDATE_USER_BUDGETS_S
                           @PS_UserID  = @LT_POH_ORIGINAL_USER_PUTIN
                        ,  @PS_Value   = @LT_Budget_Value
                        ,  @PS_Year    = @LT_POH_YEAR
                        ,  @PS_Period  = @LT_POH_PERIOD
                        if @LT_ProcedureError <> 0
                           begin
                              deallocate CSR_deleted_lines
                              rollback tran @LT_POD_ORDER_NO
                              raiserror('Execution of procedure AA_POP_UPDATE_USER_BUDGETS_S has failed.',16,1)
                              return
                           end
                      end

                  select
                     @LT_PANOMINALDR = PANOMINALDR
                     from
                        PL_ANALYSIS
                     where
                        PACODE = @LT_POD_ANALYSIS
                  if @LT_PURCH_UPDTEYEAR = 'N'
                     set @LT_Nominal_Year =  case @LT_POH_YEAR
                                                when 'C' then 'N'
                                                when 'L' then 'C'
                                                when 'O' then 'L'
                                                else
                                                   'O'
                                             end
                  else
                     set @LT_Nominal_Year = @LT_POH_YEAR

                  if @LT_Nominal_Year in ('L','C','N')
                     begin
                        exec @LT_ProcedureError = AA_POP_UPDATE_NL_BUDGETS_S
                           @PS_NominalCode      = @LT_PANOMINALDR
                        ,  @PS_Committed_Value  = @LT_Budget_Value
                        ,  @PS_Year             = @LT_Nominal_Year
                        ,  @PS_Period           = @LT_POH_PERIOD
                        if @LT_ProcedureError <> 0
                           begin
                              deallocate CSR_deleted_lines
                              rollback tran @LT_POD_ORDER_NO
                              raiserror('Execution of Procedure AA_POP_UPDATE_NL_BUDGETS_S has failed.',16,1)
                              return
                           end
                     end

                  /*Deleting a Stock item Order*/
                  if       @LT_POD_ENTRY_TYPE   = 'S'
                     and   @LT_POD_QTYRESERVED  > 0
                     begin
                        /*Unreserve Stock */
                        if @LT_POD_TYPE = 'O'
                           update STK_STOCK
                              set
                                 STK_ORDER_IN = STK_ORDER_IN - @LT_POD_QTYRESERVED
                              where
                                 STKCODE = @LT_POD_STOCK_CODE
                        else   -- for credit notes, increase order in when deleting
                           update STK_STOCK
                              set
                                 STK_ORDER_IN = STK_ORDER_IN + @LT_POD_QTYRESERVED
                              where
                                 STKCODE = @LT_POD_STOCK_CODE
                        if @@error <> 0
                           begin
                              deallocate CSR_deleted_lines
                              rollback tran @LT_POD_ORDER_NO
                              raiserror('Unable to update table STK_STOCK.',16,1)
                              return
                           end

                        /*Stock Location item*/
                        if @LT_POD_LOCATN <> ''
                           begin
                              /*Unreserve Stock Location item*/
                              if @LT_POD_TYPE = 'O'
                                 update STK_LOCATION
                                    set
                                       LOC_ORDER_IN = LOC_ORDER_IN - @LT_POD_QTYRESERVED
                                    where
                                       LOC_CONCATCODE = @LT_POD_STOCK_CODE + @LT_POD_LOCATN
                              else   -- for credit notes, increase order in when deleting
                                 update STK_LOCATION
                                    set
                                       LOC_ORDER_IN = LOC_ORDER_IN + @LT_POD_QTYRESERVED
                                    where
                                       LOC_CONCATCODE = @LT_POD_STOCK_CODE + @LT_POD_LOCATN
                              if @@error <> 0
                                 begin
                                    deallocate CSR_deleted_lines
                                    rollback tran @LT_POD_ORDER_NO
                                    raiserror('aa_pop_detail_dt: Unable to update table STK_LOCATION.',16,1)
                                    return
                                 end
                           end
                     end

                  /* Remove Landed committed cost */
                  if       isnull(@LT_POD_LOCATN,'') <> ''
                     and   @LT_POD_TYPE               = 'O'
                     and   @LT_POD_ENTRY_TYPE         = 'S'
                     and   @LT_POD_QTYRESERVED        > 0
                     begin
                        select
                           @LT_LOC_PRIMARY = LOC_PRIMARY
                           from
                              STK_LOCATION
                           where
                                    LOC_STOCK_CODE = @LT_POD_STOCK_CODE
                              and   LOC_CODE       = @LT_POD_LOCATN
                        if @LT_POD_SERIALTRACK = 1
                           begin
                              if exists
                                 (
                                    select
                                       1
                                       from
                                          POP_DETAIL
                                       where
                                                POD_ORDER_NO   = @LT_POD_ORDER_NO
                                          and   POD_STOCK_CODE = @LT_POD_STOCK_CODE
                                          and   POD_LOCATN     = @LT_POD_LOCATN
                                          and   POD_PRIMARY   <> @LT_POD_PRIMARY
                                 )
                                 set @LT_Update_Fixed_Cost = 0
                              else
                                 set @LT_Update_Fixed_Cost = 1
                           end
                        else
                           set @LT_Update_Fixed_Cost =   case @LT_POD_QTYDELVD
                                                            when 0 then 1
                                                            else
                                                               0
                                                         end

                        select
                           @LT_Landed_Quantity  =  round
                                                   (
                                                      (@LT_POD_QTYORD - @LT_POD_QTYDELVD) * @LT_POD_QTYUNIT
                                                   ,  @LT_QUANTITY_DPS
                                                   )
                        ,  @LT_Landed_Quantity  =  case
                                                      when @LT_Landed_Quantity > 0 then @LT_Landed_Quantity
                                                      else
                                                         0
                                                   end
                        ,  @LT_Landed_Value     =  round
                                                   (
                                                      (@LT_POD_QTYORD - @LT_POD_QTYDELVD)
                                                      *
                                                      @LT_POD_QTYUNIT
                                                      *
                                                      round(@LT_POD_UNITCST/@LT_POD_QTYUNIT, @LT_PRICE_DPS)
                                                   ,  @LT_VALUE_DPS
                                                   )
                        ,  @LT_Landed_Value     =  case
                                                      when @LT_Landed_Value > 0 then @LT_Landed_Value
                                                      else
                                                         0
                                                   end
                        exec AA_UPDATE_LANDED_COST_IN_S
                           @LT_LOC_PRIMARY
                        ,  0
                        ,  @LT_Landed_Quantity
                        ,  @LT_Landed_Value
                        ,  0
                        ,  0
                        ,  1
                        ,  @LT_Update_Fixed_Cost
                        ,  1
                        ,  0
                        ,  @LT_POD_DATE
                        ,  0
                        ,  0
                        ,  0
                        if @LT_ProcedureError <> 0
                           begin
                              deallocate CSR_deleted_lines
                              rollback tran @LT_POD_ORDER_NO
                              raiserror('Execution of procedure AA_UPDATE_LANDED_COST_IN_S has failed!',16,1)
                              return
                           end
                     end

                  if       @LT_POH_PRIMARY is not null
                     and   @LT_POH_PRIMARY > 0
                     begin -- only reorder if header still exists
                        /* Recalculate Header values */
                           update POP_HEADER
                              set
                                 POH_NETT                      =  POH_NETT-@LT_POD_NETT
                              ,  POH_VAT                       =  POH_VAT-dbo.AA_VALUE_DPS_F(@LT_POD_VATAMNT)
                              ,  POH_GROSS                     =  POH_GROSS-@LT_POD_GROSS+@LT_POD_T_DISCVAL
                              ,  POH_T_DISCVAL                 =  POH_T_DISCVAL-@LT_POD_T_DISCVAL
                              ,  POH_L_DISCVAL                 =  POH_L_DISCVAL-@LT_POD_L_DISCVAL
                              ,  POH_NETT_C                    =  POH_NETT_C-@LT_POD_NETT_C
                              ,  POH_TAX_C                     =  POH_TAX_C-dbo.AA_VALUE_DPS_F(@LT_POD_TAX_C)
                              ,  POH_GROSS_C                   =  POH_GROSS_C-@LT_POD_GROSS_C+@LT_POD_T_DISCVAL_C
                              ,  POH_T_DISCVAL_C               =  POH_T_DISCVAL_C-@LT_POD_T_DISCVAL_C
                              ,  POH_L_DISCVAL_C               =  POH_L_DISCVAL_C-@LT_POD_L_DISCVAL_C
                              ,  POH_NETT_BASE2                =  POH_NETT_BASE2-@LT_POD_NETT_BASE2
                              ,  POH_VAT_BASE2                 =  POH_VAT_BASE2-dbo.AA_VALUE_DPS_F(@LT_POD_VATAMNT_BASE2)
                              ,  POH_GROSS_BASE2               =  POH_GROSS_BASE2-@LT_POD_GROSS_BASE2+@LT_POD_T_DISC_BASE2
                              ,  POH_T_DISC_BASE2              =  POH_T_DISC_BASE2-@LT_POD_T_DISC_BASE2
                              ,  POH_L_DISC_BASE2              =  POH_L_DISC_BASE2-@LT_POD_L_DISC_BASE2
                              ,  POH_ACQ_TAX                   =     POH_ACQ_TAX
                                                                  -  case @LT_EC_TYPE
                                                                        when 'X' then 0
                                                                        else
                                                                           dbo.AA_VALUE_DPS_F(@LT_POD_ACQ_TAX)
                                                                     end
                              ,  POH_ACQUISTN_BASE2            =     POH_ACQUISTN_BASE2
                                                                  -  case @LT_EC_TYPE
                                                                        when 'X' then 0
                                                                        else
                                                                           dbo.AA_VALUE_DPS_F(@LT_POD_ACQUISTN_BASE2)
                                                                     end
                              ,  POH_REVERSE_SERVICE_VAT       =     POH_REVERSE_SERVICE_VAT
                                                                  -  case @LT_EC_TYPE
                                                                        when 'X' then dbo.AA_VALUE_DPS_F(@LT_POD_ACQ_TAX)
                                                                        else
                                                                           0
                                                                     end
                              ,  POH_REVERSE_SERVICE_VAT_BASE2 =     POH_REVERSE_SERVICE_VAT_BASE2
                                                                  -  case @LT_EC_TYPE
                                                                        when 'X' then dbo.AA_VALUE_DPS_F(@LT_POD_ACQUISTN_BASE2)
                                                                        else
                                                                           0
                                                                     end
                              ,  POH_OS_DELVAL                 =  POH_OS_DELVAL-@LT_POD_NETT+@LT_POD_T_DISCVAL
                              ,  POH_OS_INVVAL                 =  POH_OS_INVVAL-@LT_POD_NETT+@LT_POD_T_DISCVAL
                              ,  POH_OS_DELCVAL                =  POH_OS_DELCVAL-@LT_POD_NETT_C+@LT_POD_T_DISCVAL_C
                              ,  POH_OS_INVCVAL                =  POH_OS_INVCVAL-@LT_POD_NETT_C+@LT_POD_T_DISCVAL_C
                              ,  POH_NO_OF_LINES               =  case
                                                                     when POH_NO_OF_LINES < 1 then 0
                                                                     else
                                                                        POH_NO_OF_LINES - 1
                                                                  end
                              where
                                 POH_PRIMARY = @LT_POH_PRIMARY
                           if       not exists
                                    (
                                       select top 1
                                          1
                                          from
                                             deleted
                                          where
                                                   POD_ORDER_NO   = @LT_POD_ORDER_NO
                                             and   POD_PRIMARY    > @LT_POD_PRIMARY
                                    )
                              and   not exists
                                    (
                                       select top 1
                                          1
                                          from
                                             POP_DETAIL
                                          where
                                                   POD_ORDER_NO   = @LT_POD_ORDER_NO
                                             and   POD_STATUS     < 2
                                    )
                              and   exists
                                    (
                                       select top 1
                                          1
                                          from
                                             POP_DETAIL
                                          where
                                             POD_ORDER_NO   = @LT_POD_ORDER_NO
                                    )
                           begin
                              update POP_HEADER
                                 set
                                    POH_STATUS     = 2
                                 ,  POH_BATCH_FLAG = 0
                                 ,  POH_ACC_STATUS = '0' + POH_ACCOUNT
                                 ,  POH_COMPLETED  = getdate()
                                 where
                                    POH_ORDER_NUMBR = @LT_POD_ORDER_NO
                           end

                        if @LT_ROUND_ORDER_VAT_TO_5DP = 1
                           begin
                              with VATsummary
                              as
                                (
                                 select
                                    dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_VATAMNT) ))           as VAT_Home
                                  , dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_TAX_C) ))             as VAT_Curr
                                  , dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_VAT_BASE2) ))         as VAT_B2
                                  , dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_ACQ_TAX) ))           as VAT_ACQ_Home
                                  , dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_ACQUISTN_BASE2)))     as VAT_ACQ_B2
                                  , max(EC_TYPE)                                                         as EC_TYPE
                                    from POP_DETAIL join SYS_VATCONTROL with (nolock) on VAT_CODE = POD_VATCODE
                                    where POD_ORDER_NO = @LT_POD_ORDER_NO
                                    group by POD_VATCODE
                                )
                              , VATtotal
                              as
                                (
                                 select
                                     dbo.AA_VALUE_DPS_F(sum(VAT_Home))                                            as VAT_Home
                                    ,dbo.AA_VALUE_DPS_F(sum(VAT_Curr))                                            as VAT_Curr
                                    ,dbo.AA_VALUE_DPS_F(sum(VAT_B2))                                              as VAT_B2
                                    ,dbo.AA_VALUE_DPS_F(sum(case EC_TYPE when 'X' then 0 else VAT_ACQ_Home end))  as VAT_ACQ_Home
                                    ,dbo.AA_VALUE_DPS_F(sum(case EC_TYPE when 'X' then 0 else VAT_ACQ_B2 end))    as VAT_ACQ_B2
                                    ,dbo.AA_VALUE_DPS_F(sum(case EC_TYPE when 'X' then VAT_ACQ_Home else 0 end))  as VAT_RevServiceHome
                                    ,dbo.AA_VALUE_DPS_F(sum(case EC_TYPE when 'X' then VAT_ACQ_B2 else 0 end))    as VAT_RevServiceB2
                                 from VATsummary
                                )
                              update POP_HEADER
                                 set  POH_VAT                        = VAT_Home
                                    , POH_TAX_C                      = VAT_Curr
                                    , POH_VAT_BASE2                  = VAT_B2
                                    , POH_ACQ_TAX                    = VAT_ACQ_Home
                                    , POH_ACQUISTN_BASE2             = VAT_ACQ_B2
                                    , POH_GROSS                      = POH_NETT+VAT_Home-POH_T_DISCVAL
                                    , POH_GROSS_C                    = POH_NETT_C+VAT_Curr-POH_T_DISCVAL_C
                                    , POH_GROSS_BASE2                = POH_NETT_BASE2+VAT_B2-POH_T_DISC_BASE2
                                    , POH_REVERSE_SERVICE_VAT        = VAT_RevServiceHome
                                    , POH_REVERSE_SERVICE_VAT_BASE2  = VAT_RevServiceB2
                                 from VATtotal, POP_HEADER
                                 where POH_ORDER_NUMBR = @LT_POD_ORDER_NO
                           end

                        /* Reorder line numbers */
                        exec @LT_ProcedureError = AA_REORDER_ORDER_LINES_S
                           @PS_Module        = 'POP'
                        ,  @PS_Action        = 'D'
                        ,  @PS_Order_Number  = @LT_POH_ORDER_NUMBR
                        ,  @PS_Line_Number   = @LT_POD_LINE_NUMBER
                        if @LT_ProcedureError <> 0 -- Sub-routine raised an error
                           begin
                              deallocate CSR_deleted_lines
                              rollback
                              raiserror('Execution of procedure AA_REORDER_ORDER_LINES_S has failed!',16,1)
                              return
                           end
                     end
               end

            ---------------------------------------------------------------------
            if @WFF_Installed = 1
               begin
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
                        NAV_RUN_FROM like ''TRANSACTION-D%''
                     and
                        NAV_CODE in (''PO-TRN-ORD'',''PO-TRN-CRN'')
                     and
                        CFSD_IS_KEY = 1
                     and
                        CFSD_COL_TYPE = 1
                     group by
                        CFSH_PRIMARY
                     having max(CFSH_TABLE_NAME) > @PT_LastTableName
                     order by max(CFSH_TABLE_NAME)'

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
                                                      + ' where ' + @LT_LinkColumn + ' = ''POD-' + cast(@LT_POD_PRIMARY as varchar)
                                                   + ''')'
                                            + '; delete from ' + @LT_TableName
                                                   + ' where ' + @LT_LinkColumn + ' = ''POD-' +  cast(@LT_POD_PRIMARY as varchar)
                                                   + ''''
                        exec sp_executesql @LT_SqlDeleteText;
                     end
               end
            ---------------------------------------------------------------------
            commit tran @LT_POD_ORDER_NO
         end
      deallocate CSR_deleted_lines

      delete STK_SERIAL_LINK
         from
            deleted
               inner join STK_SERIAL_LINK on       deleted.POD_SERIALTRACK                                        = 1
                                             and   'P'+convert(varchar,convert(decimal(16),deleted.POD_PRIMARY))  = STK_SERIAL_LINK.SNOL_ORDER_LINK
         where
                  isnull(STK_SERIAL_LINK.SNOL_MOVEMENT_LINK,0) = 0
            and   isnull(STK_SERIAL_LINK.SNOL_RTP_LINK,0)      = 0
      if @@error <> 0
         begin
            rollback transaction
            raiserror('An error occurred whilst deleting from STK_SERIAL_LINK.', 16, 1)
            return
         end

      update STK_SERIAL_LINK
         set
            SNOL_ORDER_LINK = 'P'
         from
            deleted
               inner join STK_SERIAL_LINK on       deleted.POD_SERIALTRACK                                        = 1
                                             and   'P'+convert(varchar,convert(decimal(16),deleted.POD_PRIMARY))  = STK_SERIAL_LINK.SNOL_ORDER_LINK
      if @@error <> 0
         begin
            rollback transaction
            raiserror('An error occurred whilst updating STK_SERIAL_LINK.', 16, 1)
            return
         end
   end         -- End of deleting by line
GO

CREATE TRIGGER dhc_JCC_PO_RequiredDate
   ON  POP_DETAIL
   AFTER INSERT,UPDATE
AS 
BEGIN

	declare @reqDate datetime,@POD_PRIMARY int,@cnt int
	select @reqDate=POD_REQDATE,@POD_PRIMARY=POD_PRIMARY from inserted

	if (@reqDate is null)
		return

	select @cnt=count(*) from dhc_JCC_PO_Detail_ReqDate where PDR_POD_PRIMARY=@POD_PRIMARY

	if (@cnt>0)
		return

	insert into dhc_JCC_PO_Detail_ReqDate(PDR_POD_PRIMARY,PDR_FIRST_REQ_DATE) values(@POD_PRIMARY,@reqDate)

END

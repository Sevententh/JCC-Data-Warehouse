CREATE TABLE [dbo].[CST_COSTHEADER] (
    [CH_CODE]                    VARCHAR (10) NULL,
    [CH_NAME]                    VARCHAR (40) NULL,
    [CH_DESCRIPTION]             VARCHAR (80) NULL,
    [CH_STATUS]                  VARCHAR (1)  NULL,
    [CH_QUANTITY]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_ACCOUNT]                 VARCHAR (10) NULL,
    [CH_USED]                    TINYINT      DEFAULT ((0)) NULL,
    [CH_CHRG_RATE]               VARCHAR (1)  NULL,
    [CH_CHRG_VALUE]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_CHRG_LINE]               VARCHAR (2)  NULL,
    [CH_SORT]                    VARCHAR (20) NULL,
    [CH_USER1]                   VARCHAR (20) NULL,
    [CH_USER2]                   VARCHAR (20) NULL,
    [CH_USER3]                   VARCHAR (20) NULL,
    [CH_USER4]                   VARCHAR (20) NULL,
    [CH_USER5]                   VARCHAR (20) NULL,
    [CH_USER6]                   VARCHAR (20) NULL,
    [CH_COST_INVTD]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_PAYTD]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_OBUDG1]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_RBUDG2]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_ACTUAL_COST]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COMITT_COST]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_USER_COST1]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_USER_COST2]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_CNTUPV]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_UPLIFTP]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_RESUPV]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_BUDGET_REVISED]          TINYINT      DEFAULT ((0)) NULL,
    [CH_SALE_OBUDG1]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_SALE_RBUDG2]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_ACTUAL_SALES]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COMITT_SALES]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_USER_SALES1]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_USER_SALES2]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_SALE_UPLIFTV]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_SALE_UPLIFTP]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_SALE_PAYTD]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_WIP]                     FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_SALE_RESUPV]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_SALE_INVTD]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_WIP_UPLIFT]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_TIMECOSTINV]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_GENCOSTINV]              FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_CNT_OBDG_UPV]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_RES_OBDG_UPV]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_CNT_RBDG_UPV]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_RES_RBDG_UPV]            FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_DATE_USER1]              DATETIME     NULL,
    [CH_DATE_USER2]              DATETIME     NULL,
    [CH_DATE_USER3]              DATETIME     NULL,
    [CH_DATE_EST]                DATETIME     NULL,
    [CH_DATE_REQ]                DATETIME     NULL,
    [CH_DATE_STAT]               DATETIME     NULL,
    [CH_DATE_INV]                DATETIME     NULL,
    [CH_DATE_PAY]                DATETIME     NULL,
    [CH_DATE_COST]               DATETIME     NULL,
    [CH_DATE_COMP]               DATETIME     NULL,
    [CH_DURATION]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_DUR_TYPE]                VARCHAR (1)  NULL,
    [CH_USER_ACCESS]             VARCHAR (10) NULL,
    [CH_NOTES]                   TEXT         NULL,
    [CH_COST_O_1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_O_13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_L_13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_COST_C_13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_USER_EDITED]             VARCHAR (4)  NULL,
    [CH_DATE_EDITED]             DATETIME     NULL,
    [CH_LASTACTION]              VARCHAR (1)  NULL,
    [CH_USER_PUTIN]              VARCHAR (4)  NULL,
    [CH_DATE_PUTIN]              DATETIME     NULL,
    [CH_MU_STATUS]               VARCHAR (1)  NULL,
    [CH_PRIMARY]                 FLOAT (53)   NOT NULL,
    [CH_LEVEL]                   INT          DEFAULT ((0)) NULL,
    [CH_GROUP]                   VARCHAR (10) NULL,
    [CH_SOURCE]                  VARCHAR (1)  NULL,
    [CH_PERSON_LINK]             INT          NULL,
    [CH_NEXT_MILESTONE_LINK]     INT          NULL,
    [CH_STYLE]                   VARCHAR (1)  NULL,
    [CH_TYPE]                    VARCHAR (1)  NULL,
    [CH_DEFAULT_INV_CC_LINK]     INT          NULL,
    [CH_DO_NOT_USE]              TINYINT      DEFAULT ((0)) NULL,
    [CH_CONTRACT_VALUE]          FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_FIXED_PRICE]             FLOAT (53)   DEFAULT ((0)) NULL,
    [CH_DATE_START]              DATETIME     NULL,
    [CH_DATE_DEADLINE]           DATETIME     NULL,
    [CH_INVOICE_STYLE]           TINYINT      DEFAULT ((1)) NULL,
    [CH_TEMPLATE_LINK]           INT          NULL,
    [CH_INVOICE_ANALYSIS_LINK]   INT          NULL,
    [CH_TIMETABLE_ANALYSIS_LINK] INT          NULL,
    [CH_COST_ANALYSIS_LINK]      INT          NULL,
    [CH_SALES_WIP]               FLOAT (53)   NULL,
    [CH_BUDGET_CURRENCYSYMB]     VARCHAR (4)  NULL,
    [CH_CAMPAIGN_CODE]           VARCHAR (20) NULL,
    [CH_CONTRACT_LINK]           INT          NULL,
    [CH_ACLOUD_SYNCED]           BIT          DEFAULT ((0)) NOT NULL,
    CONSTRAINT [CH_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CH_PRIMARY] ASC),
    CONSTRAINT [CH_CONTRACT_LINK_FK] FOREIGN KEY ([CH_CONTRACT_LINK]) REFERENCES [dbo].[CST_CONTRACTS] ([CCON_PRIMARY]) ON DELETE SET NULL
);


GO
CREATE NONCLUSTERED INDEX [CH_ACCOUNT]
    ON [dbo].[CST_COSTHEADER]([CH_ACCOUNT] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CH_CODE]
    ON [dbo].[CST_COSTHEADER]([CH_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [CH_NAME]
    ON [dbo].[CST_COSTHEADER]([CH_NAME] ASC);


GO
CREATE NONCLUSTERED INDEX [CH_SORT]
    ON [dbo].[CST_COSTHEADER]([CH_SORT] ASC);


GO
CREATE NONCLUSTERED INDEX [CH_STATUS]
    ON [dbo].[CST_COSTHEADER]([CH_STATUS] ASC);


GO
CREATE NONCLUSTERED INDEX [CH_USER1]
    ON [dbo].[CST_COSTHEADER]([CH_USER1] ASC);


GO
CREATE NONCLUSTERED INDEX [CH_USER2]
    ON [dbo].[CST_COSTHEADER]([CH_USER2] ASC);


GO
CREATE NONCLUSTERED INDEX [CH_USER3]
    ON [dbo].[CST_COSTHEADER]([CH_USER3] ASC);


GO
CREATE NONCLUSTERED INDEX [CH_CONTRACT_LINK]
    ON [dbo].[CST_COSTHEADER]([CH_CONTRACT_LINK] ASC) WITH (FILLFACTOR = 70);


GO
create trigger AA_COSTHEADER_DT
/*
** Trigger for enforcing Project delete business rules.
** The trigger fires when an attempt is made to delete a Project
** The trigger enforces the business rule that a Project cannot be
** deleted if the Project is in use. First the trigger determines
** whether the Project is active, failing this, the trigger then goes on
** to check if the Project has any costing detail lines, failing this
** the trigger then goes further to check if the Project has been
** used by any transaction detail lines. The trigger then
** finally deletes the Cost centre(s) belonging to the deleted Project
** if the Project is found not to be in use.
**
** Written     :  05/08/1998 ??
** Last Amended:  17/12/2001 RL, 24/02/2003 NC, 07/03/2003 NC, 19/04/2006 SRB, 24/07/2006 WW, 07/08/2012 DB
**/
   on dbo.CST_COSTHEADER
instead of delete
as

if exists(select 1 from deleted where deleted.CH_STATUS = 'A')
   begin
      if @@trancount>0
         rollback transaction
      raiserror ('Active Projects can not be deleted.',16,1)
      return
   end
if exists
   (
      select
         1
         from
            deleted
               inner join CST_DETAIL with(nolock) on CT_COSTHEADER = deleted.CH_CODE and CT_COSTHEADER is not null
   )
   begin
      if @@trancount>0
         rollback transaction
      raiserror ('Projects that have been used in Costing Transactions can not be deleted.',16,1)
      return
   end
if exists
   (
      select
         1
         from
            deleted
               inner join SL_PL_NL_DETAIL with(nolock) on DET_COSTHEADER = deleted.CH_CODE and DET_COSTHEADER is not null
   )
   begin
      if @@trancount>0
         rollback transaction
      raiserror ('Projects that have been used in transaction Detail lines can not be deleted.',16,1)
      return
   end
if exists
   (
      select
         1
         from
            deleted
               inner join ORD_DETAIL on OD_COSTHEADER = deleted.CH_CODE and OD_COSTHEADER is not null
   )
   begin
      if @@trancount>0
         rollback transaction
      raiserror ('Projects that have been used in Sales Orders can not be deleted.',16,1)
      return
   end
if exists
   (
      select
         1
         from
            deleted
               inner join POP_DETAIL on POD_COSTHEADER = deleted.CH_CODE and POD_COSTHEADER is not null
   )
   begin
      if @@trancount>0
         rollback transaction
      raiserror ('Projects that have been used in Purchase Orders can not be deleted.',16,1)
      return
   end
if exists
   (
      select
         1
         from
            deleted
               inner join STK_MOVEMENTS on SM_COSTHEADER = deleted.CH_CODE and SM_COSTHEADER is not null
   )
   begin
      if @@trancount>0
         rollback transaction
      raiserror ('Projects that have been used in Stock Movements can not be deleted.',16,1)
      return
   end
if exists
   (
      select
         1
         from
            deleted
         where
                  CH_CAMPAIGN_CODE is not null
            and   CH_CAMPAIGN_CODE <> ''
   )
   begin
      if @@trancount>0
         rollback transaction
      raiserror ('Projects that have been used on a Campaign can not be deleted.',16,1)
      return
   end

if exists
   (
      select
         1
         from
            deleted
               inner join CST_CONTRACTS on         CCON_PRIMARY               = deleted.CH_CONTRACT_LINK
                                             and   CCON_MASTER_PROJECT_LINK   = deleted.CH_PRIMARY
         where
            exists                                                -- and there is another project referencing this project as a contract
            (
               select
                  1
                  from
                     CST_COSTHEADER CH with(nolock)
                  where
                           CH.CH_CONTRACT_LINK  =  deleted.CH_CONTRACT_LINK -- Same contract
                     and   CH.CH_PRIMARY       <>  deleted.CH_PRIMARY       -- Different project
            )

   )
   begin
      if @@trancount>0
         rollback transaction
      raiserror ('Contract projects can only be deleted if no other project is referencing the contract.',16,1)
      return
   end

delete CST_COSTCENTRE
   from
      deleted
         inner join CST_COSTCENTRE on CC_COPYHEADER = deleted.CH_CODE
if @@error <> 0
   begin
      if @@trancount>0
         rollback tran
      raiserror('Failed to delete from table CST_COSTCENTRE.',16,1)
      return
   end

delete CST_COSTHEADER2
   from
      deleted
         inner join CST_COSTHEADER2 on CH_PRIMARY_2 = deleted.CH_PRIMARY
if @@error <> 0
   begin
      if @@trancount>0
         rollback tran
      raiserror('Failed to delete from table CST_COSTHEADER2.',16,1)
      return
   end

delete CST_CONTRACTS
   from
      deleted
         inner join CST_CONTRACTS on         CCON_PRIMARY               = deleted.CH_CONTRACT_LINK
                                       and   CCON_MASTER_PROJECT_LINK   = deleted.CH_PRIMARY
if @@error <> 0
   begin
      if @@trancount>0
         rollback tran
      raiserror('Failed to delete from table CST_CONTRACTS.',16,1)
      return
   end

delete CH
   from
      deleted
         inner join CST_COSTHEADER CH on CH.CH_PRIMARY = deleted.CH_PRIMARY
if @@error <> 0
   begin
      if @@trancount>0
         rollback tran
      raiserror('Failed to delete from table CST_COSTHEADER.',16,1)
      return
   end

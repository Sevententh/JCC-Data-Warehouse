CREATE TABLE [dbo].[SL_ACCOUNTS] (
    [CUCODE]                         VARCHAR (10)  NULL,
    [CUNAME]                         VARCHAR (40)  NULL,
    [CUADDRESS]                      VARCHAR (160) NULL,
    [CUPOSTCODE]                     VARCHAR (12)  NULL,
    [CUPHONE]                        VARCHAR (20)  NULL,
    [CUPHONE2]                       VARCHAR (20)  NULL,
    [CUFAX]                          VARCHAR (20)  NULL,
    [CUPROSCODE]                     VARCHAR (10)  NULL,
    [CUCONTACT]                      VARCHAR (30)  NULL,
    [CU_MULTI_CURR]                  TINYINT       DEFAULT ((0)) NULL,
    [CUSALUTE]                       VARCHAR (20)  NULL,
    [CU_PRO_CONDATE]                 DATETIME      NULL,
    [CU_EXPORT_CODE]                 VARCHAR (1)   NULL,
    [CU_COUNTRY_CODE]                VARCHAR (4)   NULL,
    [CU_VAT_REG_NO]                  VARCHAR (21)  NULL,
    [CU_EC_DELIVERY]                 VARCHAR (3)   NULL,
    [CU_EC_T_NATURE]                 VARCHAR (2)   NULL,
    [CU_EC_T_MODE]                   VARCHAR (1)   NULL,
    [CUBALANCE]                      FLOAT (53)    DEFAULT ((0)) NULL,
    [CUBALANCE_C]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [CUAGED_1]                       FLOAT (53)    DEFAULT ((0)) NULL,
    [CUAGED_2]                       FLOAT (53)    DEFAULT ((0)) NULL,
    [CUAGED_3]                       FLOAT (53)    DEFAULT ((0)) NULL,
    [CUAGED_4]                       FLOAT (53)    DEFAULT ((0)) NULL,
    [CUAGED_UNALLOC]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUSORT]                         VARCHAR (20)  NULL,
    [CUUSER1]                        VARCHAR (20)  NULL,
    [CUUSER2]                        VARCHAR (20)  NULL,
    [CUUSER3]                        VARCHAR (20)  NULL,
    [CUUSED]                         TINYINT       DEFAULT ((0)) NULL,
    [CUTURNOVERPTD]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L1]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L2]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L3]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L4]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L5]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L6]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L7]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L8]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L9]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L10]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L11]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L12]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L13]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C1]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C2]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C3]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C4]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C5]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C6]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C7]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C8]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C9]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C10]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C11]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C12]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C13]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O1]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O2]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O3]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O4]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O5]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O6]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O7]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O8]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O9]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O10]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O11]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O12]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O13]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVERYTD]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CUCURRENCYCODE]                 VARCHAR (6)   NULL,
    [CUTURNOVR_L1_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L2_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L3_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L4_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L5_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L6_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L7_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L8_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L9_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L10_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L11_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L12_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_L13_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C1_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C2_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C3_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C4_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C5_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C6_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C7_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C8_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C9_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C10_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C11_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C12_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_C13_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O1_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O2_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O3_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O4_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O5_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O6_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O7_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O8_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O9_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O10_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O11_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O12_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_O13_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_YTD_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CUTURNOVR_PTD_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_1]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_2]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_3]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_4]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_5]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_6]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_7]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_8]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_9]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_10]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_11]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_12]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_13]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_1]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_2]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_3]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_4]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_5]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_6]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_7]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_8]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_9]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_10]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_PTD]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVAL_YTD]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_PTD]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_YTD]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_COSTVALUE]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVALUE]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_11]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_12]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SALEVAL_13]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_USERDATE1]                   DATETIME      NULL,
    [CU_USERDATE2]                   DATETIME      NULL,
    [CU_NOTES]                       TEXT          NULL,
    [CU_MULTIADD_FLG]                TINYINT       DEFAULT ((0)) NULL,
    [CU_INV_ADD_CDE]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_DEL_ADD_CDE]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_STAT_ADD_CDE]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_DATE_INV]                    DATETIME      NULL,
    [CU_DATE_PAY]                    DATETIME      NULL,
    [CU_USER_PUTIN]                  VARCHAR (4)   NULL,
    [CU_DATE_PUTIN]                  DATETIME      NULL,
    [CU_DATE_EDITED]                 DATETIME      NULL,
    [CU_USER_EDITED]                 VARCHAR (4)   NULL,
    [CU_MU_STATUS]                   VARCHAR (1)   NULL,
    [CU_LINE_DISC]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_TOT_DISC]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SETT_DISC_1]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SETT_DISC_2]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SETT_DAYS_1]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_SETT_DAYS_2]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_TERMS_OPTION]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_ON_STOP]                     TINYINT       DEFAULT ((0)) NULL,
    [CU_CREDIT_LIMIT]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_TERMS]                       VARCHAR (40)  NULL,
    [CU_DEL_CHARGE]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_DEL_CHARGE_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_DEL_CHG_PCNT]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_MIN_ORDR]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_MIN_ORDR_C]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_DUE_DAYS]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_A_P_DAYS]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_DUEDATE_TYPE]                TINYINT       DEFAULT ((0)) NULL,
    [CU_PRICE_KEY]                   TINYINT       DEFAULT ((0)) NULL,
    [CU_ANALYSIS]                    VARCHAR (25)  NULL,
    [CU_TAX_CODE]                    VARCHAR (4)   NULL,
    [CU_BANK_ANALYS]                 VARCHAR (25)  NULL,
    [CU_PRIMARY]                     FLOAT (53)    NOT NULL,
    [CU_DEALERCODE]                  VARCHAR (10)  NULL,
    [CU_ADDRESS_USER1]               VARCHAR (30)  NULL,
    [CU_ADDRESS_USER2]               VARCHAR (30)  NULL,
    [CU_EMAIL]                       VARCHAR (64)  NULL,
    [CU_WEB_PASSWORD]                VARCHAR (10)  NULL,
    [CU_CURRENCY_CHANGED]            TINYINT       DEFAULT ((0)) NULL,
    [CU_SOURCE]                      VARCHAR (1)   NULL,
    [CU_ACCOUNT_TYPE]                VARCHAR (1)   NULL,
    [CU_DOC_DESTINATION]             VARCHAR (10)  NULL,
    [CU_COUNTRY]                     VARCHAR (35)  NULL,
    [CU_DO_NOT_USE]                  BIT           DEFAULT ((0)) NOT NULL,
    [CU_CREDIT_CONTROLLER]           VARCHAR (4)   NULL,
    [CU_TERMS_LINK]                  INT           NULL,
    [CU_CURR_CREDIT_LIMIT]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_ANT_DAYS_FROM_DATES_OPT]     TINYINT       DEFAULT ((0)) NULL,
    [CU_PAYMENT_PROMISED]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CU_PAYMENT_PROMISED_DATE]       DATETIME      NULL,
    [CU_CUSTOM_TERMS_TEMPLATE]       BIT           DEFAULT ((0)) NOT NULL,
    [CU_PAYMENT_PROMISED_CURRENCY]   VARCHAR (4)   NULL,
    [CU_COMPANY_REG_NUMBER]          VARCHAR (20)  NULL,
    [CU_DIRECT_DEBIT_TYPE]           VARCHAR (1)   NOT NULL,
    [CU_INV_LAYOUT_LINK]             INT           NULL,
    [CU_CRN_LAYOUT_LINK]             INT           NULL,
    [CU_COMMITTED_ORDER_TOTAL]       FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CU_COMMITTED_ORDER_TOTAL_C]     FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CU_BIC_CODE]                    VARCHAR (11)  NULL,
    [CU_AUDDIS_DATE]                 DATETIME      NULL,
    [CU_DIRECT_DEBIT_STATUS]         VARCHAR (2)   DEFAULT ('') NOT NULL,
    [CU_BUYING_GROUP_FLAG]           BIT           DEFAULT ((0)) NOT NULL,
    [CU_DIRECT_DEBIT_MANDATE_ID]     VARCHAR (35)  NULL,
    [CU_DIRECT_DEBIT_SIGNATURE_DATE] DATETIME      NULL,
    [CU_DD_COLLECTION_ELAPSED_DAYS]  TINYINT       DEFAULT ((14)) NOT NULL,
    [CU_DO_NOT_EMAIL_FROM_ACLOUD]    BIT           DEFAULT ((0)) NOT NULL,
    [CU_ACC_CODE]                    AS            (isnull(nullif([CUCODE],''),isnull([CUPROSCODE],''))),
    CONSTRAINT [CU_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CU_PRIMARY] ASC),
    CONSTRAINT [CU_DIRECT_DEBIT_TYPE_CK] CHECK ([CU_DIRECT_DEBIT_TYPE]='S' OR [CU_DIRECT_DEBIT_TYPE]='B'),
    CONSTRAINT [CU_DIRECT_DEBIT_STATUS_FK] FOREIGN KEY ([CU_DIRECT_DEBIT_STATUS]) REFERENCES [dbo].[SL_DIRECT_DEBIT_STATUSES] ([SDDS_CODE])
);


GO
CREATE NONCLUSTERED INDEX [CUCODE]
    ON [dbo].[SL_ACCOUNTS]([CUCODE] ASC, [CU_DO_NOT_USE] ASC)
    INCLUDE([CUUSER3]);


GO
CREATE NONCLUSTERED INDEX [CUCONTACT]
    ON [dbo].[SL_ACCOUNTS]([CUCONTACT] ASC);


GO
CREATE NONCLUSTERED INDEX [CUNAME]
    ON [dbo].[SL_ACCOUNTS]([CUNAME] ASC);


GO
CREATE NONCLUSTERED INDEX [CUPHONE]
    ON [dbo].[SL_ACCOUNTS]([CUPHONE] ASC);


GO
CREATE NONCLUSTERED INDEX [CUPOSTCODE]
    ON [dbo].[SL_ACCOUNTS]([CUPOSTCODE] ASC);


GO
CREATE NONCLUSTERED INDEX [CUPROSCODE]
    ON [dbo].[SL_ACCOUNTS]([CUPROSCODE] ASC, [CU_DO_NOT_USE] ASC);


GO
CREATE NONCLUSTERED INDEX [CUSORT]
    ON [dbo].[SL_ACCOUNTS]([CUSORT] ASC);


GO
CREATE NONCLUSTERED INDEX [CUUSER1]
    ON [dbo].[SL_ACCOUNTS]([CUUSER1] ASC);


GO
CREATE NONCLUSTERED INDEX [CUUSER2]
    ON [dbo].[SL_ACCOUNTS]([CUUSER2] ASC);


GO
CREATE NONCLUSTERED INDEX [CUUSER3]
    ON [dbo].[SL_ACCOUNTS]([CUUSER3] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CU_ACC_CODE]
    ON [dbo].[SL_ACCOUNTS]([CU_ACC_CODE] ASC)
    INCLUDE([CU_DO_NOT_USE]) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CU_COUNTRY_CODE]
    ON [dbo].[SL_ACCOUNTS]([CU_COUNTRY_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [CU_DEALERCODE]
    ON [dbo].[SL_ACCOUNTS]([CU_DEALERCODE] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SL_ACCOUNTS_CU_DO_NOT_USE_CUCODE]
    ON [dbo].[SL_ACCOUNTS]([CU_DO_NOT_USE] ASC, [CUCODE] ASC);


GO
CREATE TRIGGER [dbo].[AA_EDIT_SL_CUST_DEF_ADDRESSES_T]
    ON [dbo].[SL_ACCOUNTS]
    WITH ENCRYPTION
    AFTER INSERT, UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
CREATE TRIGGER [dbo].[AA_SL_CUCODE_UPD_T]
    ON [dbo].[SL_ACCOUNTS]
    WITH ENCRYPTION
    AFTER UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
create trigger AA_SL_ACCOUNTS_IODT
/*
** Trigger for enforcing Customer/Prospect Account delete business
** rules. The trigger fires when an attempt is made to delete a
** Customer or Prospect Account. The trigger enforces the rule that
** a Customer/Prospect that has been used by the System cannot be
** deleted. Thus if the Customer Account has been used in Sales
** transactions, Sales Orders (which applies to Prospects as well)
** or by a Project then the Account cannot be deleted. The trigger
** goes futher to make sure that when an account is deleted then the
** Customers address record(s),Price matrix data if applicable, budget
** records (SYS_BUDGETS) and all other relevant Customer data (SL_ACCOUNTS2)
** are deleted as well.
**
** Written     :  06/10/1999 ??
** Last Amended:  17/09/2002 NC, 31/10/2002 NC, 22/01/2003 NC, 15/10/2003 MIH, 15/01/2004 DG, 15/01/2004 RL, 10/02/2004 NC, 30/11/2005 NC, 05/04/2006 WW, 13/04/2006 WW, 07/06/2007 SRB, 18/06/2007 DB, 20/07/2007 DB, 02/12/13 NC
*/
on SL_ACCOUNTS
instead of delete

as

set nocount on

declare
   @LT_DeleteSingleRow     bit
,  @LT_DeletingProspects   bit
,  @LT_DeletingCustomers   bit

begin
   if (                       -- Only want to know if > 1 row is being deleted
         select               -- Don't bother counting entire table just top 2 rows
            count(*)
            from
            (
               select top 2
                  CU_PRIMARY
                  from
                     deleted
            ) SL
      ) = 1
      set @LT_DeleteSingleRow = 1
   else
      set @LT_DeleteSingleRow = 0

   if exists
      (
         select
            1
            from
               deleted
            where
               CUCODE is null
               or
               CUCODE = ''
      )
      set @LT_DeletingProspects = 1
   else
      set @LT_DeletingProspects = 0

   if exists
      (
         select
            1
            from
               deleted
            where
                     CUCODE is not null
               and   CUCODE <> ''
      )
      set @LT_DeletingCustomers = 1
   else
      set @LT_DeletingCustomers = 0


   if @LT_DeletingCustomers = 1
      begin
         -- Check if the Customer Account has been used in Sales Transactions
         if exists
            (
               select
                  1
                  from
                     deleted
                        inner join SL_TRANSACTIONS on ST_COPYCUST = deleted.CUCODE
            )
            begin
               if @LT_DeleteSingleRow = 1
                  raiserror
                  (
                     'The Customer Account being deleted has been used in at least one Sales transactions and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               else
                  raiserror
                  (
                     'At least one of the Customer Accounts being deleted has been used in a Sales transactions and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               rollback tran
               return
            end

         -- Check if the Customer Account has been used by Sales Orders
         if exists
            (
               select
                  1
                  from
                     deleted
                        inner join  ORD_HEADER  on       deleted.CUCODE is not null
                                                   and   deleted.CUCODE <> ''
                                                   and   deleted.CUCODE in (OH_ACCOUNT,OH_ACCOUNT_ORDER,OH_ACCOUNT_DELIVERY)
            )
            begin
               if @LT_DeleteSingleRow = 1
                  raiserror
                  (
                     'The Customer Account being deleted has been used in a Sales Order and therefore can not be deleted.'
                  ,  16
                  ,  1
                  )
               else
                  raiserror
                  (
                     'At least one of the Customer Accounts being deleted has been used in a Sales Order and therefore can not be deleted.'
                  ,  16
                  ,  1
                  )
               rollback tran
               return
            end

         -- Check if the Customer Account has been used by a Project
         if exists
            (
               select
                  1
                  from
                     deleted
                        inner join CST_COSTHEADER on  CH_ACCOUNT = deleted.CUCODE
                  where
                           deleted.CUCODE is not null
                     and   deleted.CUCODE <> ''
            )
            begin
               if @LT_DeleteSingleRow = 1
                  raiserror
                  (
                     'The Customer Account being deleted has been used in a Project and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               else
                  raiserror
                  (
                     'At least one of the Customer Accounts being deleted has been used in a Project and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               rollback tran
               return
            end

         -- Check if the Customer Account is a head office referenced by other accounts.
         if exists
            (
               select
                  1
                  from
                     deleted
                        inner join SL_ACCOUNTS2 on       CU_HEAD_OFFICE_CODE  =  deleted.CUCODE
                                                   and   CUCODE2              <> deleted.CUCODE
                  where
                           deleted.CUCODE is not null
                     and   deleted.CUCODE <> ''
            )
            begin
               if @LT_DeleteSingleRow = 1
                  raiserror
                  (
                     'The Customer Account being deleted is a head office account referenced by other accounts and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               else
                  raiserror
                  (
                     'At least one of the Customer Accounts being deleted is a head office account referenced by other accounts and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               rollback tran
               return
            end

         -- Check if the Customer Account is assigned as a Dealer Code to another customer/prospect.
         if exists
            (
               select
                  1
                  from
                     deleted
                        inner join SL_ACCOUNTS Dealer on Dealer.CU_DEALERCODE = deleted.CUCODE
                  where
                           deleted.CUCODE is not null
                     and   deleted.CUCODE <> ''
            )
            begin
               if @LT_DeleteSingleRow = 1
                  raiserror
                  (
                     'The Customer Account being deleted is assigned as a Dealer code to other accounts and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               else
                  raiserror
                  (
                     'At least one of the Customer Accounts being deleted is assigned as a Dealer code to other accounts and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               rollback tran
               return
            end

         -- Check if the Customer Account is assigned to Postcode Management.
         if exists
            (
               select
                  1
                  from
                     deleted
                        inner join SL_PROSPECT_LINK   on PLINK_DEALER = deleted.CUCODE
                  where
                           deleted.CUCODE is not null
                     and   deleted.CUCODE <> ''
            )
            begin
               if @LT_DeleteSingleRow = 1
                  raiserror
                  (
                     'The Customer Account being deleted is assigned to Postcode Management and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               else
                  raiserror
                  (
                     'At least one of the Customer Accounts being deleted is assigned to Postcode Management and therefore cannot be deleted.'
                  ,  16
                  ,  1
                  )
               rollback tran
               return
            end
      end

   if @LT_DeletingProspects = 1
      begin
         -- Check if the Prospect Account has been used by Estimates
         if exists
            (
               select
                  1
                  from
                     deleted
                        inner join  ORD_HEADER  on       deleted.CUPROSCODE is not null
                                                   and   deleted.CUPROSCODE <> ''
                                                   and   deleted.CUPROSCODE in (OH_ACCOUNT,OH_ACCOUNT_ORDER,OH_ACCOUNT_DELIVERY)
            )
            begin
               if @LT_DeleteSingleRow = 1
                  raiserror
                  (
                     'The Prospect Account being deleted has been used in a Sales Order estimate and therefore can not be deleted.'
                  ,  16
                  ,  1
                  )
               else
                  raiserror
                  (
                     'At least one of the Prospect Accounts being deleted has been used in a Sales Order estimate and therefore can not be deleted.'
                  ,  16
                  ,  1
                  )
               rollback tran
               return
            end
      end

   begin tran
      /*
      ** Delete as much as we can of associated records before deleting the customer & prospect records
      */
      if @LT_DeletingCustomers = 1  -- Deleting Customers...
         begin
            -- Check if the Price matrix customer option is selected and delete the Price Matrix for the Customer Account if the option is selected
            if (
                  select
                     STK_MAT_CUSTOPT
                     from
                        SYS_DATAINFO with(nolock)
                     where
                        SYS_PRIMARY = 1
               ) = 0
               delete STK_MATRIX
                  from
                     deleted
                        inner join STK_MATRIX   on MAT_CUSTOMER = deleted.CUCODE
                  where
                           deleted.CUCODE is not null
                     and   deleted.CUCODE <> ''

            delete CM_PICKLIST
               from
                  deleted
                     inner join CM_PICKLIST  on PK_CUPROSCODE = deleted.CUCODE
               where
                        deleted.CUCODE is not null
                  and   deleted.CUCODE <> ''

         -- Delete Budget records
            delete SYS_BUDGETS
               from
                  deleted
                     inner join SYS_BUDGETS  on       B_ACCOUNT_CODE = deleted.CUCODE
                                                and   B_RECORD_TYPE  = 'S'
               where
                        deleted.CUCODE is not null
                  and   deleted.CUCODE <> ''

            delete SL_NOTES
               from
                  deleted
                     inner join  SL_NOTES_LINK  on    SLN_LINK_CUSTOMER = CU_PRIMARY
                     inner join  SL_NOTES       on    SLN_PRIMARY       = SLN_LINK_NOTE
         end

      if @LT_DeletingProspects = 1  -- Deleting Prospects...
         begin
            -- Delete the Prospect's list from Prospect Accounts' Pick list
            delete CM_PICKLIST
               from
                  deleted
                     inner join  CM_PICKLIST       on       PK_CUPROSCODE     = deleted.CUPROSCODE
               where
                        deleted.CUPROSCODE is not null
                  and   deleted.CUPROSCODE <> ''

            -- Delete the Prospect from the Customer/Prospect log information
            delete LOG_SL_ACCOUNTS
               from
                  deleted
                     inner join  LOG_SL_ACCOUNTS   on       LOG_SACC_PARENT   = deleted.CU_PRIMARY
               where
                        deleted.CUPROSCODE is not null
                  and   deleted.CUPROSCODE <> ''
         end

      delete SL_BUYING_GROUPS
         from
            deleted
               join SL_BUYING_GROUPS on SBGR_CUSTOMER_LINK   = deleted.CU_PRIMARY

      -- Delete Customers & Prospects
      delete SL_ACCOUNTS2
         from
            deleted
               inner join SL_ACCOUNTS2    on CU_PRIMARY_2   = deleted.CU_PRIMARY

      delete SL_ACCOUNTS
         from
            deleted
               inner join SL_ACCOUNTS SL  on SL.CU_PRIMARY  = deleted.CU_PRIMARY

      /*
      ** Have to delete addresses after customer & prospects have been removed because trigger on addresses table
      ** won't let you delete main address record for an existing customer.
      */
      if @LT_DeletingCustomers = 1  -- Deleting Customers...
         begin
            delete SL_ADDRESSES
               from
                  deleted
                     inner join SL_ADDRESSES on       AD_ACC_CODE = deleted.CUCODE
                                                and   (
                                                         AD_PROSPECT <> 'P'
                                                         or
                                                         AD_PROSPECT is null
                                                      )
               where
                        deleted.CUCODE is not null
                  and   deleted.CUCODE <> ''

         end

      if @LT_DeletingProspects = 1  -- Deleting Prospects...
         begin
            -- Delete the address record(s) for the deleted Prospect account
            delete SL_ADDRESSES
               from
                  deleted
                     inner join  SL_ADDRESSES      on       AD_ACC_CODE       = deleted.CUPROSCODE
                                                      and   AD_PROSPECT       = 'P'
               where
                        deleted.CUPROSCODE is not null
                  and   deleted.CUPROSCODE <> ''
         end

   commit tran
end
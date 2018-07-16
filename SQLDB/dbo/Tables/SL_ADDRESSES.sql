CREATE TABLE [dbo].[SL_ADDRESSES] (
    [AD_ACC_CODE]              VARCHAR (10)  NULL,
    [AD_CODE]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [AD_CON_CODE]              VARCHAR (16)  NULL,
    [AD_ADDRESS]               VARCHAR (160) NULL,
    [AD_POSTCODE]              VARCHAR (12)  NULL,
    [AD_HOME_PHONE]            VARCHAR (20)  NULL,
    [AD_EXTENSION]             VARCHAR (20)  NULL,
    [AD_PHONE]                 VARCHAR (20)  NULL,
    [AD_FAX]                   VARCHAR (20)  NULL,
    [AD_MOBILE]                VARCHAR (20)  NULL,
    [AD_E_MAIL]                VARCHAR (64)  NULL,
    [AD_CONTACT]               VARCHAR (30)  NULL,
    [AD_CONT_SALUTE]           VARCHAR (20)  NULL,
    [AD_INV_ADDRESS]           TINYINT       DEFAULT ((0)) NULL,
    [AD_DEL_ADDRESS]           TINYINT       DEFAULT ((0)) NULL,
    [AD_STAT_ADDRESS]          TINYINT       DEFAULT ((0)) NULL,
    [AD_PROSPECT]              VARCHAR (1)   NULL,
    [AD_ACCOUNTNAME]           TINYINT       DEFAULT ((0)) NULL,
    [AD_NOTE]                  TEXT          NULL,
    [AD_CON_TITLE]             VARCHAR (5)   NULL,
    [AD_CON_INITIALS]          VARCHAR (15)  NULL,
    [AD_CON_SURNAME]           VARCHAR (30)  NULL,
    [AD_CON_JOB]               VARCHAR (35)  NULL,
    [AD_CON_FNAME]             VARCHAR (20)  NULL,
    [AD_DEALERCODE]            VARCHAR (10)  NULL,
    [AD_USERTEXT1]             VARCHAR (20)  NULL,
    [AD_USERTEXT2]             VARCHAR (20)  NULL,
    [AD_USERDATE1]             DATETIME      NULL,
    [AD_USERNUM1]              FLOAT (53)    DEFAULT ((0)) NULL,
    [AD_USERFLAG1]             TINYINT       DEFAULT ((0)) NULL,
    [AD_USERFLAG2]             TINYINT       DEFAULT ((0)) NULL,
    [AD_USERFLAG3]             TINYINT       DEFAULT ((0)) NULL,
    [AD_USERFLAG4]             TINYINT       DEFAULT ((0)) NULL,
    [AD_EDITED_TIME]           DATETIME      NULL,
    [AD_RECALL_TIME]           DATETIME      NULL,
    [AD_USER_EDITED]           VARCHAR (4)   NULL,
    [AD_USER_PUTIN]            VARCHAR (4)   NULL,
    [AD_DATE_PUTIN]            DATETIME      NULL,
    [AD_DATE_EDITED]           DATETIME      NULL,
    [SL_AD_PRIMARY]            FLOAT (53)    NOT NULL,
    [AD_USERTEXT3]             VARCHAR (20)  NULL,
    [AD_USERTEXT4]             VARCHAR (20)  NULL,
    [AD_USERTEXT5]             VARCHAR (100) NULL,
    [AD_USERTEXT6]             VARCHAR (100) NULL,
    [AD_USERDATE2]             DATETIME      NULL,
    [AD_USERDATE3]             DATETIME      NULL,
    [AD_USERNUM2]              FLOAT (53)    DEFAULT ((0)) NULL,
    [AD_USERNUM3]              FLOAT (53)    DEFAULT ((0)) NULL,
    [AD_USERTEXT7]             VARCHAR (20)  NULL,
    [AD_USERTEXT8]             VARCHAR (20)  NULL,
    [AD_USERTEXT9]             VARCHAR (20)  NULL,
    [AD_USERTEXT10]            VARCHAR (20)  NULL,
    [AD_ADDRESS_USER1]         VARCHAR (30)  NULL,
    [AD_ADDRESS_USER2]         VARCHAR (30)  NULL,
    [AD_USER_ALOC]             VARCHAR (4)   NULL,
    [AD_ANALYSIS]              VARCHAR (25)  NULL,
    [AD_LEVEL]                 INT           DEFAULT ((0)) NULL,
    [AD_GROUP]                 VARCHAR (10)  NULL,
    [AD_DEL_ADDRESS_2]         TINYINT       DEFAULT ((0)) NULL,
    [AD_DLR_NOTIFICATION]      TINYINT       DEFAULT ((0)) NULL,
    [AD_DLR_NOTIFICATION_DATE] DATETIME      NULL,
    [AD_CNT_NOTIFICATION]      TINYINT       DEFAULT ((0)) NULL,
    [AD_CNT_NOTIFICATION_DATE] DATETIME      NULL,
    [AD_SOURCE]                VARCHAR (1)   NULL,
    [AD_CC_EMAIL]              VARCHAR (64)  NULL,
    [AD_COUNTRY]               VARCHAR (35)  NULL,
    [AD_DO_NOT_USE]            TINYINT       DEFAULT ((0)) NULL,
    [AD_COUNTRY_CODE]          VARCHAR (4)   NULL,
    [AD_EXPORT_CODE]           VARCHAR (1)   NULL,
    [AD_BRANCH_ID]             VARCHAR (3)   NULL,
    [AD_VAT_REG_NO]            VARCHAR (21)  NULL,
    [AD_EC_DELIVERY]           VARCHAR (3)   NULL,
    [AD_EC_T_NATURE]           VARCHAR (2)   NULL,
    [AD_EC_T_MODE]             VARCHAR (1)   NULL,
    [AD_USED_FLAG]             TINYINT       DEFAULT ((0)) NULL,
    [AD_DO_NOT_EMAIL]          BIT           DEFAULT ((0)) NOT NULL,
    [AD_DATE_ALLOCATED]        DATETIME      NULL,
    [AD_DELIVERY_ROUTE]        VARCHAR (20)  NULL,
    CONSTRAINT [SL_AD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SL_AD_PRIMARY] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AD_ACC_CODE]
    ON [dbo].[SL_ADDRESSES]([AD_ACC_CODE] ASC, [AD_CODE] ASC)
    INCLUDE([AD_DELIVERY_ROUTE]);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AD_CON_CODE]
    ON [dbo].[SL_ADDRESSES]([AD_CON_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_CON_SURNAME]
    ON [dbo].[SL_ADDRESSES]([AD_CON_SURNAME] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_POSTCODE]
    ON [dbo].[SL_ADDRESSES]([AD_POSTCODE] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERDATE1]
    ON [dbo].[SL_ADDRESSES]([AD_USERDATE1] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERDATE2]
    ON [dbo].[SL_ADDRESSES]([AD_USERDATE2] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERDATE3]
    ON [dbo].[SL_ADDRESSES]([AD_USERDATE3] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERNUM1]
    ON [dbo].[SL_ADDRESSES]([AD_USERNUM1] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERNUM2]
    ON [dbo].[SL_ADDRESSES]([AD_USERNUM2] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERNUM3]
    ON [dbo].[SL_ADDRESSES]([AD_USERNUM3] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERTEXT1]
    ON [dbo].[SL_ADDRESSES]([AD_USERTEXT1] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERTEXT2]
    ON [dbo].[SL_ADDRESSES]([AD_USERTEXT2] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERTEXT3]
    ON [dbo].[SL_ADDRESSES]([AD_USERTEXT3] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USERTEXT4]
    ON [dbo].[SL_ADDRESSES]([AD_USERTEXT4] ASC);


GO
CREATE NONCLUSTERED INDEX [AD_USER_ALOC]
    ON [dbo].[SL_ADDRESSES]([AD_USER_ALOC] ASC);


GO
CREATE TRIGGER [dbo].[AA_EDIT_SL_DEF_ADDRESSES_T]
    ON [dbo].[SL_ADDRESSES]
    WITH ENCRYPTION
    AFTER INSERT, UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
create trigger AA_SL_ADDRESSES_IODT
/*
** Trigger for enforcing customer address delete business rules.
** The trigger fires when an attempt is made to delete a customer
** address. The trigger ensures that the business rule which stipulates
** that a customer address not be deleted if in use is enforced, by
** disallowing deletes of customer addresses which are the first address,
** set as a default invoice, delivery or statement address, or
** used by sop orders
**
** Written     :  13/12/2002 MIH
** Last Amended:  17/12/2002 MIH, 15/10/2003 MIH, 07/06/2007 SRB, 04/07/2007 DB, 08/08/2007 DB
*/
on dbo.SL_ADDRESSES
instead of delete

as

declare
   @LT_DeleteSingleRow           bit
,  @LT_CustomerOrProspectExists  bit
,  @LT_Record_Label              varchar(40)

if (                       -- Only want to know if > 1 row is being deleted
      select               -- Don't bother counting entire table just top 2 rows
         count(*)
         from
         (
            select top 2
               SL_AD_PRIMARY
               from
                  deleted
         ) SL
   ) = 1
   set @LT_DeleteSingleRow = 1
else
   set @LT_DeleteSingleRow = 0

-- determines whether to do all validation or not as may have called by customer delete trigger
if exists
   (
      select
         1
         from
            (
               select
                  AD_ACC_CODE
               ,  case isnull(AD_PROSPECT,'')
                     when 'P' then 'P'
                     else
                        null
                  end                           AD_PROSPECT
                  from
                     deleted
            )  ToBeDeleted
               left join   (
                              select
                                 CUCODE
                                 from
                                    SL_ACCOUNTS
                                 where
                                          CUCODE is not null
                                    and   CUCODE <> ''
                           )  Customers
                           on       Customers.CUCODE  = ToBeDeleted.AD_ACC_CODE
                              and   AD_PROSPECT       is null
               left join   (
                              select
                                 CUPROSCODE
                                 from
                                    SL_ACCOUNTS
                                 where
                                          CUPROSCODE is not null
                                    and   CUPROSCODE <> ''
                           ) Prospects
                           on       Prospects.CUPROSCODE = ToBeDeleted.AD_ACC_CODE
                              and   AD_PROSPECT          = 'P'
         where
            CUCODE      is not null
            or
            CUPROSCODE  is not null
   )
   set @LT_CustomerOrProspectExists = 1
else
   set @LT_CustomerOrProspectExists = 0

-- holds the label for raiserror messages based on record type
if @LT_DeleteSingleRow = 1  -- if only one record to delete then check whether customer or prospect
   begin
      if (
            select
               count(*)
               from
                  deleted
               where
                  deleted.AD_PROSPECT <> 'P'
                  or
                  deleted.AD_PROSPECT is null
         ) > 0
         set @LT_Record_Label = 'Customer Address'
      else
         set @LT_Record_Label = 'Prospect Contact'
   end
else
   set @LT_Record_Label = 'Customer Address/Prospect Contact'

-- Customer/Prospect exists so do ALL checks
if @LT_CustomerOrProspectExists > 0
   begin
      -- is the address the first address then cannot delete
      if exists
         (
            select
               1
               from
                  deleted
               where
                  deleted.AD_CODE = 1
         )
         begin
            raiserror('A main %s cannot be deleted.',16,1,@LT_Record_Label)
            rollback tran
            return
         end

      -- is the address flagged as the default invoice address
      if exists
         (
            select
               1
               from
                  deleted
               where
                  deleted.AD_INV_ADDRESS = 1
         )
         begin
            raiserror('A default Invoice %s cannot be deleted.',16,1,@LT_Record_Label)
            rollback tran
            return
         end

      -- is the address flagged as the default delivery address
      if exists
         (
            select
               1
               from
                  deleted
               where
                  deleted.AD_DEL_ADDRESS = 1
         )
         begin
            raiserror('A default Delivery %s cannot be deleted.',16,1,@LT_Record_Label)
            rollback tran
            return
         end

      -- is the address flagged as the default statement address
      if exists
         (
            select
               1
               from
                  deleted
               where
                  deleted.AD_STAT_ADDRESS = 1
         )
         begin
            raiserror('A default Statement %s cannot be deleted.',16,1,@LT_Record_Label)
            rollback tran
            return
         end
   end

-- is the address used as an invoice address on a SOP order
if exists
   (
      select
         1
         from
            deleted
               inner join ORD_HEADER on         OH_ACCOUNT  = deleted.AD_ACC_CODE
                                          and   OH_INV_ADD  = deleted.AD_CODE
   )
   begin
      if @LT_DeleteSingleRow = 1
         raiserror('This %s is used by SOP Order/Credit Notes and cannot be deleted.',16,1,@LT_Record_Label)
      else
         raiserror('At least one %s being deleted is used by SOP Order/Credit Notes and cannot be deleted.',16,1,@LT_Record_Label)
      rollback tran
      return
   end

-- is the address used as a delivery address on a batched SOP order
if exists
   (
      select
         1
         from
            deleted
               inner join ORD_HEADER on         OH_ACCOUNT_DELIVERY  = deleted.AD_ACC_CODE
                                          and   OH_BATCH_FLAG        = 1
                                          and   OH_DEL_ADD           = deleted.AD_CODE
   )
   begin
      if @LT_DeleteSingleRow = 1
         raiserror('This %s is used by batched SOP Order/Credit Notes and cannot be deleted.',16,1,@LT_Record_Label)
      else
         raiserror('At least one %s being deleted is used by batched SOP Order/Credit Notes and cannot be deleted.',16,1,@LT_Record_Label)
      rollback tran
      return
   end

-- is the address used as a delivery address on a batched POP order
if exists
   (
      select
         1
         from
            deleted
               inner join POP_HEADER on         POH_BATCH_FLAG    = 1
                                          and   POH_DEL_ADD_POINT = 'CU'
                                          and   POH_DEL_ADD       = deleted.SL_AD_PRIMARY
   )
   begin
      if @LT_DeleteSingleRow = 1
         raiserror('This %s is used by batched POP Order/Credit Notes and cannot be deleted.',16,1,@LT_Record_Label)
      else
         raiserror('At least one %s being deleted is used by batched POP Order/Credit Notes and cannot be deleted.',16,1,@LT_Record_Label)
      rollback tran
      return
   end

begin tran
   -- now delete all other relevant data from other related tables
   -- delete pick list records
   delete CM_PICKLIST
      from
         deleted
            inner join CM_PICKLIST        on PK_ADD_CON_CODE            = deleted.AD_CON_CODE

   -- delete address log records
   delete LOG_SL_ADDRESSES
      from
         deleted
            inner join LOG_SL_ADDRESSES   on LOG_SADD_PARENT            = deleted.SL_AD_PRIMARY

   -- delete from additional address table
   delete SL_ADDRESSES2
      from
         deleted
            inner join SL_ADDRESSES2      on AD_PRIMARY_2               = deleted.SL_AD_PRIMARY

   delete SL_ADDRESSES
      from
         deleted
            inner join SL_ADDRESSES       on SL_ADDRESSES.SL_AD_PRIMARY = deleted.SL_AD_PRIMARY
commit tran
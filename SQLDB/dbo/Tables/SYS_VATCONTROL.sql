CREATE TABLE [dbo].[SYS_VATCONTROL] (
    [VAT_CODE]          VARCHAR (4)  NULL,
    [VAT_RATE]          FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_NET_OUTPUT]    FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_NET_INPUT]     FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_OUTPUT]        FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_INPUT]         FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_NAME]          VARCHAR (40) NULL,
    [UPDTE_FROM_PER]    FLOAT (53)   DEFAULT ((0)) NULL,
    [UPDTE_TO_PER]      FLOAT (53)   DEFAULT ((0)) NULL,
    [UPDATED_DATE]      DATETIME     NULL,
    [UPDTE_FIRST_SEQ]   FLOAT (53)   DEFAULT ((0)) NULL,
    [UPDTE_LAST_SEQ]    FLOAT (53)   DEFAULT ((0)) NULL,
    [UPDTE_USER]        VARCHAR (4)  NULL,
    [UPDTE_FROM_YEAR]   VARCHAR (1)  NULL,
    [UPDTE_TO_YEAR]     VARCHAR (1)  NULL,
    [VAT_EC_IMP_GDS]    FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_EC_EXP_GDS]    FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_EC_ACQUISIT]   FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_EC_SUPPLIES]   FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_EC_VATACQS]    FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_RULE_FLAG]     TINYINT      DEFAULT ((0)) NULL,
    [EC_TYPE]           VARCHAR (1)  NULL,
    [ESL_YEAR_FROM]     VARCHAR (1)  NULL,
    [ESL_YEAR_TO]       VARCHAR (1)  NULL,
    [ESL_PERD_FROM]     TINYINT      DEFAULT ((0)) NULL,
    [ESL_PERD_TO]       TINYINT      DEFAULT ((0)) NULL,
    [CASHOUT_INV_BF]    FLOAT (53)   DEFAULT ((0)) NULL,
    [CASHOUT_VAT_BF]    FLOAT (53)   DEFAULT ((0)) NULL,
    [CASHOUT_VALUE]     FLOAT (53)   DEFAULT ((0)) NULL,
    [CASHOUT_VAT]       FLOAT (53)   DEFAULT ((0)) NULL,
    [CASHIN_INV_BF]     FLOAT (53)   DEFAULT ((0)) NULL,
    [CASHIN_VAT_BF]     FLOAT (53)   DEFAULT ((0)) NULL,
    [CASHIN_VALUE]      FLOAT (53)   DEFAULT ((0)) NULL,
    [CASHIN_VAT]        FLOAT (53)   DEFAULT ((0)) NULL,
    [TAX_SORT_CODE]     VARCHAR (4)  NULL,
    [TAX_RATE1]         FLOAT (53)   DEFAULT ((0)) NULL,
    [TAX_RATE2]         FLOAT (53)   DEFAULT ((0)) NULL,
    [TAX_RATE3]         FLOAT (53)   DEFAULT ((0)) NULL,
    [TAX_RATE4]         FLOAT (53)   DEFAULT ((0)) NULL,
    [TAX_RATE5]         FLOAT (53)   DEFAULT ((0)) NULL,
    [TAX_RATE6]         FLOAT (53)   DEFAULT ((0)) NULL,
    [VAT_DATE_PUTIN]    DATETIME     NULL,
    [VAT_USER_PUTIN]    VARCHAR (4)  NULL,
    [VAT_DATE_EDITED]   DATETIME     NULL,
    [VAT_USER_EDITED]   VARCHAR (4)  NULL,
    [VAT_PRIMARY]       FLOAT (53)   NOT NULL,
    [VAT_SYSTEM]        TINYINT      DEFAULT ((0)) NULL,
    [VAT_TYPE]          TINYINT      DEFAULT ((0)) NULL,
    [VAT_RULE_COUNT]    INT          DEFAULT ((0)) NULL,
    [VAT_RATE_ICC]      FLOAT (53)   DEFAULT ((0)) NULL,
    [UPDTE_FROM_DATE]   DATETIME     NULL,
    [UPDTE_TO_DATE]     DATETIME     NULL,
    [ESL_FROM_DATE]     DATETIME     NULL,
    [ESL_TO_DATE]       DATETIME     NULL,
    [VAT_ACLOUD_SYNCED] BIT          DEFAULT ((0)) NOT NULL,
    CONSTRAINT [VAT_PRIMARY_PK] PRIMARY KEY CLUSTERED ([VAT_PRIMARY] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [VAT_CODE]
    ON [dbo].[SYS_VATCONTROL]([VAT_CODE] ASC);


GO
CREATE TRIGGER [dbo].[AA_SYS_VATCONTROL_UT]
    ON [dbo].[SYS_VATCONTROL]
    WITH ENCRYPTION
    AFTER UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
create trigger AA_SYS_VATCONTROL_IODT
/*
** Trigger for enforcing vat rate delete business rules.
** The trigger fires when an attempt is made to delete a vat
** rate. The trigger ensures that the business rule which stipulates
** that a vat rate not be deleted if in use is enforced, by
** disallowing deletes of vat rates which are default system rates, or
** used on sales analysis, purchase analysis, transaction detail, sop detail
** or pop detail
**
** Written     :  25/06/2010 DB
** Last Amended:  30/06/2010 DB
*/
on dbo.SYS_VATCONTROL
instead of delete

as

declare
   @LT_VATCodes   varchar(max)

set @LT_VATCodes = ''

-- Cannot delete a system VAT rate
if exists
   (
      select
         1
         from
            deleted
         where
            deleted.VAT_SYSTEM = 2
            or
            deleted.VAT_SYSTEM = 3
   )
   begin
      if @@trancount>0
         rollback tran
      raiserror('A system VAT rate cannot be deleted.',16,1)
      return
   end

select
   @LT_VATCodes = @LT_VATCodes + ''''+VAT_CODE+''', '
   from
      deleted
   where
      dbo.AA_SYS_VAT_RATE_USED_F(VAT_PRIMARY,VAT_CODE) > 0
if len(@LT_VATCodes)>0
   begin
      if @@trancount>0
         rollback tran
      set @LT_VATCodes = substring(@LT_VATCodes,1,len(@LT_VATCodes)-1)
      raiserror('The following VAT codes cannot be deleted because they are in use: %s.',16,1,@LT_VATCodes)
      return
   end

begin tran
delete from SYS_VATCONTROL
   from
      deleted
         inner join SYS_VATCONTROL SVC on SVC.VAT_PRIMARY = deleted.VAT_PRIMARY
if @@error <> 0
   begin
      if @@trancount>0
         rollback tran
      raiserror('Failed to delete from SYS_VATCONTROL.',16,1)
   end
commit tran
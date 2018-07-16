CREATE TABLE [dbo].[SYS_VAT_DEFAULTS] (
    [SVD_TYPE]   CHAR (4)    NOT NULL,
    [SVD_HOME]   VARCHAR (4) NOT NULL,
    [SVD_EU]     VARCHAR (4) NOT NULL,
    [SVD_NON_EU] VARCHAR (4) NOT NULL,
    CONSTRAINT [SVD_TYPE_PK] PRIMARY KEY CLUSTERED ([SVD_TYPE] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [SVD_EU_FK] FOREIGN KEY ([SVD_EU]) REFERENCES [dbo].[SYS_VATCONTROL] ([VAT_CODE]),
    CONSTRAINT [SVD_HOME_FK] FOREIGN KEY ([SVD_HOME]) REFERENCES [dbo].[SYS_VATCONTROL] ([VAT_CODE]),
    CONSTRAINT [SVD_NON_EU_FK] FOREIGN KEY ([SVD_NON_EU]) REFERENCES [dbo].[SYS_VATCONTROL] ([VAT_CODE])
);


GO
CREATE TRIGGER [dbo].[AA_SYS_VAT_DEFAULTS_IUT]
    ON [dbo].[SYS_VAT_DEFAULTS]
    WITH ENCRYPTION
    AFTER INSERT, UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
create trigger AA_SYS_VAT_DEFAULTS_IODT
/*
** Trigger to prevent deletion of rows.
**
** Written     :  17/06/2010 DB
** Last Amended:
*/
on SYS_VAT_DEFAULTS
instead of delete

as

raiserror('VAT default records cannot be deleted.',16,1)

if @@trancount>0
   rollback tran
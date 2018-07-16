CREATE TABLE [dbo].[SYS_DEBT_STATUS] (
    [DS_PRIMARY]            INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DS_STATUS_DESCRIPTION] VARCHAR (30) NULL,
    [DS_CREDIT_CONTROLLER]  VARCHAR (4)  NULL,
    [DS_SYSTEM_STATUS]      BIT          NOT NULL,
    [DS_ORDER]              INT          NOT NULL,
    CONSTRAINT [DS_PRIMARY_PK] PRIMARY KEY CLUSTERED ([DS_PRIMARY] ASC)
);


GO
CREATE TRIGGER [dbo].[aa_sys_debt_status_dt]
    ON [dbo].[SYS_DEBT_STATUS]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


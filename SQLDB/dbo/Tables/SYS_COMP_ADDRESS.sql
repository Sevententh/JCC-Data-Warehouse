﻿CREATE TABLE [dbo].[SYS_COMP_ADDRESS] (
    [COAD_PRIMARY]       INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [COAD_USER_PUTIN]    VARCHAR (4)   NULL,
    [COAD_DATE_PUTIN]    DATETIME      NULL,
    [COAD_USER_EDITED]   VARCHAR (4)   NULL,
    [COAD_DATE_EDITED]   DATETIME      NULL,
    [COAD_CODE]          VARCHAR (13)  NULL,
    [COAD_NAME]          VARCHAR (40)  NULL,
    [COAD_ADDRESS]       VARCHAR (160) NULL,
    [COAD_ADDRESS_USER1] VARCHAR (30)  NULL,
    [COAD_ADDRESS_USER2] VARCHAR (30)  NULL,
    [COAD_POSTCODE]      VARCHAR (12)  NULL,
    [COAD_PHONE]         VARCHAR (20)  NULL,
    [COAD_FAX]           VARCHAR (20)  NULL,
    [COAD_EMAIL]         VARCHAR (64)  NULL,
    [COAD_MOBILE]        VARCHAR (20)  NULL,
    [COAD_ANACODE]       VARCHAR (13)  NULL,
    [COAD_USERSORT1]     VARCHAR (20)  NULL,
    [COAD_USERSORT2]     VARCHAR (20)  NULL,
    [COAD_USER_SORT3]    VARCHAR (20)  NULL,
    [COAD_NOTES]         TEXT          NULL,
    [COAD_CONTACT]       VARCHAR (30)  NULL,
    [COAD_ANALYSIS]      VARCHAR (25)  NULL,
    [COAD_DEFAULT]       TINYINT       DEFAULT ((0)) NULL,
    [COAD_COUNTRY]       VARCHAR (35)  NULL,
    [COAD_CC_EMAIL]      VARCHAR (64)  NULL,
    CONSTRAINT [COAD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([COAD_PRIMARY] ASC)
);


GO
CREATE TRIGGER [dbo].[aa_sys_compaddr_dt]
    ON [dbo].[SYS_COMP_ADDRESS]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


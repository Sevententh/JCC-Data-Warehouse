﻿CREATE TABLE [dbo].[LOG_SL_ACCOUNTS] (
    [LOG_SACC_FILE_NO]  TINYINT       DEFAULT ((0)) NULL,
    [LOG_SACC_FIELD_NO] INT           DEFAULT ((0)) NULL,
    [LOG_SACC_DBASE_NO] INT           DEFAULT ((0)) NULL,
    [LOG_SACC_USER_ID]  VARCHAR (4)   NULL,
    [LOG_SACC_DATE]     DATETIME      NULL,
    [LOG_SACC_PARENT]   INT           DEFAULT ((0)) NULL,
    [LOG_SACC_PRIMARY]  INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [LOG_SACC_VALUE]    VARCHAR (250) NULL,
    [LOG_SACC_NOTES]    TEXT          NULL,
    CONSTRAINT [LOG_SACC_PRIMARY_PK] PRIMARY KEY CLUSTERED ([LOG_SACC_PRIMARY] ASC)
);


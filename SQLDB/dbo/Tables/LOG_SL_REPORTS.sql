﻿CREATE TABLE [dbo].[LOG_SL_REPORTS] (
    [LOG_SLREP_USERID]  VARCHAR (4)  NULL,
    [LOG_SLREP_DATE]    DATETIME     NULL,
    [LOG_SLREP_NAME]    VARCHAR (80) NULL,
    [LOG_SLREP_PRIMARY] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    CONSTRAINT [LOG_SLREP_PRIMARY_PK] PRIMARY KEY CLUSTERED ([LOG_SLREP_PRIMARY] ASC)
);


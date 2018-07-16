﻿CREATE TABLE [dbo].[LOG_SL_LETTERS] (
    [LOG_SLLET_PRIMARY] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [LOG_SLLET_USER_ID] VARCHAR (4)  NULL,
    [LOG_SLLET_DATE]    DATETIME     NULL,
    [LOG_SLLET_NAME]    VARCHAR (20) NULL,
    [LOG_SLLET_PARENT]  INT          DEFAULT ((0)) NULL,
    CONSTRAINT [LOG_SLLET_PRIMARY_PK] PRIMARY KEY CLUSTERED ([LOG_SLLET_PRIMARY] ASC)
);


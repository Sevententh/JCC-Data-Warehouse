﻿CREATE TABLE [dbo].[SYS_DIARY] (
    [DIARY_PRIMARY]        INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DIARY_USERID]         VARCHAR (4)  NULL,
    [DIARY_ACTIONDATE]     DATETIME     NULL,
    [DIARY_MODULEOPTION]   VARCHAR (31) NULL,
    [DIARY_MODULE]         VARCHAR (3)  NULL,
    [DIARY_RECORDTYPE]     VARCHAR (6)  NULL,
    [DIARY_RECORDCODE]     VARCHAR (25) NULL,
    [DIARY_STATUS]         TINYINT      DEFAULT ((0)) NULL,
    [DIARY_TEXT]           TEXT         NULL,
    [DIARY_USER_PUTIN]     VARCHAR (4)  NULL,
    [DIARY_DATE_PUTIN]     DATETIME     NULL,
    [DIARY_USER_EDITED]    VARCHAR (4)  NULL,
    [DIARY_DATE_EDITED]    DATETIME     NULL,
    [DIARY_COMPLETED_DATE] DATETIME     NULL,
    [DIARY_PRIORITY]       TINYINT      DEFAULT ((0)) NULL,
    [DIARY_TASK_LINK]      INT          NULL,
    CONSTRAINT [DIARY_PRIMARY_PK] PRIMARY KEY CLUSTERED ([DIARY_PRIMARY] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIARY_MODULEOPTION]
    ON [dbo].[SYS_DIARY]([DIARY_MODULEOPTION] ASC);


GO
CREATE NONCLUSTERED INDEX [DIARY_USERID]
    ON [dbo].[SYS_DIARY]([DIARY_USERID] ASC);


GO
CREATE NONCLUSTERED INDEX [DIARY_TASK_LINK]
    ON [dbo].[SYS_DIARY]([DIARY_TASK_LINK] ASC) WITH (FILLFACTOR = 70);

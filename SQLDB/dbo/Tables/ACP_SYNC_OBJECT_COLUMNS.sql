﻿CREATE TABLE [dbo].[ACP_SYNC_OBJECT_COLUMNS] (
    [ACP_SYNC_COL_PRIMARY]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ACP_SYNC_COL_ID]          VARCHAR (100) NULL,
    [ACP_SYNC_COL_OBJ_ID_LINK] VARCHAR (100) NULL,
    [ACP_SYNC_COL_NAME]        VARCHAR (100) NULL,
    [ACP_SYNC_COL_ISKEY]       BIT           NULL,
    CONSTRAINT [ACP_SYNC_COL_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ACP_SYNC_COL_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


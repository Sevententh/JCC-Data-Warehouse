﻿CREATE TABLE [dbo].[ACP_SYNC_TRANSFER_LOG] (
    [ACP_TRANSFER_LOG_PRIMARY]    INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ACP_TRANSFER_LOG_APP_SUB_ID] VARCHAR (100)  NULL,
    [ACP_TRANSFER_LOG_OBJ_ID]     VARCHAR (100)  NULL,
    [ACP_TRANSFER_LOG_NUMBER]     INT            NULL,
    [ACP_TRANSFER_LOG_TASK_ID]    VARCHAR (100)  NULL,
    [ACP_TRANSFER_LOG_SUCCESSFUL] BIT            NULL,
    [ACP_TRANSFER_LOG_ERROR]      VARCHAR (8000) NULL,
    [ACP_TRANSFER_LOG_TYPE]       TINYINT        NULL,
    [ACP_TRANSFER_LOG_DATETIME]   DATETIME       NULL,
    [ACP_TRANSFER_DIRECTION]      TINYINT        NULL,
    [ACP_TRANSFER_SYNC_TOKEN]     VARCHAR (1000) NULL,
    CONSTRAINT [ACP_TRANSFER_LOG_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ACP_TRANSFER_LOG_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


﻿CREATE TABLE [dbo].[ACP_TRAN_QUERY_SYNC] (
    [ACP_TQS_PRIMARY]            INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ACP_TQS_DATETIME_CREATED]   DATETIME      NULL,
    [ACP_TQS_USER_ID]            VARCHAR (100) NULL,
    [ACP_TQS_TRAN_PRIMARY]       FLOAT (53)    NULL,
    [ACP_TQS_TRAN_ID]            VARCHAR (100) NULL,
    [ACP_TQS_QUERY_FLAG]         BIT           NULL,
    [ACP_TQS_STATEMENT_ID]       VARCHAR (100) NULL,
    [ACP_TQS_ORGANISATION_ID]    VARCHAR (100) NULL,
    [ACP_TQS_PROCESS_STATUS]     TINYINT       NULL,
    [ACP_TQS_USER_FIRST_NAME]    VARCHAR (100) NULL,
    [ACP_TQS_USER_LAST_NAME]     VARCHAR (100) NULL,
    [ACP_TQS_USER_EMAIL_ADDRESS] VARCHAR (64)  NULL,
    [ACP_TQS_DIRECTION]          TINYINT       NULL,
    [ACP_TQS_TASK_ID]            VARCHAR (100) NULL,
    [ACP_TQS_DIMS_USER_ID]       VARCHAR (4)   NULL,
    CONSTRAINT [ACP_TQS_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ACP_TQS_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE NONCLUSTERED INDEX [ACP_TQS_TRAN_PRIMARY]
    ON [dbo].[ACP_TRAN_QUERY_SYNC]([ACP_TQS_TRAN_PRIMARY] ASC) WITH (FILLFACTOR = 70);

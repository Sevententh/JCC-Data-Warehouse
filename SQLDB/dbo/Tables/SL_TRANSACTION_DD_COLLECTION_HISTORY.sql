﻿CREATE TABLE [dbo].[SL_TRANSACTION_DD_COLLECTION_HISTORY] (
    [ST_DDCH_PRIMARY]          INT         IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ST_DDCH_TRANSACTION_LINK] FLOAT (53)  NOT NULL,
    [ST_DDCH_ACTION]           VARCHAR (1) NULL,
    [ST_DDCH_ACTION_DATE]      DATETIME    DEFAULT (getdate()) NOT NULL,
    [ST_DDCH_ACTION_USER_ID]   VARCHAR (4) NOT NULL,
    [ST_DDCH_RESPONSE_CODE]    INT         NULL,
    [ST_DDCH_DD_TYPE]          VARCHAR (1) NOT NULL,
    CONSTRAINT [ST_DDCH_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ST_DDCH_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [ST_DDCH_ACTION_CK] CHECK ([ST_DDCH_ACTION]='P' OR [ST_DDCH_ACTION]='R' OR [ST_DDCH_ACTION]='X' OR [ST_DDCH_ACTION]='B' OR [ST_DDCH_ACTION]=''),
    CONSTRAINT [ST_DDCH_RESPONSE_CODE_FK] FOREIGN KEY ([ST_DDCH_RESPONSE_CODE]) REFERENCES [dbo].[SYS_DD_REASON_CODES] ([DDRC_PRIMARY]),
    CONSTRAINT [ST_DDCH_TRANSACTION_LINK_FK] FOREIGN KEY ([ST_DDCH_TRANSACTION_LINK]) REFERENCES [dbo].[SL_TRANSACTIONS] ([ST_PRIMARY]) ON DELETE CASCADE
);


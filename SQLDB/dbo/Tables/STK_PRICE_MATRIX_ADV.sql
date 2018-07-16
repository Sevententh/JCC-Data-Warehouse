CREATE TABLE [dbo].[STK_PRICE_MATRIX_ADV] (
    [STP_PRIMARY]              FLOAT (53)   NOT NULL,
    [STP_PROD]                 VARCHAR (25) NULL,
    [STP_TYPE]                 VARCHAR (1)  NULL,
    [STP_DISC]                 FLOAT (53)   NULL,
    [STP_FIXED]                FLOAT (53)   NULL,
    [STP_PROD_TYPE]            VARCHAR (1)  NULL,
    [STP_FIXED_OR_QTY]         INT          NULL,
    [STP_PARENT]               FLOAT (53)   NULL,
    [STP_EXCLUDE]              TINYINT      NULL,
    [STP_DISC_CASH]            FLOAT (53)   NULL,
    [STP_BUY_QTY]              FLOAT (53)   NULL,
    [STP_FREE_QTY]             FLOAT (53)   NULL,
    [STP_MAX_ALLOW]            FLOAT (53)   NULL,
    [STP_BOGOF_TYPE]           VARCHAR (1)  NULL,
    [STP_MIN_QTY]              FLOAT (53)   NULL,
    [STP_CHAIN]                FLOAT (53)   NULL,
    [STP_LOC1]                 VARCHAR (25) NULL,
    [STP_LOC2]                 VARCHAR (25) NULL,
    [STP_LOC3]                 VARCHAR (25) NULL,
    [STP_LOC4]                 VARCHAR (25) NULL,
    [STP_LOC5]                 VARCHAR (22) NULL,
    [STP_LOC6]                 VARCHAR (25) NULL,
    [STP_BGF_SAME_OR_DIF_PROD] TINYINT      NULL,
    [STP_BGF_PROD_TYPE]        VARCHAR (1)  NULL,
    [STP_BGF_PROD]             VARCHAR (25) NULL,
    [STP_BGF_APPLY_SPL]        TINYINT      NULL,
    [STP_IGNORE_DISC]          TINYINT      NULL,
    [STP_BGF_INCLUDE_ADD]      TINYINT      DEFAULT ((0)) NULL,
    CONSTRAINT [STP_PRIMARY_PK] PRIMARY KEY CLUSTERED ([STP_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE NONCLUSTERED INDEX [STP_PARENT]
    ON [dbo].[STK_PRICE_MATRIX_ADV]([STP_PARENT] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [STP_PROD]
    ON [dbo].[STK_PRICE_MATRIX_ADV]([STP_PROD] ASC) WITH (FILLFACTOR = 70);


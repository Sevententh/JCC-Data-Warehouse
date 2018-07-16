﻿CREATE TABLE [dbo].[STK_PRICE_LIST_CUST] (
    [STKC_PRIMARY] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [STKC_PARENT]  FLOAT (53)   NULL,
    [STKC_TYPE]    VARCHAR (1)  NULL,
    [STKC_CHAR]    VARCHAR (20) NULL,
    [STKC_EXCLUDE] TINYINT      NULL,
    CONSTRAINT [STKC_PRIMARY_PK] PRIMARY KEY CLUSTERED ([STKC_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE NONCLUSTERED INDEX [STKC_CHAR]
    ON [dbo].[STK_PRICE_LIST_CUST]([STKC_CHAR] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [STKC_PARENT]
    ON [dbo].[STK_PRICE_LIST_CUST]([STKC_PARENT] ASC) WITH (FILLFACTOR = 70);

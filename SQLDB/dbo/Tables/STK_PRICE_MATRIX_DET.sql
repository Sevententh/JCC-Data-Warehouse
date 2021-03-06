﻿CREATE TABLE [dbo].[STK_PRICE_MATRIX_DET] (
    [STPD_PRIMARY]     INT         IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [STPD_HEADER]      INT         NULL,
    [STPD_FROM]        FLOAT (53)  NULL,
    [STPD_TO]          FLOAT (53)  NULL,
    [STPD_FIXED]       FLOAT (53)  NULL,
    [STPD_DISC]        FLOAT (53)  NULL,
    [STPD_TYPE]        VARCHAR (1) NULL,
    [STPD_DISC_CASH]   FLOAT (53)  NULL,
    [STPD_CHAIN]       FLOAT (53)  NULL,
    [STPD_IGNORE_DISC] TINYINT     NULL,
    CONSTRAINT [STPD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([STPD_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE NONCLUSTERED INDEX [STPD_HEADER]
    ON [dbo].[STK_PRICE_MATRIX_DET]([STPD_HEADER] ASC) WITH (FILLFACTOR = 70);


﻿CREATE TABLE [dbo].[SDK_WMS_RECON_DELTA_STOCK] (
    [WMSRDS_PRODUCT_CODE]        VARCHAR (25)    NOT NULL,
    [WMSRDS_PRODUCT_BATCH]       VARCHAR (25)    NOT NULL,
    [WMSRDS_PRODUCT_DESCRIPTION] VARCHAR (80)    NULL,
    [WMSRDS_PRODUCT_PRIMARY]     INT             NULL,
    [WMSRDS_DELTA_QUANTITY]      DECIMAL (24, 8) NULL,
    CONSTRAINT [SDK_WMS_RECON_DELTA_STOCK_PK] PRIMARY KEY CLUSTERED ([WMSRDS_PRODUCT_CODE] ASC, [WMSRDS_PRODUCT_BATCH] ASC) WITH (FILLFACTOR = 70)
);

﻿CREATE TABLE [dbo].[SDK_WMS_INTEGRATION_ERROR_LOG] (
    [WMSEL_PRIMARY]   INT          IDENTITY (1, 1) NOT NULL,
    [WMSEL_QUEUENAME] VARCHAR (50) NULL,
    [WMSEL_ERROR_NO]  INT          NULL,
    [WMSEL_ERROR]     TEXT         NULL,
    [WMSEL_ERRORDATE] DATETIME     NULL
);


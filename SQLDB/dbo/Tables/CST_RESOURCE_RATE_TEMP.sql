﻿CREATE TABLE [dbo].[CST_RESOURCE_RATE_TEMP] (
    [CRT_GUID]           UNIQUEIDENTIFIER NOT NULL,
    [CRT_SEQUENCE]       BIGINT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CRT_STATUS]         TINYINT          NULL,
    [CRT_RESOURCE_LINK]  INT              NULL,
    [CRT_RATE_NUMBER]    TINYINT          NULL,
    [CRT_COST_PRICE]     FLOAT (53)       NULL,
    [CRT_UPLIFT_P]       FLOAT (53)       NULL,
    [CRT_UPLIFT_VALUE]   FLOAT (53)       NULL,
    [CRT_COST_UPLIFT]    FLOAT (53)       NULL,
    [CRT_MARGIN_P]       FLOAT (53)       NULL,
    [CRT_MARGIN_VALUE]   FLOAT (53)       NULL,
    [CRT_FLAT_RATE]      BIT              DEFAULT ((0)) NULL,
    [CRT_SALES_PRICE]    FLOAT (53)       NULL,
    [CRT_CURR_RATE]      FLOAT (53)       NULL,
    [CRT_CURR_LINK]      INT              NULL,
    [CRT_COST_PRICE_C]   FLOAT (53)       NULL,
    [CRT_UPLIFT_VALUE_C] FLOAT (53)       NULL,
    [CRT_COST_UPLIFT_C]  FLOAT (53)       NULL,
    [CRT_MARGIN_VALUE_C] FLOAT (53)       NULL,
    [CRT_SALES_PRICE_C]  FLOAT (53)       NULL,
    [CRT_CURRENCY_CALC]  VARCHAR (1)      NULL,
    [CRT_DEFAULT_STRING] VARCHAR (20)     NULL,
    CONSTRAINT [CRT_RESOURCE_RATE_PK] PRIMARY KEY CLUSTERED ([CRT_GUID] ASC, [CRT_SEQUENCE] ASC)
);


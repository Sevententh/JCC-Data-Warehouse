CREATE TABLE [dbo].[CIS_PAYMENTS] (
    [CIP_PRIMARY]              INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CIP_PERIOD]               INT          NULL,
    [CIP_CONTRACTOR_LINK]      INT          NULL,
    [CIP_GROSS]                FLOAT (53)   NULL,
    [CIP_CITB_LEVY]            FLOAT (53)   NULL,
    [CIP_MATERIALS]            FLOAT (53)   NULL,
    [CIP_TAX_PERCENTAGE]       FLOAT (53)   NULL,
    [CIP_TAX_WITHHELD]         FLOAT (53)   NULL,
    [CIP_TAX_STATUS]           TINYINT      NULL,
    [CIP_PRINTED]              BIT          NULL,
    [CIP_PAYMENT_LINK]         INT          NULL,
    [CIP_CITB_LINK]            INT          NULL,
    [CIP_TAX_LINK]             INT          NULL,
    [CIP_PERIOD_END_DATE]      DATETIME     NULL,
    [CIP_CIS300_FLAG]          BIT          CONSTRAINT [DF_CIS_PAYMENTS_CIP_CIS300_FLAG] DEFAULT ((0)) NULL,
    [CIP_CORRELATION_ID]       VARCHAR (40) NULL,
    [CIP_USE_GROSS_MINUS_LEVY] BIT          DEFAULT ((0)) NOT NULL,
    CONSTRAINT [CIP_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CIP_PRIMARY] ASC)
);


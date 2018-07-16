CREATE TABLE [dbo].[SOP_BATCH_TEMP] (
    [SOB_ID]                      INT             NOT NULL,
    [SOB_ORDER_LINK]              INT             NULL,
    [SOB_DOCUMENT_LINK]           INT             NULL,
    [SOB_PROCESS]                 TINYINT         NULL,
    [SOB_DATE]                    DATETIME        NULL,
    [SOB_YEAR]                    VARCHAR (1)     NULL,
    [SOB_PERIOD]                  TINYINT         NULL,
    [SOB_INVOICE_FULL_ORDER]      BIT             NULL,
    [SOB_CRN_DO_NOT_UPDATE_STOCK] BIT             NULL,
    [SOB_COMBINED_DELIVERY]       BIT             NULL,
    [SOB_REVALUE_CURRENCY]        BIT             NULL,
    [SOB_REVALUE_CURRENCY_RATE]   DECIMAL (16, 6) NULL,
    [SOB_REVALUE_EURO_RATE]       DECIMAL (16, 6) NULL,
    [SOB_REVALUE_BASE2_RATE]      DECIMAL (16, 6) NULL,
    [SOB_SOURCE]                  VARCHAR (1)     NULL,
    [SOB_USER_ID]                 VARCHAR (4)     NULL,
    [SOB_SPID]                    INT             NULL,
    [SOB_TIMESTAMP]               ROWVERSION      NOT NULL,
    [SOB_LINE_NO]                 INT             DEFAULT ((1)) NOT NULL,
    CONSTRAINT [SOP_BATCH_TEMP_PK] PRIMARY KEY CLUSTERED ([SOB_ID] ASC, [SOB_LINE_NO] ASC)
);


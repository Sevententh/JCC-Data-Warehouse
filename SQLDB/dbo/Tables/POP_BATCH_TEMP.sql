CREATE TABLE [dbo].[POP_BATCH_TEMP] (
    [POB_ID]                      INT             NOT NULL,
    [POB_ORDER_LINK]              INT             NULL,
    [POB_DOCUMENT_LINK]           INT             NULL,
    [POB_PROCESS]                 TINYINT         NULL,
    [POB_PROCESS_TYPE]            VARCHAR (1)     NULL,
    [POB_DATE]                    DATETIME        NULL,
    [POB_YEAR]                    VARCHAR (1)     NULL,
    [POB_PERIOD]                  TINYINT         NULL,
    [POB_INVOICE_NUMBER]          VARCHAR (25)    NULL,
    [POB_INTERNAL_REFERENCE]      INT             NULL,
    [POB_DESCRIPTION]             VARCHAR (30)    NULL,
    [POB_DISPUTED]                BIT             NULL,
    [POB_UPDATE_COSTPRICE]        BIT             NULL,
    [POB_CRN_DO_NOT_UPDATE_STOCK] BIT             NULL,
    [POB_REVALUE_CURRENCY]        TINYINT         NULL,
    [POB_REVALUE_CURRENCY_RATE]   DECIMAL (16, 6) NULL,
    [POB_SOURCE]                  VARCHAR (1)     NULL,
    [POB_USER_ID]                 VARCHAR (4)     NULL,
    [POB_SPID]                    INT             NULL,
    [POB_TIMESTAMP]               ROWVERSION      NOT NULL,
    CONSTRAINT [POP_BATCH_TEMP_PK] PRIMARY KEY CLUSTERED ([POB_ID] ASC)
);


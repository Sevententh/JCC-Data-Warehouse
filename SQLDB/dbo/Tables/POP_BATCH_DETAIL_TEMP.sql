CREATE TABLE [dbo].[POP_BATCH_DETAIL_TEMP] (
    [POBD_ID]                          INT             NOT NULL,
    [POBD_LINE_NO]                     INT             NOT NULL,
    [POBD_ORDER_LINK]                  INT             NULL,
    [POBD_STATUS]                      INT             NULL,
    [POBD_DELIVERY_QUANTITY]           DECIMAL (24, 8) NULL,
    [POBD_INVOICE_QUANTITY]            DECIMAL (24, 8) NULL,
    [POBD_SUB_ANALYSIS]                VARCHAR (25)    NULL,
    [POBD_SERIAL_NUMBER]               VARCHAR (40)    NULL,
    [POBD_HOME_NET]                    DECIMAL (24, 8) NULL,
    [POBD_HOME_VAT]                    DECIMAL (24, 8) NULL,
    [POBD_CURRENCY_NET]                DECIMAL (24, 8) NULL,
    [POBD_CURRENCY_VAT]                DECIMAL (24, 8) NULL,
    [POBD_TIMESTAMP]                   ROWVERSION      NOT NULL,
    [POBD_PRICE_CODE]                  VARCHAR (16)    NULL,
    [POBD_VAT_CODE]                    VARCHAR (4)     NULL,
    [POBD_MULTI_SUB_SERIAL_LINK]       INT             NULL,
    [POBD_CO2_CLASSIFICATION_ID]       CHAR (4)        NULL,
    [POBD_CO2_CONSUMPTION_DATE]        DATETIME        NULL,
    [POBD_CO2_YEAR]                    SMALLINT        NULL,
    [POBD_CO2_PERIOD]                  TINYINT         NULL,
    [POBD_CO2_QUANTITY]                FLOAT (53)      NULL,
    [POBD_CO2_1ST_CATEGORY_PRIMARY]    INT             NULL,
    [POBD_CO2_2ND_CATEGORY_PRIMARY]    INT             NULL,
    [POBD_CO2_1ST_CATEGORY_CODE]       VARCHAR (6)     NULL,
    [POBD_CO2_2ND_CATEGORY_CODE]       VARCHAR (6)     NULL,
    [POBD_CO2_UNIT_OF_MEASURE]         VARCHAR (20)    NULL,
    [POBD_CO2_XML]                     TEXT            NULL,
    [POBD_ANALYSIS_CODE]               VARCHAR (25)    NULL,
    [POBD_PROJECT_CODE]                VARCHAR (10)    NULL,
    [POBD_COST_CENTRE_CODE]            VARCHAR (10)    NULL,
    [POBD_DETAIL]                      VARCHAR (240)   NULL,
    [POBD_HOME_UNIT_COST]              DECIMAL (24, 8) NULL,
    [POBD_CURRENCY_UNIT_COST]          DECIMAL (24, 8) NULL,
    [POBD_CALCULATE_QUANTITY_FROM_NET] BIT             NULL,
    [POBD_HOME_GROSS]                  DECIMAL (24, 8) NULL,
    [POBD_CURRENCY_GROSS]              DECIMAL (24, 8) NULL,
    [POBD_CO2_EMISSIONS_GROUP_ID]      VARCHAR (2)     NULL,
    [POBD_CO2_GHG_SCOPE]               TINYINT         NULL,
    [POBD_CO2_SORT_KEY1]               VARCHAR (20)    NULL,
    [POBD_CO2_SORT_KEY1_CREATE]        BIT             NULL,
    [POBD_CO2_SORT_KEY2]               VARCHAR (20)    NULL,
    [POBD_CO2_SORT_KEY2_CREATE]        BIT             NULL,
    [POBD_CO2_SORT_KEY3]               VARCHAR (20)    NULL,
    [POBD_CO2_SORT_KEY3_CREATE]        BIT             NULL,
    [POBD_CO2_SORT_KEY4]               VARCHAR (20)    NULL,
    [POBD_CO2_SORT_KEY4_CREATE]        BIT             NULL,
    [POBD_COMPLETE_LINE]               BIT             NULL,
    [POBD_ACCRUAL_NOMINAL_ACCOUNT]     VARCHAR (25)    NULL,
    [POBD_ALLOW_NO_CARBON]             BIT             NULL,
    CONSTRAINT [POP_BATCH_DETAIL_TEMP_PK] PRIMARY KEY CLUSTERED ([POBD_ID] ASC, [POBD_LINE_NO] ASC)
);


GO
CREATE TRIGGER [dbo].[AA_POP_BATCH_DET_TEMP_DEL_T]
    ON [dbo].[POP_BATCH_DETAIL_TEMP]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


CREATE TABLE [dbo].[STK_TRN_TEMP] (
    [STK_TRAN_ID]                   INT           NOT NULL,
    [STK_LINE_NO]                   INT           NOT NULL,
    [STK_STATUS_TEMP]               TINYINT       NOT NULL,
    [STK_USE_DEFAULT]               VARCHAR (100) NULL,
    [STK_USER_ID]                   VARCHAR (4)   NULL,
    [STK_TRANSACTION_TYPE]          VARCHAR (3)   NULL,
    [STK_TYPE]                      CHAR (1)      NULL,
    [STK_REFERENCE]                 VARCHAR (10)  NULL,
    [STK_BATCH_REFERENCE]           VARCHAR (10)  NULL,
    [STK_TRAN_DATE]                 DATETIME      NULL,
    [STK_TRAN_YEAR]                 CHAR (1)      NULL,
    [STK_TRAN_PERIOD]               TINYINT       NULL,
    [STK_TRAN_STATUS]               CHAR (1)      NULL,
    [STK_STOCK_CODE]                VARCHAR (25)  NULL,
    [STK_SERIAL_NUMBER]             VARCHAR (40)  NULL,
    [STK_SUB_ANALYSIS_CODE]         VARCHAR (25)  NULL,
    [STK_QUANTITY]                  FLOAT (53)    NULL,
    [STK_PRICE_LINE_CODE]           VARCHAR (3)   NULL,
    [STK_PRICE]                     FLOAT (53)    NULL,
    [STK_TRAN_VALUE]                FLOAT (53)    NULL,
    [STK_COSTHEADER]                VARCHAR (10)  NULL,
    [STK_COSTCENTRE]                VARCHAR (10)  NULL,
    [STK_DETAIL]                    VARCHAR (240) NULL,
    [STK_ARCHIVE_FLAG]              TINYINT       NULL,
    [STK_DO_NOT_BATCH]              TINYINT       NULL,
    [STK_UPDATE_COST_PRICE]         TINYINT       NULL,
    [STK_USE_CURRENCY_PRICE]        TINYINT       NULL,
    [STK_IGNORE_QUANTITY_CHECK]     TINYINT       NULL,
    [STK_LANDED_COST_LINE]          TINYINT       NULL,
    [STK_UPDATE_LANDED_COST]        TINYINT       NULL,
    [STK_LOT_NUMBER]                VARCHAR (20)  NULL,
    [STK_RENEW_DATE]                DATETIME      NULL,
    [STK_SERIAL_SORT]               VARCHAR (20)  NULL,
    [STK_SNO_DATE1]                 DATETIME      NULL,
    [STK_SNO_DATE2]                 DATETIME      NULL,
    [STK_SNO_DATE3]                 DATETIME      NULL,
    [STK_SERIAL_NOTES]              VARCHAR (240) NULL,
    [STK_ACCOUNT_REF]               VARCHAR (10)  NULL,
    [STK_ORDER_REF]                 VARCHAR (10)  NULL,
    [STK_SOURCE]                    VARCHAR (1)   NULL,
    [STK_ANALYSIS]                  VARCHAR (25)  NULL,
    [STK_DO_NOT_UPDATE_NOMINAL]     TINYINT       NULL,
    [STK_PRIMARY]                   INT           NULL,
    [STK_ORIGIN]                    VARCHAR (3)   NULL,
    [STK_USER_CHAR1]                VARCHAR (20)  NULL,
    [STK_USER_CHAR2]                VARCHAR (20)  NULL,
    [STK_USER_CHAR3]                VARCHAR (100) NULL,
    [STK_USER_CHAR4]                VARCHAR (100) NULL,
    [STK_USER_FLAG1]                TINYINT       NULL,
    [STK_USER_FLAG2]                TINYINT       NULL,
    [STK_USER_DATE1]                DATETIME      NULL,
    [STK_USER_DATE2]                DATETIME      NULL,
    [STK_USER_NUMBER1]              FLOAT (53)    NULL,
    [STK_USER_NUMBER2]              FLOAT (53)    NULL,
    [STK_SERIAL_MULTI_LINK]         INT           NULL,
    [STK_SERIAL_EXCLUDE_FROM_SOP]   BIT           NULL,
    [STK_SELECT_FIRST_SUB_ANALYSIS] BIT           NULL,
    [STK_SELECT_FIRST_SERIAL_NO]    BIT           NULL,
    CONSTRAINT [STK_TRN_TEMP_PK] PRIMARY KEY CLUSTERED ([STK_TRAN_ID] ASC, [STK_LINE_NO] ASC)
);


GO
CREATE TRIGGER [dbo].[AA_PROCESS_STK_TRN_TEMP_T]
    ON [dbo].[STK_TRN_TEMP]
    WITH ENCRYPTION
    AFTER UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
CREATE TRIGGER [dbo].[AA_STK_TRN_TEMP_DELETE_T]
    ON [dbo].[STK_TRN_TEMP]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


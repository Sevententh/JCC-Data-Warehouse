﻿CREATE TABLE [dbo].[SL_TRN_TEMP] (
    [SL_TRAN_ID]                        INT             NOT NULL,
    [SL_DETAIL_LINE_NO]                 INT             NOT NULL,
    [SL_STATUS_TEMP]                    TINYINT         NOT NULL,
    [SL_USE_DEFAULT]                    VARCHAR (100)   NULL,
    [SL_USER_ID]                        VARCHAR (4)     NULL,
    [SL_MODULE]                         VARCHAR (3)     NULL,
    [SL_TRANSACTION_TYPE]               VARCHAR (3)     NULL,
    [SL_CUSTOMER_CODE]                  VARCHAR (10)    NULL,
    [SL_SUBLEDGER_CODE]                 VARCHAR (10)    NULL,
    [SL_CURRENCY_TYPE]                  VARCHAR (2)     NULL,
    [SL_CURRENCYCODE]                   VARCHAR (6)     NULL,
    [SL_CURRENCYSYMBOL]                 VARCHAR (4)     NULL,
    [SL_CURRENCY_RATE]                  DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [SL_EURO_HOME_RATE]                 DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [SL_BASE2_RATE]                     DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [SL_CURRENCY_RATE_CHNGED]           TINYINT         DEFAULT ((0)) NULL,
    [SL_EURO_HOME_RATE_CHNGED]          TINYINT         DEFAULT ((0)) NULL,
    [SL_BASE2_RATE_CHNGED]              TINYINT         DEFAULT ((0)) NULL,
    [SL_EC_DELIVERY_TERMS]              VARCHAR (3)     NULL,
    [SL_EC_TRAN_NATURE]                 VARCHAR (2)     NULL,
    [SL_EC_TRANSPORTATN_MODE]           VARCHAR (2)     NULL,
    [SL_TRAN_REFERENCE]                 VARCHAR (10)    NULL,
    [SL_BATCH_REFERENCE]                VARCHAR (10)    NULL,
    [SL_TRAN_DATE]                      DATETIME        NULL,
    [SL_TRAN_YEAR]                      VARCHAR (2)     NULL,
    [SL_TRAN_PERIOD]                    TINYINT         DEFAULT ((0)) NULL,
    [SL_DUE_DATE]                       DATETIME        NULL,
    [SL_ANTICIPATED_PAY_DATE]           DATETIME        NULL,
    [SL_TRAN_DESCRIPTION]               VARCHAR (30)    NULL,
    [SL_DETAIL_ANALYSIS_CODE]           VARCHAR (25)    NULL,
    [SL_DETAIL_VATCODE]                 VARCHAR (4)     NULL,
    [SL_DETAIL_HOME_VALUE]              FLOAT (53)      NULL,
    [SL_DETAIL_HOME_TAX]                FLOAT (53)      NULL,
    [SL_DETAIL_CURR_GROSS]              FLOAT (53)      NULL,
    [SL_DETAIL_CURR_TAX]                FLOAT (53)      NULL,
    [SL_DETAIL_BASE2_GROSS]             FLOAT (53)      NULL,
    [SL_DETAIL_BASE2_TAX]               FLOAT (53)      NULL,
    [SL_DETAIL_COSTHEADER]              VARCHAR (10)    NULL,
    [SL_DETAIL_COSTCENTRE]              VARCHAR (10)    NULL,
    [SL_DETAIL_DESCRIPTION]             VARCHAR (240)   NULL,
    [SL_DETAIL_DIMENSION1]              VARCHAR (20)    NULL,
    [SL_DETAIL_DIMENSION2]              VARCHAR (20)    NULL,
    [SL_DETAIL_DIMENSION3]              VARCHAR (20)    NULL,
    [SL_DISPUTED_FLAG]                  TINYINT         NULL,
    [SL_SETTLE_DISCOUNT_1]              FLOAT (53)      DEFAULT ((0)) NULL,
    [SL_SETTLE_DAYS_1]                  INT             DEFAULT ((0)) NULL,
    [SL_SETTLE_DISCOUNT_2]              FLOAT (53)      DEFAULT ((0)) NULL,
    [SL_SETTLE_DAYS2]                   INT             DEFAULT ((0)) NULL,
    [SL_ARCHIVE_FLAG]                   TINYINT         NULL,
    [SL_DO_NOT_BATCH]                   TINYINT         NULL,
    [SL_HOME_GROSS_ENTRY_MODE]          TINYINT         NULL,
    [SL_CURRENCY_ENTRY_MODE]            VARCHAR (2)     NULL,
    [SL_SOURCE]                         VARCHAR (1)     DEFAULT ('') NULL,
    [SL_DETAIL_PRIMARY]                 INT             DEFAULT ((0)) NULL,
    [SL_ENTER_DUE_RECEIPT_DATE]         TINYINT         NULL,
    [SL_DELETE_DETAIL_LINE]             TINYINT         DEFAULT ((0)) NULL,
    [SL_HEADER_USER_CHAR1]              VARCHAR (20)    NULL,
    [SL_HEADER_USER_CHAR2]              VARCHAR (20)    NULL,
    [SL_HEADER_USER_CHAR3]              VARCHAR (100)   NULL,
    [SL_HEADER_USER_CHAR4]              VARCHAR (100)   NULL,
    [SL_HEADER_USER_FLAG1]              TINYINT         NULL,
    [SL_HEADER_USER_FLAG2]              TINYINT         NULL,
    [SL_HEADER_USER_DATE1]              DATETIME        NULL,
    [SL_HEADER_USER_DATE2]              DATETIME        NULL,
    [SL_HEADER_USER_NUMBER1]            FLOAT (53)      DEFAULT ((0)) NULL,
    [SL_HEADER_USER_NUMBER2]            FLOAT (53)      DEFAULT ((0)) NULL,
    [SL_DETAIL_USER_CHAR1]              VARCHAR (20)    NULL,
    [SL_DETAIL_USER_CHAR2]              VARCHAR (20)    NULL,
    [SL_DETAIL_USER_CHAR3]              VARCHAR (100)   NULL,
    [SL_DETAIL_USER_CHAR4]              VARCHAR (100)   NULL,
    [SL_DETAIL_USER_FLAG1]              TINYINT         NULL,
    [SL_DETAIL_USER_FLAG2]              TINYINT         NULL,
    [SL_DETAIL_USER_DATE1]              DATETIME        NULL,
    [SL_DETAIL_USER_DATE2]              DATETIME        NULL,
    [SL_DETAIL_USER_NUMBER1]            FLOAT (53)      DEFAULT ((0)) NULL,
    [SL_DETAIL_USER_NUMBER2]            FLOAT (53)      DEFAULT ((0)) NULL,
    [SL_TRAN_OPTIONS]                   VARCHAR (30)    NULL,
    [SL_HEADER_PRIMARY]                 INT             NULL,
    [SL_USER_SORT1]                     VARCHAR (20)    NULL,
    [SL_USER_SORT2]                     VARCHAR (20)    NULL,
    [SL_USER_SORT3]                     VARCHAR (20)    NULL,
    [SL_NOTE]                           TEXT            NULL,
    [SL_FORCE_VAT_RATE_REFRESH]         BIT             NULL,
    [SL_ACCRUAL_NOMINAL_ACCOUNT]        VARCHAR (25)    NULL,
    [SL_ACCRUAL_NO_OF_PERIODS]          SMALLINT        NULL,
    [SL_ACCRUAL_SCHEDULE_START_DATE]    DATETIME        NULL,
    [SL_ACCRUAL_SCHEDULE_DATES_XML]     XML             NULL,
    [SL_USE_MULTIPLE_DUE_DATES]         BIT             NULL,
    [SL_MULTIPLE_DUE_DATE_DEPOSIT_PERC] DECIMAL (16, 2) NULL,
    [SL_MULTIPLE_DUE_DATE_DEPOSIT_VAL]  FLOAT (53)      NULL,
    [SL_MULTIPLE_DUE_DATE_START_DATE]   DATETIME        NULL,
    [SL_MULTIPLE_DUE_DATE_PAYMENT_NO]   INT             NULL,
    [SL_MULTIPLE_DUE_DATES_XML]         XML             NULL,
    [SL_SETTLE_DISCOUNT_CRN]            BIT             NULL,
    CONSTRAINT [SL_TRN_TEMP_PK] PRIMARY KEY CLUSTERED ([SL_TRAN_ID] ASC, [SL_DETAIL_LINE_NO] ASC)
);


GO
CREATE TRIGGER [dbo].[AA_PROCESS_SL_TRN_TEMP_T]
    ON [dbo].[SL_TRN_TEMP]
    WITH ENCRYPTION
    AFTER UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


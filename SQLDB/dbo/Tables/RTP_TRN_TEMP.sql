﻿CREATE TABLE [dbo].[RTP_TRN_TEMP] (
    [RTP_TRAN_ID]                 INT             NOT NULL,
    [RTP_LINE_NO]                 INT             NOT NULL,
    [RTP_STATUS_TEMP]             TINYINT         NULL,
    [RTP_DEFAULT_STRING]          VARCHAR (200)   NULL,
    [RTP_USER_ID]                 VARCHAR (4)     NULL,
    [RTP_DETAIL_PRIMARY]          INT             NULL,
    [RTP_DELETE_DETAIL_LINE]      TINYINT         NULL,
    [RTP_SOURCE]                  VARCHAR (1)     NULL,
    [RTP_RTP_NUMBER]              VARCHAR (10)    NULL,
    [RTP_ACCOUNT]                 VARCHAR (10)    NULL,
    [RTP_REQUEST_DATE]            DATETIME        NULL,
    [RTP_REQUEST_YEAR]            VARCHAR (1)     NULL,
    [RTP_REQUEST_PERIOD]          TINYINT         NULL,
    [RTP_DATE_REQUIRED]           DATETIME        NULL,
    [RTP_SUPPLIER_REF]            VARCHAR (20)    NULL,
    [RTP_BATCH_REF]               VARCHAR (10)    NULL,
    [RTP_DESCRIPTION]             VARCHAR (30)    NULL,
    [RTP_CURRENCYCODE]            VARCHAR (6)     NULL,
    [RTP_CURRENCYSYMBOL]          VARCHAR (4)     NULL,
    [RTP_CURRENCYTYPE]            CHAR (1)        NULL,
    [RTP_CURRENCY_RATE]           DECIMAL (16, 6) NULL,
    [RTP_EURO_TO_HOME_RATE]       FLOAT (53)      NULL,
    [RTP_PRICE_KEY]               TINYINT         NULL,
    [RTP_ARCHIVE_FLAG]            TINYINT         NULL,
    [RTP_ALLOW_EMPTY_SUBANALYSIS] BIT             NULL,
    [RTP_ALLOW_EMPTY_SERIAL_NO]   BIT             NULL,
    [RTP_ENTRY_TYPE]              VARCHAR (1)     NULL,
    [RTP_ITEM_CODE]               VARCHAR (25)    NULL,
    [RTP_PRICE_CODE]              VARCHAR (16)    NULL,
    [RTP_SERIAL_NUMBER]           VARCHAR (40)    NULL,
    [RTP_SUB_ANALYSIS]            VARCHAR (25)    NULL,
    [RTP_QUANTITY]                FLOAT (53)      NULL,
    [RTP_PRICE_LINE]              TINYINT         NULL,
    [RTP_QUANTITY_UNIT]           FLOAT (53)      NULL,
    [RTP_HOME_UNIT_COST]          FLOAT (53)      NULL,
    [RTP_LINE_DETAIL]             VARCHAR (240)   NULL,
    [RTP_LINE_REQUIRED_DATE]      DATETIME        NULL,
    [RTP_TRANSACTION_USER_KEY1]   VARCHAR (20)    NULL,
    [RTP_TRANSACTION_USER_KEY2]   VARCHAR (20)    NULL,
    [RTP_TRANSACTION_USER_KEY3]   VARCHAR (20)    NULL,
    [RTP_TRAN_OPTIONS]            VARCHAR (30)    NULL,
    [RTP_HEADER_USER_CHAR1]       VARCHAR (20)    NULL,
    [RTP_HEADER_USER_CHAR2]       VARCHAR (20)    NULL,
    [RTP_HEADER_USER_CHAR3]       VARCHAR (100)   NULL,
    [RTP_HEADER_USER_CHAR4]       VARCHAR (100)   NULL,
    [RTP_HEADER_USER_FLAG1]       TINYINT         NULL,
    [RTP_HEADER_USER_FLAG2]       TINYINT         NULL,
    [RTP_HEADER_USER_DATE1]       DATETIME        NULL,
    [RTP_HEADER_USER_DATE2]       DATETIME        NULL,
    [RTP_HEADER_USER_NUMBER1]     FLOAT (53)      NULL,
    [RTP_HEADER_USER_NUMBER2]     FLOAT (53)      NULL,
    [RTP_DETAIL_USER_CHAR1]       VARCHAR (20)    NULL,
    [RTP_DETAIL_USER_CHAR2]       VARCHAR (20)    NULL,
    [RTP_DETAIL_USER_CHAR3]       VARCHAR (100)   NULL,
    [RTP_DETAIL_USER_CHAR4]       VARCHAR (100)   NULL,
    [RTP_DETAIL_USER_FLAG1]       TINYINT         NULL,
    [RTP_DETAIL_USER_FLAG2]       TINYINT         NULL,
    [RTP_DETAIL_USER_DATE1]       DATETIME        NULL,
    [RTP_DETAIL_USER_DATE2]       DATETIME        NULL,
    [RTP_DETAIL_USER_NUMBER1]     FLOAT (53)      NULL,
    [RTP_DETAIL_USER_NUMBER2]     FLOAT (53)      NULL,
    [RTP_SERIAL_MULTI_LINK]       INT             NULL,
    [RTP_SERVICE]                 BIT             NULL,
    [RTP_COSTHEADER]              VARCHAR (10)    NULL,
    [RTP_COSTCENTRE]              VARCHAR (10)    NULL,
    CONSTRAINT [RTP_TRN_TEMP_PK] PRIMARY KEY CLUSTERED ([RTP_TRAN_ID] ASC, [RTP_LINE_NO] ASC)
);

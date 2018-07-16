﻿CREATE TABLE [dbo].[LANG_SUPER_TOOLTIP4] (
    [LANGCODE_ST4]               VARCHAR (10)  NOT NULL,
    [LST_ROUTE_RECORD]           VARCHAR (200) NULL,
    [LST_STOCK_RECORD_REPORTS]   VARCHAR (200) NULL,
    [LST_STOCK_TRANS_REPORTS]    VARCHAR (200) NULL,
    [LST_WORKS_ORDER_REPORTS]    VARCHAR (200) NULL,
    [LST_STOCK_PURGE]            VARCHAR (200) NULL,
    [LST_PROJECT_RECORD]         VARCHAR (200) NULL,
    [LST_RESOURCE_RECORD]        VARCHAR (200) NULL,
    [LST_RESOURCE_RATES]         VARCHAR (200) NULL,
    [LST_COSTING_BATCH]          VARCHAR (200) NULL,
    [LST_COSTING_TIMESHEETS]     VARCHAR (200) NULL,
    [LST_COSTING_MISCELLANEOUS]  VARCHAR (200) NULL,
    [LST_COSTING_SALES]          VARCHAR (200) NULL,
    [LST_COSTING_RECORD_REPORTS] VARCHAR (200) NULL,
    [LST_COSTING_TRANS_REPORTS]  VARCHAR (200) NULL,
    [LST_COSTING_PURGE]          VARCHAR (200) NULL,
    [LST_COMPANY_RECORD]         VARCHAR (200) NULL,
    [LST_VAT_RETURN]             VARCHAR (200) NULL,
    [LST_VAT_AUDIT_REPORT]       VARCHAR (200) NULL,
    [LST_VAT_RATES]              VARCHAR (200) NULL,
    [LST_EC_REPORTS]             VARCHAR (200) NULL,
    [LST_VAT_ACR]                VARCHAR (200) NULL,
    [LST_SYS_HMRC_ONLINE]        VARCHAR (200) NULL,
    [LST_CURRENCY_RATE]          VARCHAR (200) NULL,
    [LST_CURRENCY_RECORD]        VARCHAR (200) NULL,
    [LST_COUNTRY_RECORD]         VARCHAR (200) NULL,
    [LST_CURRENCY_REPORTS]       VARCHAR (200) NULL,
    [LST_USER_RECORD]            VARCHAR (200) NULL,
    [LST_USER_PROFILE]           VARCHAR (200) NULL,
    [LST_IR_APPROVERS]           VARCHAR (200) NULL,
    [LST_SYSTEM_OPTIONS]         VARCHAR (200) NULL,
    [LST_SYS_AGED_DEBT_CRED]     VARCHAR (200) NULL,
    [LST_AUTO_REPORTS]           VARCHAR (200) NULL,
    [LST_DATA_UTILITIES]         VARCHAR (200) NULL,
    [LST_MINIMIZE_RIBBON]        VARCHAR (200) NULL,
    [LST_MAXIMIZE_RIBBON]        VARCHAR (200) NULL,
    [LST_STOCK_ALLOCATION]       VARCHAR (200) NULL,
    [LST_ENQUIRY_SWITCH]         VARCHAR (200) NULL,
    [LST_POP_ORDER_STATUS]       VARCHAR (200) NULL,
    [LST_DOWNLOAD_EXPENSES]      VARCHAR (200) NULL,
    [LST_INVITE_USERS]           VARCHAR (200) NULL,
    CONSTRAINT [LANGCODE_ST4_PK] PRIMARY KEY CLUSTERED ([LANGCODE_ST4] ASC) WITH (FILLFACTOR = 70)
);

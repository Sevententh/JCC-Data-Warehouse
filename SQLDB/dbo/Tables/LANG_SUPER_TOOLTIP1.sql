﻿CREATE TABLE [dbo].[LANG_SUPER_TOOLTIP1] (
    [LANGCODE_ST1]              VARCHAR (10)  NOT NULL,
    [LST_CLICK_ENQUIRY]         VARCHAR (200) NULL,
    [LST_DEBTORS_ENQUIRIES]     VARCHAR (200) NULL,
    [LST_CREDITORS_ENQUIRIES]   VARCHAR (200) NULL,
    [LST_FINANCIALS_ENQUIRIES]  VARCHAR (200) NULL,
    [LST_STOCK_ENQUIRIES]       VARCHAR (200) NULL,
    [LST_COSTING_ENQUIRIES]     VARCHAR (200) NULL,
    [LST_DIARY]                 VARCHAR (200) NULL,
    [LST_DOCUMENTS_EXTERNAL]    VARCHAR (200) NULL,
    [LST_DOCUMENTS_ADM]         VARCHAR (200) NULL,
    [LST_UNFREEZE]              VARCHAR (200) NULL,
    [LST_UNFREEZE_SHORTCUT]     VARCHAR (200) NULL,
    [LST_CUSTOMER_RECORD]       VARCHAR (200) NULL,
    [LST_SALES_ANALYSIS_RECORD] VARCHAR (200) NULL,
    [LST_TERMS_RECORD]          VARCHAR (200) NULL,
    [LST_SALES_BATCH]           VARCHAR (200) NULL,
    [LST_SALES_INVOICE]         VARCHAR (200) NULL,
    [LST_BULK_RECEIPTS]         VARCHAR (200) NULL,
    [LST_SALES_CREDIT_NOTE]     VARCHAR (200) NULL,
    [LST_SALES_RECEIPT]         VARCHAR (200) NULL,
    [LST_SALES_ADJUSTMENTS]     VARCHAR (200) NULL,
    [LST_CLICK_FOR_MORE]        VARCHAR (200) NULL,
    [LST_SALES_ALLOCATION]      VARCHAR (200) NULL,
    [LST_CHASE_DEBTORS]         VARCHAR (200) NULL,
    [LST_CC_DATES]              VARCHAR (200) NULL,
    [LST_CC_DEBT_STATUS]        VARCHAR (200) NULL,
    [LST_CC_CUSTOMERS]          VARCHAR (200) NULL,
    [LST_CC_SUPPLIERS]          VARCHAR (200) NULL,
    [LST_SALES_RECORD_REPORTS]  VARCHAR (200) NULL,
    [LST_SALES_TRANS_REPORTS]   VARCHAR (200) NULL,
    [LST_CC_REPORTS]            VARCHAR (200) NULL,
    [LST_SALES_PERIOD_END]      VARCHAR (200) NULL,
    [LST_SUPPLIER_RECORD]       VARCHAR (200) NULL,
    [LST_PURCH_ANALYSIS_RECORD] VARCHAR (200) NULL,
    [LST_REJECTION_DICTIONARY]  VARCHAR (200) NULL,
    [LST_PRICE_RECORD]          VARCHAR (200) NULL,
    [LST_PURCHASE_BATCH]        VARCHAR (200) NULL,
    [LST_PURCHASE_INVOICE]      VARCHAR (200) NULL,
    [LST_PURCHASE_CREDIT_NOTE]  VARCHAR (200) NULL,
    [LST_DIRECT_DEBITS]         VARCHAR (200) NULL,
    CONSTRAINT [LANGCODE_ST1_PK] PRIMARY KEY CLUSTERED ([LANGCODE_ST1] ASC) WITH (FILLFACTOR = 70)
);


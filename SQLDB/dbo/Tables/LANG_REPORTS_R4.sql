﻿CREATE TABLE [dbo].[LANG_REPORTS_R4] (
    [LANGCODE_REP4]            VARCHAR (10) NOT NULL,
    [ACCOUNT_REP]              VARCHAR (10) NULL,
    [ACTUAL_REP]               VARCHAR (8)  NULL,
    [ALLOCATED_VALUE_REP]      VARCHAR (20) NULL,
    [ANALYSISTEXT_REP]         VARCHAR (10) NULL,
    [ANALYSIS_CREDIT_REP]      VARCHAR (10) NULL,
    [ANALYSIS_DEBIT_REP]       VARCHAR (10) NULL,
    [ANTDAYS_REP]              VARCHAR (10) NULL,
    [ANT_DATE_REP]             VARCHAR (10) NULL,
    [AN_PTD_REP]               VARCHAR (10) NULL,
    [AUDIT_NO_REP]             VARCHAR (10) NULL,
    [AUDIT_TEXT_REP]           VARCHAR (6)  NULL,
    [BALANCE_REP]              VARCHAR (10) NULL,
    [BATCH_REF_REP]            VARCHAR (12) NULL,
    [BUDGET_REP]               VARCHAR (8)  NULL,
    [COMPLETE_REP]             VARCHAR (10) NULL,
    [COMPLETED_REP]            VARCHAR (12) NULL,
    [CONTACT_REP]              VARCHAR (10) NULL,
    [COST_REP]                 VARCHAR (10) NULL,
    [CREDITLIMIT_REP]          VARCHAR (15) NULL,
    [CST_MEM_RECORD_REP]       VARCHAR (12) NULL,
    [CST_MEM_CENTRE_REP]       VARCHAR (12) NULL,
    [CURRENCY_TXT_REP]         VARCHAR (10) NULL,
    [CURRENT_YEAR_M_REP]       VARCHAR (15) NULL,
    [CUSTOMER_REP]             VARCHAR (10) NULL,
    [CUSTOMER_CODE_REP]        VARCHAR (8)  NULL,
    [CUSTOMER_NAME_REP]        VARCHAR (8)  NULL,
    [DATE_ENTERED_REP]         VARCHAR (15) NULL,
    [DATE_TEXT_REP]            VARCHAR (5)  NULL,
    [DAYS_REP]                 VARCHAR (10) NULL,
    [DAY_OF_FOLLOW_MNTH_M_REP] VARCHAR (25) NULL,
    [DELIVERY_CHARGE_REP]      VARCHAR (17) NULL,
    [DELIVERY_EC_REP]          VARCHAR (10) NULL,
    [DELIVERY_METHOD_REP]      VARCHAR (18) NULL,
    [DESCRIPTION_REP]          VARCHAR (15) NULL,
    [DUE_DATE_REP]             VARCHAR (10) NULL,
    [DUE_DAYS_TEXT_REP]        VARCHAR (10) NULL,
    [END_OF_FOLLOW_MNTH_M_REP] VARCHAR (25) NULL,
    [ENTERED_BY_REP]           VARCHAR (12) NULL,
    [FAX_REP]                  VARCHAR (10) NULL,
    [FROM_INVOICE_DATE_M_REP]  VARCHAR (25) NULL,
    [GROSS_REP]                VARCHAR (6)  NULL,
    [ITEM_CODE_REP]            VARCHAR (10) NULL,
    [LAST_CHANGED_REP]         VARCHAR (20) NULL,
    [LAST_YEAR_M_REP]          VARCHAR (15) NULL,
    [LINEDISCOUNT_REP]         VARCHAR (15) NULL,
    [MARGIN_REP]               VARCHAR (10) NULL,
    [MIN_ORDERVALUE_REP]       VARCHAR (20) NULL,
    [NET_REP]                  VARCHAR (6)  NULL,
    [NL_JOURNALS_REP]          VARCHAR (20) NULL,
    [NOMINAL_CODE_REP]         VARCHAR (8)  NULL,
    [NOTES_REP]                VARCHAR (10) NULL,
    [NO_OF_REP]                VARCHAR (8)  NULL,
    [ON_STOP_REP]              VARCHAR (15) NULL,
    [ORDERNO_REP]              VARCHAR (15) NULL,
    [ORDER_NO_REP]             VARCHAR (10) NULL,
    [ORDER_PERCENT_REP]        VARCHAR (12) NULL,
    [ORDER_TEXT_REP]           VARCHAR (6)  NULL,
    [ORDER_TOTAL_REP]          VARCHAR (15) NULL,
    [OTHER_YEAR_M_REP]         VARCHAR (12) NULL,
    [OUTSTANDING_REP]          VARCHAR (15) NULL,
    [PARTIAL_INV_DEL_REP]      VARCHAR (30) NULL,
    [PERIOD_REP]               VARCHAR (10) NULL,
    [PHONE_REP]                VARCHAR (10) NULL,
    [MEM_PLAC_SORT_REP]        VARCHAR (20) NULL,
    [MEM_PL_ACCUSER1_REP]      VARCHAR (20) NULL,
    [MEM_PL_ACCUSER2_REP]      VARCHAR (20) NULL,
    [MEM_PL_ACCUSER3_REP]      VARCHAR (20) NULL,
    [PL_CREDIT_NOTE_REP]       VARCHAR (20) NULL,
    [PL_INVOICE_REP]           VARCHAR (20) NULL,
    [PL_PAYMENTS_REP]          VARCHAR (20) NULL,
    [PREVIOUS_YEAR_M_REP]      VARCHAR (15) NULL,
    [PRICE_REP]                VARCHAR (6)  NULL,
    [PRICE_ENTRY_M_REP]        VARCHAR (15) NULL,
    [PRICE_KEY_REP]            VARCHAR (10) NULL,
    [PRICE_RECORD_REP]         VARCHAR (15) NULL,
    [PRIORITY_REP]             VARCHAR (12) NULL,
    [PROCESS_STATUS_REP]       VARCHAR (18) NULL,
    [PROFIT_REP]               VARCHAR (8)  NULL,
    [PURCHASE_REP]             VARCHAR (12) NULL,
    [PURCHASE_ANALYSIS_REP]    VARCHAR (18) NULL,
    [QUANTITY_REP]             VARCHAR (10) NULL,
    [RATE_REP]                 VARCHAR (6)  NULL,
    [RECORDS_REP]              VARCHAR (10) NULL,
    [REF_REP]                  VARCHAR (6)  NULL,
    [REFERENCE_REP]            VARCHAR (15) NULL,
    [REQUIRED_BY_DATE_REP]     VARCHAR (20) NULL,
    [RESOURCE_TEXT_REP]        VARCHAR (10) NULL,
    [SALES_REP]                VARCHAR (8)  NULL,
    [SALE_ANALYSIS_REP]        VARCHAR (18) NULL,
    [SERIAL_NUMBER_REP]        VARCHAR (15) NULL,
    [MEM_SLAC_SORT_REP]        VARCHAR (20) NULL,
    [MEM_SL_ACCUSER1_REP]      VARCHAR (20) NULL,
    [MEM_SL_ACCUSER2_REP]      VARCHAR (20) NULL,
    [MEM_SL_ACCUSER3_REP]      VARCHAR (20) NULL,
    [SL_CREDIT_NOTE_REP]       VARCHAR (20) NULL,
    [SL_INVOICE_REP]           VARCHAR (20) NULL,
    [SL_PROSPECTS_REP]         VARCHAR (20) NULL,
    [SL_RECEIPTS_REP]          VARCHAR (20) NULL,
    [SOP_CREDITNOTE_REP]       VARCHAR (20) NULL,
    [SOP_ORDER_REP]            VARCHAR (20) NULL,
    [SORT_KEY_REP]             VARCHAR (10) NULL,
    [STK_MOVEMENTS_TRN_REP]    VARCHAR (20) NULL,
    [STK_USERDEF1_REP]         VARCHAR (20) NULL,
    [STK_USERDEF2_REP]         VARCHAR (20) NULL,
    [STK_USERDEF3_REP]         VARCHAR (20) NULL,
    [STK_PRICEKEY1_REP]        VARCHAR (20) NULL,
    [STK_PRICEKEY10_REP]       VARCHAR (20) NULL,
    [STK_PRICEKEY2_REP]        VARCHAR (20) NULL,
    [STK_PRICEKEY3_REP]        VARCHAR (20) NULL,
    [STK_PRICEKEY4_REP]        VARCHAR (20) NULL,
    [STK_PRICEKEY5_REP]        VARCHAR (20) NULL,
    [STK_PRICEKEY6_REP]        VARCHAR (20) NULL,
    [CONTACT_LIST_REP]         VARCHAR (20) NULL,
    [HOURS_REP]                VARCHAR (20) NULL,
    [CARD_TYPE_REP]            VARCHAR (10) NULL,
    [ISSUE_NO_REP]             VARCHAR (10) NULL,
    [ISSUE_DATE_REP]           VARCHAR (12) NULL,
    [SWITCH_REP]               VARCHAR (8)  NULL,
    [OTHER_REP]                VARCHAR (8)  NULL,
    CONSTRAINT [LANGCODE_REP4_PK] PRIMARY KEY CLUSTERED ([LANGCODE_REP4] ASC)
);

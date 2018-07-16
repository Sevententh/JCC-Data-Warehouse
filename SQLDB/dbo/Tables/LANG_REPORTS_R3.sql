﻿CREATE TABLE [dbo].[LANG_REPORTS_R3] (
    [LANGCODE_REP3]          VARCHAR (10) NOT NULL,
    [NO_OF_LINES]            VARCHAR (15) NULL,
    [LINES_DELIVERED]        VARCHAR (18) NULL,
    [LINES_INVOICED]         VARCHAR (18) NULL,
    [CREDIT_NOTE_NO]         VARCHAR (18) NULL,
    [QTY_OS_TO_INVOICE]      VARCHAR (20) NULL,
    [QTY_OS_TO_DELIVER]      VARCHAR (20) NULL,
    [AMOUNT_VAT]             VARCHAR (8)  NULL,
    [CREDIT_NOTE_ADDRESS]    VARCHAR (22) NULL,
    [OUTSTANDING_TO_INV]     VARCHAR (25) NULL,
    [OUTSTANDING_TO_DEL]     VARCHAR (25) NULL,
    [NORMAL_ORDERS]          VARCHAR (15) NULL,
    [URGENT_ORDERS]          VARCHAR (17) NULL,
    [ORDERS_ON_HOLD]         VARCHAR (18) NULL,
    [QUANTITY_TO_PICK]       VARCHAR (18) NULL,
    [TO_PICK]                VARCHAR (10) NULL,
    [TOTAL_FOR_SLCT_ORDS]    VARCHAR (35) NULL,
    [CODE_DESCRIPTION]       VARCHAR (20) NULL,
    [UNIT_TEXT]              VARCHAR (6)  NULL,
    [PLEASE_DELIVER_TO]      VARCHAR (20) NULL,
    [THE_TAX_SHOWN_POPDOC]   VARCHAR (60) NULL,
    [PART_PROCESSED]         VARCHAR (18) NULL,
    [GOODS_RECEIVED_NOTE]    VARCHAR (25) NULL,
    [GRN_NO]                 VARCHAR (10) NULL,
    [PURCHASE_UNIT]          VARCHAR (15) NULL,
    [ESL_CODE]               VARCHAR (10) NULL,
    [SSD_CODE]               VARCHAR (10) NULL,
    [SALES_BANK]             VARCHAR (12) NULL,
    [PURCHASE_BANK]          VARCHAR (15) NULL,
    [FISCAL_AGENT]           VARCHAR (15) NULL,
    [DELIVERY_TERMS]         VARCHAR (18) NULL,
    [NATURE_OF_TRANSACTION]  VARCHAR (25) NULL,
    [TRANSPORT_MODE]         VARCHAR (15) NULL,
    [CURRENCY_RATE_VALUE]    VARCHAR (25) NULL,
    [DIFFERENCE_TEXT]        VARCHAR (12) NULL,
    [VALUATION_AT_CURRENT]   VARCHAR (30) NULL,
    [VALUATION_AT_SPECIFD]   VARCHAR (30) NULL,
    [CURRENCY_VALUE]         VARCHAR (18) NULL,
    [CURRENCY_RATE]          VARCHAR (15) NULL,
    [SOURCE_TEXT]            VARCHAR (8)  NULL,
    [BOX_TEXT]               VARCHAR (6)  NULL,
    [INTER_EC]               VARCHAR (12) NULL,
    [TRANS_ABBREV]           VARCHAR (8)  NULL,
    [EXCHANGE_TEXT]          VARCHAR (10) NULL,
    [FOREIGN_TEXT]           VARCHAR (10) NULL,
    [CTRY_ABBREV]            VARCHAR (6)  NULL,
    [TRANS_VALUE]            VARCHAR (15) NULL,
    [TOTAL_OUTSIDE_SCOPE]    VARCHAR (25) NULL,
    [VAT_CONTROL]            VARCHAR (15) NULL,
    [VALUE_OF]               VARCHAR (10) NULL,
    [CURR_ABBREV]            VARCHAR (8)  NULL,
    [PROC_ABBREV]            VARCHAR (8)  NULL,
    [PROCESS_TEXT]           VARCHAR (10) NULL,
    [RECORD_CHANGES_LAST]    VARCHAR (28) NULL,
    [WITHHELD_TEXT]          VARCHAR (10) NULL,
    [TOTAL_FOR_ACCOUNT]      VARCHAR (20) NULL,
    [NON_TAXABLE]            VARCHAR (15) NULL,
    [TAXABLE_TEXT]           VARCHAR (10) NULL,
    [OUTSIDE_SCOPE]          VARCHAR (15) NULL,
    [COVERING_PERIODS]       VARCHAR (18) NULL,
    [OUTPUTS_TEXT]           VARCHAR (10) NULL,
    [INPUTS_TEXT]            VARCHAR (8)  NULL,
    [EXCLUDING_TEXT]         VARCHAR (12) NULL,
    [ON_OUTPUTS]             VARCHAR (12) NULL,
    [ON_INPUTS]              VARCHAR (12) NULL,
    [EC_VAT_ON_ACQUISITIONS] VARCHAR (25) NULL,
    [EC_VAT_ON_SERVICES]     VARCHAR (38) NULL,
    [EXC_CODE]               VARCHAR (12) NULL,
    [EC_MEMBER_STATE_TRANS]  VARCHAR (32) NULL,
    [VAT_RETURN]             VARCHAR (15) NULL,
    [EC_VAT_CODE]            VARCHAR (15) NULL,
    [EDITED_TEXT]            VARCHAR (8)  NULL,
    [EC_TYPE_TEXT]           VARCHAR (10) NULL,
    [TOTAL_NO_ALLOC_POST]    VARCHAR (40) NULL,
    [PROSPECT_REP]           VARCHAR (12) NULL,
    [ALLOCATED_USER]         VARCHAR (20) NULL,
    [DEBTORS_REVALUATION]    VARCHAR (22) NULL,
    [CREDITORS_REVALUATION]  VARCHAR (22) NULL,
    [CREDIT_NOTE_DOC]        VARCHAR (15) NULL,
    [TEXT_ITEMS]             VARCHAR (15) NULL,
    [PICKING_LIST_DOC]       VARCHAR (15) NULL,
    [PRO_FORMA_STATEMENTS]   VARCHAR (22) NULL,
    [PROGRESS_STATEMENTS]    VARCHAR (22) NULL,
    [SOP_STATEMENTS]         VARCHAR (12) NULL,
    [STATEMENT_OF_PROF]      VARCHAR (25) NULL,
    [STATEMENT_OF_PROGC]     VARCHAR (30) NULL,
    [STATEMENT_OF_BOTH]      VARCHAR (42) NULL,
    [STOCK_MOVEMENT_DOC]     VARCHAR (16) NULL,
    [OUTSTND_SALES_ORDERS]   VARCHAR (26) NULL,
    [OUTSTND_PURCH_ORDERS]   VARCHAR (30) NULL,
    [PROSPECT_LIST]          VARCHAR (15) NULL,
    [VAT_RATES_LIST]         VARCHAR (16) NULL,
    [FIELD_NAME_REP]         VARCHAR (12) NULL,
    [LAST_TXT]               VARCHAR (8)  NULL,
    [NEXT_TXT]               VARCHAR (8)  NULL,
    [YR_ABBREV]              VARCHAR (3)  NULL,
    [PERIOD_ABBREV]          VARCHAR (3)  NULL,
    [SETT_DISC_REP]          VARCHAR (15) NULL,
    [NEXT_YEAR_ABBREV]       VARCHAR (6)  NULL,
    [CURR_YEAR_ABBREV]       VARCHAR (6)  NULL,
    [LAST_YEAR_ABBREV]       VARCHAR (6)  NULL,
    [TOTAL_FOR_REP]          VARCHAR (10) NULL,
    [TRANSACTIONS_TXT]       VARCHAR (15) NULL,
    [GOODS_IN_STOCK_REP]     VARCHAR (20) NULL,
    [DELIVERY_TO_UPDATE_REP] VARCHAR (14) NULL,
    CONSTRAINT [LANGCODE_REP3_PK] PRIMARY KEY CLUSTERED ([LANGCODE_REP3] ASC)
);


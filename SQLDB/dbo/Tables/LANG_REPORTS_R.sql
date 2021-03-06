﻿CREATE TABLE [dbo].[LANG_REPORTS_R] (
    [LANGCODE_REP_1]        VARCHAR (10)  NOT NULL,
    [UNALLOCATED_REP]       VARCHAR (12)  NULL,
    [PAGE_REP]              VARCHAR (5)   NULL,
    [DISPUTED_INVS_REP]     VARCHAR (18)  NULL,
    [INVS_NOT_CHASE_REP]    VARCHAR (30)  NULL,
    [NO_OF_ACCOUNTS_REP]    VARCHAR (20)  NULL,
    [OVERALL_TOTAL_REP]     VARCHAR (15)  NULL,
    [TOT_FUTURE_PDS_REP]    VARCHAR (65)  NULL,
    [OS_DIFF_BAL_REP]       VARCHAR (100) NULL,
    [UP_TO_REP]             VARCHAR (7)   NULL,
    [OVER_REP]              VARCHAR (5)   NULL,
    [SETT1_IS_REP]          VARCHAR (17)  NULL,
    [SETT2_IS_REP]          VARCHAR (17)  NULL,
    [IF_PAID_IN_REP]        VARCHAR (12)  NULL,
    [ALLOC_STATMNT_REP]     VARCHAR (22)  NULL,
    [WORTH_REP]             VARCHAR (7)   NULL,
    [TOTAL_VALOS_REP]       VARCHAR (25)  NULL,
    [AND_BEFORE_REP]        VARCHAR (12)  NULL,
    [TOTALFOR_REP]          VARCHAR (10)  NULL,
    [DAYS_OVERDUE_REP]      VARCHAR (15)  NULL,
    [TOT_OVERDUE_REP]       VARCHAR (15)  NULL,
    [RECEIPT_REP]           VARCHAR (8)   NULL,
    [RECEIVED_REP]          VARCHAR (10)  NULL,
    [TOT_VAL_ALOCTRN_REP]   VARCHAR (40)  NULL,
    [TOT_VAL_DISCNT_REP]    VARCHAR (30)  NULL,
    [TOT_VAL_RCPT_REP]      VARCHAR (25)  NULL,
    [SALES_STATMENT_REP]    VARCHAR (18)  NULL,
    [RUN_BALANCE_REP]       VARCHAR (18)  NULL,
    [AGED_ANALYSIS_REP]     VARCHAR (15)  NULL,
    [CURRENT_REP]           VARCHAR (8)   NULL,
    [TOT_BAL_OS_REP]        VARCHAR (28)  NULL,
    [ALLOCATED_REP]         VARCHAR (10)  NULL,
    [PART_ALLOCATED_REP]    VARCHAR (15)  NULL,
    [QUERY_REP]             VARCHAR (7)   NULL,
    [BATCHED_REP]           VARCHAR (8)   NULL,
    [LIVE_REP]              VARCHAR (5)   NULL,
    [DR_ABBREV_REP]         VARCHAR (2)   NULL,
    [CR_ABBREV_REP]         VARCHAR (2)   NULL,
    [UNANALYSED_REP]        VARCHAR (12)  NULL,
    [PRINTED_AT_REP]        VARCHAR (12)  NULL,
    [ON_XT_REP]             VARCHAR (4)   NULL,
    [AGEDFROM_REP]          VARCHAR (10)  NULL,
    [REGNO_ABBREV_REP]      VARCHAR (10)  NULL,
    [NOMINAL_REP]           VARCHAR (10)  NULL,
    [DEAR_SIRMADM_REP]      VARCHAR (18)  NULL,
    [DEAR_TXT_REP]          VARCHAR (5)   NULL,
    [CONT_ABBREV_REP]       VARCHAR (6)   NULL,
    [NO_ABBREV_REP]         VARCHAR (4)   NULL,
    [CODETXT_REP]           VARCHAR (5)   NULL,
    [OSVALUE_REP]           VARCHAR (10)  NULL,
    [KEY_TXT_REP]           VARCHAR (5)   NULL,
    [ENTERED_REP]           VARCHAR (8)   NULL,
    [COMP_BANK_DET_REP]     VARCHAR (22)  NULL,
    [AC_NO_REP]             VARCHAR (8)   NULL,
    [AMOUNT_REP]            VARCHAR (8)   NULL,
    [AC_NO_TYPE_REP]        VARCHAR (15)  NULL,
    [REMITTED_REP]          VARCHAR (10)  NULL,
    [TOTAL_VAL_REMIT_REP]   VARCHAR (26)  NULL,
    [PLEASE_FIND_ENC_REP]   VARCHAR (36)  NULL,
    [FORTHEABOVE_REP]       VARCHAR (22)  NULL,
    [THE_ABOVE_AMNT_REP]    VARCHAR (40)  NULL,
    [BEFORE_REP]            VARCHAR (8)   NULL,
    [OS_INVOICES_REP]       VARCHAR (22)  NULL,
    [AQUISITION_REP]        VARCHAR (12)  NULL,
    [INTERNAL_REP]          VARCHAR (10)  NULL,
    [UNALLOCDEBITS_REP]     VARCHAR (20)  NULL,
    [ZERO_REP]              VARCHAR (6)   NULL,
    [ONE_REP]               VARCHAR (6)   NULL,
    [TWO_REP]               VARCHAR (6)   NULL,
    [THREE_REP]             VARCHAR (6)   NULL,
    [FOUR_REP]              VARCHAR (6)   NULL,
    [FIVE_REP]              VARCHAR (6)   NULL,
    [SIX_REP]               VARCHAR (6)   NULL,
    [SEVEN_REP]             VARCHAR (6)   NULL,
    [EIGHT_REP]             VARCHAR (6)   NULL,
    [NINE_REP]              VARCHAR (6)   NULL,
    [KEY_TO_MAJOR_REP]      VARCHAR (22)  NULL,
    [PROFIT_LOSS_REP]       VARCHAR (15)  NULL,
    [BALANCE_SHEET_REP]     VARCHAR (15)  NULL,
    [MH_REP]                VARCHAR (3)   NULL,
    [TOTAL_FIX_ASSETS_REP]  VARCHAR (20)  NULL,
    [NET_CURR_ASSETS_REP]   VARCHAR (20)  NULL,
    [TOTAL_ASSETS_LESS_REP] VARCHAR (38)  NULL,
    [FINANCED_BY_REP]       VARCHAR (12)  NULL,
    [NET_ASSETS_REP]        VARCHAR (12)  NULL,
    [NET_LIABILITIES_REP]   VARCHAR (16)  NULL,
    [UNPOSTED_PROFIT_REP]   VARCHAR (18)  NULL,
    [UNPOSTED_LOSS_REP]     VARCHAR (18)  NULL,
    [DIFF_REP]              VARCHAR (5)   NULL,
    [BALANCE_FORWARD_REP]   VARCHAR (16)  NULL,
    [OPENING_BALANCE_REP]   VARCHAR (18)  NULL,
    [CLOSING_BALANCE_REP]   VARCHAR (18)  NULL,
    [RECONCILED_BAL_REP]    VARCHAR (20)  NULL,
    [CASH_BOOK_BAL_REP]     VARCHAR (18)  NULL,
    [UNRECON_RCPTS_REP]     VARCHAR (24)  NULL,
    [UNRECON_PAYS_REP]      VARCHAR (24)  NULL,
    [RECUR_POSTING_REP]     VARCHAR (18)  NULL,
    [RECUR_MASTER_REP]      VARCHAR (18)  NULL,
    [INVOICE_REP]           VARCHAR (8)   NULL,
    [CREDIT_NOTE_REP]       VARCHAR (12)  NULL,
    [PAYMENT_REP]           VARCHAR (8)   NULL,
    [CREDIT_ADJUST_REP]     VARCHAR (18)  NULL,
    [DEBIT_ADJUST_REP]      VARCHAR (18)  NULL,
    [CURR_TRANSFER_REP]     VARCHAR (18)  NULL,
    [LEDGER_REP]            VARCHAR (8)   NULL,
    [OPEN_BAL_YEAR_REP]     VARCHAR (22)  NULL,
    [OPEN_BAL_PRD_REP]      VARCHAR (24)  NULL,
    [VALUE_TRN_OTHER_REP]   VARCHAR (42)  NULL,
    [CLOSING_BAL_PRD_REP]   VARCHAR (28)  NULL,
    [NO_OF_TRANS_REP]       VARCHAR (26)  NULL,
    [INVOICER_REP]          VARCHAR (10)  NULL,
    [NO_OF_NEW_ACCTS_REP]   VARCHAR (24)  NULL,
    [NET_PROFIT_REP]        VARCHAR (12)  NULL,
    [NET_LOSS_REP]          VARCHAR (10)  NULL,
    [GROSS_PROFIT_REP]      VARCHAR (15)  NULL,
    [GROSS_LOSS_REP]        VARCHAR (12)  NULL,
    [AFTER_REP]             VARCHAR (6)   NULL,
    [RECUR_REVERSING_REP]   VARCHAR (20)  NULL,
    CONSTRAINT [LANGCODE_REP_1_PK] PRIMARY KEY CLUSTERED ([LANGCODE_REP_1] ASC)
);


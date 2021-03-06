﻿CREATE TABLE [dbo].[LANG_BUTTONS2] (
    [LANGCODE_BTN2]            VARCHAR (10) NOT NULL,
    [CLEAR_MU_FLG_BTN]         VARCHAR (22) NULL,
    [USER_TXT_BTN]             VARCHAR (15) NULL,
    [AGE_CRED_BTN]             VARCHAR (14) NULL,
    [AGE_DEBT_BTN]             VARCHAR (14) NULL,
    [TOVER_BTN]                VARCHAR (17) NULL,
    [ENTER_INVOICE_DETAIL_BTN] VARCHAR (25) NULL,
    [MATCH_TO_POP_BTN]         VARCHAR (30) NULL,
    [PRICE_RECORD_BTN]         VARCHAR (15) NULL,
    [IR_APPROVERS_BTN]         VARCHAR (26) NULL,
    [RESET_TRN_OPTS_BTN]       VARCHAR (35) NULL,
    [ALPHABETIC_BTN]           VARCHAR (20) NULL,
    [CURR_TRANSFER_BTN]        VARCHAR (20) NULL,
    [TEST_LOGON_BTN]           VARCHAR (20) NULL,
    [RELOAD_PERSONAL_BTN]      VARCHAR (22) NULL,
    [LEVELS_BTN]               VARCHAR (20) NULL,
    [APPROVE_INVOICE]          VARCHAR (20) NULL,
    [SHOWTODAY_BTN]            VARCHAR (24) NULL,
    [SHOWFUTURE_BTN]           VARCHAR (24) NULL,
    [SHOWALL_BTN]              VARCHAR (20) NULL,
    [SHOWUSER_BTN]             VARCHAR (15) NULL,
    [SHOWRECORD_BTN]           VARCHAR (15) NULL,
    [CURR_UTILS_BTN]           VARCHAR (20) NULL,
    [ACD_LINK_BTN]             VARCHAR (20) NULL,
    [ACCESS_WEB_BTN]           VARCHAR (30) NULL,
    [STOCK_UTILS_BTN]          VARCHAR (15) NULL,
    [EMAIL_DETAILS_BTN]        VARCHAR (15) NULL,
    [REJECTPOP_BTN]            VARCHAR (10) NULL,
    [SHOW_UNUSED_BTN]          VARCHAR (15) NULL,
    [DISPLAY_ALL_BTN]          VARCHAR (15) NULL,
    [COMPLETE_LINE_BTN]        VARCHAR (15) NULL,
    [COMPLETE_ADD_LINE_BTN]    VARCHAR (25) NULL,
    [HIDE_UNUSED_BTN]          VARCHAR (15) NULL,
    [ALPHA_SORT_BTN]           VARCHAR (30) NULL,
    [CLOSE_ORDER_BTN]          VARCHAR (15) NULL,
    [SMART_TAG_BTN]            VARCHAR (20) NULL,
    [RELOAD_LIST_BTN]          VARCHAR (15) NULL,
    [CLEAR_LINES_BTN]          VARCHAR (25) NULL,
    [RESTORE_SORT_BTN]         VARCHAR (20) NULL,
    [ALLOCATE_LIST_BTN]        VARCHAR (35) NULL,
    [SHOW_SUMMARY_BTN]         VARCHAR (15) NULL,
    [VIEW_ALLOCATIONS_BTN]     VARCHAR (20) NULL,
    [ALLOCATE_STOCK_BTN]       VARCHAR (15) NULL,
    [QUICK_ENTRY_BTN]          VARCHAR (20) NULL,
    [DETAILED_ENTRY_BTN]       VARCHAR (20) NULL,
    [UPDATE_SELECTED_BTN]      VARCHAR (35) NULL,
    [DESTINATION_VAT_BTN]      VARCHAR (20) NULL,
    [SELECT_SUBANALYSIS_BTN]   VARCHAR (20) NULL,
    [OUTPUT_TO_EXCEL_BTN]      VARCHAR (20) NULL,
    [OUTPUT_TO_WORD_BTN]       VARCHAR (20) NULL,
    [EDIT_WO_BTN]              VARCHAR (20) NULL,
    [PRINT_DOCKET_BTN]         VARCHAR (20) NULL,
    [PRINT_KIT_LIST_BTN]       VARCHAR (20) NULL,
    [ISSUE_COMP_BTN]           VARCHAR (20) NULL,
    [REVERSE_ISSUE_BTN]        VARCHAR (20) NULL,
    [BUILD_WO_BTN]             VARCHAR (20) NULL,
    [CANCEL_WO_BTN]            VARCHAR (20) NULL,
    [MERGE_WO_BTN]             VARCHAR (35) NULL,
    [RTP_BTN]                  VARCHAR (20) NULL,
    [CREATE_CHILD_ORD_BTN]     VARCHAR (20) NULL,
    [PROGRESS_WO_BTN]          VARCHAR (20) NULL,
    [PRINT_CERT_BTN]           VARCHAR (20) NULL,
    [ADVANCE_QTY_BTN]          VARCHAR (40) NULL,
    [BACK_BTN]                 VARCHAR (10) NULL,
    [SET_DEFAULT_BTN]          VARCHAR (18) NULL,
    [FINISH_BTN]               VARCHAR (10) NULL,
    [ISSUE_ALL_BTN]            VARCHAR (30) NULL,
    [ORDERS_WAITING_BTN]       VARCHAR (20) NULL,
    [RESET_COLOURS_BTN]        VARCHAR (20) NULL,
    [SAVE_REP_COLS_BTN]        VARCHAR (30) NULL,
    [CRED_CONT_UTIL_BTN]       VARCHAR (40) NULL,
    [OPEN_CUST_REC_BTN]        VARCHAR (20) NULL,
    [CRED_CONT_NOTES_BTN]      VARCHAR (25) NULL,
    [CORRECT_ALLOCATION_BTN]   VARCHAR (20) NULL,
    [ENTER_RECEIPT_BTN]        VARCHAR (20) NULL,
    [INSERT_NOTE_BTN]          VARCHAR (15) NULL,
    [VIEW_TERMS_BTN]           VARCHAR (15) NULL,
    [SAVE_BTN]                 VARCHAR (10) NULL,
    [MATCH_TO_ORDER_BTN]       VARCHAR (20) NULL,
    [ENTER_DETAILS_BTN]        VARCHAR (20) NULL,
    [AMEND_ENTRIES_BTN]        VARCHAR (20) NULL,
    [SUBMIT_BTN]               VARCHAR (15) NULL,
    [CB_STATEMENT_BTN]         VARCHAR (20) NULL,
    [CLEAR_VALUES_BTN]         VARCHAR (25) NULL,
    [TRIAL_BAL_BTN]            VARCHAR (20) NULL,
    [PROFIT_LOSS_BTN]          VARCHAR (25) NULL,
    [BAL_SHEET_BTN]            VARCHAR (25) NULL,
    [FILTER_BTN]               VARCHAR (25) NULL,
    [CLEAR_FILTER_BTN]         VARCHAR (25) NULL,
    [VIEW_GROUPS_BTN]          VARCHAR (25) NULL,
    [IMPORT_BTN]               VARCHAR (10) NULL,
    [SYNC_WITH_ACLOUD_BTN]     VARCHAR (20) NULL,
    CONSTRAINT [LANGCODE_BTN2_PK] PRIMARY KEY CLUSTERED ([LANGCODE_BTN2] ASC) WITH (FILLFACTOR = 70)
);


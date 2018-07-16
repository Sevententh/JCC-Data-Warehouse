﻿CREATE TABLE [dbo].[LANG_KEYS_MENU] (
    [LANGCODE_KEYS1]              VARCHAR (10) NOT NULL,
    [KEYS]                        VARCHAR (10) NULL,
    [FIND_RECORD_K]               VARCHAR (18) NULL,
    [INSERT_RECORD_K]             VARCHAR (20) NULL,
    [EDIT_RECORD_K]               VARCHAR (18) NULL,
    [DELETE_RECORD_K]             VARCHAR (20) NULL,
    [RECORD_LIST_K]               VARCHAR (18) NULL,
    [RECORD_OPTIONS_K]            VARCHAR (20) NULL,
    [NEXT_RECORD_K]               VARCHAR (18) NULL,
    [PREVIOUS_RECORD_K]           VARCHAR (22) NULL,
    [HELP_K]                      VARCHAR (10) NULL,
    [ASSEMBLY_K]                  VARCHAR (15) NULL,
    [COMPONENT_K]                 VARCHAR (18) NULL,
    [RECALC_ASSEMBLY_K]           VARCHAR (20) NULL,
    [COMPONENT_SWITCH_K]          VARCHAR (24) NULL,
    [FIND_ADD_TO_LIST_K]          VARCHAR (22) NULL,
    [DUPLICATE_K]                 VARCHAR (15) NULL,
    [CONTINUOUS_INSERT_K]         VARCHAR (20) NULL,
    [REMOVE_DUPLICATES_K]         VARCHAR (20) NULL,
    [USER_DETAILS_K]              VARCHAR (18) NULL,
    [BYPASS_OPTIONS_K]            VARCHAR (20) NULL,
    [REPORTS_K]                   VARCHAR (10) NULL,
    [REORDER_POPUPS_K]            VARCHAR (21) NULL,
    [NOTES_K]                     VARCHAR (12) NULL,
    [TERMS_K]                     VARCHAR (12) NULL,
    [EC_INFO_K]                   VARCHAR (15) NULL,
    [CONVERT_K]                   VARCHAR (12) NULL,
    [CONTACTS_K]                  VARCHAR (15) NULL,
    [SOP_ENTRY_K]                 VARCHAR (15) NULL,
    [ESTIMATE_BATCH_K]            VARCHAR (20) NULL,
    [OS_ESTIMATES_K]              VARCHAR (18) NULL,
    [TRANSACTIONS_K]              VARCHAR (18) NULL,
    [DEALERS_K]                   VARCHAR (10) NULL,
    [USER_DATES_K]                VARCHAR (17) NULL,
    [TURNOVER_K]                  VARCHAR (15) NULL,
    [COST_CENTRES_K]              VARCHAR (18) NULL,
    [GROUPS_K]                    VARCHAR (15) NULL,
    [UNRECOVERABLE_K]             VARCHAR (20) NULL,
    [EXTRA_WORK_K]                VARCHAR (18) NULL,
    [OS_POP_K]                    VARCHAR (15) NULL,
    [SOP_K]                       VARCHAR (8)  NULL,
    [ENTER_BUDGETS_K]             VARCHAR (18) NULL,
    [DEFINE_AS_BANK_K]            VARCHAR (20) NULL,
    [PETTY_CASH_ACCOUNT_K]        VARCHAR (22) NULL,
    [AUTO_INSERT_ACS_K]           VARCHAR (20) NULL,
    [INSERT_ANALYSIS_K]           VARCHAR (18) NULL,
    [PROFILE_K]                   VARCHAR (15) NULL,
    [DEFAULT_K]                   VARCHAR (15) NULL,
    [BANK_K]                      VARCHAR (10) NULL,
    [ADDRESSES_K]                 VARCHAR (15) NULL,
    [AGED_CREDITS_K]              VARCHAR (19) NULL,
    [OS_ORDERS_K]                 VARCHAR (15) NULL,
    [AGED_DEBTS_K]                VARCHAR (17) NULL,
    [PROFIT_K]                    VARCHAR (12) NULL,
    [SERIAL_NOS_K]                VARCHAR (18) NULL,
    [LOCATIONS_K]                 VARCHAR (15) NULL,
    [ASSEMBLY_LIST_K]             VARCHAR (15) NULL,
    [PROFIT_K_STK]                VARCHAR (12) NULL,
    [RATES_K]                     VARCHAR (12) NULL,
    [TRANSFERS_K]                 VARCHAR (15) NULL,
    [HOME_SYMBOL_K]               VARCHAR (18) NULL,
    [REVALUE_DEBTORS_K]           VARCHAR (22) NULL,
    [REVALUE_CREDITORS_K]         VARCHAR (24) NULL,
    [REVALUE_NOMINAL_K]           VARCHAR (22) NULL,
    [RATES_REPORT_K]              VARCHAR (18) NULL,
    [USER_TEXT_K]                 VARCHAR (20) NULL,
    [SNAPSHOT_K]                  VARCHAR (15) NULL,
    [HEADER_WINDOW_K]             VARCHAR (18) NULL,
    [DETAIL_WINDOW_K]             VARCHAR (18) NULL,
    [TOTALS_WINDOW_K]             VARCHAR (18) NULL,
    [FREEZE_K]                    VARCHAR (12) NULL,
    [TRANSACTION_OPTS_K]          VARCHAR (25) NULL,
    [POST_BATCH_K]                VARCHAR (15) NULL,
    [MARGINS_K]                   VARCHAR (12) NULL,
    [PAGE_PREVIEW_K]              VARCHAR (18) NULL,
    [DEBIT_CREDIT_SWCH_K]         VARCHAR (25) NULL,
    [ORDER_ENTRY_SWCH_K]          VARCHAR (25) NULL,
    [STOCK_INOUT_SWCH_K]          VARCHAR (27) NULL,
    [VIEW_ORDER_DETAIL_K]         VARCHAR (25) NULL,
    [EDIT_ORDER_K]                VARCHAR (15) NULL,
    [DELETE_ORDER_K]              VARCHAR (20) NULL,
    [TOGGLE_ALL_LINES_K]          VARCHAR (24) NULL,
    [TOGGLE_SINGLE_LINE_K]        VARCHAR (25) NULL,
    [RESET_PRINT_STATUS_K]        VARCHAR (27) NULL,
    [PICTURE_K]                   VARCHAR (12) NULL,
    [COST_PRICE_K]                VARCHAR (15) NULL,
    [SELL_PRICE_K]                VARCHAR (15) NULL,
    [BOTH_PRICES_K]               VARCHAR (15) NULL,
    [REMOVE_K]                    VARCHAR (12) NULL,
    [AD_HOC_REPORTS_K]            VARCHAR (18) NULL,
    [PRINT_K]                     VARCHAR (10) NULL,
    [EXPORT_K]                    VARCHAR (10) NULL,
    [FILE_K]                      VARCHAR (8)  NULL,
    [PAGE_SETUP_K]                VARCHAR (15) NULL,
    [UTILITIES_MENU_K]            VARCHAR (18) NULL,
    [QUIT_K]                      VARCHAR (8)  NULL,
    [EXIT_K]                      VARCHAR (8)  NULL,
    [INFO_K]                      VARCHAR (8)  NULL,
    [DDE_APPLE_EVENTS_K]          VARCHAR (20) NULL,
    [AD_HOC_ALL_K]                VARCHAR (25) NULL,
    [AD_HOC_OWNED_K]              VARCHAR (32) NULL,
    [UN_FREEZE_K]                 VARCHAR (15) NULL,
    [TOOL_BAR_K]                  VARCHAR (12) NULL,
    [ABOUT_K]                     VARCHAR (25) NULL,
    [RECORD_INFO_K]               VARCHAR (8)  NULL,
    [CURRENCY_DEFAULTS_K]         VARCHAR (20) NULL,
    [WEB_LINKS_K]                 VARCHAR (20) NULL,
    [TAB_OPTIONS_K]               VARCHAR (20) NULL,
    [OPTIONS_K]                   VARCHAR (20) NULL,
    [POSTCODE_MANAGEMENT_K]       VARCHAR (30) NULL,
    [BULK_UPDATE_K]               VARCHAR (20) NULL,
    [UPDATE_CAMPAIGN_K]           VARCHAR (20) NULL,
    [LETTERS_K]                   VARCHAR (20) NULL,
    [LETTER_SETUP_K]              VARCHAR (20) NULL,
    [OUTPUT_TO_EXCEL_K]           VARCHAR (25) NULL,
    [EXTERNAL_DOCS_K]             VARCHAR (25) NULL,
    [CONVERT_TO_CUSTOMER_K]       VARCHAR (30) NULL,
    [BATCH_K]                     VARCHAR (20) NULL,
    [SELECT_SEARCH_K]             VARCHAR (20) NULL,
    [SAVE_SEARCH_K]               VARCHAR (20) NULL,
    [CLEAR_K]                     VARCHAR (20) NULL,
    [DISPLAY_K]                   VARCHAR (20) NULL,
    [MY_RECORDS_K]                VARCHAR (20) NULL,
    [PIPELINE_K]                  VARCHAR (20) NULL,
    [TASKS_K]                     VARCHAR (20) NULL,
    [SEARCH_K]                    VARCHAR (20) NULL,
    [CAMPAIGN_K]                  VARCHAR (20) NULL,
    [REMOVE_LINE_K]               VARCHAR (25) NULL,
    [VAT_K]                       VARCHAR (20) NULL,
    [ASSIGN_ACCOUNT_K]            VARCHAR (25) NULL,
    [SSM_DETAILS_K]               VARCHAR (25) NULL,
    [DOCUMENT_HISTORY_K]          VARCHAR (25) NULL,
    [POPUP_LIST_CONFIGURATION_K]  VARCHAR (35) NULL,
    [CAMPAIGN_HISTORY_K]          VARCHAR (25) NULL,
    [SMART_TAG_SUMMARY_K]         VARCHAR (30) NULL,
    [SAVE_AND_PREVIOUS_K]         VARCHAR (25) NULL,
    [SAVE_AND_NEXT_K]             VARCHAR (25) NULL,
    [DUPLICATE_REC_K]             VARCHAR (25) NULL,
    [DELETE_K]                    VARCHAR (25) NULL,
    [SAVE_NOW_K]                  VARCHAR (25) NULL,
    [DETAILS_K]                   VARCHAR (25) NULL,
    [KEYWORDS_K]                  VARCHAR (25) NULL,
    [CHECKLIST_K]                 VARCHAR (25) NULL,
    [CUSTOM_K]                    VARCHAR (25) NULL,
    [CONTACT_DETAILS_K]           VARCHAR (25) NULL,
    [CONTACT_NOTES_K]             VARCHAR (25) NULL,
    [CAMPAIGN_REC_K]              VARCHAR (25) NULL,
    [ADDRESS_K]                   VARCHAR (25) NULL,
    [CONTACT_KEYWORDS_K]          VARCHAR (25) NULL,
    [SOP_OPTIONS_K]               VARCHAR (25) NULL,
    [AGED_DEBTOR_K]               VARCHAR (25) NULL,
    [AGED_CREDITOR_K]             VARCHAR (25) NULL,
    [UPDATE_ALLOCATED_USER]       VARCHAR (30) NULL,
    [NAVIGATE_TREE_K]             VARCHAR (20) NULL,
    [CHANGE_REGISTRATION_DETAILS] VARCHAR (30) NULL,
    [ACCESS_SUPPLIES_WEBSITE]     VARCHAR (30) NULL,
    [RECOMMEND_DIMENSIONS]        VARCHAR (30) NULL,
    [USE_SYSTEM_DEFAULT]          VARCHAR (25) NULL,
    [CRM_PROFIT]                  VARCHAR (20) NULL,
    [SUBCONTRACTOR_K]             VARCHAR (20) NULL,
    [ABOUT_DIMENSIONS_K]          VARCHAR (25) NULL,
    [CORRECTIONS_K]               VARCHAR (25) NULL,
    [TRIAL_BALANCE_K]             VARCHAR (25) NULL,
    [PROFIT_LOSS_K]               VARCHAR (25) NULL,
    [PL_ALL_PERIODS_K]            VARCHAR (25) NULL,
    [PL_COMPARISON_K]             VARCHAR (25) NULL,
    [BALANCE_SHEET_K]             VARCHAR (25) NULL,
    CONSTRAINT [LANGCODE_KEYS1_PK] PRIMARY KEY CLUSTERED ([LANGCODE_KEYS1] ASC) WITH (FILLFACTOR = 70)
);

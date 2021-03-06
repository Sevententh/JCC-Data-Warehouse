﻿CREATE TABLE [dbo].[LANG_DEF7] (
    [LANGCODE_DEF7]           VARCHAR (10) NOT NULL,
    [WEEK_NO]                 VARCHAR (12) NULL,
    [ESTIMATE]                VARCHAR (10) NULL,
    [ACTIVE]                  VARCHAR (10) NULL,
    [COSTCENTRE_CODE]         VARCHAR (8)  NULL,
    [COSTCENTRE_NAME]         VARCHAR (8)  NULL,
    [NO_USER_SUBTOTAL]        VARCHAR (18) NULL,
    [DATE_REQUIRED]           VARCHAR (15) NULL,
    [DURATION]                VARCHAR (10) NULL,
    [DATE_LAST_INVOICE]       VARCHAR (20) NULL,
    [DATE_LAST_PAYMENT]       VARCHAR (20) NULL,
    [TOTAL_UPLIFT]            VARCHAR (15) NULL,
    [RESOURCE_TEXT]           VARCHAR (10) NULL,
    [ORIGINAL]                VARCHAR (10) NULL,
    [REVISED]                 VARCHAR (10) NULL,
    [UPLIFT_ON_ORIGINAL]      VARCHAR (20) NULL,
    [UPLIFT_ON_REVISED]       VARCHAR (20) NULL,
    [COMMITTED_TEXT]          VARCHAR (12) NULL,
    [UPLIFT_ON_ACTUAL]        VARCHAR (18) NULL,
    [GROUP_TEXT]              VARCHAR (8)  NULL,
    [TIME_TEXT]               VARCHAR (6)  NULL,
    [ORIGINAL_BUDGET]         VARCHAR (18) NULL,
    [REVISED_BUDGET]          VARCHAR (18) NULL,
    [DATE_ESTIMATED]          VARCHAR (18) NULL,
    [DATE_COMPLETED]          VARCHAR (18) NULL,
    [WORK_IN_PROGRESS]        VARCHAR (18) NULL,
    [WIP_UPLIFTED]            VARCHAR (18) NULL,
    [TIMESHEETS_INVOICED]     VARCHAR (22) NULL,
    [OTHERS_INVOICED]         VARCHAR (18) NULL,
    [NO_OF]                   VARCHAR (8)  NULL,
    [VALUE_COST]              VARCHAR (14) NULL,
    [VALUE_INV]               VARCHAR (14) NULL,
    [DISPLAY]                 VARCHAR (10) NULL,
    [ONLY_TEXT]               VARCHAR (6)  NULL,
    [SHOW]                    VARCHAR (6)  NULL,
    [HIDE]                    VARCHAR (6)  NULL,
    [SELECTION]               VARCHAR (12) NULL,
    [BY_TEXT]                 VARCHAR (5)  NULL,
    [SUSPENDED]               VARCHAR (12) NULL,
    [REOPENED]                VARCHAR (12) NULL,
    [CANCELLED]               VARCHAR (12) NULL,
    [COMPLETED]               VARCHAR (12) NULL,
    [BUDGET_TIME_QTY]         VARCHAR (18) NULL,
    [ACTUAL_TIME_QTY]         VARCHAR (18) NULL,
    [EMPLOYEE_CODE]           VARCHAR (15) NULL,
    [DEFAULT_PAYTYPE_RATE]    VARCHAR (25) NULL,
    [INVOICE_TOTAL]           VARCHAR (15) NULL,
    [LINE_VALUE]              VARCHAR (12) NULL,
    [EST_ABBREV]              VARCHAR (6)  NULL,
    [QTYS_ABBREV]             VARCHAR (6)  NULL,
    [PAYROLL_LINK]            VARCHAR (14) NULL,
    [BASE_PRICE]              VARCHAR (12) NULL,
    [RESOURCE_CODE]           VARCHAR (16) NULL,
    [RESOURCE_NAME]           VARCHAR (16) NULL,
    [COPY_OPTIONS]            VARCHAR (15) NULL,
    [AND_BYPASS]              VARCHAR (12) NULL,
    [BYPASS_ENTRY]            VARCHAR (15) NULL,
    [DATE_STATUS_CHANGED]     VARCHAR (22) NULL,
    [INVOICE_PREVIEW]         VARCHAR (18) NULL,
    [DELETE_TRANS_FOR]        VARCHAR (25) NULL,
    [CUSTOMISE_USER_TEXT]     VARCHAR (8)  NULL,
    [UP_TO_TEXT]              VARCHAR (8)  NULL,
    [DO_NOT_USE_TEXT]         VARCHAR (10) NULL,
    [BTB_TEXT]                VARCHAR (3)  NULL,
    [NO_PAY_APPROVAL]         VARCHAR (20) NULL,
    [ONE_STAGE_APPROVAL]      VARCHAR (20) NULL,
    [TWO_STAGE_APPROVAL]      VARCHAR (20) NULL,
    [SELECTED_TEXT]           VARCHAR (12) NULL,
    [BEST_PRICE_TEXT]         VARCHAR (15) NULL,
    [PRICE_LINE1_TEXT]        VARCHAR (14) NULL,
    [POSTCODE]                VARCHAR (11) NULL,
    [TOYTD]                   VARCHAR (10) NULL,
    [USER_TEXT]               VARCHAR (9)  NULL,
    [COUNT_TEXT]              VARCHAR (7)  NULL,
    [AN_PTD]                  VARCHAR (12) NULL,
    [POST_TO]                 VARCHAR (9)  NULL,
    [TOTAL_TO_PRINT]          VARCHAR (20) NULL,
    [USER_ID_TEXT]            VARCHAR (15) NULL,
    [NEW_ORDER]               VARCHAR (16) NULL,
    [USER_FIELD_LABELS]       VARCHAR (20) NULL,
    [YEAR_END]                VARCHAR (17) NULL,
    [OLD_TEXT]                VARCHAR (6)  NULL,
    [UPDATE_AGED_CREDITORS]   VARCHAR (30) NULL,
    [UPDATE_AGED_DEBT]        VARCHAR (25) NULL,
    [USE_PAYTYPE_VALUE_AS]    VARCHAR (49) NULL,
    [USERS]                   VARCHAR (11) NULL,
    [ADVANCE_BY_DAYS]         VARCHAR (28) NULL,
    [BANK_ACCOUNTS]           VARCHAR (16) NULL,
    [YEAR_END_UPDATE]         VARCHAR (25) NULL,
    [BOX]                     VARCHAR (6)  NULL,
    [BOX_CODE]                VARCHAR (11) NULL,
    [BOX_SIGN]                VARCHAR (12) NULL,
    [CANNOT_DELETE_BATCHED]   VARCHAR (37) NULL,
    [VAT_RETURN_NEVER_UPD]    VARCHAR (49) NULL,
    [APPROVER_TYPE]           VARCHAR (15) NULL,
    [INVOICE_REGISTER_SELECT] VARCHAR (30) NULL,
    [ACCESS_OPTION_TXT]       VARCHAR (20) NULL,
    [ACCESS_MODULE_TXT]       VARCHAR (20) NULL,
    [EXTERNAL_PROGRAM_TXT]    VARCHAR (20) NULL,
    [TOOLTIP_TXT]             VARCHAR (15) NULL,
    [CURRENT_ICON_TXT]        VARCHAR (15) NULL,
    [BROWSE_TXT]              VARCHAR (10) NULL,
    [PROGRAM_PATH_TXT]        VARCHAR (15) NULL,
    [SHOW_THOUSANDS_AS]       VARCHAR (20) NULL,
    [ANY_USER]                VARCHAR (10) NULL,
    [SPECIFIC_USER]           VARCHAR (15) NULL,
    [IR_LEVEL]                VARCHAR (8)  NULL,
    [MATCHED_INVOICES]        VARCHAR (20) NULL,
    [PROCESS_IN_ORDER]        VARCHAR (20) NULL,
    [TO_MATCH]                VARCHAR (10) NULL,
    [PO_NO]                   VARCHAR (8)  NULL,
    [WAITING_FOR_APPROVAL]    VARCHAR (25) NULL,
    [APPROVAL_REQUIRED]       VARCHAR (30) NULL,
    [MATCHING]                VARCHAR (10) NULL,
    [POP_INVOICE]             VARCHAR (15) NULL,
    [MAJORHEADING_NUMBER]     VARCHAR (24) NULL,
    [NL_JNL_VCH_REPS]         VARCHAR (25) NULL,
    [WINDOWS_USER]            VARCHAR (20) NULL,
    [OS_REC]                  VARCHAR (15) NULL,
    [SERVER_MODE]             VARCHAR (15) NULL,
    [SYSTEM_EMAIL_DEFAULTS]   VARCHAR (30) NULL,
    CONSTRAINT [LANGCODE_DEF7_PK] PRIMARY KEY CLUSTERED ([LANGCODE_DEF7] ASC) WITH (FILLFACTOR = 70)
);


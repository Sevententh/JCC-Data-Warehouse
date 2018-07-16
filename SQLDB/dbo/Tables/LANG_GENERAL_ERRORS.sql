﻿CREATE TABLE [dbo].[LANG_GENERAL_ERRORS] (
    [LANGCODE_GENERAL_ERRORS]        VARCHAR (10)  NOT NULL,
    [LGE_INTERNAL_ERROR]             VARCHAR (35)  NULL,
    [LGE_SQL_ERROR]                  VARCHAR (30)  NULL,
    [LGE_MULTI_USER_LOCKING_PRBLM]   VARCHAR (35)  NULL,
    [LGE_CONSTANT_MISMATCH]          VARCHAR (85)  NULL,
    [LGE_INITIALISATION_FAILED]      VARCHAR (25)  NULL,
    [LGE_PARAMETER_MISSING]          VARCHAR (20)  NULL,
    [LGE_SWITCHED_OFF]               VARCHAR (40)  NULL,
    [LGE_UNEXPECTED_PARAM_TYPE]      VARCHAR (50)  NULL,
    [LGE_UNKNOWN_COMMAND]            VARCHAR (20)  NULL,
    [LGE_UNKNOWN_ERROR_CODE]         VARCHAR (25)  NULL,
    [LGE_UNKNOWN_SEVERITY]           VARCHAR (25)  NULL,
    [LGE_UNKNOWN_VALUE]              VARCHAR (20)  NULL,
    [LGE_UNKNOWN_VERBOSENESS]        VARCHAR (30)  NULL,
    [LGE_USER_CANCELLED]             VARCHAR (20)  NULL,
    [LGE_NO_SERIAL_NUMBER]           VARCHAR (70)  NULL,
    [LGE_PROBLEM_CREATING_FILE]      VARCHAR (25)  NULL,
    [LGE_DELIVERY_CHARGE_ON_OWN]     VARCHAR (60)  NULL,
    [LGE_BATCH_PROCESS_CANCELLED]    VARCHAR (40)  NULL,
    [LGE_NO_SUB_ANALYSIS]            VARCHAR (65)  NULL,
    [LGE_DEL_ALREADY_PRINTED]        VARCHAR (75)  NULL,
    [LGE_NOT_AUTHORISED]             VARCHAR (60)  NULL,
    [LGE_PROCESS_BY_ANOTHER_USER]    VARCHAR (70)  NULL,
    [LGE_ORDER_CLOSED]               VARCHAR (45)  NULL,
    [LGE_ORDER_ON_HOLD]              VARCHAR (45)  NULL,
    [LGE_MULTIPLE_SUB_ANALYSIS]      VARCHAR (120) NULL,
    [LGE_ORDER_ACC_ON_STOP]          VARCHAR (55)  NULL,
    [LGE_DELIVERY_NOTE_NOT_PRINTED]  VARCHAR (75)  NULL,
    [LGE_INVOICE_NOT_PRINTED]        VARCHAR (70)  NULL,
    [LGE_NOT_ENOUGH_STOCK]           VARCHAR (55)  NULL,
    [LGE_NO_CREDIT_CARD]             VARCHAR (65)  NULL,
    [LGE_NO_SWITCH_DETAILS]          VARCHAR (90)  NULL,
    [LGE_NL_PERIODEND_RUNNING]       VARCHAR (70)  NULL,
    [LGE_PL_PERIODEND_RUNNING]       VARCHAR (70)  NULL,
    [LGE_SL_PERIODEND_RUNNING]       VARCHAR (70)  NULL,
    [LGE_INVOICE_WITHOUT_DELIVERY]   VARCHAR (45)  NULL,
    [LGE_PRICE_RECORD_ON_OWN]        VARCHAR (45)  NULL,
    [LGE_DELIVERY_ADDRESS_NOTUSED]   VARCHAR (50)  NULL,
    [LGE_SOP_ADDRESSES_NOTUSED]      VARCHAR (65)  NULL,
    [LGE_POP_ADDRESSES_NOTUSED]      VARCHAR (65)  NULL,
    [LGE_INVOICE_ADDRESS_NOTUSED]    VARCHAR (50)  NULL,
    [LGE_ORDER_ADDRESS_NOTUSED]      VARCHAR (50)  NULL,
    [LGE_CRASH_DETECTED]             VARCHAR (20)  NULL,
    [LGE_INV_ALREADY_PRINTED]        VARCHAR (70)  NULL,
    [LGE_DEL_ALREADY_UPDATED]        VARCHAR (70)  NULL,
    [LGE_INV_ALREADY_UPDATED]        VARCHAR (70)  NULL,
    [LGE_NOTHING_TO_PRINT_ON_PLIST]  VARCHAR (50)  NULL,
    [LGE_NO_CARD_EXPIRY]             VARCHAR (75)  NULL,
    [LGE_STOCK_NOT_ALLOCATED]        VARCHAR (65)  NULL,
    [LGE_VALUE_READ_ONLY]            VARCHAR (35)  NULL,
    [LGE_VALUE_WRITE_ONLY]           VARCHAR (35)  NULL,
    [LGE_VALUE_UNAVAILABLE]          VARCHAR (25)  NULL,
    [LGE_NEGATIVE_CHEQUE_VALUE]      VARCHAR (120) NULL,
    [LGE_CHEQUE_VALUE_TOO_LARGE]     VARCHAR (120) NULL,
    [LGE_SQL_SESSION_CLOSED]         VARCHAR (65)  NULL,
    [LGE_EXCEEDED_CREDIT_LIMIT]      VARCHAR (25)  NULL,
    [LGE_INSUFFICIENT_SERIAL_NOS]    VARCHAR (35)  NULL,
    [LGE_NO_STOCK_ANALYSIS]          VARCHAR (65)  NULL,
    [LGE_DELIVERY_ACC_ON_STOP]       VARCHAR (35)  NULL,
    [LGE_INVOICE_ACC_ON_STOP]        VARCHAR (35)  NULL,
    [LGE_CREDIT_NOTE_NOT_PROCESSED]  VARCHAR (60)  NULL,
    [LGE_CREDIT_NOTE_NOT_COMPLETED]  VARCHAR (60)  NULL,
    [LGE_PROJECT_STATUS_INVALID]     VARCHAR (80)  NULL,
    [LGE_COSTCENTRE_STATUS_INVALID]  VARCHAR (80)  NULL,
    [LGE_D_CHRGE_AND_PRC_REC_ON_OWN] VARCHAR (90)  NULL,
    [LGE_PRICE_RECORDS_ON_OWN]       VARCHAR (60)  NULL,
    [LGE_DO_NOT_PART_DELIVER]        VARCHAR (80)  NULL,
    [LGE_CRN_ALREADY_PRINTED]        VARCHAR (45)  NULL,
    [LGE_CRN_NOT_PRINTED]            VARCHAR (50)  NULL,
    [LGE_PARAMETER_LIST_EMPTY]       VARCHAR (50)  NULL,
    [LGE_USER_DOES_NOT_EXIST]        VARCHAR (40)  NULL,
    [LGE_INV_CONSOLIDATION_ERROR]    VARCHAR (50)  NULL,
    [LGE_WFF_REJECTED]               VARCHAR (30)  NULL,
    [LGE_WFF_PENDING]                VARCHAR (40)  NULL,
    [LGE_PROJECT_IS_A_CONTRACT]      VARCHAR (100) NULL,
    CONSTRAINT [LANGCODE_GENERAL_ERRORS_PK] PRIMARY KEY CLUSTERED ([LANGCODE_GENERAL_ERRORS] ASC) WITH (FILLFACTOR = 70)
);


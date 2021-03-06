﻿CREATE TABLE [dbo].[LANG_TRNOPTIONS] (
    [LANGCODE_TRNOPTS]                    VARCHAR (10) NOT NULL,
    [MAKE_PAYMENT_NOW]                    VARCHAR (35) NULL,
    [ENTER_DUEPAYDATE]                    VARCHAR (35) NULL,
    [REMEMBER_SUPPLIER]                   VARCHAR (35) NULL,
    [INVS_ON_DISPUTE]                     VARCHAR (35) NULL,
    [EXCLUDE_RES_UPLIFT]                  VARCHAR (25) NULL,
    [COPY_RES_NOTES]                      VARCHAR (35) NULL,
    [UPDATE_PAYROLL]                      VARCHAR (35) NULL,
    [ENTER_GROSS_AMOUNTS]                 VARCHAR (25) NULL,
    [ENTER_RECEIPT_NOW]                   VARCHAR (35) NULL,
    [ALLOC_TRANS_NOW]                     VARCHAR (35) NULL,
    [ENTER_GROSS_CURR]                    VARCHAR (35) NULL,
    [ARCHIVE_TRANSACTION]                 VARCHAR (35) NULL,
    [BATCH_TRANSACTION]                   VARCHAR (35) NULL,
    [ENTER_DUERCPTDATE]                   VARCHAR (35) NULL,
    [BYPASS_COSTING]                      VARCHAR (35) NULL,
    [POSTBAL_CONTRA]                      VARCHAR (35) NULL,
    [POST_MULTICONTRA]                    VARCHAR (35) NULL,
    [RECUR_JOURNAL]                       VARCHAR (35) NULL,
    [ENTER_CURR_AMOUNTS]                  VARCHAR (35) NULL,
    [MULTIPLE_LOTNUMBER]                  VARCHAR (40) NULL,
    [SELECT_FIRST_SNO]                    VARCHAR (40) NULL,
    [SELECT_FIRST_LOCATION]               VARCHAR (40) NULL,
    [UPDATE_COST_PRICE]                   VARCHAR (40) NULL,
    [CURRENCY_VALUES]                     VARCHAR (40) NULL,
    [IGNORE_QTY_CHECKS]                   VARCHAR (40) NULL,
    [MULTIPLE_SERIAL_NOS]                 VARCHAR (30) NULL,
    [BATCH_ORDER]                         VARCHAR (35) NULL,
    [RESERVE_STOCK]                       VARCHAR (35) NULL,
    [DO_NOT_PRINT_DEL_NOTE]               VARCHAR (35) NULL,
    [BATCH_INVOICE]                       VARCHAR (35) NULL,
    [ALLOCATE_INV_NOW]                    VARCHAR (35) NULL,
    [DUE_DATE_RCPT_DATE]                  VARCHAR (35) NULL,
    [INVOICE_FULL_ORDER]                  VARCHAR (35) NULL,
    [ENTER_GROSS_ORDERS]                  VARCHAR (40) NULL,
    [BYPASS_QTY]                          VARCHAR (35) NULL,
    [BYPASS_PRICE]                        VARCHAR (35) NULL,
    [BYPASS_DISCOUNT]                     VARCHAR (35) NULL,
    [BYPASS_ANALYSIS]                     VARCHAR (35) NULL,
    [ALLOW_LOCATION_EMPTY]                VARCHAR (45) NULL,
    [ALWAYS_FIRST_SNO]                    VARCHAR (40) NULL,
    [ALLOW_SNO_EMPTY]                     VARCHAR (45) NULL,
    [BATCH_CREDIT_NOTE]                   VARCHAR (35) NULL,
    [DO_NOT_UPDATE_STOCK]                 VARCHAR (35) NULL,
    [BATCH_CREDIT]                        VARCHAR (35) NULL,
    [ALLOCATE_CREDIT_NOW]                 VARCHAR (35) NULL,
    [ENTER_GROSS_CREDITS]                 VARCHAR (40) NULL,
    [UPDATE_STOCK_ON_ORDER]               VARCHAR (35) NULL,
    [DUE_DATE_PAY_DATE]                   VARCHAR (35) NULL,
    [PRINT_GOODS_RECVD]                   VARCHAR (35) NULL,
    [PRINT_GOODS_RETURN]                  VARCHAR (35) NULL,
    [QUANTITY_NOT_ZERO]                   VARCHAR (35) NULL,
    [RECALC_CURR_ORDERS]                  VARCHAR (70) NULL,
    [NO_RECALC_ON_CONVERSION]             VARCHAR (70) NULL,
    [RECALC_HOME_TO_CURR]                 VARCHAR (70) NULL,
    [RECALC_CURR_TO_HOME]                 VARCHAR (70) NULL,
    [RECALC_FOR_TRAN_OPT]                 VARCHAR (70) NULL,
    [ENTER_SUPPLIER_DELIVERY_NOTE_NUMBER] VARCHAR (50) NULL,
    [SHOW_QUANTITY_ON_DETAIL]             VARCHAR (40) NULL,
    [REVALUE_IN_BATCH_DETAIL]             VARCHAR (35) NULL,
    CONSTRAINT [LANGCODE_TRNOPTS_PK] PRIMARY KEY CLUSTERED ([LANGCODE_TRNOPTS] ASC) WITH (FILLFACTOR = 70)
);


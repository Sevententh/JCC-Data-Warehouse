﻿CREATE TABLE [dbo].[LANG_MODULES] (
    [SYS_SL1_MODULE]          VARCHAR (10) NULL,
    [SYS_SL2_MODULE]          VARCHAR (10) NULL,
    [SYS_PL1_MODULE]          VARCHAR (10) NULL,
    [SYS_PL2_MODULE]          VARCHAR (10) NULL,
    [SYS_NL1_MODULE]          VARCHAR (10) NULL,
    [SYS_NL2_MODULE]          VARCHAR (10) NULL,
    [SYS_CB1_MODULE]          VARCHAR (15) NULL,
    [SYS_CB2_MODULE]          VARCHAR (10) NULL,
    [SYS_CF1_MODULE]          VARCHAR (10) NULL,
    [SYS_CF2_MODULE]          VARCHAR (10) NULL,
    [SYS_STK1_MODULE]         VARCHAR (10) NULL,
    [SYS_STK2_MODULE]         VARCHAR (10) NULL,
    [SYS_SOP1_MODULE]         VARCHAR (10) NULL,
    [SYS_SOP2_MODULE]         VARCHAR (10) NULL,
    [SYS_POP1_MODULE]         VARCHAR (10) NULL,
    [SYS_POP2_MODULE]         VARCHAR (10) NULL,
    [SYS_CST1_MODULE]         VARCHAR (10) NULL,
    [SYS_CST2_MODULE]         VARCHAR (10) NULL,
    [SYS_SYS1_MODULE]         VARCHAR (10) NULL,
    [SYS_SYS2_MODULE]         VARCHAR (10) NULL,
    [SYS_PROS_MODULE]         VARCHAR (10) NULL,
    [SYS_WO1_MODULE]          VARCHAR (12) NULL,
    [SYS_WO2_MODULE]          VARCHAR (10) NULL,
    [LANGCODE_MODULE]         VARCHAR (10) NOT NULL,
    [SYS_IR1_MODULE]          VARCHAR (10) NULL,
    [SYS_IR2_MODULE]          VARCHAR (10) NULL,
    [MODULE_KEY_SL]           VARCHAR (4)  NULL,
    [MODULE_KEY_PM]           VARCHAR (4)  NULL,
    [MODULE_KEY_PL]           VARCHAR (4)  NULL,
    [MODULE_KEY_IR]           VARCHAR (4)  NULL,
    [MODULE_KEY_NL]           VARCHAR (4)  NULL,
    [MODULE_KEY_CB]           VARCHAR (4)  NULL,
    [MODULE_KEY_CC]           VARCHAR (4)  NULL,
    [MODULE_KEY_SOP]          VARCHAR (4)  NULL,
    [MODULE_KEY_POP]          VARCHAR (4)  NULL,
    [MODULE_KEY_STK]          VARCHAR (4)  NULL,
    [MODULE_KEY_CST]          VARCHAR (4)  NULL,
    [MODULE_KEY_SYS]          VARCHAR (4)  NULL,
    [MODULE_KEY_WO]           VARCHAR (4)  NULL,
    [MODULE_MENU_FINANCIALS]  VARCHAR (15) NULL,
    [MODULE_MENU_PIR]         VARCHAR (15) NULL,
    [MODULE_MENU_STOCK]       VARCHAR (15) NULL,
    [MODULE_MENU_SOP]         VARCHAR (15) NULL,
    [MODULE_MENU_POP]         VARCHAR (15) NULL,
    [MODULE_MENU_COSTING]     VARCHAR (15) NULL,
    [MODULE_MENU_SYS_CONTROL] VARCHAR (15) NULL,
    [MODULE_MENU_WO]          VARCHAR (15) NULL,
    [ACCESS_MENU]             VARCHAR (15) NULL,
    [RIBBON_DEBTORS]          VARCHAR (20) NULL,
    [RIBBON_CREDITORS]        VARCHAR (20) NULL,
    [RIBBON_SELLING]          VARCHAR (20) NULL,
    [RIBBON_PURCHASING]       VARCHAR (20) NULL,
    CONSTRAINT [LANGCODE_MODULE_PK] PRIMARY KEY CLUSTERED ([LANGCODE_MODULE] ASC)
);


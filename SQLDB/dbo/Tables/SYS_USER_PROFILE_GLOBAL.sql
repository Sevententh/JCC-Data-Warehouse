﻿CREATE TABLE [dbo].[SYS_USER_PROFILE_GLOBAL] (
    [UPG_PRIMARY]                  INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [UPG_CODE]                     VARCHAR (10) NULL,
    [UPG_NUMBER_LOGONS]            INT          DEFAULT ((0)) NULL,
    [UPG_PWORD_FREQUENCY]          VARCHAR (1)  NULL,
    [UPG_LOGON_TIME_BEGIN]         DATETIME     NULL,
    [UPG_LOGON_TIME_END]           DATETIME     NULL,
    [UPG_USER_PUTIN]               VARCHAR (4)  NULL,
    [UPG_DATE_PUTIN]               DATETIME     NULL,
    [UPG_USER_EDITED]              VARCHAR (4)  NULL,
    [UPG_DATE_EDITED]              DATETIME     NULL,
    [UPG_LEVEL_MODE]               VARCHAR (1)  NULL,
    [UPG_INSERT_LEVEL]             INT          DEFAULT ((0)) NULL,
    [UPG_DESCRIPTION]              VARCHAR (40) NULL,
    [UPG_SOP_STATUS_DEF]           INT          DEFAULT ((0)) NULL,
    [UPG_BATCH_ONLY]               TINYINT      DEFAULT ((0)) NULL,
    [UPG_NO_REPORTS]               TINYINT      DEFAULT ((0)) NULL,
    [UPG_NO_SPRDSHT]               TINYINT      DEFAULT ((0)) NULL,
    [UPG_USE_TOOLBAR]              TINYINT      DEFAULT ((0)) NULL,
    [UPG_EDIT_TOOLBAR]             TINYINT      DEFAULT ((0)) NULL,
    [UPG_SPECIAL_REPS]             TINYINT      DEFAULT ((0)) NULL,
    [UPG_OWN_PROSPECT]             TINYINT      DEFAULT ((0)) NULL,
    [UPG_LANG_ENTRY]               TINYINT      DEFAULT ((0)) NULL,
    [UPG_SL_FUTURE_POST]           TINYINT      DEFAULT ((0)) NULL,
    [UPG_SL_C_YEAR_ONLY]           TINYINT      DEFAULT ((0)) NULL,
    [UPG_PL_FUTURE_POST]           TINYINT      DEFAULT ((0)) NULL,
    [UPG_PL_C_YEAR_ONLY]           TINYINT      DEFAULT ((0)) NULL,
    [UPG_NL_FUTURE_POST]           TINYINT      DEFAULT ((0)) NULL,
    [UPG_NL_C_YEAR_ONLY]           TINYINT      DEFAULT ((0)) NULL,
    [UPG_STK_FUTURE_POST]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_STK_C_YEAR_ONLY]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_SOP_FUTURE_POST]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_SOP_C_YEAR_ONLY]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_POP_FUTURE_POST]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_POP_C_YEAR_ONLY]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_CST_FUTURE_POST]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_CST_C_YEAR_ONLY]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_EXCEED_OTHER_NL]          TINYINT      DEFAULT ((0)) NULL,
    [UPG_AUTHORISE_OWN]            TINYINT      DEFAULT ((0)) NULL,
    [UPG_AUTHORISE_ORDERS]         TINYINT      DEFAULT ((0)) NULL,
    [UPG_ORDER_BUDGET]             FLOAT (53)   DEFAULT ((0)) NULL,
    [UPG_CURRENT_BUDGET]           FLOAT (53)   DEFAULT ((0)) NULL,
    [UPG_PREVIOUS_BUDGET]          FLOAT (53)   DEFAULT ((0)) NULL,
    [UPG_BUDGET_GROUP]             VARCHAR (20) NULL,
    [UPG_AUTHORISE_TYPE]           TINYINT      DEFAULT ((0)) NULL,
    [UPG_SL_SUBLEDGERCODE]         VARCHAR (10) NULL,
    [UPG_PL_SUBLEDGERCODE]         VARCHAR (10) NULL,
    [UPG_NL_SUBLEDGERCODE]         VARCHAR (10) NULL,
    [UPG_ADHOC_R]                  TINYINT      DEFAULT ((0)) NULL,
    [UPG_ADHOC_W]                  TINYINT      DEFAULT ((0)) NULL,
    [UPG_DDE_AE]                   TINYINT      DEFAULT ((0)) NULL,
    [UPG_SOP_STATUS_LEVEL]         INT          DEFAULT ((0)) NULL,
    [UPG_DISABLE_EMAIL]            TINYINT      DEFAULT ((0)) NULL,
    [UPG_REVISE_USER_BUDGETS]      TINYINT      DEFAULT ((0)) NULL,
    [UPG_AUTHORISE_ALL]            TINYINT      DEFAULT ((0)) NULL,
    [UPG_CHECK_BUDGET_VALUES]      TINYINT      DEFAULT ((0)) NULL,
    [UPG_DELIVER_ALLOC_STOCK]      TINYINT      DEFAULT ((0)) NULL,
    [UPG_NO_STOCK_ANALYSIS]        TINYINT      DEFAULT ((0)) NULL,
    [UPG_CC_WRITE_OFF_LIMIT]       FLOAT (53)   DEFAULT ((0)) NULL,
    [UPG_CHASE_DEBT_OWN_CUST]      TINYINT      DEFAULT ((1)) NULL,
    [UPG_RESTRICT_SORT_KEY_USE]    BIT          DEFAULT ((0)) NULL,
    [UPG_POP_STATUS_DEFAULT_LINK]  INT          NOT NULL,
    [UPG_POP_STATUS_LEVEL]         TINYINT      NOT NULL,
    [UPG_HIDE_STOCK_COST_PRICE]    BIT          DEFAULT ((0)) NOT NULL,
    [UPG_HIDE_STOCK_VALUE]         BIT          DEFAULT ((0)) NOT NULL,
    [UPG_HIDE_RESOURCE_COST_PRICE] BIT          DEFAULT ((0)) NOT NULL,
    [UPG_DEFAULT_SA_OUTBOUND]      VARCHAR (25) NULL,
    [UPG_DEFAULT_SA_INBOUND]       VARCHAR (25) NULL,
    CONSTRAINT [UPG_PRIMARY_PK] PRIMARY KEY CLUSTERED ([UPG_PRIMARY] ASC),
    CONSTRAINT [UPG_POP_STATUS_LEVEL_CK] CHECK ([UPG_POP_STATUS_LEVEL]>=(0) AND [UPG_POP_STATUS_LEVEL]<=(99)),
    CONSTRAINT [UPG_POP_STATUS_DEFAULT_LINK_FK] FOREIGN KEY ([UPG_POP_STATUS_DEFAULT_LINK]) REFERENCES [dbo].[POP_ORDER_STATUS] ([POS_PRIMARY])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UPG_CODE]
    ON [dbo].[SYS_USER_PROFILE_GLOBAL]([UPG_CODE] ASC);


﻿CREATE TABLE [dbo].[SYS_USER] (
    [USER_ID]                    VARCHAR (4)    NULL,
    [USER_NAME]                  VARCHAR (25)   NULL,
    [USER_PASSWORD]              VARCHAR (10)   NULL,
    [USER_MASTER]                TINYINT        DEFAULT ((0)) NULL,
    [USER_STARTUP_OP]            TINYINT        DEFAULT ((0)) NULL,
    [USER_START_MOD]             TINYINT        DEFAULT ((0)) NULL,
    [USER_LANGUAGE]              VARCHAR (10)   NULL,
    [USER_ACTIVE]                TINYINT        DEFAULT ((0)) NULL,
    [DATE_IN]                    DATETIME       NULL,
    [TIME_IN]                    DATETIME       NULL,
    [TIME_OUT]                   DATETIME       NULL,
    [POST_TO_NEXT_CST]           TINYINT        DEFAULT ((0)) NULL,
    [POST_UPTO_CST]              TINYINT        DEFAULT ((0)) NULL,
    [USER_ALLOC_AC_S]            VARCHAR (10)   NULL,
    [USER_ALLOC_AC_P]            VARCHAR (10)   NULL,
    [POST_TO_NEXT_NL]            TINYINT        DEFAULT ((0)) NULL,
    [POST_TO_NEXT_PL]            TINYINT        DEFAULT ((0)) NULL,
    [POST_TO_NEXT_SL]            TINYINT        DEFAULT ((0)) NULL,
    [USER_BATCHING]              VARCHAR (1)    NULL,
    [USER_PRINTING]              VARCHAR (1)    NULL,
    [POST_TO_NEXT_SOP]           TINYINT        DEFAULT ((0)) NULL,
    [POST_TO_NEXT_POP]           TINYINT        DEFAULT ((0)) NULL,
    [POST_TO_NEXT_STK]           TINYINT        DEFAULT ((0)) NULL,
    [POST_UPTO_STK]              TINYINT        DEFAULT ((0)) NULL,
    [POST_UPTO_NL]               TINYINT        DEFAULT ((0)) NULL,
    [POST_UPTO_PL]               TINYINT        DEFAULT ((0)) NULL,
    [POST_UPTO_SL]               TINYINT        DEFAULT ((0)) NULL,
    [POST_UPTO_SOP]              TINYINT        DEFAULT ((0)) NULL,
    [POST_UPTO_POP]              TINYINT        DEFAULT ((0)) NULL,
    [WINDOW_POSITION]            FLOAT (53)     DEFAULT ((0)) NULL,
    [STAGGER_HEIGHT]             FLOAT (53)     DEFAULT ((0)) NULL,
    [STAGGER_WIDTH]              FLOAT (53)     DEFAULT ((0)) NULL,
    [USER_RPT]                   TINYINT        DEFAULT ((0)) NULL,
    [USER_OPTS_SAVED]            TINYINT        DEFAULT ((0)) NULL,
    [USER_SL_FUTURE]             TINYINT        DEFAULT ((0)) NULL,
    [USER_PL_FUTURE]             TINYINT        DEFAULT ((0)) NULL,
    [USER_NL_FUTURE]             TINYINT        DEFAULT ((0)) NULL,
    [USER_OPTION30]              TINYINT        DEFAULT ((0)) NULL,
    [USER_STK_FUTURE]            TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_FUTURE]            TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_FUTURE]            TINYINT        DEFAULT ((0)) NULL,
    [USER_CST_FUTURE]            TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP1]             TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP2]             TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP3]             TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP4]             TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP5]             TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP6]             TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP7]             TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP8]             TINYINT        DEFAULT ((0)) NULL,
    [USER_SOP_B_OP9]             TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_B_OP1]             TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_B_OP2]             TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_B_OP3]             TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_B_OP4]             TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_B_OP5]             TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_B_OP6]             TINYINT        DEFAULT ((0)) NULL,
    [USR_PRIMARY]                FLOAT (53)     NOT NULL,
    [USER_CB_POPUPALLOC]         TINYINT        DEFAULT ((0)) NULL,
    [USER_CB_TABUPDATE]          TINYINT        DEFAULT ((0)) NULL,
    [USER_CB_VALUEENTRY]         TINYINT        DEFAULT ((0)) NULL,
    [USER_CB_BYPASSCOST]         TINYINT        DEFAULT ((0)) NULL,
    [USR_CHG_PASWD_DATE]         DATETIME       NULL,
    [USER_TAB_DEFAULT]           VARCHAR (11)   NULL,
    [USER_POP_BUDGET_LINE]       FLOAT (53)     DEFAULT ((0)) NULL,
    [USER_ORDER_BUDGET]          FLOAT (53)     DEFAULT ((0)) NULL,
    [USER_CURRENT_BUDGET]        FLOAT (53)     DEFAULT ((0)) NULL,
    [USER_PREVIOUS_BUDGET]       FLOAT (53)     DEFAULT ((0)) NULL,
    [USER_EXCEED_OTHER_NL]       TINYINT        DEFAULT ((0)) NULL,
    [USER_AUTHORISE_OWN]         TINYINT        DEFAULT ((0)) NULL,
    [USER_NL_BUDGET]             TINYINT        DEFAULT ((0)) NULL,
    [USER_CST_BUDGET]            TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_BUDGET]            TINYINT        DEFAULT ((0)) NULL,
    [USER_POP_SHOW_MESSAGE]      TINYINT        DEFAULT ((0)) NULL,
    [USER_INVREG_APPROVER1]      TINYINT        DEFAULT ((0)) NULL,
    [USER_INVREG_APPROVER2]      TINYINT        DEFAULT ((0)) NULL,
    [USER_INVREG_APPROVER3]      TINYINT        DEFAULT ((0)) NULL,
    [USER_INVREG_OVERIDE]        TINYINT        DEFAULT ((0)) NULL,
    [USER_EM_NAME]               VARCHAR (128)  NULL,
    [USER_EM_ADDRESS]            VARCHAR (128)  NULL,
    [USER_PROFILE_CODE]          VARCHAR (10)   NULL,
    [USER_LEVEL]                 INT            DEFAULT ((0)) NULL,
    [USER_GROUP]                 VARCHAR (10)   NULL,
    [USER_PASSWORD_DATE]         DATETIME       NULL,
    [USER_NUMBER_LOGONS]         INT            DEFAULT ((0)) NULL,
    [USER_PUTIN]                 VARCHAR (4)    NULL,
    [USER_DATE_PUTIN]            DATETIME       NULL,
    [USER_EDITED]                VARCHAR (4)    NULL,
    [USER_DATE_EDITED]           DATETIME       NULL,
    [USER_SRV_HEADER_KEY]        VARCHAR (20)   NULL,
    [USER_SRV_ACTION]            VARCHAR (20)   NULL,
    [SYS_ACD_USERNAME]           VARCHAR (30)   NULL,
    [SYS_ACD_PASSWORD]           VARCHAR (30)   NULL,
    [SYS_ACD_SESSION]            VARCHAR (30)   NULL,
    [SYS_ACD_USE_DEFAULTS]       TINYINT        DEFAULT ((0)) NULL,
    [USER_ENABLED_SP]            TINYINT        DEFAULT ((0)) NULL,
    [USER_SERVICEPACK_PATH]      VARCHAR (255)  NULL,
    [USER_HTMLHELP_PATH]         VARCHAR (255)  NULL,
    [USER_CRYSTALREPS_PATH]      VARCHAR (255)  NULL,
    [USER_USER_TOOLBAR]          TINYINT        DEFAULT ((0)) NULL,
    [USER_SYS_MENU_STYLE]        TINYINT        DEFAULT ((0)) NULL,
    [USER_EXTERNALDOCS_PATH]     VARCHAR (255)  NULL,
    [USER_BUDGET_GROUP]          VARCHAR (20)   NULL,
    [USER_AUTHORISE_ORDERS]      TINYINT        DEFAULT ((0)) NULL,
    [USER_AUTHORISE_TYPE]        TINYINT        DEFAULT ((0)) NULL,
    [USER_AUTHORISE_ALL]         TINYINT        DEFAULT ((0)) NULL,
    [USER_CHECK_BUDGET_VALUES]   TINYINT        DEFAULT ((0)) NULL,
    [USER_FAX_USE_PRINT_DRIVER]  TINYINT        DEFAULT ((0)) NULL,
    [USER_FAX_PRINT_DRIVER]      VARCHAR (255)  NULL,
    [USER_FAX_SOFTWARE_LINK]     INT            DEFAULT ((0)) NULL,
    [USER_FAX_USE_USER_SETTINGS] TINYINT        DEFAULT ((0)) NULL,
    [USER_FAX_COVERPAGE]         VARCHAR (255)  NULL,
    [USER_DOMAIN]                VARCHAR (100)  NULL,
    [USER_DESCRIPTION]           VARCHAR (40)   NULL,
    [USER_START_WINDOW]          INT            DEFAULT ((0)) NULL,
    [USER_XACTIVE]               TINYINT        DEFAULT ((0)) NULL,
    [USER_CRM_ACTIVE]            TINYINT        DEFAULT ((0)) NULL,
    [USER_EDI_PATH]              VARCHAR (255)  NULL,
    [USER_CRM_SCREEN_LAYOUT]     VARCHAR (20)   NULL,
    [USER_ACD_DOCUMENTS_PATH]    VARCHAR (255)  NULL,
    [USER_NAVIGATOR_OPTIONS]     VARCHAR (100)  NULL,
    [USER_SHOW_BROWSER]          BIT            DEFAULT ((0)) NULL,
    [USER_BROWSER_URL]           VARCHAR (255)  NULL,
    [USER_BROWSER_OPTION]        TINYINT        DEFAULT ((0)) NULL,
    [USER_DASHBOARD_PATH]        VARCHAR (255)  NULL,
    [USER_SPID]                  INT            NULL,
    [USER_DMS_USERNAME]          VARCHAR (200)  NULL,
    [USER_DMS_PASSWORD]          NVARCHAR (400) NULL,
    [USER_DMS_USERID]            VARCHAR (4)    NULL,
    [USER_DMS_PRINT_BARCODE]     BIT            DEFAULT ((0)) NOT NULL,
    [USER_DMS_WIN_AUTH]          BIT            DEFAULT ((0)) NOT NULL,
    [USER_EM_MAPI_PASSWORD]      VARCHAR (20)   NULL,
    [USER_EM_MAPI_PROFILE_NAME]  VARCHAR (128)  NULL,
    [USER_LOCKED]                BIT            DEFAULT ((0)) NOT NULL,
    [USER_WFF_ADMINISTRATOR]     BIT            DEFAULT ((0)) NOT NULL,
    [USER_EM_BCC_ADDRESS]        VARCHAR (128)  NULL,
    [USER_EM_COPY_TO_BCC]        BIT            DEFAULT ((0)) NOT NULL,
    [USER_EM_SMTP_USER_LINK]     INT            NULL,
    [USER_EM_MODE]               TINYINT        DEFAULT ((0)) NOT NULL,
    [USER_ACLOUD]                BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [USR_PRIMARY_PK] PRIMARY KEY CLUSTERED ([USR_PRIMARY] ASC),
    CONSTRAINT [USER_EM_SMTP_USER_LINK_FK] FOREIGN KEY ([USER_EM_SMTP_USER_LINK]) REFERENCES [dbo].[SYS_SMTP_USERS] ([SMTP_USER_PRIMARY]) ON DELETE SET NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [USER_ID]
    ON [dbo].[SYS_USER]([USER_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [USER_EM_SMTP_USER_LINK]
    ON [dbo].[SYS_USER]([USER_EM_SMTP_USER_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE TRIGGER [dbo].[aa_user_dt]
    ON [dbo].[SYS_USER]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

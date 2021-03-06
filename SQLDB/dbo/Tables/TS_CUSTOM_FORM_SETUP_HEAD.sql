﻿CREATE TABLE [dbo].[TS_CUSTOM_FORM_SETUP_HEAD] (
    [CFSH_PRIMARY]                           FLOAT (53)       NOT NULL,
    [CFSH_NAME]                              VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_ACTIVE]                            FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [CFSH_OWN_MENU]                          TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SEQ_CODE]                          VARCHAR (50)     NULL,
    [CFSH_TABLE_NAME]                        VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_VIEW_NAME]                         VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_R1]                                TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_R2]                                TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_R3]                                TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_CODE]                              VARCHAR (20)     DEFAULT ('') NOT NULL,
    [CFSH_POSTING_TYPE]                      TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_POST_SP_NAME]                      VARCHAR (100)    DEFAULT ('') NOT NULL,
    [CFSH_SHOW_ON_JC]                        TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_PK_NAME]                           VARCHAR (40)     DEFAULT ('') NOT NULL,
    [CFSH_SHOW_PK_ON_FORM]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SHOW_PK_ON_VIEW]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_DO_NOT_REBUILD_VIEW]               TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_APPROVAL_USER_INFO_VIEW_NAME]      VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_APPROVAL_RECORD_INFO_VIEW_NAME]    VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_API_TYPE]                          TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_DO_NOT_FLAG_AS_POSTED]             TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_IGN_POSTED_RECS_ON_MASTER_DL]      TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SHOW_REC_STATUS]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_ALLOW_REOPEN]                      TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_GET_STATUS_FROM_REC_VIEW]          TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_STATUS_COLUMN_NAME]                VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_ALLOW_PRINTING]                    TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_CR_PATH]                           VARCHAR (100)    DEFAULT ('') NOT NULL,
    [CFSH_TYPE]                              TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_HIDE_SAVE_BTN]                     TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SAVE_BTN_NAME]                     VARCHAR (30)     DEFAULT ('') NOT NULL,
    [CFSH_POST_BTN_NAME]                     VARCHAR (30)     DEFAULT ('') NOT NULL,
    [CFSH_DONT_CLOSE_ON_SAVE]                TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SHOW_ON_JCOM]                      TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_HR_FORM_TYPE]                      TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_POSTING_NO_TRAN]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_HR_MODULE]                         TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_IS_MAIN_HR_FORM]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_INSERT_EDIT_DATE]                  DATETIME         NULL,
    [CFSH_VALIDATION_TYPE]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_VALIDATION_SP_NAME]                VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_CALL_SP_ON_SAVE]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SAVE_SP_NAME]                      VARCHAR (100)    DEFAULT ('') NOT NULL,
    [CFSH_PROMPT_FOR_DUPLICATE_QTY]          TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_CALL_SP_ON_DUPLICATE]              TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_DUPLICATE_SP_NAME]                 VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_DUPLICATE_BTN_NAME]                VARCHAR (30)     DEFAULT ('') NOT NULL,
    [CFSH_VIEW_GROUP_TYPE]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_VIEW_GRP_PARENT_COL]               VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_VIEW_GRP_CHILD_COL]                VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_VIEW_GRP_NAME_COL]                 VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_VIEW_GRP_ORDER_COL]                VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_VIEW_GROUPING]                     VARCHAR (300)    DEFAULT ('') NOT NULL,
    [CFSH_FORM_HEIGHT_TYPE]                  TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_FORM_HEIGHT]                       FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [CFSH_FORM_WIDTH_TYPE]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_FORM_WIDTH]                        FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [CFSH_TOP_SECTION_HEIGHT_TYPE]           TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_TOP_SECTION_HEIGHT]                FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [CFSH_STATUS_TYPE]                       TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_PREFIX]                            VARCHAR (20)     DEFAULT ('') NOT NULL,
    [CFSH_UNIQUE_CODE]                       VARCHAR (25)     DEFAULT ('') NOT NULL,
    [CFSH_SHOW_BANNER]                       TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_ICON_NAME]                         VARCHAR (255)    DEFAULT ('') NOT NULL,
    [CFSH_ALLOW_EMAIL]                       TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_EMAIL_COLUMN_NAME]                 VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_DONT_DISABLE_APPROVED]             TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_DEFAULT_MENU_STATUS]               TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SHOW_STAGES_IN_MENU]               TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_ICON]                              IMAGE            NULL,
    [CFSH_SAVE_USER_LIST_POS]                TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_BATCH_PROCESS]                     TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SINGLETON]                         TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_WINDOW_MODE]                       TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_APPROVAL_SKIP_IF_ALREADY_APPROVED] TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SYSTEM]                            TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_MASTER]                            TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_MASTER_LINK]                       VARCHAR (25)     DEFAULT ('') NOT NULL,
    [CFSH_DL_CALL_SP_ON_LOAD]                TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_DL_SP_NAME]                        VARCHAR (100)    DEFAULT ('') NOT NULL,
    [CFSH_CALL_SP_ON_DELETE]                 TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_DELETE_SP_NAME]                    VARCHAR (100)    DEFAULT ('') NOT NULL,
    [CFSH_CALL_DELETE_SP_INSTEAD]            TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_TABLE_NAME2]                       VARCHAR (100)    DEFAULT ('') NOT NULL,
    [CFSH_MENU_PARENT_NODE_KEY]              VARCHAR (50)     DEFAULT ('') NOT NULL,
    [CFSH_DISABLE_DELETE]                    TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_DISABLE_DUPLICATE]                 TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SHOW_CHILD_RECS]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_SINGLE_TAB_MODE]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_OWN_APPROVAL_MENU]                 TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_GUID]                              UNIQUEIDENTIFIER NULL,
    [CFSH_DEFAULT_VIEW]                      TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_ALLOW_GROUPING]                    TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_FEATURE_LEVEL]                     TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_ENABLE_FILTER]                     TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_FILTER_LIST_ROWS]                  FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [CFSH_DO_NOT_AUTO_LOAD]                  TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_TURN_OFF_AUTO_KEY_FIELDS]          TINYINT          DEFAULT ((0)) NOT NULL,
    [CFSH_FORCE_LIST_REFRESH]                TINYINT          DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([CFSH_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


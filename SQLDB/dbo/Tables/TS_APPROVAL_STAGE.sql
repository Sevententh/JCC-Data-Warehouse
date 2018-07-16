﻿CREATE TABLE [dbo].[TS_APPROVAL_STAGE] (
    [APAS_PRIMARY]                      INT              NOT NULL,
    [APAS_ORDER]                        INT              DEFAULT ((0)) NOT NULL,
    [APAS_NAME]                         VARCHAR (50)     DEFAULT ('') NOT NULL,
    [APAS_APPROVER_TYPE]                TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_RECORD_TYPE]                  VARCHAR (10)     DEFAULT ('') NOT NULL,
    [APAS_RECORD_LINK]                  FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [APAS_ON_APPROVE_GOTO_TYPE]         TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ON_APPROVE_GOTO]              INT              DEFAULT ((0)) NOT NULL,
    [APAS_DEFAULT_APPROVER_USERID]      VARCHAR (100)    DEFAULT ('') NULL,
    [APAS_PROJECT_LINK]                 TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ALLOW_EDIT]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_USE_BANDS]                    TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_DEFAULT_TO_PM]                TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ON_REJECT]                    TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ENABLED]                      TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_CANNOT_APPROVE_OWN]           TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ON_APPROVE_GOTO_STEP]         INT              DEFAULT ((0)) NOT NULL,
    [APAS_APP_VIEW_COL_NAME]            VARCHAR (50)     DEFAULT ('') NOT NULL,
    [APAS_ON_APPROVE_CALL_SP]           TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ON_APPROVE_SP_NAME]           VARCHAR (100)    DEFAULT ('') NOT NULL,
    [APAS_ON_REJECT_CALL_SP]            TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ON_REJECT_SP_NAME]            VARCHAR (100)    DEFAULT ('') NOT NULL,
    [APAS_APPROVAL_LIST_VIEW_NAME]      VARCHAR (100)    DEFAULT ('') NOT NULL,
    [APAS_ON_REJECT_GOTO_STEP]          INT              DEFAULT ((0)) NOT NULL,
    [APAS_ON_REJECT_GOTO]               FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [APAS_USE_JOB_COSTING_LINKS]        TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_APPROVE_TEXT]                 VARCHAR (50)     DEFAULT ('') NOT NULL,
    [APAS_REJECT_TEXT]                  VARCHAR (50)     DEFAULT ('') NOT NULL,
    [APAS_REDIRECT_TEXT]                VARCHAR (50)     DEFAULT ('') NOT NULL,
    [APAS_ALLOW_APPROVE]                TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ALLOW_REJECT]                 TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ALLOW_REDIRECT]               TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ALLOW_UNSUBMIT]               TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_UNSUBMIT_TEXT]                VARCHAR (50)     DEFAULT ('') NOT NULL,
    [APAS_ON_REJECT_EVAL_PRESR]         TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_PRINT_REQ]                    TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_CR_PRINT_PATH]                VARCHAR (255)    DEFAULT ('') NOT NULL,
    [APAS_ALLOW_REROUTE]                TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ON_REROUTE_GOTO_STEP]         INT              DEFAULT ((0)) NOT NULL,
    [APAS_ALLOW_NOTES_EDIT]             TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ON_REROUTE_GOTO]              FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [APAS_REQUIRED_APPROVER_COUNT]      INT              DEFAULT ((0)) NOT NULL,
    [APAS_ALLOW_PRINT]                  TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_APPLY_RULES_TO_ORIG_APPROVER] TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_REDIRECT_TO_ALL]              TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_ALLOW_COSTING_EDIT]           TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_DISABLE_VALUES_FROM_SP]       TINYINT          DEFAULT ((0)) NOT NULL,
    [APAS_GUID]                         UNIQUEIDENTIFIER NULL,
    [APAS_HIDE_APPROVERS_FROM_MESSAGE]  TINYINT          DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([APAS_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);

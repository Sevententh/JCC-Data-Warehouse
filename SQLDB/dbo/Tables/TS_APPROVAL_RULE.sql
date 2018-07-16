﻿CREATE TABLE [dbo].[TS_APPROVAL_RULE] (
    [APAR_PRIMARY]                              INT              NOT NULL,
    [APAR_APAS_PRIMARY]                         INT              DEFAULT ((0)) NOT NULL,
    [APAR_ORDER]                                INT              DEFAULT ((0)) NOT NULL,
    [APAR_NAME]                                 VARCHAR (50)     DEFAULT ('') NOT NULL,
    [APAR_EVALUTION_STAGE]                      TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_EXPRESSION]                           VARCHAR (2000)   DEFAULT ('') NOT NULL,
    [APAR_IF_TRUE_GOTO_TYPE]                    TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_IF_TRUE_GOTO]                         INT              DEFAULT ((0)) NOT NULL,
    [APAR_IF_TRUE_SHOW_MESSAGE]                 TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_IF_TRUE_ALLOW_CANCEL]                 TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_IF_TRUE_MESSAGE]                      VARCHAR (1000)   DEFAULT ('') NOT NULL,
    [APAR_IF_FALSE_GOTO_TYPE]                   TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_IF_FALSE_GOTO]                        INT              DEFAULT ((0)) NOT NULL,
    [APAR_IF_FALSE_SHOW_MESSAGE]                TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_IF_FALSE_ALLOW_CANCEL]                TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_IF_FALSE_MESSAGE]                     VARCHAR (2000)   DEFAULT ('') NOT NULL,
    [APAR_ENABLED]                              TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_IF_TRUE_GOTO_STEP]                    FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [APAR_IF_FALSE_GOTO_STEP]                   FLOAT (53)       DEFAULT ((0)) NOT NULL,
    [APAR_IF_TRUE_EVALUATE_TARGET_STAGE_RULES]  TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_IF_FALSE_EVALUATE_TARGET_STAGE_RULES] TINYINT          DEFAULT ((0)) NOT NULL,
    [APAR_GUID]                                 UNIQUEIDENTIFIER NULL,
    PRIMARY KEY CLUSTERED ([APAR_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


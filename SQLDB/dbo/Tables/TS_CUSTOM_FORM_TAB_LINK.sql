﻿CREATE TABLE [dbo].[TS_CUSTOM_FORM_TAB_LINK] (
    [CTLK_PRIMARY]      FLOAT (53)   NOT NULL,
    [CTLK_RECORD_LINK]  FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [CTLK_CFSH_PRIMARY] FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [CTLK_TAB_POSITION] FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [CTLK_TAB_NAME]     VARCHAR (30) DEFAULT ('') NOT NULL,
    [CTLK_RECORD_TYPE]  VARCHAR (10) DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([CTLK_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);

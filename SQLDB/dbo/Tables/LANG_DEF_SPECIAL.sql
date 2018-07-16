﻿CREATE TABLE [dbo].[LANG_DEF_SPECIAL] (
    [LANGCODE_DEFS]    VARCHAR (10) NOT NULL,
    [WARRANTY_DATASET] VARCHAR (20) NULL,
    [WARRANTY_MATRIX]  VARCHAR (20) NULL,
    [WARRANTY]         VARCHAR (20) NULL,
    [WARRANTY_TRACKED] VARCHAR (20) NULL,
    CONSTRAINT [LANGCODE_DEFS_PK] PRIMARY KEY CLUSTERED ([LANGCODE_DEFS] ASC)
);

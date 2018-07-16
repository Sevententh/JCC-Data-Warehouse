﻿CREATE TABLE [dbo].[SYS_SEQCONTRL] (
    [CTL_TABLE]      VARCHAR (128) NULL,
    [CTL_SEQ_NUMBER] FLOAT (53)    DEFAULT ((0)) NULL,
    [CTL_SEQ_NAME]   VARCHAR (128) NOT NULL,
    CONSTRAINT [CTL_SEQ_NAME_PK] PRIMARY KEY CLUSTERED ([CTL_SEQ_NAME] ASC) WITH (FILLFACTOR = 70)
);

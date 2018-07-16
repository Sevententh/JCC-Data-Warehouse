﻿CREATE TABLE [dbo].[CST_ALLOC_HISTORY_HEADER] (
    [CAH_PRIMARY]      INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CAH_ALLOC_DATE]   DATETIME     NULL,
    [CAH_ALLOC_USER]   VARCHAR (4)  NULL,
    [CAH_YEAR_LINK]    SMALLINT     NULL,
    [CAH_PERIOD]       TINYINT      NULL,
    [CAH_REFERENCE]    VARCHAR (10) NULL,
    [CAH_PROJECT_LINK] INT          NULL,
    CONSTRAINT [CAH_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CAH_PRIMARY] ASC)
);


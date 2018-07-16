﻿CREATE TABLE [dbo].[SYS_DD_REASON_CODES] (
    [DDRC_PRIMARY]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DDRC_TYPE]        VARCHAR (1)   NOT NULL,
    [DDRC_CODE]        VARCHAR (10)  NOT NULL,
    [DDRC_DESCRIPTION] VARCHAR (100) NOT NULL,
    CONSTRAINT [DDRC_PRIMARY_PK] PRIMARY KEY CLUSTERED ([DDRC_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);

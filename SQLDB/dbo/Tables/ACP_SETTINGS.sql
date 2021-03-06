﻿CREATE TABLE [dbo].[ACP_SETTINGS] (
    [ACP_SETT_PRIMARY]           INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ACP_SETT_ORGANISATION_GUID] VARCHAR (100) NULL,
    [ACP_SETT_DATABASE_GUID]     VARCHAR (100) NULL,
    [ACP_SETT_URL_LINK]          INT           NULL,
    CONSTRAINT [ACP_SETT_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ACP_SETT_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


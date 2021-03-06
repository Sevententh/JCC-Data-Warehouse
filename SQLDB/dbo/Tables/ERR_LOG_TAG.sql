﻿CREATE TABLE [dbo].[ERR_LOG_TAG] (
    [ELT_PRIMARY]             INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ELT_DESTINATION_DATASET] VARCHAR (128) NULL,
    [ELT_WORKSTATION_NAME]    VARCHAR (255) NULL,
    CONSTRAINT [ELT_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ELT_PRIMARY] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ERR_LOG_TAG_CI]
    ON [dbo].[ERR_LOG_TAG]([ELT_DESTINATION_DATASET] ASC, [ELT_WORKSTATION_NAME] ASC);


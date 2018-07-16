﻿CREATE TABLE [dbo].[SYS_SERVICE_PACK_SRV] (
    [SSP_PRIMARY]        INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SSP_TYPE]           VARCHAR (1)   NULL,
    [SSP_NAME]           VARCHAR (50)  NULL,
    [SSP_VERSION]        FLOAT (53)    DEFAULT ((0)) NULL,
    [SSP_SUB_DIRECTORY]  VARCHAR (255) NULL,
    [SSP_DATA]           TEXT          NULL,
    [SSP_DB]             VARCHAR (2)   NULL,
    [SSP_LAST_AMENDED]   VARCHAR (20)  NULL,
    [SSP_LA_DATE]        DATETIME      NULL,
    [SSP_HOTFIX_VERSION] INT           DEFAULT ((0)) NULL,
    [SSP_DESTINATION]    TINYINT       DEFAULT ((0)) NULL,
    CONSTRAINT [SSP_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SSP_PRIMARY] ASC)
);

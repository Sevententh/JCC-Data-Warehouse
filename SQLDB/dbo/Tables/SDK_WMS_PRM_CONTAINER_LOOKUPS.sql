﻿CREATE TABLE [dbo].[SDK_WMS_PRM_CONTAINER_LOOKUPS] (
    [WMPCL_PRIMARY]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [WMPCL_TYPE]        VARCHAR (10)  NOT NULL,
    [WMPCL_CODE]        VARCHAR (25)  NOT NULL,
    [WMPCL_DESCRIPTION] VARCHAR (100) NULL,
    CONSTRAINT [SDK_WMS_PRM_CONTAINER_LOOKUPS_PK] PRIMARY KEY CLUSTERED ([WMPCL_TYPE] ASC, [WMPCL_CODE] ASC) WITH (FILLFACTOR = 70)
);


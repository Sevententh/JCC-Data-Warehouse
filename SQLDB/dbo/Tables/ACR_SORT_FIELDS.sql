﻿CREATE TABLE [dbo].[ACR_SORT_FIELDS] (
    [ACR_SORT_FLD_PRIMARY]    INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ACR_SORT_FLD_SORT_LINK]  INT          DEFAULT ((0)) NULL,
    [ACR_SORT_FLD_FIELD_NAME] VARCHAR (64) NULL,
    [ACR_SORT_FLD_DESCENDING] TINYINT      DEFAULT ((0)) NULL,
    [ACR_SORT_FLD_GROUP]      TINYINT      DEFAULT ((0)) NULL,
    [ACR_SORT_FLD_NEW_PAGE]   TINYINT      DEFAULT ((0)) NULL,
    CONSTRAINT [ACR_SORT_FLD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ACR_SORT_FLD_PRIMARY] ASC)
);


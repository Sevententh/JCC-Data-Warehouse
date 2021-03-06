﻿CREATE TABLE [dbo].[NL_MAJHEAD_TEMP] (
    [NLMH_ID]             INT          NOT NULL,
    [NLMH_LINE_NO]        INT          NOT NULL,
    [NLMH_ACTION]         VARCHAR (1)  NULL,
    [NLMH_SOURCE]         VARCHAR (1)  NULL,
    [NLMH_DEFAULT_STRING] VARCHAR (20) NULL,
    [NLMH_MAJHEAD_CODE]   TINYINT      NULL,
    [NLMH_MAJHEAD_NAME]   VARCHAR (40) NULL,
    [NLMH_TYPE]           VARCHAR (1)  NULL,
    [NLMH_SORT_CODE]      INT          NULL,
    [NLMH_STATUS]         TINYINT      NULL,
    CONSTRAINT [NL_MAJHEAD_TEMP_PK] PRIMARY KEY CLUSTERED ([NLMH_ID] ASC, [NLMH_LINE_NO] ASC)
);


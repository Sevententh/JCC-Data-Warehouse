CREATE TABLE [dbo].[SYS_RIBBON_CHANGES] (
    [RBN_PRIMARY]           INT              IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [RBN_USERID]            VARCHAR (4)      NOT NULL,
    [RBN_ACTION]            VARCHAR (1)      NOT NULL,
    [RBN_CUSTOM_TYPE]       VARCHAR (1)      NULL,
    [RBN_NAME]              VARCHAR (100)    NULL,
    [RBN_TAB_NUMBER]        INT              NULL,
    [RBN_GROUP_ID]          INT              NULL,
    [RBN_FEATURE_TYPE]      VARCHAR (1)      NULL,
    [RBN_TOOLTIP]           VARCHAR (200)    NULL,
    [RBN_ICONID]            INT              NULL,
    [RBN_URL_EXE]           VARCHAR (255)    NULL,
    [RBN_USERNAME]          VARCHAR (40)     NULL,
    [RBN_PASSWORD]          VARCHAR (40)     NULL,
    [RBN_CHART_ID]          INT              NULL,
    [RBN_CHART_QUERY]       VARCHAR (500)    NULL,
    [RBN_MAXIMISED]         BIT              DEFAULT ((0)) NOT NULL,
    [RBN_EMBEDDED]          BIT              DEFAULT ((0)) NOT NULL,
    [RBN_GUID]              UNIQUEIDENTIFIER NULL,
    [RBN_PARENT_GUID]       UNIQUEIDENTIFIER NULL,
    [RBN_INSERT_AFTER_GUID] UNIQUEIDENTIFIER NULL,
    CONSTRAINT [RBN_PRIMARY_PK] PRIMARY KEY CLUSTERED ([RBN_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


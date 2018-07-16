CREATE TABLE [dbo].[CST_MILESTONES_TEMP] (
    [MST_GUID]            UNIQUEIDENTIFIER NOT NULL,
    [MST_SEQUENCE]        BIGINT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [MST_STATUS]          TINYINT          NULL,
    [MST_MILESTONE_LINK]  INT              NULL,
    [MST_PROJECT_LINK]    INT              NULL,
    [MST_DESCRIPTION]     VARCHAR (40)     NULL,
    [MST_DATE]            DATETIME         NULL,
    [MST_PERCENTAGE]      FLOAT (53)       NULL,
    [MST_VALUE]           FLOAT (53)       NULL,
    [MST_WIP_CENTRE_LINK] INT              NULL,
    [MST_COMPLETED]       BIT              DEFAULT ((0)) NOT NULL,
    [MST_COSTS]           FLOAT (53)       NULL,
    [MST_INVOICED]        FLOAT (53)       NULL,
    [MST_RETAINED]        FLOAT (53)       NULL,
    [MST_DELETE_FLAG]     BIT              NULL,
    [MST_DEFAULT_STRING]  VARCHAR (20)     NULL,
    CONSTRAINT [MST_PRIMARY_PK] PRIMARY KEY CLUSTERED ([MST_GUID] ASC, [MST_SEQUENCE] ASC)
);


CREATE TABLE [dbo].[ERR_LOG_DETAIL] (
    [ELD_PRIMARY]              INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ELD_CODE]                 INT           DEFAULT ((0)) NULL,
    [ELD_NAME]                 VARCHAR (128) NULL,
    [ELD_SEVERITY]             INT           DEFAULT ((0)) NULL,
    [ELD_VERBOSENESS]          INT           DEFAULT ((0)) NULL,
    [ELD_CATEGORY_LANG_LBL]    VARCHAR (128) NULL,
    [ELD_DESCRIPTION_LANG_LBL] VARCHAR (128) NULL,
    [ELD_OUTCOME_LANG_LBL]     VARCHAR (128) NULL,
    [ELD_EXTRA_INFO]           TEXT          NULL,
    [ELD_DETAIL_LINE_NO]       INT           DEFAULT ((0)) NULL,
    [ELD_DETAIL_LINK]          INT           DEFAULT ((0)) NULL,
    [ELD_DATETIME]             DATETIME      NULL,
    [ELD_SEQUENCE_NO]          INT           DEFAULT ((0)) NULL,
    CONSTRAINT [ELD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ELD_PRIMARY] ASC)
);


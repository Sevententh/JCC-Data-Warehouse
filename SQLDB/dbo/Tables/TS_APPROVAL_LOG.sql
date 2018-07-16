CREATE TABLE [dbo].[TS_APPROVAL_LOG] (
    [APAL_PRIMARY]                     INT            NOT NULL,
    [APAL_RECORD_TYPE]                 VARCHAR (20)   DEFAULT ('') NOT NULL,
    [APAL_RECORD_LINK]                 INT            DEFAULT ((0)) NOT NULL,
    [APAL_APAS_PRIMARY]                INT            DEFAULT ((0)) NOT NULL,
    [APAL_INSERTED_DATE]               DATETIME       NULL,
    [APAL_CURRENT]                     TINYINT        DEFAULT ((0)) NOT NULL,
    [APAL_PREV_ACTION]                 TINYINT        DEFAULT ((0)) NOT NULL,
    [APAL_PREV_ACTION_USERID]          VARCHAR (4)    DEFAULT ('') NOT NULL,
    [APAL_THIS_ACTION]                 TINYINT        DEFAULT ((0)) NOT NULL,
    [APAL_THIS_ACTION_USERID]          VARCHAR (4)    DEFAULT ('') NOT NULL,
    [APAL_ACTIONED_BY_USERID]          VARCHAR (4)    DEFAULT ('') NOT NULL,
    [APAL_ACTIONED_DATE]               DATETIME       NULL,
    [APAL_NOTES]                       VARCHAR (1000) NOT NULL,
    [APAL_STATUS]                      TINYINT        DEFAULT ((0)) NOT NULL,
    [APAL_ORIGINAL_THIS_ACTION_USERID] VARCHAR (4)    DEFAULT ('') NOT NULL,
    [APAL_LINE_REF]                    VARCHAR (40)   DEFAULT ('') NOT NULL,
    PRIMARY KEY CLUSTERED ([APAL_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


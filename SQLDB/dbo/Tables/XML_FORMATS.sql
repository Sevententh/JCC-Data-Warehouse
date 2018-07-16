CREATE TABLE [dbo].[XML_FORMATS] (
    [XF_PRIMARY]            INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [XF_NAME]               VARCHAR (20)  NULL,
    [XF_DOCUMENT]           VARCHAR (6)   NULL,
    [XF_SCHEMA]             VARCHAR (50)  NULL,
    [XF_INCLUDE_STYLESHEET] TINYINT       DEFAULT ((0)) NULL,
    [XF_STYLESHEET]         VARCHAR (50)  NULL,
    [XF_SUBJECT]            VARCHAR (100) NULL,
    [XF_MESSAGE]            TEXT          NULL,
    [XF_ID]                 INT           DEFAULT ((0)) NULL,
    [XF_SYSTEM]             TINYINT       DEFAULT ((0)) NULL,
    [XF_ACTIVE]             TINYINT       DEFAULT ((0)) NULL,
    [XF_TEMPLATE_DATE]      DATETIME      NULL,
    CONSTRAINT [XF_PRIMARY_PK] PRIMARY KEY CLUSTERED ([XF_PRIMARY] ASC)
);


CREATE TABLE [dbo].[SYS_DELETED_TRANSACTIONS] (
    [SDT_ORIGIN]               VARCHAR (3)  NULL,
    [SDT_TRNTYPE]              VARCHAR (3)  NULL,
    [SDT_TRNDATE]              DATETIME     NULL,
    [SDT_ACCOUNT_CODE]         VARCHAR (25) NULL,
    [SDT_DEL_USER]             VARCHAR (4)  NULL,
    [SDT_DEL_DATE]             DATETIME     NOT NULL,
    [SDT_HEADER_AUDIT_NO]      FLOAT (53)   NOT NULL,
    [SDT_DETAIL_AUDIT_NO]      FLOAT (53)   NULL,
    [SDT_COMPLETE_TRANSACTION] BIT          DEFAULT ((0)) NOT NULL,
    [SDT_ACCOUNT_LINK]         FLOAT (53)   NULL,
    [SDT_SOURCE]               VARCHAR (1)  NULL,
    [SDT_HEADER_REF]           VARCHAR (25) NULL,
    [SDT_GROSS]                FLOAT (53)   NULL
);


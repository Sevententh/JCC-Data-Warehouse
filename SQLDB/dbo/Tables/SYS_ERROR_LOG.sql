CREATE TABLE [dbo].[SYS_ERROR_LOG] (
    [ERROR_ID]               VARCHAR (10)     NOT NULL,
    [ERROR_GROUP_NUMBER]     BIGINT           NOT NULL,
    [ERROR_SUB_GROUP_NUMBER] INT              NOT NULL,
    [SP_NAME]                [sysname]        NOT NULL,
    [PARAM0]                 NVARCHAR (100)   NULL,
    [PARAM1]                 NVARCHAR (100)   NULL,
    [PARAM2]                 NVARCHAR (100)   NULL,
    [PARAM3]                 NVARCHAR (100)   NULL,
    [PARAM4]                 NVARCHAR (100)   NULL,
    [SEVERITY]               TINYINT          NOT NULL,
    [CREATED_DATE]           DATETIME         NOT NULL,
    [CREATED_BY]             VARCHAR (4)      NULL,
    [OBJECT_GUID]            UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_SYS_ERROR_LOG] PRIMARY KEY CLUSTERED ([ERROR_GROUP_NUMBER] ASC, [ERROR_SUB_GROUP_NUMBER] ASC)
);


CREATE TABLE [dbo].[CST_TRN_TEMP] (
    [CST_TRAN_ID]                INT           NOT NULL,
    [CST_USE_DEFAULT]            VARCHAR (100) NULL,
    [CST_STATUS_TEMP]            TINYINT       DEFAULT ((0)) NOT NULL,
    [CST_USER_ID]                VARCHAR (5)   NULL,
    [CST_MODULE]                 VARCHAR (3)   NULL,
    [CST_TRAN_STATUS]            CHAR (1)      NULL,
    [CST_TRAN_TYPE]              VARCHAR (3)   NULL,
    [CST_TRAN_REFERENCE]         VARCHAR (10)  NULL,
    [CST_BATCH_REFERENCE]        VARCHAR (10)  NULL,
    [CST_TRAN_DATE]              DATETIME      NULL,
    [CST_WEEK_NO]                TINYINT       NULL,
    [CST_YEAR]                   CHAR (1)      NULL,
    [CST_PERIOD]                 TINYINT       NULL,
    [CST_DESCRIPTION]            VARCHAR (20)  NULL,
    [CST_COSTHEADER]             VARCHAR (10)  NULL,
    [CST_COSTCENTRE]             VARCHAR (10)  NULL,
    [CST_RESOURCE]               VARCHAR (16)  NULL,
    [CST_RESOURCE_LINE]          TINYINT       NULL,
    [CST_CURRENCYCODE]           VARCHAR (4)   NULL,
    [CST_QUANTITY]               FLOAT (53)    NULL,
    [CST_HOME_PRICE]             FLOAT (53)    NULL,
    [CST_CURR_PRICE]             FLOAT (53)    NULL,
    [CST_HOME_VALUE]             FLOAT (53)    NULL,
    [CST_CENTRE_UPLFT_VAL_PRCNT] FLOAT (53)    NULL,
    [CST_CENTRE_UPLIFT_VAL]      FLOAT (53)    NULL,
    [CST_CENTRE_CURR_UPLIFT_VAL] FLOAT (53)    NULL,
    [CST_PAYROLL_PAYTYPE]        VARCHAR (20)  NULL,
    [CST_DETAIL]                 VARCHAR (240) NULL,
    [CST_ARCHIVE_FLAG]           TINYINT       NULL,
    [CST_DO_NOT_BATCH]           TINYINT       NULL,
    [CST_EXCLUDE_RESORCE_FLAG]   TINYINT       NULL,
    [CST_SOURCE]                 VARCHAR (1)   NULL,
    [CST_PRIMARY]                INT           NULL,
    [CST_IDENTITY]               INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CST_DELETE]                 TINYINT       NULL,
    [CST_USER_CHAR1]             VARCHAR (20)  NULL,
    [CST_USER_CHAR2]             VARCHAR (20)  NULL,
    [CST_USER_CHAR3]             VARCHAR (100) NULL,
    [CST_USER_CHAR4]             VARCHAR (100) NULL,
    [CST_USER_FLAG1]             TINYINT       NULL,
    [CST_USER_FLAG2]             TINYINT       NULL,
    [CST_USER_DATE1]             DATETIME      DEFAULT ('') NULL,
    [CST_USER_DATE2]             DATETIME      DEFAULT ('') NULL,
    [CST_USER_NUMBER1]           FLOAT (53)    NULL,
    [CST_USER_NUMBER2]           FLOAT (53)    NULL,
    [CST_ENTER_CURRENCY]         TINYINT       NULL,
    CONSTRAINT [CST_TRN_TEMP_PK] PRIMARY KEY CLUSTERED ([CST_TRAN_ID] ASC, [CST_IDENTITY] ASC)
);


GO
CREATE TRIGGER [dbo].[AA_PROCESS_CST_TRN_TEMP_T]
    ON [dbo].[CST_TRN_TEMP]
    WITH ENCRYPTION
    AFTER UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


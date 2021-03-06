﻿CREATE TABLE [dbo].[ACP_USERS] (
    [ACP_USER_PRIMARY]            INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ACP_USER_CODE]               VARCHAR (20)   NULL,
    [ACP_USER_EMAIL_ADDRESS]      VARCHAR (64)   NULL,
    [ACP_USER_EXCH_RATE_ON_LOGON] BIT            NULL,
    [ACP_USER_INVITED]            BIT            NULL,
    [ACP_USER_SIGNEDUP]           BIT            NULL,
    [ACP_USER_PLATFORM_ID]        VARCHAR (100)  NULL,
    [ACP_USER_TYPE]               TINYINT        NULL,
    [ACP_USER_PLATFORM_TICKET]    VARCHAR (8000) NULL,
    [ACP_USER_ORG_ID]             VARCHAR (100)  NULL,
    [ACP_USER_PLATFORM_NAME]      VARCHAR (500)  NULL,
    [ACP_USER_EXP_CODE]           VARCHAR (10)   NULL,
    CONSTRAINT [ACP_USER_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ACP_USER_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


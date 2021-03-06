﻿CREATE TABLE [dbo].[ARM_CM_PL_ALLOC_HISTORY] (
    [P_AL_PRIMARY]        INT          NOT NULL,
    [P_AL_DATE]           DATETIME     NULL,
    [P_AL_PERIOD]         TINYINT      CONSTRAINT [DF_ARM_CM_PL_ALLOC_HISTORY_P_AL_PERIOD] DEFAULT ((0)) NULL,
    [P_AL_YEAR]           VARCHAR (1)  NULL,
    [P_AL_VALUE_HOME]     FLOAT (53)   CONSTRAINT [DF_ARM_CM_PL_ALLOC_HISTORY_P_AL_VALUE_HOME] DEFAULT ((0)) NULL,
    [P_AL_VALUE_CURR]     FLOAT (53)   CONSTRAINT [DF_ARM_CM_PL_ALLOC_HISTORY_P_AL_VALUE_CURR] DEFAULT ((0)) NULL,
    [P_AL_REFERENCE]      VARCHAR (10) NULL,
    [P_AL_HEADER_KEY]     VARCHAR (20) NULL,
    [P_AL_USER_ID]        VARCHAR (4)  NULL,
    [P_AL_ACCOUNT_CODE]   VARCHAR (10) NULL,
    [P_AL_FULLALLOC_PD]   SMALLINT     CONSTRAINT [DF_ARM_CM_PL_ALLOC_HISTORY_P_AL_FULLALLOC_PD] DEFAULT ((0)) NULL,
    [P_AL_FULLALLOC_DATE] INT          CONSTRAINT [DF_ARM_CM_PL_ALLOC_HISTORY_P_AL_FULLALLOC_DATE] DEFAULT ((0)) NULL,
    [P_AL_YEAR_LINK]      SMALLINT     NULL
);


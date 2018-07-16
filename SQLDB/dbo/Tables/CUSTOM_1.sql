﻿CREATE TABLE [dbo].[CUSTOM_1] (
    [CSTM1_PRIMARY] FLOAT (53)    NOT NULL,
    [CSTM1_CHAR1]   VARCHAR (100) NULL,
    [CSTM1_CHAR2]   VARCHAR (100) NULL,
    [CSTM1_CHAR3]   VARCHAR (100) NULL,
    [CSTM1_CHAR4]   VARCHAR (100) NULL,
    [CSTM1_CHAR5]   VARCHAR (100) NULL,
    [CSTM1_CHAR6]   VARCHAR (100) NULL,
    [CSTM1_CHAR7]   VARCHAR (100) NULL,
    [CSTM1_CHAR8]   VARCHAR (100) NULL,
    [CSTM1_CHAR9]   VARCHAR (100) NULL,
    [CSTM1_CHAR10]  VARCHAR (100) NULL,
    [CSTM1_DATE1]   DATETIME      NULL,
    [CSTM1_DATE2]   DATETIME      NULL,
    [CSTM1_DATE3]   DATETIME      NULL,
    [CSTM1_DATE4]   DATETIME      NULL,
    [CSTM1_FLAG1]   TINYINT       DEFAULT ((0)) NULL,
    [CSTM1_FLAG2]   TINYINT       DEFAULT ((0)) NULL,
    [CSTM1_FLAG3]   TINYINT       DEFAULT ((0)) NULL,
    [CSTM1_FLAG4]   TINYINT       DEFAULT ((0)) NULL,
    [CSTM1_NO2DP1]  FLOAT (53)    DEFAULT ((0)) NULL,
    [CSTM1_NO2DP2]  FLOAT (53)    DEFAULT ((0)) NULL,
    [CSTM1_NO2DP3]  FLOAT (53)    DEFAULT ((0)) NULL,
    [CSTM1_NO2DP4]  FLOAT (53)    DEFAULT ((0)) NULL,
    [CSTM1_NO0DP1]  FLOAT (53)    DEFAULT ((0)) NULL,
    [CSTM1_NO0DP2]  FLOAT (53)    DEFAULT ((0)) NULL,
    CONSTRAINT [CSTM1_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CSTM1_PRIMARY] ASC)
);


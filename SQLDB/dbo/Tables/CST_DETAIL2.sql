﻿CREATE TABLE [dbo].[CST_DETAIL2] (
    [CT_PRIMARY_2] FLOAT (53)    NOT NULL,
    [CT_CHAR1]     VARCHAR (20)  NULL,
    [CT_CHAR2]     VARCHAR (20)  NULL,
    [CT_CHAR3]     VARCHAR (100) NULL,
    [CT_CHAR4]     VARCHAR (100) NULL,
    [CT_FLAG1]     TINYINT       DEFAULT ((0)) NULL,
    [CT_FLAG2]     TINYINT       DEFAULT ((0)) NULL,
    [CT_DATE1]     DATETIME      NULL,
    [CT_DATE2]     DATETIME      NULL,
    [CT_NUM1]      FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_NUM2]      FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_USRCHAR1]  VARCHAR (20)  NULL,
    [CT_USRCHAR2]  VARCHAR (20)  NULL,
    [CT_USRCHAR3]  VARCHAR (100) NULL,
    [CT_USRCHAR4]  VARCHAR (100) NULL,
    [CT_USRFLAG1]  TINYINT       DEFAULT ((0)) NULL,
    [CT_USRFLAG2]  TINYINT       DEFAULT ((0)) NULL,
    [CT_USRDATE1]  DATETIME      NULL,
    [CT_USRDATE2]  DATETIME      NULL,
    [CT_USRNUM1]   FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_USRNUM2]   FLOAT (53)    DEFAULT ((0)) NULL,
    CONSTRAINT [CT_PRIMARY_2_PK] PRIMARY KEY CLUSTERED ([CT_PRIMARY_2] ASC)
);


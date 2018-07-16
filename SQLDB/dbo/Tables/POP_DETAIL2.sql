﻿CREATE TABLE [dbo].[POP_DETAIL2] (
    [POD_PRIMARY_2] FLOAT (53)    NOT NULL,
    [POD_CHAR1]     VARCHAR (20)  NULL,
    [POD_CHAR2]     VARCHAR (20)  NULL,
    [POD_CHAR3]     VARCHAR (100) NULL,
    [POD_CHAR4]     VARCHAR (100) NULL,
    [POD_FLAG1]     TINYINT       DEFAULT ((0)) NULL,
    [POD_FLAG2]     TINYINT       DEFAULT ((0)) NULL,
    [POD_DATE1]     DATETIME      NULL,
    [POD_DATE2]     DATETIME      NULL,
    [POD_NUM1]      FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_NUM2]      FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_USRCHAR1]  VARCHAR (20)  NULL,
    [POD_USRCHAR2]  VARCHAR (20)  NULL,
    [POD_USRCHAR3]  VARCHAR (100) NULL,
    [POD_USRCHAR4]  VARCHAR (100) NULL,
    [POD_USRFLAG1]  TINYINT       DEFAULT ((0)) NULL,
    [POD_USRFLAG2]  TINYINT       DEFAULT ((0)) NULL,
    [POD_USRDATE1]  DATETIME      NULL,
    [POD_USRDATE2]  DATETIME      NULL,
    [POD_USRNUM1]   FLOAT (53)    DEFAULT ((0)) NULL,
    [POD_USRNUM2]   FLOAT (53)    DEFAULT ((0)) NULL,
    CONSTRAINT [POD_PRIMARY_2_PK] PRIMARY KEY CLUSTERED ([POD_PRIMARY_2] ASC)
);

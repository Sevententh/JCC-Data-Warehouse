﻿CREATE TABLE [dbo].[SYS_TABCARD] (
    [TAB_USER]          VARCHAR (4)   NOT NULL,
    [CU_TABSTATUS]      VARCHAR (180) NULL,
    [CM_TABSTATUS]      VARCHAR (40)  NULL,
    [SU_TABSTATUS]      VARCHAR (40)  NULL,
    [SA_TABSTATUS]      VARCHAR (40)  NULL,
    [PA_TABSTATUS]      VARCHAR (40)  NULL,
    [STK_TABSTATUS]     VARCHAR (180) NULL,
    [CST_TABSTATUS]     VARCHAR (40)  NULL,
    [NL_TABSTATUS]      VARCHAR (45)  NULL,
    [PRC_TABSTATUS]     VARCHAR (40)  NULL,
    [COMP_TABSTATUS]    VARCHAR (40)  NULL,
    [WO_TABSTATUS]      VARCHAR (40)  NULL,
    [CRM_TABSTATUS]     VARCHAR (40)  NULL,
    [CU_CUSTOM_FIELDS]  VARCHAR (60)  NULL,
    [STK_CUSTOM_FIELDS] VARCHAR (60)  NULL,
    [NL_CUSTOM_FIELDS]  VARCHAR (15)  NULL,
    CONSTRAINT [TAB_USER_PK] PRIMARY KEY CLUSTERED ([TAB_USER] ASC)
);


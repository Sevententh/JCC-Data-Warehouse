﻿CREATE TABLE [dbo].[TS_CUSTOM_FORM_API_MAPS] (
    [CFAM_PRIMARY]          FLOAT (53)    NOT NULL,
    [CFAM_API_FIELD_NAME]   VARCHAR (50)  DEFAULT ('') NOT NULL,
    [CFAM_USER_FIELD_NAME]  VARCHAR (150) DEFAULT ('') NOT NULL,
    [CFAM_MAP_TYPE]         TINYINT       DEFAULT ((0)) NOT NULL,
    [CFAM_VALUE]            VARCHAR (50)  DEFAULT ('') NOT NULL,
    [CFAM_CFSD_COLUMN_NAME] VARCHAR (50)  DEFAULT ('') NOT NULL,
    [CFAM_CFSH_PRIMARY]     FLOAT (53)    DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([CFAM_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


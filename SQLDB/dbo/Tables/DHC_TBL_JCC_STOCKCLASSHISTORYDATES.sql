﻿CREATE TABLE [dbo].[DHC_TBL_JCC_STOCKCLASSHISTORYDATES] (
    [JSCD_PRIMARY]   BIGINT      IDENTITY (1, 1) NOT NULL,
    [JSCD_DATE]      DATETIME    NOT NULL,
    [JSCD_DATEINDEX] INT         NOT NULL,
    [JSCD_TYPE]      VARCHAR (1) NOT NULL
);


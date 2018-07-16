﻿CREATE TABLE [dbo].[AA_AOI_INXL3_NOMINAL_DETAIL] (
    [GUID]             VARCHAR (36)    NOT NULL,
    [ROW_NBR_IN_GUID]  INT             NULL,
    [Dataset]          VARCHAR (6)     NOT NULL,
    [NCODE]            VARCHAR (25)    NULL,
    [NNAME]            VARCHAR (40)    NULL,
    [NMAJORTYPE]       INT             NULL,
    [NMAJORHEADCODE]   TINYINT         NULL,
    [NL_MAJORNAME]     VARCHAR (40)    NULL,
    [NCATEGORYCODE1]   VARCHAR (10)    NULL,
    [NL_CATEGORYNAME1] VARCHAR (50)    NULL,
    [NCATEGORYCODE2]   VARCHAR (10)    NULL,
    [NL_CATEGORYNAME2] VARCHAR (50)    NULL,
    [NCATEGORYCODE3]   VARCHAR (10)    NULL,
    [NL_CATEGORYNAME3] VARCHAR (50)    NULL,
    [NCATEGORYCODE4]   VARCHAR (10)    NULL,
    [NL_CATEGORYNAME4] VARCHAR (50)    NULL,
    [NCATEGORYCODE5]   VARCHAR (10)    NULL,
    [NL_CATEGORYNAME5] VARCHAR (50)    NULL,
    [NCATEGORYCODE6]   VARCHAR (10)    NULL,
    [NL_CATEGORYNAME6] VARCHAR (50)    NULL,
    [NCATEGORYCODE7]   VARCHAR (10)    NULL,
    [NL_CATEGORYNAME7] VARCHAR (50)    NULL,
    [NCATEGORYCODE8]   VARCHAR (10)    NULL,
    [NL_CATEGORYNAME8] VARCHAR (50)    NULL,
    [Account]          VARCHAR (10)    NULL,
    [Record_Name]      VARCHAR (40)    NULL,
    [Date]             DATETIME        NULL,
    [Year]             VARCHAR (1)     NULL,
    [iPeriod]          TINYINT         NULL,
    [Period]           VARCHAR (3)     NULL,
    [DET_NOM_PERSORT]  INT             NULL,
    [Origin]           VARCHAR (3)     NULL,
    [Type]             VARCHAR (3)     NULL,
    [Analysis]         VARCHAR (25)    NULL,
    [ItemCode]         VARCHAR (25)    NULL,
    [ItemName]         VARCHAR (80)    NULL,
    [DET_QUANTITY]     FLOAT (53)      NULL,
    [Project]          VARCHAR (10)    NULL,
    [Costcentre]       VARCHAR (10)    NULL,
    [HeaderNo]         FLOAT (53)      NULL,
    [HeaderKey]        VARCHAR (20)    NULL,
    [HeaderRef]        VARCHAR (26)    NULL,
    [Description]      VARCHAR (200)   NULL,
    [Detail]           VARCHAR (240)   NULL,
    [USER_CREATED]     VARCHAR (4)     NULL,
    [DATE_CREATED]     DATETIME        NULL,
    [Amount]           DECIMAL (28, 2) NULL,
    [Origin_primary]   FLOAT (53)      NULL
);


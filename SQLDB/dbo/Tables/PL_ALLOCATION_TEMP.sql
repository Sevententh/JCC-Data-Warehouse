CREATE TABLE [dbo].[PL_ALLOCATION_TEMP] (
    [PL_AL_ID]              INT             NOT NULL,
    [PL_AL_LINE_NUMBER]     INT             NOT NULL,
    [PL_AL_STATUS]          TINYINT         NULL,
    [PL_AL_PRIMARY]         INT             NULL,
    [PL_AL_USER_ID]         VARCHAR (4)     NULL,
    [PL_AL_CURRENCY_SYMBOL] VARCHAR (4)     NULL,
    [PL_AL_VALUE]           DECIMAL (24, 8) NULL,
    [PL_AL_DISPUTE]         BIT             NULL,
    CONSTRAINT [PL_AL_TEMP_PK] PRIMARY KEY CLUSTERED ([PL_AL_ID] ASC, [PL_AL_LINE_NUMBER] ASC)
);


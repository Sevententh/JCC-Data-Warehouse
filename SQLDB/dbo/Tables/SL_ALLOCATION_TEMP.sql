CREATE TABLE [dbo].[SL_ALLOCATION_TEMP] (
    [SL_AL_ID]              INT             NOT NULL,
    [SL_AL_LINE_NUMBER]     INT             NOT NULL,
    [SL_AL_STATUS]          TINYINT         NULL,
    [SL_AL_PRIMARY]         INT             NULL,
    [SL_AL_USER_ID]         VARCHAR (4)     NULL,
    [SL_AL_CURRENCY_SYMBOL] VARCHAR (4)     NULL,
    [SL_AL_VALUE]           DECIMAL (24, 8) NULL,
    [SL_AL_DISPUTE]         BIT             NULL,
    CONSTRAINT [SL_AL_TEMP_PK] PRIMARY KEY CLUSTERED ([SL_AL_ID] ASC, [SL_AL_LINE_NUMBER] ASC)
);


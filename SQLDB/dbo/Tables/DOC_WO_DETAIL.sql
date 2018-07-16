CREATE TABLE [dbo].[DOC_WO_DETAIL] (
    [DWD_PRIMARY]             INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DWD_HEADER_LINK]         INT           NULL,
    [DWD_WC_ORDER_NUMBER]     INT           NULL,
    [DWD_WC_LINK]             INT           NULL,
    [DWD_LEVEL]               INT           NULL,
    [DWD_SORT]                INT           NULL,
    [DWD_COMP_CODE_NAME]      VARCHAR (120) NULL,
    [DWD_COMP_QTY_REQU]       FLOAT (53)    NULL,
    [DWD_COMP_QTY_ISSUED]     FLOAT (53)    NULL,
    [DWD_COMP_QTY_ALLOC]      FLOAT (53)    NULL,
    [DWD_COMP_QTY_NEEDED]     FLOAT (53)    NULL,
    [DWD_COMP_QTY_AVAIL]      FLOAT (53)    NULL,
    [DWD_LINE_TYPE]           INT           NULL,
    [DWD_COMP_LABOUR_FLAG]    BIT           NULL,
    [DWD_COMP_BACKFLUSH_FLAG] BIT           NULL,
    [DWD_COMP_RTP_FLAG]       BIT           NULL,
    CONSTRAINT [DWD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([DWD_PRIMARY] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DWD_HEADER_LINK]
    ON [dbo].[DOC_WO_DETAIL]([DWD_HEADER_LINK] ASC);


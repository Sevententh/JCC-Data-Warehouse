﻿CREATE TABLE [dbo].[PLTRN_CHEQUES_TEMP] (
    [PLCHQ_ID]        INT     NOT NULL,
    [PLCHQ_TRAN_LINK] BIGINT  NOT NULL,
    [PLCHQ_STATUS]    TINYINT DEFAULT ((0)) NULL,
    [PLCHQ_LINE_NO]   BIGINT  IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    CONSTRAINT [PLTRN_CHEQUES_TEMP_PK] PRIMARY KEY CLUSTERED ([PLCHQ_ID] ASC, [PLCHQ_TRAN_LINK] ASC)
);


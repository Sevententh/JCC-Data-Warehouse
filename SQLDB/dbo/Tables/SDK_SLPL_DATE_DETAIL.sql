﻿CREATE TABLE [dbo].[SDK_SLPL_DATE_DETAIL] (
    [SLPLDTED_PRIMARY] INT        IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SLPLDTED_PARENT]  INT        NULL,
    [SLPLDTED_DATE]    DATETIME   NULL,
    [SLPLDTED_VALUE]   FLOAT (53) NULL,
    [SLPLDTED_REMAIN]  FLOAT (53) NULL,
    CONSTRAINT [SLPLDTED_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SLPLDTED_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [SLPLDTED_PARENT_FK] FOREIGN KEY ([SLPLDTED_PARENT]) REFERENCES [dbo].[SDK_SLPL_DATE_HEADER] ([SLPLDTE_PRIMARY]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [SLPLDTED_PARENT]
    ON [dbo].[SDK_SLPL_DATE_DETAIL]([SLPLDTED_PARENT] ASC) WITH (FILLFACTOR = 70);


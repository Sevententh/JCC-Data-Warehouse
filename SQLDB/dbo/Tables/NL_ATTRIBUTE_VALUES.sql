﻿CREATE TABLE [dbo].[NL_ATTRIBUTE_VALUES] (
    [NATV_PRIMARY]             INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [NATV_CODE]                VARCHAR (10) NOT NULL,
    [NATV_NAME]                VARCHAR (30) NULL,
    [NATV_ATTRIBUTE_TYPE_LINK] INT          NOT NULL,
    [NATV_SOURCE]              VARCHAR (1)  NULL,
    [NATV_ORDER]               INT          NOT NULL,
    CONSTRAINT [NATV_PRIMARY_PK] PRIMARY KEY CLUSTERED ([NATV_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [NATV_ATTRIBUTE_TYPE_LINK_FK] FOREIGN KEY ([NATV_ATTRIBUTE_TYPE_LINK]) REFERENCES [dbo].[NL_ATTRIBUTE_TYPES] ([NATT_PRIMARY]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [NATV_ATTRIBUTE_TYPE_LINK]
    ON [dbo].[NL_ATTRIBUTE_VALUES]([NATV_ATTRIBUTE_TYPE_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [NATV_CODE]
    ON [dbo].[NL_ATTRIBUTE_VALUES]([NATV_CODE] ASC, [NATV_ATTRIBUTE_TYPE_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [NATV_ORDER]
    ON [dbo].[NL_ATTRIBUTE_VALUES]([NATV_ATTRIBUTE_TYPE_LINK] ASC, [NATV_ORDER] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [NATV_PRIMARY_NATV_ATTRIBUTE_TYPE_LINK]
    ON [dbo].[NL_ATTRIBUTE_VALUES]([NATV_PRIMARY] ASC, [NATV_ATTRIBUTE_TYPE_LINK] ASC) WITH (FILLFACTOR = 70);


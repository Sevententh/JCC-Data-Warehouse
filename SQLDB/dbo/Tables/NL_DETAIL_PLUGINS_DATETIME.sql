﻿CREATE TABLE [dbo].[NL_DETAIL_PLUGINS_DATETIME] (
    [NLDPD_PRIMARY]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [NLDPD_DETAIL_LINK] FLOAT (53)    NOT NULL,
    [NLDPD_TAGNAME]     VARCHAR (100) NOT NULL,
    [NLDPD_TAGVALUE]    DATETIME      NULL,
    CONSTRAINT [NLDPD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([NLDPD_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [NLDPD_DETAIL_LINK_FK] FOREIGN KEY ([NLDPD_DETAIL_LINK]) REFERENCES [dbo].[SL_PL_NL_DETAIL] ([DET_PRIMARY]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [NLDPD_DETAIL_LINK]
    ON [dbo].[NL_DETAIL_PLUGINS_DATETIME]([NLDPD_DETAIL_LINK] ASC, [NLDPD_TAGNAME] ASC) WITH (FILLFACTOR = 70);


﻿CREATE TABLE [dbo].[SL_DETAIL_PLUGINS_DATETIME] (
    [SLDPD_PRIMARY]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SLDPD_DETAIL_LINK] FLOAT (53)    NOT NULL,
    [SLDPD_TAGNAME]     VARCHAR (100) NOT NULL,
    [SLDPD_TAGVALUE]    DATETIME      NULL,
    CONSTRAINT [SLDPD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SLDPD_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [SLDPD_DETAIL_LINK_FK] FOREIGN KEY ([SLDPD_DETAIL_LINK]) REFERENCES [dbo].[SL_PL_NL_DETAIL] ([DET_PRIMARY]) ON DELETE CASCADE
);

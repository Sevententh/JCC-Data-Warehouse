﻿CREATE TABLE [dbo].[SL_DETAIL_PLUGINS_VCHAR] (
    [SLDPV_PRIMARY]     INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SLDPV_DETAIL_LINK] FLOAT (53)     NOT NULL,
    [SLDPV_TAGNAME]     VARCHAR (100)  NOT NULL,
    [SLDPV_TAGVALUE]    VARCHAR (1000) NULL,
    CONSTRAINT [SLDPV_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SLDPV_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [SLDPV_DETAIL_LINK_FK] FOREIGN KEY ([SLDPV_DETAIL_LINK]) REFERENCES [dbo].[SL_PL_NL_DETAIL] ([DET_PRIMARY]) ON DELETE CASCADE
);


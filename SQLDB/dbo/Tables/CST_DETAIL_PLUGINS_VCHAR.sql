﻿CREATE TABLE [dbo].[CST_DETAIL_PLUGINS_VCHAR] (
    [CTDPV_PRIMARY]     INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CTDPV_DETAIL_LINK] FLOAT (53)     NOT NULL,
    [CTDPV_TAGNAME]     VARCHAR (100)  NOT NULL,
    [CTDPV_TAGVALUE]    VARCHAR (1000) NULL,
    CONSTRAINT [CTDPV_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CTDPV_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [CTDPV_DETAIL_LINK_FK] FOREIGN KEY ([CTDPV_DETAIL_LINK]) REFERENCES [dbo].[CST_DETAIL] ([CT_PRIMARY]) ON DELETE CASCADE
);

﻿CREATE TABLE [dbo].[CST_DETAIL_PLUGINS_DATETIME] (
    [CTDPD_PRIMARY]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CTDPD_DETAIL_LINK] FLOAT (53)    NOT NULL,
    [CTDPD_TAGNAME]     VARCHAR (100) NOT NULL,
    [CTDPD_TAGVALUE]    DATETIME      NULL,
    CONSTRAINT [CTDPD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CTDPD_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [CTDPD_DETAIL_LINK_FK] FOREIGN KEY ([CTDPD_DETAIL_LINK]) REFERENCES [dbo].[CST_DETAIL] ([CT_PRIMARY]) ON DELETE CASCADE
);


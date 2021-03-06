﻿CREATE TABLE [dbo].[STK_FACET_PRODUCT_GROUP_LINKS] (
    [SFPGL_PRODUCT_GROUP_LINK] INT     NOT NULL,
    [SFPGL_FACET_LINK]         INT     NOT NULL,
    [SFPGL_FACET_NUMBER]       TINYINT NOT NULL,
    CONSTRAINT [STK_FACET_PRODUCT_GROUP_LINKS_PK] PRIMARY KEY CLUSTERED ([SFPGL_PRODUCT_GROUP_LINK] ASC, [SFPGL_FACET_NUMBER] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [SFPGL_FACET_LINK_FK] FOREIGN KEY ([SFPGL_FACET_LINK]) REFERENCES [dbo].[STK_FACETS] ([SFCT_PRIMARY]),
    CONSTRAINT [SFPGL_PRODUCT_GROUP_LINK_FK] FOREIGN KEY ([SFPGL_PRODUCT_GROUP_LINK]) REFERENCES [dbo].[STK_FACET_PRODUCT_GROUP] ([SFPG_PRIMARY]) ON DELETE CASCADE
);


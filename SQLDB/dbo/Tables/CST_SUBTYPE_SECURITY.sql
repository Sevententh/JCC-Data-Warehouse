﻿CREATE TABLE [dbo].[CST_SUBTYPE_SECURITY] (
    [CSS_SUBTYPE_LINK]      INT NOT NULL,
    [CSS_USER_PROFILE_LINK] INT NOT NULL,
    CONSTRAINT [CSS_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CSS_SUBTYPE_LINK] ASC, [CSS_USER_PROFILE_LINK] ASC),
    CONSTRAINT [CST_SUBTYPE_SECURITY_SUBTYPE_LINK_FK] FOREIGN KEY ([CSS_SUBTYPE_LINK]) REFERENCES [dbo].[CST_TRANSACTION_SUBTYPE] ([CTT_PRIMARY]) ON DELETE CASCADE,
    CONSTRAINT [CST_SUBTYPE_SECURITY_USER_PROFILE_LINK_FK] FOREIGN KEY ([CSS_USER_PROFILE_LINK]) REFERENCES [dbo].[SYS_USER_PROFILE_GLOBAL] ([UPG_PRIMARY]) ON DELETE CASCADE
);


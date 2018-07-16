﻿CREATE TABLE [dbo].[CB_AUTOBANKREC_STATEMENT] (
    [ABRS_PRIMARY]         INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ABRS_NL_ACCOUNT_LINK] VARCHAR (25) NOT NULL,
    [ABRS_STATEMENT_REF]   VARCHAR (10) NOT NULL,
    [ABRS_STATEMENT_BAL]   FLOAT (53)   NULL,
    [ABRS_STATEMENT_DATE]  DATETIME     NULL,
    [ABRS_DATE_EDITED]     DATETIME     NULL,
    [ABRS_USER_EDITED]     VARCHAR (4)  NULL,
    [ABRS_DATE_PUTIN]      DATETIME     DEFAULT (getdate()) NOT NULL,
    [ABRS_USER_PUTIN]      VARCHAR (4)  NOT NULL,
    CONSTRAINT [ABRS_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ABRS_PRIMARY] ASC),
    CONSTRAINT [ABRS_NL_ACCOUNT_LINK_FK] FOREIGN KEY ([ABRS_NL_ACCOUNT_LINK]) REFERENCES [dbo].[NL_ACCOUNTS] ([NCODE])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ABRS_NL_ACCOUNT_LINK_ABRS_STATEMENT_REF]
    ON [dbo].[CB_AUTOBANKREC_STATEMENT]([ABRS_NL_ACCOUNT_LINK] ASC, [ABRS_STATEMENT_REF] ASC);


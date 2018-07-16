﻿CREATE TABLE [dbo].[CST_CONTRACTS] (
    [CCON_PRIMARY]             INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CCON_MASTER_PROJECT_LINK] FLOAT (53)   NOT NULL,
    [CCON_CONTRACT_NUMBER]     VARCHAR (20) NOT NULL,
    CONSTRAINT [CCON_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CCON_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [CCON_CONTRACT_NUMBER_CK] CHECK ([CCON_CONTRACT_NUMBER]<>''),
    CONSTRAINT [CCON_MASTER_PROJECT_LINK_FK] FOREIGN KEY ([CCON_MASTER_PROJECT_LINK]) REFERENCES [dbo].[CST_COSTHEADER] ([CH_PRIMARY])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CCON_CONTRACT_NUMBER]
    ON [dbo].[CST_CONTRACTS]([CCON_CONTRACT_NUMBER] ASC)
    INCLUDE([CCON_MASTER_PROJECT_LINK]) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CCON_MASTER_PROJECT_LINK]
    ON [dbo].[CST_CONTRACTS]([CCON_MASTER_PROJECT_LINK] ASC)
    INCLUDE([CCON_CONTRACT_NUMBER]) WITH (FILLFACTOR = 70);


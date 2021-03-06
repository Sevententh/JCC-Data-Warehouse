﻿CREATE TABLE [dbo].[CO2_SORT_KEYS_2] (
    [CSK2_PRIMARY]     INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CSK2_DESCRIPTION] VARCHAR (20) NOT NULL,
    [CSK2_SORT_ORDER]  INT          NOT NULL,
    [CSK2_DO_NOT_USE]  BIT          NOT NULL,
    [CSK2_USER_PUTIN]  VARCHAR (4)  NOT NULL,
    [CSK2_DATE_PUTIN]  DATETIME     NOT NULL,
    [CSK2_USER_EDITED] VARCHAR (4)  NULL,
    [CSK2_DATE_EDITED] DATETIME     NULL,
    CONSTRAINT [CSK2_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CSK2_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CSK2_DESCRIPTION]
    ON [dbo].[CO2_SORT_KEYS_2]([CSK2_DESCRIPTION] ASC)
    INCLUDE([CSK2_DO_NOT_USE], [CSK2_SORT_ORDER]) WITH (FILLFACTOR = 70);


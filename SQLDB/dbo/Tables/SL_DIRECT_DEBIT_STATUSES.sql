﻿CREATE TABLE [dbo].[SL_DIRECT_DEBIT_STATUSES] (
    [SDDS_PRIMARY]          INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SDDS_CODE]             VARCHAR (2)  NOT NULL,
    [SDDS_DESCRIPTION]      VARCHAR (64) NULL,
    [SDDS_DATE_PUTIN]       DATETIME     DEFAULT (getdate()) NOT NULL,
    [SDDS_SEPA_CODE]        VARCHAR (4)  NULL,
    [SDDS_SEPA_DESCRIPTION] VARCHAR (64) NULL,
    CONSTRAINT [SDDS_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SDDS_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SDDS_CODE]
    ON [dbo].[SL_DIRECT_DEBIT_STATUSES]([SDDS_CODE] ASC)
    INCLUDE([SDDS_DESCRIPTION]) WITH (FILLFACTOR = 70);


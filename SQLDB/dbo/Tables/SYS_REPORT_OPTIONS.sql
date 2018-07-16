﻿CREATE TABLE [dbo].[SYS_REPORT_OPTIONS] (
    [OPTION_ID]       BIGINT         IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [OPTION_NAME]     NVARCHAR (255) NOT NULL,
    [REPORT_ID]       BIGINT         NOT NULL,
    [REPORT_SEARCH]   IMAGE          NULL,
    [REPORT_SORT]     IMAGE          NULL,
    [REPORT_SECTIONS] IMAGE          NULL,
    [USER_PUTIN]      VARCHAR (4)    NOT NULL,
    [DATE_PUTIN]      SMALLDATETIME  NOT NULL,
    [USER_EDITED]     VARCHAR (4)    NULL,
    [DATE_EDITED]     SMALLDATETIME  NULL,
    CONSTRAINT [OPTION_ID_PK] PRIMARY KEY CLUSTERED ([OPTION_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [REPORT_ID]
    ON [dbo].[SYS_REPORT_OPTIONS]([REPORT_ID] ASC);


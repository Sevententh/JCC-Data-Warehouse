CREATE TABLE [dbo].[dhc_JCC_PO_Detail_ReqDate] (
    [PDR_PRIMARY]        BIGINT   IDENTITY (1, 1) NOT NULL,
    [PDR_POD_PRIMARY]    INT      NOT NULL,
    [PDR_FIRST_REQ_DATE] DATETIME NULL
);


GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
    ON [dbo].[dhc_JCC_PO_Detail_ReqDate]([PDR_POD_PRIMARY] ASC);


CREATE TABLE [dbo].[dhc_JCC_WeeklyDemandByWeekTBL] (
    [WeekDemandPWStockCode] VARCHAR (25) NULL,
    [Demand]                FLOAT (53)   NOT NULL,
    [Week]                  INT          NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [x_WeekDemandPWStockCode]
    ON [dbo].[dhc_JCC_WeeklyDemandByWeekTBL]([WeekDemandPWStockCode] ASC) WITH (FILLFACTOR = 70);


CREATE TABLE [dbo].[dhc_JCC_MonthlyWorksOrderStockDemandTBL] (
    [WODemandStockCode]   VARCHAR (25) NULL,
    [WODemandPrevMonth12] FLOAT (53)   NOT NULL,
    [WODemandPrevMonth11] FLOAT (53)   NOT NULL,
    [WODemandPrevMonth10] FLOAT (53)   NOT NULL,
    [WODemandPrevMonth9]  FLOAT (53)   NOT NULL,
    [WODemandPrevMonth8]  FLOAT (53)   NOT NULL,
    [WODemandPrevMonth7]  FLOAT (53)   NOT NULL,
    [WODemandPrevMonth6]  FLOAT (53)   NOT NULL,
    [WODemandPrevMonth5]  FLOAT (53)   NOT NULL,
    [WODemandPrevMonth4]  FLOAT (53)   NOT NULL,
    [WODemandPrevMonth3]  FLOAT (53)   NOT NULL,
    [WODemandPrevMonth2]  FLOAT (53)   NOT NULL,
    [WODemandPrevMonth1]  FLOAT (53)   NOT NULL,
    [WOAvg3Months]        FLOAT (53)   NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [x_MonthWODemandStockCode]
    ON [dbo].[dhc_JCC_MonthlyWorksOrderStockDemandTBL]([WODemandStockCode] ASC) WITH (FILLFACTOR = 70);


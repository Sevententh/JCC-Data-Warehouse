CREATE TABLE [dbo].[dhc_JCC_MonthlyStockDemandTBL] (
    [MonthDemandStockCode]     VARCHAR (25) NULL,
    [DemandPrevMonth12]        FLOAT (53)   NOT NULL,
    [DemandPrevMonth11]        FLOAT (53)   NOT NULL,
    [DemandPrevMonth10]        FLOAT (53)   NOT NULL,
    [DemandPrevMonth9]         FLOAT (53)   NOT NULL,
    [DemandPrevMonth8]         FLOAT (53)   NOT NULL,
    [DemandPrevMonth7]         FLOAT (53)   NOT NULL,
    [DemandPrevMonth6]         FLOAT (53)   NOT NULL,
    [DemandPrevMonth5]         FLOAT (53)   NOT NULL,
    [DemandPrevMonth4]         FLOAT (53)   NOT NULL,
    [DemandPrevMonth3]         FLOAT (53)   NOT NULL,
    [DemandPrevMonth2]         FLOAT (53)   NOT NULL,
    [DemandPrevMonth1]         FLOAT (53)   NOT NULL,
    [Avg3Months]               FLOAT (53)   NOT NULL,
    [PrevMonth12StartDate]     DATETIME     NULL,
    [PrevMonth11StartDate]     DATETIME     NULL,
    [PrevMonth10StartDate]     DATETIME     NULL,
    [PrevMonthMonth9StartDate] DATETIME     NULL,
    [PrevMonthMonth8StartDate] DATETIME     NULL,
    [PrevMonthMonth7StartDate] DATETIME     NULL,
    [PrevMonthMonth6StartDate] DATETIME     NULL,
    [PrevMonthMonth5StartDate] DATETIME     NULL,
    [PrevMonthMonth4StartDate] DATETIME     NULL,
    [PrevMonthMonth3StartDate] DATETIME     NULL,
    [PrevMonthMonth2StartDate] DATETIME     NULL,
    [PrevMonthMonth1StartDate] DATETIME     NULL,
    [ThisMonthStartDate]       DATETIME     NULL,
    [NextMonthMonth1StartDate] DATETIME     NULL,
    [NextMonthMonth2StartDate] DATETIME     NULL,
    [NextMonthMonth3StartDate] DATETIME     NULL,
    [NextMonthMonth4StartDate] DATETIME     NULL
);


GO
CREATE NONCLUSTERED INDEX [x_MonthDemandStockCode]
    ON [dbo].[dhc_JCC_MonthlyStockDemandTBL]([MonthDemandStockCode] ASC) WITH (FILLFACTOR = 70);


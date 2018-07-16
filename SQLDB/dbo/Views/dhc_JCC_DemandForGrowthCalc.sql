 
CREATE VIEW [dbo].[dhc_JCC_DemandForGrowthCalc]
AS

	SELECT STKCODE as StockCode,
			STK_SORT_KEY3 as StockFamily,
			PrevMonth12StartDate,
			PrevMonth11StartDate,
			PrevMonth10StartDate,
			PrevMonthMonth9StartDate,
			PrevMonthMonth8StartDate,
			PrevMonthMonth7StartDate,
			PrevMonthMonth6StartDate,
			PrevMonthMonth5StartDate,
			PrevMonthMonth4StartDate,
			PrevMonthMonth3StartDate,
			PrevMonthMonth2StartDate,
			PrevMonthMonth1StartDate,

			ThisMonthStartDate,
			NextMonthMonth1StartDate,
			NextMonthMonth2StartDate,
			NextMonthMonth3StartDate,
			NextMonthMonth4StartDate,
	
			--subqueries for previous month demand back 12 months. Full months only.
			isnull(DemandPrevMonth12,0)+isnull(WODemandPrevMonth12,0) as DemandPrevMonth12,
			isnull(DemandPrevMonth11,0)+isnull(WODemandPrevMonth11,0) as DemandPrevMonth11,
			isnull(DemandPrevMonth10,0)+isnull(WODemandPrevMonth10,0) as DemandPrevMonth10,
			isnull(DemandPrevMonth9,0)+isnull(WODemandPrevMonth9,0) as DemandPrevMonth9,
			isnull(DemandPrevMonth8,0)+isnull(WODemandPrevMonth8,0) as DemandPrevMonth8,
			isnull(DemandPrevMonth7,0)+isnull(WODemandPrevMonth7,0) as DemandPrevMonth7,
			isnull(DemandPrevMonth6,0)+isnull(WODemandPrevMonth6,0) as DemandPrevMonth6,
			isnull(DemandPrevMonth5,0)+isnull(WODemandPrevMonth5,0) as DemandPrevMonth5,
			isnull(DemandPrevMonth4,0)+isnull(WODemandPrevMonth4,0) as DemandPrevMonth4,
			isnull(DemandPrevMonth3,0)+isnull(WODemandPrevMonth3,0) as DemandPrevMonth3,
			isnull(DemandPrevMonth2,0)+isnull(WODemandPrevMonth2,0) as DemandPrevMonth2,
			isnull(DemandPrevMonth1,0)+isnull(WODemandPrevMonth1,0) as DemandPrevMonth1
	
	
	
	FROM STK_STOCK
		LEFT OUTER JOIN dhc_JCC_MonthlyStockDemandTBL on MonthDemandStockCode=STKCODE
		LEFT OUTER JOIN dhc_JCC_MonthlyWorksOrderStockDemandTBL on WODemandStockCode=STKCODE

	where isnull(STKNAME,'')<>'DISCONTINUED'

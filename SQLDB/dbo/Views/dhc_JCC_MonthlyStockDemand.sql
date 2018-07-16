 
CREATE VIEW [dbo].[dhc_JCC_MonthlyStockDemand]
AS
	SELECT MonthDemandStockCode,
			DemandPrevMonth12,
			DemandPrevMonth11,
			DemandPrevMonth10,
			DemandPrevMonth9,
			DemandPrevMonth8,
			DemandPrevMonth7,
			DemandPrevMonth6,
			DemandPrevMonth5,
			DemandPrevMonth4,
			DemandPrevMonth3,
			DemandPrevMonth2,
			DemandPrevMonth1,
			(DemandPrevMonth1+DemandPrevMonth2+DemandPrevMonth3)/3 as Avg3Months,
			
			dbo.dhc_getMonthStartDate(getdate(),-12) AS PrevMonth12StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-11) AS PrevMonth11StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-10) AS PrevMonth10StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-9) AS PrevMonthMonth9StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-8) AS PrevMonthMonth8StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-7) AS PrevMonthMonth7StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-6) AS PrevMonthMonth6StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-5) AS PrevMonthMonth5StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-4) AS PrevMonthMonth4StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-3) AS PrevMonthMonth3StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-2) AS PrevMonthMonth2StartDate,
			dbo.dhc_getMonthStartDate(getdate(),-1) AS PrevMonthMonth1StartDate,
			
			dbo.dhc_getMonthStartDate(getdate(),0) AS ThisMonthStartDate,
			dbo.dhc_getMonthStartDate(getdate(),1) AS NextMonthMonth1StartDate,
			dbo.dhc_getMonthStartDate(getdate(),2) AS NextMonthMonth2StartDate,
			dbo.dhc_getMonthStartDate(getdate(),3) AS NextMonthMonth3StartDate,
			dbo.dhc_getMonthStartDate(getdate(),4) AS NextMonthMonth4StartDate
	FROM
	(
		SELECT STKCODE as MonthDemandStockCode,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-11) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth12,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-11) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-10) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth11,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-10) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-9) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth10,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-9) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-8) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth9,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-8) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-7) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth8,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-7) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-6) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth7,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-6) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-5) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth6,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-5) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-4) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth5,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-4) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-3) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth4,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-3) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-2) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth3,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-2) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-1) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth2,
			isnull(sum(case when OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-1) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),0) then (case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end),0) as DemandPrevMonth1

		FROM STK_STOCK
			left outer join dhc_cons_ORD_DETAIL_grouped 
			on OD_STOCK_CODE=STKCODE and OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12) and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),0)
		where isnull(STKNAME,'')<>'DISCONTINUED'
			
		GROUP BY STKCODE
	) b



CREATE VIEW [dbo].[dhc_JCC_MonthlyWorksOrderStockDemand]
AS
	SELECT STKCODE as WODemandStockCode,
			isnull(WODemandPrevMonth12,0) as WODemandPrevMonth12,
			isnull(WODemandPrevMonth11,0) as WODemandPrevMonth11,
			isnull(WODemandPrevMonth10,0) as WODemandPrevMonth10,
			isnull(WODemandPrevMonth9,0) as WODemandPrevMonth9,
			isnull(WODemandPrevMonth8,0) as WODemandPrevMonth8,
			isnull(WODemandPrevMonth7,0) as WODemandPrevMonth7,
			isnull(WODemandPrevMonth6,0) as WODemandPrevMonth6,
			isnull(WODemandPrevMonth5,0) as WODemandPrevMonth5,
			isnull(WODemandPrevMonth4,0) as WODemandPrevMonth4,
			isnull(WODemandPrevMonth3,0) as WODemandPrevMonth3,
			isnull(WODemandPrevMonth2,0) as WODemandPrevMonth2,
			isnull(WODemandPrevMonth1,0) as WODemandPrevMonth1,
			round((isnull(WODemandPrevMonth1,0)+isnull(WODemandPrevMonth2,0)+isnull(WODemandPrevMonth3,0))/3,2) as WOAvg3Months
	FROM
		STK_STOCK
	left outer join
	(
		SELECT STKCODE as WOStockCode,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-11) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth12,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-11) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-10) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth11,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-10) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-9) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth10,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-9) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-8) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth9,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-8) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-7) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth8,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-7) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-6) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth7,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-6) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-5) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth6,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-5) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-4) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth5,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-4) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-3) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth4,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-3) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-2) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth3,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-2) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),-1) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth2,
			isnull(sum(case when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-1) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),0) then (case SM_STATUS when 'O' then SM_QUANTITY else -SM_QUANTITY end) else 0 end),0) as WODemandPrevMonth1

		FROM STK_STOCK
		left outer join dhc_cons_STK_MOVEMENTS on SM_STOCK_CODE=STKCODE
			where ((sm_origin='W' and sm_status='O'
				and SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),0))
				or SM_PRIMARY is null) and isnull(STKNAME,'')<>'DISCONTINUED'
		GROUP BY STKCODE
	) b on STKCODE=WOStockCode

	where isnull(STKNAME,'')<>'DISCONTINUED'


CREATE VIEW [dbo].[dhc_JCC_SafetyStock]
AS

		SELECT STKCODE as StockCode,							--Item Number
			isnull(STK_USRCHAR5,'') as StockType,				--Type
			round(case when STK_PHYSICAL=0 then 0 
			else STK_FIFO_VALU/STK_PHYSICAL
			end,2) as StockValuePerItem,							--Stock Value Per Item £
			
			--(STK_FIFO_VALU/(case STK_PHYSICAL when 0 then 1 else STK_PHYSICAL end)) FIFO_Cost_Price,
			--STK_BASEPRICE as SellPrice, -- should this be from Price Line 1?
			round(case when STK_PHYSICAL=0 or STK_BASEPRICE=0 then 0
			else (STK_FIFO_VALU/STK_PHYSICAL)/STK_BASEPRICE end,2) as PrimeMargin,--Prime margin

			--Customer Service Level (Calc/Lookup)
			--k factor (Calc/Lookup)

			TotalYearDemand,									--Annual demand (last 12 months)
			round(TotalYearDemandAvg,2) as TotalYearDemandAvg,	--Ave weekly demand (last 12 months)
			round(YearStDev,2) as YearStDev,					--Standard deviation of demand

			QuotedLeadTimeWeeks,								--System lead time (weeks) 
			DiffBetweenReqDelWeeks,								--Average lead time (weeks)
			DiffBetweenReqDelWeeks_SD							--Standard deviation of lead time

			--SD of demand during lead time (Calc)
			--Safety Stock (Calc)
			--Economic Order Quantity (Calc)
			--Coefficient of Variance (Calc)

	FROM STK_STOCK
		--LEFT OUTER JOIN STK_STOCK_2 on STKCODE=STKCODE2
		LEFT OUTER JOIN STK_STOCK3 on STKCODE=STKCODE3
		LEFT OUTER JOIN [dhc_JCC_WeeklyHistoricalDemand] wd on STKCODE=wd.StockCode
		LEFT OUTER JOIN [dhc_JCC_SupplyLeadTime] lt on STKCODE=lt.StockCode
	
	where isnull(STKNAME,'')<>'DISCONTINUED'



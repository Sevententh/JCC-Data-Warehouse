
CREATE VIEW [dbo].[dhc_JCC_CarryingCost]
AS

	SELECT	STKCODE as StockCode,										--Item Number
			round(case when STK_PHYSICAL=0 then 0 
			else STK_FIFO_VALU/STK_PHYSICAL
			end,5) as CostPricePerItem,							--Stock Value Per Item £
			isnull(avgOrder.AvgOrderQty,0) as AverageOrderQty,					--Average order
			isnull(yrDemand.TotalYearDemand,0) as TotalYearDemand,					--Average order
			--Rent (input to sheet)
			--Cost of Capital (input to sheet)
			round((case when Last13WeeksAvgDemand=0 then 0 else
			isnull(avgOrder.AvgOrderQty,0)/Last13WeeksAvgDemand end),2) as AvgHoldingTime	--Average holding time (wks)
			--Variable carrying Cost (%) (input to sheet)
			--Freight (input to sheet)
			--Total variable (Calc)
			--Order processing (input to sheet)
			--Cost per average order (Calc)
			--Ratio per average order (Calc)



	FROM STK_STOCK
		left outer join [dhc_JCC_WeeklyHistoricalDemand] on STKCODE=StockCode

		LEFT OUTER JOIN
		(
			select POD_STOCK_CODE,
				round(avg(POD_QTYORD),2) as AvgOrderQty
			from dhc_cons_POP_DETAIL
			where pod_date>=dbo.dhc_getMonthStartDate(getdate(),-15) and pod_date<dbo.dhc_getMonthStartDate(getdate(),0)
			group by POD_STOCK_CODE

		) avgOrder on POD_STOCK_CODE=STKCODE

		LEFT OUTER JOIN
		(
			select WeekDemandStockCode,
				(DemandPrevWeek53+DemandPrevWeek52+DemandPrevWeek51+DemandPrevWeek50+DemandPrevWeek49+
				DemandPrevWeek48+DemandPrevWeek47+DemandPrevWeek46+DemandPrevWeek45+DemandPrevWeek44+
				DemandPrevWeek43+DemandPrevWeek42+DemandPrevWeek41+DemandPrevWeek40+DemandPrevWeek39+
				DemandPrevWeek38+DemandPrevWeek37+DemandPrevWeek36+DemandPrevWeek35+DemandPrevWeek34+
				DemandPrevWeek33+DemandPrevWeek32+DemandPrevWeek31+DemandPrevWeek30+DemandPrevWeek29+
				DemandPrevWeek28+DemandPrevWeek27+DemandPrevWeek26+DemandPrevWeek25+DemandPrevWeek24+
				DemandPrevWeek23+DemandPrevWeek22+DemandPrevWeek21+DemandPrevWeek20+DemandPrevWeek19+
				DemandPrevWeek18+DemandPrevWeek17+DemandPrevWeek16+DemandPrevWeek15+DemandPrevWeek14+
				DemandPrevWeek13+DemandPrevWeek12+DemandPrevWeek11+DemandPrevWeek10+DemandPrevWeek9+
				DemandPrevWeek8+DemandPrevWeek7+DemandPrevWeek6+DemandPrevWeek5+DemandPrevWeek4+
				DemandPrevWeek3+DemandPrevWeek2+DemandPrevWeek1) as TotalYearDemand

			from dhc_JCC_WeeklyStockDemandTBL

		)yrDemand on WeekDemandStockCode=STKCODE

	where isnull(STKNAME,'')<>'DISCONTINUED'

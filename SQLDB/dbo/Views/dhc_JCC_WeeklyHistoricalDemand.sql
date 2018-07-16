 
CREATE VIEW [dbo].[dhc_JCC_WeeklyHistoricalDemand]
AS

	SELECT	TOP 100 PERCENT STKCODE as StockCode,
			STK_SORT_KEY3 as StockFamily,

			--jnWeeklyHistoricalBasedBudget
			--Compare 65-53, against 1-13, apply percentage to (52+lead time)-(39+lead time)

			[weeks65to53],[weeks13to1],

			(case when [weeks65to53]=0 then 0 else [weeks13to1]/[weeks65to53] end) as [p13to1div65to53],

			DemandNextQuartPlusLTLastYear as [SameQuartLastYearPlusLT],

			(case when [weeks65to53]=0 then 0 else ([weeks13to1]-[weeks65to53])/[weeks65to53] end) as LastQtrLYPcntChng,

			round(DemandNextQuartPlusLTLastYear*
			(case when [weeks65to53]=0 then 0 else [weeks13to1]/[weeks65to53] end),2) as Next13WeekPlusLTBudget,

			(DemandPrevWeek52+DemandPrevWeek51+DemandPrevWeek50+DemandPrevWeek49+
			DemandPrevWeek48+DemandPrevWeek47+DemandPrevWeek46+DemandPrevWeek45+DemandPrevWeek44+
			DemandPrevWeek43+DemandPrevWeek42+DemandPrevWeek41+DemandPrevWeek40) as CorrespondingLastQtr,

			DemandPrevWeek65,DemandPrevWeek64,DemandPrevWeek63,DemandPrevWeek62,DemandPrevWeek61,
			DemandPrevWeek60,DemandPrevWeek59,DemandPrevWeek58,DemandPrevWeek57,DemandPrevWeek56,
			DemandPrevWeek55,DemandPrevWeek54,
			DemandPrevWeek53,DemandPrevWeek52,DemandPrevWeek51,DemandPrevWeek50,DemandPrevWeek49,
			DemandPrevWeek48,DemandPrevWeek47,DemandPrevWeek46,DemandPrevWeek45,DemandPrevWeek44,
			DemandPrevWeek43,DemandPrevWeek42,DemandPrevWeek41,DemandPrevWeek40,DemandPrevWeek39,
			DemandPrevWeek38,DemandPrevWeek37,DemandPrevWeek36,DemandPrevWeek35,DemandPrevWeek34,
			DemandPrevWeek33,DemandPrevWeek32,DemandPrevWeek31,DemandPrevWeek30,DemandPrevWeek29,
			DemandPrevWeek28,DemandPrevWeek27,DemandPrevWeek26,DemandPrevWeek25,DemandPrevWeek24,
			DemandPrevWeek23,DemandPrevWeek22,DemandPrevWeek21,DemandPrevWeek20,DemandPrevWeek19,
			DemandPrevWeek18,DemandPrevWeek17,DemandPrevWeek16,DemandPrevWeek15,DemandPrevWeek14,
			DemandPrevWeek13,DemandPrevWeek12,DemandPrevWeek11,DemandPrevWeek10,DemandPrevWeek9,
			DemandPrevWeek8,DemandPrevWeek7,DemandPrevWeek6,DemandPrevWeek5,DemandPrevWeek4,
			DemandPrevWeek3,DemandPrevWeek2,DemandPrevWeek1,

			(DemandPrevWeek13+DemandPrevWeek12+DemandPrevWeek11+
			DemandPrevWeek10+DemandPrevWeek9+DemandPrevWeek8+
			DemandPrevWeek7+DemandPrevWeek6+DemandPrevWeek5+
			DemandPrevWeek4+DemandPrevWeek3+DemandPrevWeek2+
			DemandPrevWeek1)/13 as Last13WeeksAvgDemand,

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
			DemandPrevWeek3+DemandPrevWeek2+DemandPrevWeek1) as TotalYearDemand,

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
			DemandPrevWeek3+DemandPrevWeek2+DemandPrevWeek1)/53 as TotalYearDemandAvg,

--			(select stdev(Demand) as StkStandardDev from dhc_JCC_WeeklyStockDemandPerWeek where WeekDemandPWStockCode=STKCODE)
--					as YearStDev

			jnWeeklyStockDemandPerWeek.StkStandardDev as YearStDev
			

	FROM STK_STOCK

		INNER JOIN dhc_JCC_WeeklyStockDemandTBL on STKCODE=WeekDemandStockCode
		LEFT OUTER JOIN
		(
			select WeekDemandPWStockCode,stdev(Demand) as StkStandardDev 
			from dhc_JCC_WeeklyDemandByWeekTBL 
			group by WeekDemandPWStockCode
			--where WeekDemandPWStockCode=STKCODE
		) jnWeeklyStockDemandPerWeek on WeekDemandPWStockCode=STKCODE

		LEFT OUTER JOIN [dhc_JCC_StockLeadTime] on LeadTimeStockCode=STKCODE

		inner join
		(
			SELECT	WeekDemandStockCode as WDSTK,

				(DemandPrevWeek65+DemandPrevWeek64+DemandPrevWeek63+DemandPrevWeek62+DemandPrevWeek61+
				DemandPrevWeek60+DemandPrevWeek59+DemandPrevWeek58+DemandPrevWeek57+DemandPrevWeek56+
				DemandPrevWeek55+DemandPrevWeek54+DemandPrevWeek53) as [weeks65to53],

				(DemandPrevWeek13+DemandPrevWeek12+DemandPrevWeek11+DemandPrevWeek10+DemandPrevWeek9+
				DemandPrevWeek8+DemandPrevWeek7+DemandPrevWeek6+DemandPrevWeek5+DemandPrevWeek4+
				DemandPrevWeek3+DemandPrevWeek2+DemandPrevWeek1) as [weeks13to1]
			from dhc_JCC_WeeklyStockDemandTBL

		) histBud on WDSTK=STKCODE

		inner join
		(
			select STKCODE as WDSTKLT,
						
				sum(case when OD_DATE>=dbo.dhc_getWeekStartDate(getdate(),-52+isnull(LeadTimeWeeks,0)) 
						and OD_DATE<dbo.dhc_getWeekStartDate(getdate(),-39+isnull(LeadTimeWeeks,0)) then 
							(case OD_TYPE when 'O' then OD_QTYORD else -OD_QTYORD end) else 0 end) as DemandNextQuartPlusLTLastYear

			FROM STK_STOCK
				left outer join dhc_cons_ORD_DETAIL_grouped on OD_STOCK_CODE=STKCODE
				LEFT OUTER JOIN [dhc_JCC_StockLeadTime] on LeadTimeStockCode=STKCODE
			GROUP BY STKCODE

		) histBudWithLeadTimes on WDSTKLT=STKCODE

	where isnull(STKNAME,'')<>'DISCONTINUED'

ORDER BY STKCODE


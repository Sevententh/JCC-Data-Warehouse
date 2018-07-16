 
CREATE VIEW [dbo].[dhc_JCC_PurchasingModelMain]
AS

	SELECT STKCODE as StockCode,
			STKNAME as StockDescription,
			isnull(STK_SORT_KEY2,'') as Supplier,
			--Stock User Char 2 : StockType
			isnull(STK_USRCHAR5,'') as StockType,

			(case isnull(STK_ASSEMBLY,'')
				when '' then ''
				when 'A' then 'ASS'
				when 'C' then 'COMP'
			end) as AssemblyType,

			--subquery : Date first recieved stock
			(case when STK_DATE_PUTIN<='2007-05-01' then
				'2007-05-01'
			else
				(case when FirstRecievedDate is null then FirstAdjustmentInDate else FirstRecievedDate end)
			end) as FirstRecievedDate,

			--subquery : Number of days since first recieved stock
			datediff(Month,(case when FirstRecievedDate is null then FirstAdjustmentInDate else FirstRecievedDate end),getdate()) as FirstRecievedMonths,

			--Stock User Num 2 : Package volume in cm3
			isnull(STK_USRNUM2,0) as CartonVolume,

			isnull(STK_USRNUM3,0) as CartonQty,
			0 as PackageVolume,

			--subquery : Number of distinct customers in last 12 months
			--(select count(distinct DET_ACCOUNT) from SL_PL_NL_DETAIL WHERE DET_ORIGIN='SO' and DET_TYPE='INV' and det_stock_code=STKCODE) as NumCusts12Months,
			isnull(jnNumCusts12Months.NumCusts12Months,0) as NumCusts12Months,

--			--subquery : Percentage top customer of all customers based on quantity
--			round(isnull((select sum(DET_QUANTITY) FROM SL_PL_NL_DETAIL WHERE DET_ORIGIN='SO' and DET_TYPE='INV' and DET_STOCK_CODE=STKCODE and DET_ACCOUNT=
--				(select top 1 DET_ACCOUNT from SL_PL_NL_DETAIL 
--						WHERE DET_ORIGIN='SO' and DET_TYPE='INV' and det_stock_code=STKCODE
--						group by DET_ACCOUNT
--						order by sum(DET_QUANTITY) desc)
--			)
--			/
--			(select sum(DET_QUANTITY) FROM SL_PL_NL_DETAIL WHERE DET_ORIGIN='SO' and DET_TYPE='INV' and DET_STOCK_CODE=STKCODE)
--			,0)*100,2)
--
--			 as TopCust12MonthsPercnt1,

			--TopCustomer12Months,
			TopCustomer12MonthsQty,
			TotalQuantityInv,
			round((case when TotalQuantityInv=0 then 0 else
				(TopCustomer12MonthsQty/TotalQuantityInv) end),2) as TopCust12MonthsPercnt,


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
			isnull(DemandPrevMonth1,0)+isnull(WODemandPrevMonth1,0) as DemandPrevMonth1,

			(DemandPrevWeek4+DemandPrevWeek3+DemandPrevWeek2+DemandPrevWeek1) as Last4Weeks,

			--subquery : Average demand over last 3 months. Full Months only.
--			round((isnull((select sum(OD_QTYORD) FROM ORD_DETAIL 
--				WHERE OD_STOCK_CODE=STKCODE and OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-3)
--					and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-2)),0)+
--			isnull((select sum(OD_QTYORD) FROM ORD_DETAIL 
--				WHERE OD_STOCK_CODE=STKCODE and OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-2)
--					and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-1)),0)+
--			isnull((select sum(OD_QTYORD) FROM ORD_DETAIL 
--				WHERE OD_STOCK_CODE=STKCODE and OD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-1)
--					and OD_DATE<dbo.dhc_getMonthStartDate(getdate(),-0)),0))/3,2) as DemandPrev3MonthAvg,

			round(Avg3Months,2) as Avg3Months,

			--F'cast budgeted sales
			--F'cast modelled sales
			--Model conf- idence
			--Average monthly demand
			--Demand cong-ruence
			--Flagged change demand

			--Lead time (weeks)

			--Replenishment time (weeks) : Supplier record
			--Safety Stock
			--Re-order Level (Calc)

			--Physical Stock (Stock record)
			STK_PHYSICAL as PhysicalStock,

			--Allocated Orders (stock record)
			STK_RESERVE_OUT as AllocatedOrders,

			--Deliveries to Update (stock record)
			STK_QTYPRINTED as DeliveriesToUpdate,

			--Unallocated Orders (stock record)
--			(select sum(OD_QTYORD-OD_QTYRESERVED-OD_QTYDELVD-OD_QTYPRINTED) from ord_detail
--				where OD_STOCK_CODE=STKCODE) as UnallocatedOrders,
			isnull(jnUnallocatedOrders.UnallocatedBackOrders,0) as BackOrders,

			isnull(jnUnallocatedOrders.UnallocatedFutureOrders,0) as FutureOrders,

			--Free Stock (stock record)
			STK_PHYSICAL-STK_RESERVE_OUT-STK_QTYPRINTED-STK_WO_UNALLOC_QUANTITY-isnull(jnUnallocatedOrders.UnallocatedBackOrders,0)-isnull(jnUnallocatedOrders.UnallocatedFutureOrders,0) as FreeStock,

			0 as QuotesInFuture,
			--Receipts in lead time
			(case when PO_Est_Del_Date1<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder1 else 0 end)+
			(case when PO_Est_Del_Date2<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder2 else 0 end)+
			(case when PO_Est_Del_Date3<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder3 else 0 end)+
			(case when PO_Est_Del_Date4<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder4 else 0 end)+
			(case when PO_Est_Del_Date5<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder5 else 0 end)+
			(case when PO_Est_Del_Date6<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder6 else 0 end)+
			(case when PO_Est_Del_Date7<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder7 else 0 end)+
			(case when PO_Est_Del_Date8<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder8 else 0 end)+
			(case when PO_Est_Del_Date9<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder9 else 0 end)+
			(case when PO_Est_Del_Date10<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder10 else 0 end) as ReceiptsInLeadTime,

			--Next 3 Purchase Orders within lead time
			--Qty on Order | PO Number | Est. Delivery Date | Deliv in lead time
			QtyOnOrder1,PO_Number1,PO_Est_Del_Date1,
			QtyOnOrder2,PO_Number2,PO_Est_Del_Date2,
			QtyOnOrder3,PO_Number3,PO_Est_Del_Date3,
			QtyOnOrder4,PO_Number4,PO_Est_Del_Date4,
			QtyOnOrder5,PO_Number5,PO_Est_Del_Date5,
			QtyOnOrder6,PO_Number6,PO_Est_Del_Date6,
			QtyOnOrder7,PO_Number7,PO_Est_Del_Date7,
			QtyOnOrder8,PO_Number8,PO_Est_Del_Date8,
			QtyOnOrder9,PO_Number9,PO_Est_Del_Date9,
			QtyOnOrder10,PO_Number10,PO_Est_Del_Date10,

			(case when PO_Est_Del_Date1<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder1 else null end) as DelivInLeadTime1,
			(case when PO_Est_Del_Date2<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder2 else null end) as DelivInLeadTime2,
			(case when PO_Est_Del_Date3<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder3 else null end) as DelivInLeadTime3,
			(case when PO_Est_Del_Date4<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder4 else null end) as DelivInLeadTime4,
			(case when PO_Est_Del_Date5<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder5 else null end) as DelivInLeadTime5,
			(case when PO_Est_Del_Date6<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder6 else null end) as DelivInLeadTime6,
			(case when PO_Est_Del_Date7<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder7 else null end) as DelivInLeadTime7,
			(case when PO_Est_Del_Date8<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder8 else null end) as DelivInLeadTime8,
			(case when PO_Est_Del_Date9<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder9 else null end) as DelivInLeadTime9,
			(case when PO_Est_Del_Date10<=dateadd(week,LeadTimeWeeks,getdate()) then QtyOnOrder10 else null end) as DelivInLeadTime10,

			--Minimum order quantity
			STK_MIN_ORDER1 as MOQ,

			--Lead time (weeks)
			LeadTimeWeeks,
			--isnull(LeadTimeWeeks,0)/7 as LeadTimeWeeks
			ModelLeadTime as ActualAvgLeadTime,

			(case when isnull(POCount,0)<=1 then 
				null
			else
				datediff(week,FirstPODate,LastPODate)/POCount end) as AvgReplenishmentTime,

			STK_COSTPRICE1 as CostPrice,
			(case when ISNULL(STK_P_CURRCST3,0)<>0 then STK_P_CURRCDE3 when ISNULL(STK_P_CURRCST4,0)<>0 then STK_P_CURRCDE4 else '' END) as LocalCurrencySymbl,
			(case when ISNULL(STK_P_CURRCST3,0)<>0 then STK_P_CURRCST3 when ISNULL(STK_P_CURRCST4,0)<>0 then STK_P_CURRCST4 else 0 END) as LocalCurrencyPrice,
--STK_P_CURRCDE4
--STK_P_CURRCST4,
			0.00 AS StockSellPrice,
			isnull(STK_USRCHAR2,'') as StockClassValue
			

	FROM STK_STOCK WITH (NOLOCK)
		LEFT OUTER JOIN STK_STOCK_2 WITH (NOLOCK) on STKCODE=STKCODE2 
		LEFT OUTER JOIN STK_STOCK3 WITH (NOLOCK) on STKCODE=STKCODE3

		LEFT OUTER JOIN dhc_JCC_MonthlyStockDemandTBL WITH (NOLOCK) on MonthDemandStockCode=STKCODE
		LEFT OUTER JOIN dhc_JCC_WeeklyStockDemandTBL WITH (NOLOCK) on WeekDemandStockCode=STKCODE
		LEFT OUTER JOIN dhc_JCC_MonthlyWorksOrderStockDemandTBL WITH (NOLOCK) on WODemandStockCode=STKCODE

		-- Unallocated orders
		LEFT OUTER JOIN 
		(
			select OD_STOCK_CODE as UnallocStkCode,
				sum(case when OD_DATE<=getdate() then OD_QTYORD-OD_QTYRESERVED-OD_QTYDELVD-OD_QTYPRINTED else 0 end) as UnallocatedBackOrders,
				sum(case when OD_DATE>getdate() then OD_QTYORD-OD_QTYRESERVED-OD_QTYDELVD-OD_QTYPRINTED else 0 end) as UnallocatedFutureOrders
			from ord_detail WITH (NOLOCK) 
			inner join ord_header WITH (NOLOCK) on od_order_number=oh_order_number
			where od_status<>2 and OH_PRIORITY<>4
			group by OD_STOCK_CODE
		) jnUnallocatedOrders on UnallocStkCode=STKCODE

		--Num custs 12 months
		LEFT OUTER JOIN
		(
			select det_stock_code as NumCustsStkCode,count(distinct DET_ACCOUNT) as NumCusts12Months
			from dhc_cons_SL_PL_NL_DETAIL WITH (NOLOCK)
			WHERE DET_ORIGIN='SO' and DET_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12)
			group by det_stock_code
		) jnNumCusts12Months on NumCustsStkCode=STKCODE

		--TOP 3 Purchase orders by date for stock
		LEFT OUTER JOIN
		(
			select 
				POD_STOCK_CODE,
				max(case when PO_Rank=1 then POD_ORDER_NO else null end) as 	PO_Number1,
				max(case when PO_Rank=1 then QTY_OS else null end) as			QtyOnOrder1,
				max(case when PO_Rank=1 then REQDATE else null end) as			PO_Est_Del_Date1,
				max(case when PO_Rank=2 then POD_ORDER_NO else null end) as		PO_Number2,
				max(case when PO_Rank=2 then QTY_OS else null end) as			QtyOnOrder2,
				max(case when PO_Rank=2 then REQDATE else null end) as			PO_Est_Del_Date2,
				max(case when PO_Rank=3 then POD_ORDER_NO else null end) as		PO_Number3,
				max(case when PO_Rank=3 then QTY_OS else null end) as			QtyOnOrder3,
				max(case when PO_Rank=3 then REQDATE else null end) as			PO_Est_Del_Date3,

				max(case when PO_Rank=4 then POD_ORDER_NO else null end) as 	PO_Number4,
				max(case when PO_Rank=4 then QTY_OS else null end) as			QtyOnOrder4,
				max(case when PO_Rank=4 then REQDATE else null end) as			PO_Est_Del_Date4,
				max(case when PO_Rank=5 then POD_ORDER_NO else null end) as		PO_Number5,
				max(case when PO_Rank=5 then QTY_OS else null end) as			QtyOnOrder5,
				max(case when PO_Rank=5 then REQDATE else null end) as			PO_Est_Del_Date5,
				max(case when PO_Rank=6 then POD_ORDER_NO else null end) as		PO_Number6,
				max(case when PO_Rank=6 then QTY_OS else null end) as			QtyOnOrder6,
				max(case when PO_Rank=6 then REQDATE else null end) as			PO_Est_Del_Date6,

				max(case when PO_Rank=7 then POD_ORDER_NO else null end) as 	PO_Number7,
				max(case when PO_Rank=7 then QTY_OS else null end) as			QtyOnOrder7,
				max(case when PO_Rank=7 then REQDATE else null end) as			PO_Est_Del_Date7,
				max(case when PO_Rank=8 then POD_ORDER_NO else null end) as		PO_Number8,
				max(case when PO_Rank=8 then QTY_OS else null end) as			QtyOnOrder8,
				max(case when PO_Rank=8 then REQDATE else null end) as			PO_Est_Del_Date8,
				max(case when PO_Rank=9 then POD_ORDER_NO else null end) as		PO_Number9,
				max(case when PO_Rank=9 then QTY_OS else null end) as			QtyOnOrder9,
				max(case when PO_Rank=9 then REQDATE else null end) as			PO_Est_Del_Date9,
				max(case when PO_Rank=10 then POD_ORDER_NO else null end) as	PO_Number10,
				max(case when PO_Rank=10 then QTY_OS else null end) as			QtyOnOrder10,
				max(case when PO_Rank=10 then REQDATE else null end) as			PO_Est_Del_Date10
			from
			(
				select POD_STOCK_CODE, POD_ORDER_NO, SUM(POD_QTYORD-POD_QTYDELVD) AS QTY_OS, MAX(POD_REQDATE) as REQDATE,
						rank() over (partition by POD_STOCK_CODE order by MAX(POD_REQDATE) asc, POD_ORDER_NO) as PO_Rank
					from
						POP_DETAIL WITH (NOLOCK)
					where POD_ENTRY_TYPE='S'
						and POD_TYPE='O' and POD_STATUS<>2
						and POD_QTYORD-POD_QTYDELVD>0
					GROUP BY
						POD_STOCK_CODE,POD_ORDER_NO
			) a
			where a.PO_Rank <= 10
			group by POD_STOCK_CODE
		) b on POD_STOCK_CODE=STKCODE

		--First recieved dates (Purchases)
		LEFT OUTER JOIN
		(
			select SM_STOCK_CODE, min(sm_date) as FirstRecievedDate
			from
				dhc_cons_STK_MOVEMENTS WITH (NOLOCK)
			where sm_type='P' and SM_STATUS='I' and isnull(sm_batch_flag,0)<>1
			group by SM_STOCK_CODE
		) firstRecP on firstRecP.SM_STOCK_CODE=STKCODE

		--First recieved dates (Adjustments)
		LEFT OUTER JOIN
		(
			select SM_STOCK_CODE, min(sm_date) as FirstAdjustmentInDate
			from
				dhc_cons_STK_MOVEMENTS WITH (NOLOCK)
			where sm_type='A' and SM_STATUS='I' and isnull(sm_batch_flag,0)<>1
			group by SM_STOCK_CODE
		) firstRecA on firstRecA.SM_STOCK_CODE=STKCODE

		--total quantity sold
		LEFT OUTER JOIN
		(
			select DET_STOCK_CODE,sum(case when DET_TYPE='INV' then DET_QUANTITY else -DET_QUANTITY end) as TotalQuantityInv
			from dhc_cons_SL_PL_NL_DETAIL WITH (NOLOCK)
			where DET_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12) and DET_ORIGIN='SO' and isnull(DET_STOCK_CODE,'')<>''
			group by DET_STOCK_CODE
		) d on DET_STOCK_CODE=STKCODE

		--TOP 1 customer by stock record and their quantity
		LEFT OUTER JOIN
		(
			select
				DET_STOCK_CODE,
				max(DET_ACCOUNT) as TopCustomer12Months,
				max(CustomerQty) as TopCustomer12MonthsQty
			from
			(
				select DET_STOCK_CODE,DET_ACCOUNT, sum(case when DET_TYPE='INV' then DET_QUANTITY else -DET_QUANTITY end) as CustomerQty,
						rank() over (partition by DET_STOCK_CODE order by sum(case when DET_TYPE='INV' then DET_QUANTITY else -DET_QUANTITY end) desc) as PO_Rank
					from
						dhc_cons_SL_PL_NL_DETAIL WITH (NOLOCK)
					where DET_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12) and DET_ORIGIN='SO'
						and isnull(DET_STOCK_CODE,'')<>''
					GROUP BY
						DET_STOCK_CODE,DET_ACCOUNT
			) a
			where a.PO_Rank <= 1
			group by DET_STOCK_CODE
		) e on e.DET_STOCK_CODE=STKCODE

		LEFT OUTER JOIN [dhc_JCC_StockLeadTime] WITH (NOLOCK) on LeadTimeStockCode=STKCODE
		LEFT OUTER JOIN [dhc_JCC_SupplyLeadTime] WITH (NOLOCK) on [dhc_JCC_SupplyLeadTime].StockCode=STKCODE

		LEFT OUTER JOIN
		(

			select POD_STOCK_CODE, min(POD_DATE) as FirstPODate, max(POD_DATE) as LastPODate, count(distinct POD_ORDER_NO) POCount
			FROM dhc_cons_POP_DETAIL WITH (NOLOCK)
			WHERE POD_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12) and POD_DATE<dbo.dhc_getMonthStartDate(getdate(),0) 
				and isnull(POD_STOCK_CODE,'')<>''
			group by POD_STOCK_CODE

		) replenishmentTime on replenishmentTime.POD_STOCK_CODE=STKCODE

	WHERE (isnull(STK_USRFLAG1,0) = 0) OR (isnull(STK_PHYSICAL, 0) <> 0) OR (isnull(QtyOnOrder1,0) > 0)


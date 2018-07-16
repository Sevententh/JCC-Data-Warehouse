
CREATE VIEW [dbo].[dhc_JCC_SupplyLeadTime]
AS


	SELECT STKCODE as StockCode,								--Item Number
			isnull(STK_SORT_KEY2,'') as Supplier,				--Supplier
			
			round((case when isnull(stk_usrnum1,0)=0 then 
				isnull(SU_LEAD_TIME,0)
			else isnull(stk_usrnum1,0) end),1) as QuotedLeadTimeWeeks,	-- Stock lead time if available, else supplier lead time
				
			isnull(NumOrders15Months,0) as NumOrders15Months,	--Number of orders last 15 months	
				--PO Number (IGNORE)
				--PO Date (IGNORE)
				--Lead time date (IGNORE)
				--Requested Delivery Date	 (IGNORE)
				--Days over lead time	 (IGNORE)
				--Orginal Confirmed Delivery Date	
				--Expected Date	
				--Actual Delivery Date	
				--Variance to lead time or RDD if > lead	
				--Model lead time
			isnull(DiffBetweenReqDelDays,'') as DiffBetweenReqDelDays,
			isnull(DiffBetweenReqDelDays_SD,'') as DiffBetweenReqDelDays_SD,

			isnull(DiffBetweenReqDelWeeks,'') as DiffBetweenReqDelWeeks,
			isnull(DiffBetweenReqDelWeeks_SD,'') as DiffBetweenReqDelWeeks_SD,

--			isnull(ReqDelDiffMatrixWeeks,0) as ReqDelDiffMatrixWeeks
			(case
				when (isnull(DeliveryCount,0)=0) then
					round(case when isnull(stk_usrnum1,0)=0 then 
						isnull(SU_LEAD_TIME,0)
					else isnull(stk_usrnum1,0) end,1)
				when (isnull(DeliveryCount,0) > 0 and isnull(DeliveryCount,0) < 3) then
					(ReqDelDiffMatrixWeeks+
					round(case when isnull(stk_usrnum1,0)=0 then 
						isnull(SU_LEAD_TIME,0)
					else isnull(stk_usrnum1,0) end,1))/2
				else
					ReqDelDiffMatrixWeeks
			end) as ModelLeadTime,

			isnull(DeliveryCount,0) as DeliveryCount

	FROM STK_STOCK
		LEFT OUTER JOIN STK_STOCK3 on STKCODE=STKCODE3
		LEFT OUTER JOIN PL_ACCOUNTS on SUCODE=isnull(STK_SORT_KEY2,'') and isnull(STK_SORT_KEY2,'')<>''

		LEFT OUTER JOIN
		(
			select POD_STOCK_CODE,count(*) as NumOrders15Months
			FROM dhc_cons_POP_DETAIL
			where pod_date>=dbo.dhc_getMonthStartDate(getdate(),-15) and pod_date<dbo.dhc_getMonthStartDate(getdate(),0)
			group by POD_STOCK_CODE
		) stkPOCount on stkPOCount.POD_STOCK_CODE=STKCODE

		LEFT OUTER JOIN
		(

			select a.DHD_ITEM_CODE,
			
			isnull(avg(

				case when DHD_DATE_REQUIRED>dateadd(day,LeadTimeDays,POH_DATE) then --Confirmed > Lead	
					(case when DHH_DATE_UPDATED<DHD_DATE_REQUIRED then					--Early Delivery
						LeadTimeDays
					when DHH_DATE_UPDATED=DHD_DATE_REQUIRED then					--On-time Delivery
						LeadTimeDays+datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)
					when DHH_DATE_UPDATED>DHD_DATE_REQUIRED then					--Late Delivery
						LeadTimeDays+datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)
					end)

				when DHD_DATE_REQUIRED=dateadd(day,LeadTimeDays,POH_DATE) then --Confirmed = Lead	
					(case when DHH_DATE_UPDATED<DHD_DATE_REQUIRED then					--Early Delivery
						LeadTimeDays+datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)
					when DHH_DATE_UPDATED=DHD_DATE_REQUIRED then					--On-time Delivery
						LeadTimeDays+datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)
					when DHH_DATE_UPDATED>DHD_DATE_REQUIRED then					--Late Delivery
						LeadTimeDays+datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)
					end)

				when DHD_DATE_REQUIRED<dateadd(day,LeadTimeDays,POH_DATE) then --Confirmed < Lead	
					(case when DHH_DATE_UPDATED<DHD_DATE_REQUIRED then					--Early Delivery
						LeadTimeDays+datediff(day,dateadd(day,LeadTimeDays,POH_DATE),DHH_DATE_UPDATED)
					when DHH_DATE_UPDATED=DHD_DATE_REQUIRED then					--On-time Delivery
						LeadTimeDays+datediff(day,dateadd(day,LeadTimeDays,POH_DATE),DHH_DATE_UPDATED)
					when DHH_DATE_UPDATED>DHD_DATE_REQUIRED then					--Late Delivery
						LeadTimeDays+datediff(day,dateadd(day,LeadTimeDays,POH_DATE),DHH_DATE_UPDATED)
					end)

				end
			),0)/7 ReqDelDiffMatrixWeeks,

			avg(datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)) as DiffBetweenReqDelDays,

			round(stdev(datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)),2) as DiffBetweenReqDelDays_SD,
			
			avg(datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)/7) as DiffBetweenReqDelWeeks,

			round(stdev(datediff(day,DHD_DATE_REQUIRED,DHH_DATE_UPDATED)/7),2) as DiffBetweenReqDelWeeks_SD

			from
			(
				select DHD_DATE_REQUIRED,DHD_ITEM_CODE,DHH_DATE_UPDATED,POH_DATE from dhc_cons_po_lead_times
			) a

			inner join [dhc_JCC_StockLeadTime] on a.DHD_ITEM_CODE=LeadTimeStockCode
			where DHD_DATE_REQUIRED is not null and DHH_DATE_UPDATED is not null
			group by a.DHD_ITEM_CODE

		) poDeliveries on DHD_ITEM_CODE=STKCODE

		left outer join
		(
			select DHD_ITEM_CODE,count(*) as DeliveryCount
			from dhc_cons_po_lead_times
			group by DHD_ITEM_CODE

		) b on b.DHD_ITEM_CODE=STKCODE

	where isnull(STKNAME,'')<>'DISCONTINUED'

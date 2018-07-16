
create view dhc_cons_po_lead_times
as

	select DHD_DATE_REQUIRED,DHD_ITEM_CODE,DHH_DATE_UPDATED,POH_DATE from dhc_JCC_HistoricalPODates
	
	union all
	
	select (case when PDR_FIRST_REQ_DATE is not null then 
		PDR_FIRST_REQ_DATE
	else
		(case when POH_REQUIRED is not null then
			POH_REQUIRED 
		else
			DHD_DATE_REQUIRED
		end)	 
	end) as DHD_DATE_REQUIRED,DHD_ITEM_CODE,DHH_DATE_UPDATED,POH_DATE
	from sys_del_history_detail with (nolock)
		inner join SYS_DEL_HISTORY_HEADER with (nolock) on dhd_header_link=dhh_primary
		inner join pop_detail with (nolock) on dhd_orderline_link=pod_primary
		inner join POP_HEADER with (nolock) on DHH_ORDER_NO=POH_ORDER_NUMBR
		left outer join dhc_JCC_PO_Detail_ReqDate with (nolock) on PDR_POD_PRIMARY=pod_primary
	where dhd_product_type='S' and DHH_ORIGIN='POO'


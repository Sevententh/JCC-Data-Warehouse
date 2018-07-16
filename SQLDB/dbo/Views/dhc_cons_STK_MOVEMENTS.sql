
create view dhc_cons_STK_MOVEMENTS
as
	select 
		SM_PRIMARY,SM_DATE,SM_STATUS,SM_STOCK_CODE,SM_ORIGIN,SM_QUANTITY,SM_TYPE,SM_BATCH_FLAG
	from STK_MOVEMENTS with (nolock)
	
	union all
	
	select 
		SM_PRIMARY,SM_DATE,SM_STATUS collate Latin1_General_CI_AS,
		SM_STOCK_CODE collate Latin1_General_CI_AS,
		SM_ORIGIN collate Latin1_General_CI_AS,
		SM_QUANTITY,
		SM_TYPE collate Latin1_General_CI_AS,
		SM_BATCH_FLAG
	from JCC_HISTORICAL.dbo.STK_MOVEMENTS with (nolock)

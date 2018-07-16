
create view dhc_cons_POP_DETAIL
as
	select POD_PRIMARY, POD_STOCK_CODE, POD_QTYORD, POD_DATE, POD_ORDER_NO from POP_DETAIL with (nolock)
	
	union all
	
	select 
		POD_PRIMARY,
		POD_STOCK_CODE collate Latin1_General_CI_AS,
		POD_QTYORD,POD_DATE,
		POD_ORDER_NO collate Latin1_General_CI_AS
	from JCC_HISTORICAL.dbo.POP_DETAIL with (nolock)


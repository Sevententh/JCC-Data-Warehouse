
create view dhc_cons_SL_PL_NL_DETAIL
as
	select DET_STOCK_CODE,DET_QUANTITY,DET_ORIGIN,DET_DATE,DET_TYPE,DET_ACCOUNT
	from SL_PL_NL_DETAIL
	
	union all
	
	select
		DET_STOCK_CODE collate Latin1_General_CI_AS,
		DET_QUANTITY,DET_ORIGIN collate Latin1_General_CI_AS,
		DET_DATE,
		DET_TYPE collate Latin1_General_CI_AS,
		DET_ACCOUNT collate Latin1_General_CI_AS
	from JCC_HISTORICAL.dbo.SL_PL_NL_DETAIL

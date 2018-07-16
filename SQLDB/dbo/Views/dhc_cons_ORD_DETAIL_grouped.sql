
create view dhc_cons_ORD_DETAIL_grouped
as
	select OD_STOCK_CODE,OD_DATE,OD_TYPE,sum(OD_QTYORD) as OD_QTYORD,SUM(OD_NETT) as OD_NETT
	from
	(
		select OD_STOCK_CODE,OD_DATE,OD_TYPE,OD_QTYORD,OD_NETT from ORD_DETAIL with (nolock)
		
		union all
		
		select 
			OD_STOCK_CODE collate Latin1_General_CI_AS,OD_DATE,
			OD_TYPE collate Latin1_General_CI_AS,OD_QTYORD,OD_NETT
		from JCC_HISTORICAL.dbo.ORD_DETAIL with (nolock)
	) a
	group by OD_STOCK_CODE,OD_DATE,OD_TYPE


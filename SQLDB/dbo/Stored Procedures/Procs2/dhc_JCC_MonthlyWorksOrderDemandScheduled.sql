
CREATE PROCEDURE dhc_JCC_MonthlyWorksOrderDemandScheduled
AS
BEGIN

	if (select count(*) from dbo.sysobjects where id = object_id(N'[dbo].[dhc_JCC_MonthlyWorksOrderStockDemandTBL]')) > 0
		drop table dhc_JCC_MonthlyWorksOrderStockDemandTBL

	select *
	into dhc_JCC_MonthlyWorksOrderStockDemandTBL
	from dhc_JCC_MonthlyWorksOrderStockDemand
	order by WODemandStockCode

	IF EXISTS (SELECT name FROM sysindexes 
			WHERE name = 'x_MonthWODemandStockCode')
		DROP INDEX dhc_JCC_MonthlyWorksOrderStockDemandTBL.x_MonthWODemandStockCode

	CREATE INDEX x_MonthWODemandStockCode
	ON dhc_JCC_MonthlyWorksOrderStockDemandTBL (WODemandStockCode)

end


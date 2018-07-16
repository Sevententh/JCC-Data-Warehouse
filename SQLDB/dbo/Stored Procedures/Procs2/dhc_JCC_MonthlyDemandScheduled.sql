
CREATE PROCEDURE dhc_JCC_MonthlyDemandScheduled
AS
BEGIN

	if (select count(*) from dbo.sysobjects where id = object_id(N'[dbo].[dhc_JCC_MonthlyStockDemandTBL]')) > 0
		drop table dhc_JCC_MonthlyStockDemandTBL

	select *
	into dhc_JCC_MonthlyStockDemandTBL
	from dhc_JCC_MonthlyStockDemand

	IF EXISTS (SELECT name FROM sysindexes 
			WHERE name = 'x_MonthDemandStockCode')
		DROP INDEX dhc_JCC_MonthlyStockDemandTBL.x_MonthDemandStockCode

	CREATE INDEX x_MonthDemandStockCode
	ON dhc_JCC_MonthlyStockDemandTBL (MonthDemandStockCode)

end


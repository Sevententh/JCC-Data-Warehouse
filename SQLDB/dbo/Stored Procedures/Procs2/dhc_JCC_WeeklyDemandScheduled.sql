
CREATE PROCEDURE dhc_JCC_WeeklyDemandScheduled
AS
BEGIN

	if (select count(*) from dbo.sysobjects where id = object_id(N'[dbo].[dhc_JCC_WeeklyStockDemandTBL]')) > 0
		drop table dhc_JCC_WeeklyStockDemandTBL

	select *
	into dhc_JCC_WeeklyStockDemandTBL
	from dhc_JCC_WeeklyStockDemand

	IF EXISTS (SELECT name FROM sysindexes 
			WHERE name = 'x_WeekDemandStockCode')
		DROP INDEX dhc_JCC_WeeklyStockDemandTBL.x_WeekDemandStockCode

	CREATE INDEX x_WeekDemandStockCode
	ON dhc_JCC_WeeklyStockDemandTBL (WeekDemandStockCode)

end


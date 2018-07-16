
CREATE PROCEDURE dhc_JCC_WeeklyDemandByWeekScheduled
AS
BEGIN

	if (select count(*) from dbo.sysobjects where id = object_id(N'[dbo].[dhc_JCC_WeeklyDemandByWeekTBL]')) > 0
		drop table dhc_JCC_WeeklyDemandByWeekTBL

	select *
	into dhc_JCC_WeeklyDemandByWeekTBL
	from dhc_JCC_WeeklyStockDemandPerWeek

	IF EXISTS (SELECT name FROM sysindexes 
			WHERE name = 'x_WeekDemandPWStockCode')
		DROP INDEX dhc_JCC_WeeklyDemandByWeekTBL.x_WeekDemandPWStockCode

	CREATE INDEX x_WeekDemandPWStockCode
	ON dhc_JCC_WeeklyDemandByWeekTBL (WeekDemandPWStockCode)

end


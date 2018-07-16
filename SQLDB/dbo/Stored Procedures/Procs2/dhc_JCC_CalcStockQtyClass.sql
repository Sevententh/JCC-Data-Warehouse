





CREATE PROCEDURE [dbo].[dhc_JCC_CalcStockQtyClass]
AS
BEGIN

	set nocount on

		-- Create table with our numbers
	declare @table table (tblPrimary int, StockTypeCode varchar(3), DemandPercent float)


   -- Previous percentages per classification:
	-- A = top 50%
	-- B = next 30%
	-- C = next 19%
	-- D = next 1%
	-- E = next 0%
	
	--insert into @table (tblPrimary,StockTypeCode,DemandPercent)
	--	select 1,'A', 0.5 union all
	--	select 2,'B', 0.80 union all
	--	select 3,'C', 0.99 union all
	--	select 4,'D', 1 union all
	--	select 5,'E', 1.01 --??
	
	-- New percentages per classification (as of 10/06/2014):
	-- A = top 60%
	-- B = next 30%
	-- C = next 10%
	-- N = New (Stock Lines with less than 6 months history).
	
	insert into @table (tblPrimary,StockTypeCode,DemandPercent)
		select 1,'A', 0.6 union all
		select 2,'B', 0.90 union all
		select 3,'C', 1 union all
		select 4,'D', 1.01 union all
		select 5,'E', 1.02 --??

		--N = New (Stock Lines with less than 6 months history).

	declare @now datetime, @dateIndexPrim int
	set @now=getdate()

	insert into dhc_tbl_JCC_StockClassHistoryDates(JSCD_DATE,JSCD_DATEINDEX,JSCD_TYPE)
		values(@now,0,'Q')

	select top 1 @dateIndexPrim=JSCD_PRIMARY from dhc_tbl_JCC_StockClassHistoryDates where JSCD_DATEINDEX=0 and JSCD_TYPE='Q'

	update dhc_tbl_JCC_StockClassHistoryDates 
	set JSCD_DATEINDEX=JSCD_DATEINDEX+1
	where JSCD_DATEINDEX<12 and JSCD_TYPE='Q'


	-- get demand by stock record for last 12 months into temp table ordered by annual demand qty desc
	SELECT 
		b.StockCode as StockCode,
		ISNULL(CASE WHEN DBO.DHC_GETDATEDIFF(c.FirstRecievedDate)> 12 THEN 
			AnnualDemand 
		ELSE 
			CASE WHEN DBO.DHC_GETDATEDIFF(c.FirstRecievedDate)= 0 THEN
				0 
			ELSE
				ROUND((cast(AnnualDemand as float)/DBO.DHC_GETDATEDIFF(c.FirstRecievedDate)) * 12,2)
			END 
		END,0) as AnnualDemand,
		c.FirstRecievedDate as FirstRecievedDate,
		Discontinued,
		BackOrder
	into #tempJCCStockTypes
	FROM
	(
		SELECT STKCODE as StockCode,
			isnull(sum(case 
				when SM_DATE is null then 
					0
				when SM_DATE>=dbo.dhc_getMonthStartDate(getdate(),-12) and SM_DATE<dbo.dhc_getMonthStartDate(getdate(),0) then 
					1
				else 
					0 
			end),0) as AnnualDemand,
			isnull(STK_USRFLAG1,0) as Discontinued,
			isnull(STK_USRFLAG2,0) as BackOrder
		FROM STK_STOCK with (nolock)
			left outer join STK_STOCK3 with (nolock) on STKCODE=STKCODE3
			left outer join dhc_cons_STK_MOVEMENTS with (nolock) on SM_STOCK_CODE=STKCODE and (SM_TYPE='S' OR (SM_TYPE='A' and SM_ORIGIN='W')) and SM_STATUS='O'
		GROUP BY STKCODE,isnull(STK_USRFLAG1,0), isnull(STK_USRFLAG2,0)
	) b
	left outer join [dhc_JCC_PurchasingModelMain] c with (nolock) on c.StockCode=b.StockCode
	order by AnnualDemand desc
	
	 --get total demand OLD
      declare @totalDemand float
      select @totalDemand=sum(AnnualDemand) from #tempJCCStockTypes
            where Discontinued<>1 and BackOrder <> 1 and (FirstRecievedDate is not null and not (datediff(month,FirstRecievedDate,@now)<6))

      declare @stockCode varchar(25), @stockDemand float, @cumulativeDemand float,@stockTypeCode varchar(3), @firstRecDate datetime
      set @cumulativeDemand = 0

      declare @discontinuedFlag bit, @backorderFlag bit
      
      ---- get total demand
      --declare @totalDemand float
      --select @totalDemand=sum(AnnualDemand) from #tempJCCStockTypes
      --      where Discontinued<>1 and BackOrder <> 1 and (FirstRecievedDate is not null and not (datediff(day,FirstRecievedDate,@now)<180))

      --declare @stockCode varchar(25), @stockDemand float, @cumulativeDemand float,@stockTypeCode varchar(3), @firstRecDate datetime
      --set @cumulativeDemand = 0

      --declare @discontinuedFlag bit, @backorderFlag bit

	
	-- go through table and add up, when get to 50% of total, change to B, etc
	declare stockType insensitive cursor for
		select StockCode,AnnualDemand,FirstRecievedDate,Discontinued,BackOrder from #tempJCCStockTypes order by AnnualDemand desc

	open stockType
	fetch next from stockType into @stockCode,@stockDemand,@firstRecDate,@discontinuedFlag,@backorderFlag

	while @@fetch_status=0
	begin

		if (@discontinuedFlag = 1)
			set @stockTypeCode = 'X'
		else if (@backorderFlag = 1)
			set @stockTypeCode = 'E'
		else if (@firstRecDate is null)
			set @stockTypeCode = 'N'
		else if (datediff(month,@firstRecDate,@now)<6)
			set @stockTypeCode = 'N'
		else
		begin
			-- increase cumulative demand
			set @cumulativeDemand=round(@cumulativeDemand+@stockDemand,2)

			--find the group that this stock record fits into
			select top 1 @stockTypeCode=StockTypeCode from @table where DemandPercent >= round(@cumulativeDemand/@totalDemand,2)
				order by tblPrimary

			--select @stockCode as StkCode,@stockDemand as StkDemand,@cumulativeDemand CumDemand,@stockTypeCode TypeCode
			--print 'StockCode: ' + @stockCode + ' / cumDemand: ' + cast(@cumulativeDemand as varchar(30)) + ' / Stock Type: ' + @stockTypeCode
			
			-- if for some reason we had a bit of a problem rounding and were over the top percentage, take the biggest one.
			if isnull(@stockTypeCode,'')=''
			begin
				select top 1 @stockTypeCode=StockTypeCode from @table
					order by DemandPercent desc
			
			end

		end


		--if (@stockDemand=0)
		--	print 'demand is 0'

		--print 'StockCode: '+@stockCode + ' / cumDemand: ' +cast(@cumulativeDemand as varchar(20)) + ' / Stock Type: ' + @stockTypeCode
		
		declare @c int
		select @c = count(*) from stk_stock3 where stkcode3=@stockCode

		--check if stk_stock3 record exists and update as necessary
		if (@c=0)
			insert into stk_stock3 (stkcode3,STK_USRCHAR5) values(@stockCode,@stockTypeCode)
		else
			update stk_stock3 set STK_USRCHAR5=@stockTypeCode where STKCODE3=@stockCode

		insert into dhc_tbl_JCC_StockClassHistory (JSCH_STOCKCODE,JSCH_CLASSIFICATION,JSCH_DATEINDEX_LINK,JSCH_TRANS_FREQ) 
			values(@stockCode,@stockTypeCode,@dateIndexPrim,@stockDemand)		

		fetch next from stockType into @stockCode,@stockDemand,@firstRecDate,@discontinuedFlag,@backorderFlag
	end

	close stockType
	deallocate stockType

END







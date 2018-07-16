

-- =============================================
-- Author:		Paul Gunn	
-- Create date: 17 July 2008
-- Description:	This routine handles the Cross account allocations.
-- =============================================
CREATE PROCEDURE [dbo].[dhc_CrossAccount]
@StatementAccount varchar(25), @UserID varchar(4)
AS
BEGIN
	SET NOCOUNT ON;

	declare @Period int, 
			@year int,
			@AllocRef int, 
			@BLK_TRAN_PRIM int,
			@BLK_UNALLOCFLAG int, 
			@BLK_TRAN_VALUE float, 
			@BLK_TRAN_CUST varchar(25), 
			@SalesPeriod int, 
			@Salesyear varchar(5),
			@Salesyear_Link smallint,
			@allocPD int, 
			@AllocPDYear int, 
			@AllocPDPeriod int, 
			@dVal float, 
			@unalloc Float, 
			@ToOADate int, 
			@HeaderKey varchar(50),
			@BLK_TRAN_TYPE varchar(50)

	set @ToOADate = (convert(int, getdate()) - 2) * -1

	SELECT @AllocRef = allocat_ref from sys_datainfo

	set @AllocRef = @AllocRef + 1

	update sys_datainfo set allocat_ref = @AllocRef

	SELECT @SalesPeriod = sales_period from sys_datainfo

	select @Salesyear = sales_updteyear from sys_datainfo
	select @Salesyear_Link = YEAR_PRIMARY from SYS_YEAR WHERE YEAR_COSTING_CODE = @Salesyear
	
	set @AllocPDYear =
      CASE @Salesyear
         When 'N' then  0 
         when 'C' then 13 
         when 'L' then  26
      END

	set @AllocPDPeriod = 
      CASE @SalesPeriod
			when 13 then 1
            when 12 THEN 2
            when 11 then 3
            when 10 then 4
            when 9 then 5
            when 8 then 6
            when 7 then 7
            when 6 then 8
            when 5 then 9
            when 4 then 10
            when 3 then 11
            when 2 then 12
            when 1 then 13
      END

	set @allocPD = (@AllocPDYear + @AllocPDPeriod)
	
	DECLARE BulkReceipts CURSOR FOR SELECT BLK_TRAN_PRIM, BLK_UNALLOCFLAG, BLK_TRAN_VALUE, BLK_TRAN_CUST, BLK_TRAN_TYPE from dhc_bulk_receipts where blk_user_putin = @userid

	OPEN BulkReceipts

	-- get the first record
	FETCH NEXT FROM BulkReceipts INTO @BLK_TRAN_PRIM, @BLK_UNALLOCFLAG, @BLK_TRAN_VALUE, @BLK_TRAN_CUST, @BLK_TRAN_TYPE

	-- stay in the loop while there are still records
	WHILE (@@FETCH_STATUS = 0)
		begin

		set @headerkey = 'S' + convert(varchar(20),@BLK_TRAN_PRIM)


		set @dVal = round((@BLK_TRAN_VALUE * -1),2)


		if @BLK_UNALLOCFLAG <> -1
			begin
				select @unalloc = round(st_unallocated,2) from sl_transactions  WHERE ST_PRIMARY =  @BLK_TRAN_PRIM

				if round((@unalloc - @dVal),2) = 0.0 
					begin
						update sl_transactions set st_unallocated = 0, st_aloc_pointer = '1' + @BLK_TRAN_CUST,
							   ST_ALLOC_USER1 = @userid, ST_ALLOC_DATE1 = getdate(), ST_ALLOC_REF1 = @AllocRef, 
							   ST_ALLOC_PERIOD = @SalesPeriod, ST_ALLOC_YEAR = @Salesyear, ST_ALLOC_YEAR_LINK = @Salesyear_Link
							   WHERE ST_PRIMARY = @BLK_TRAN_PRIM
					end	
				else
					begin

					IF @BLK_TRAN_TYPE = 'INV' OR @BLK_TRAN_TYPE = 'ADR'
						BEGIN
							SET @dVal = @dVal * -1		
						END

                        update sl_transactions set st_unallocated = st_unallocated - @dVal, st_aloc_pointer = '0' + @BLK_TRAN_CUST,
							   ST_ALLOC_USER1 = @userid, ST_ALLOC_DATE1 = getdate(), ST_ALLOC_REF1 = @AllocRef, 
							   ST_ALLOC_PERIOD = @SalesPeriod, ST_ALLOC_YEAR = @salesYear, ST_ALLOC_YEAR_LINK = @Salesyear_Link
							   WHERE ST_PRIMARY = @BLK_TRAN_PRIM


					IF @BLK_TRAN_TYPE = 'INV' OR @BLK_TRAN_TYPE = 'ADR'
						BEGIN
							SET @dVal = @dVal * -1		
						END
                        
					end

				update SL_ALLOC_HISTORY set S_AL_FULLALLOC_PD = @allocpd , S_AL_FULLALLOC_DATE = @ToOADate
                where s_al_header_key = @headerkey

				insert into SL_ALLOC_HISTORY (S_AL_DATE, S_AL_PERIOD, S_AL_YEAR, S_AL_YEAR_LINK, S_AL_VALUE_HOME, S_AL_VALUE_CURR, S_AL_REFERENCE, S_AL_HEADER_KEY, S_AL_USER_ID, S_AL_ACCOUNT_CODE, S_AL_FULLALLOC_PD, S_AL_FULLALLOC_DATE)
                VALUES(GETDATE(),@salesPeriod, @salesYear, @Salesyear_Link, @dVal , 0, @AllocRef , @headerkey, @UserID , @StatementAccount,@allocpd, @ToOADate)

			end
		else
			begin

				IF @BLK_TRAN_TYPE = 'INV' OR @BLK_TRAN_TYPE = 'ADR'
						BEGIN
							SET @dVal = @dVal * -1		
						END

                update sl_transactions set st_unallocated =  @dVal , ST_ALLOC_USER1 = @userid, st_aloc_pointer = '0' + @BLK_TRAN_CUST,
				ST_ALLOC_DATE1 = getdate(), ST_ALLOC_REF1 = @AllocRef, ST_ALLOC_PERIOD = @SalesPeriod,
				ST_ALLOC_YEAR = @salesYear, ST_ALLOC_YEAR_LINK = @Salesyear_Link
                WHERE ST_PRIMARY = @BLK_TRAN_PRIM
                
                update SL_ALLOC_HISTORY set S_AL_FULLALLOC_PD = @allocpd, S_AL_FULLALLOC_DATE = @ToOADate
                where s_al_header_key = @headerkey

--				IF @BLK_TRAN_TYPE = 'PAY' OR @BLK_TRAN_TYPE = 'ADR' OR @BLK_TRAN_TYPE = 'CRN' 
--					BEGIN
--						SET @dVal = @dVal * -1		
--					END

                insert into SL_ALLOC_HISTORY (S_AL_DATE, S_AL_PERIOD, S_AL_YEAR, S_AL_YEAR_LINK, S_AL_VALUE_HOME, S_AL_VALUE_CURR, S_AL_REFERENCE, S_AL_HEADER_KEY, S_AL_USER_ID, S_AL_ACCOUNT_CODE, S_AL_FULLALLOC_PD, S_AL_FULLALLOC_DATE)
                VALUES(GETDATE(),@SalesPeriod, @salesYear, @Salesyear_Link, @dVal, 0,@AllocRef,@headerkey,@UserID, @StatementAccount,@allocpd,@ToOADate)

			end

			declare @pos float
		    select @pos = isnull(sum(ST_UNALLOCATED),0) from sl_transactions where st_copycust = @BLK_TRAN_CUST and (st_TRANTYPE = 'INV' OR st_TRANTYPE = 'ADR')
            
			declare @neg float
            select @neg = isnull(sum(ST_UNALLOCATED),0) from sl_transactions where st_copycust = @BLK_TRAN_CUST and (st_TRANTYPE = 'CRN' OR st_copycust = @BLK_TRAN_CUST and st_TRANTYPE = 'ACR' OR st_copycust = @BLK_TRAN_CUST and st_TRANTYPE = 'PAY')

			declare @Bal float
            set @bal = (@pos - @neg)

            update SL_ACCOUNTS set CUBALANCE = @bal where cucode = @BLK_TRAN_CUST
					
			FETCH NEXT FROM BulkReceipts INTO @BLK_TRAN_PRIM, @BLK_UNALLOCFLAG, @BLK_TRAN_VALUE, @BLK_TRAN_CUST, @BLK_TRAN_TYPE
		end
	CLOSE BulkReceipts
	DEALLOCATE BulkReceipts
	
	
	
	update sl_transactions
	set st_unallocated = round(st_unallocated ,2)
	where ST_PRIMARY in (select BLK_TRAN_PRIM from dhc_bulk_Receipts where blk_user_putin = @userid)
	
	update sl_transactions set ST_ALOC_POINTER = '1' + ST_COPYCUST 
	where ST_PRIMARY in (select BLK_TRAN_PRIM from dhc_bulk_Receipts where blk_user_putin = @userid)
	and ST_UNALLOCATED = 0 and ST_ALOC_POINTER like '0%'
	
END


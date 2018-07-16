

-- PG27 Feb 2008

CREATE PROCEDURE [dbo].[DHC_BULK_RECEIPTS_POST]

--@Date as datetime, 
@HeaderRef as varchar(10),
@Subledger as varchar(10),
--@CurrCode as varchar(4),
--@Analysis as varchar(10),
--@BatchID as int,
@Date as datetime,
@Bank as varchar(10),
@UserID as varchar(10),
@NegativePay as bit,
@Deallocation as bit,
@ST_PRIMARY_OUT float = null out

AS
/*
=====================================================================
   Object Name:      DHC_BULK_RECEIPTS_POST
   Author:           PG27
   Create Date:      Feb 2008
   Description:      Post Bulk Receipts for non-cross-account allocations

   Version History:
                     : v1 - Initial Version
   14 Aug 2014 SM    : v1.1 - add round function with values as floats causing rounding issues

======================================================================
*/

if @Bank=''
set @Bank=null

declare @PostVal float,@CustCode as varchar(10),@Type as varchar(4),@LineNo as int,
@LS_Sequence_No float,
@LS_Header_Primary float,
@LS_Header_Key varchar(10)


set @LineNo=1

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--create cursor and loop through each line and new line = new customer
declare bulkCustSelect cursor for
SELECT     BLK_TRAN_CUST, SUM(round(BLK_TRAN_VALUE,2)) FROM DHC_BULK_RECEIPTS where blk_user_putin=@UserID
GROUP BY BLK_TRAN_CUST

open bulkCustSelect
fetch next from bulkCustSelect
into @CustCode,@PostVal

while @@fetch_status=0

begin

--------------------------------------------------------------------------------------------

	--check type of transaction to post
	if @PostVal<0
	begin
	set @PostVal=0-@PostVal
	set @Type='PAY'
	end
	else
	begin
	set @Type = 'PAY'
	end

	/**
	select unique ref from sys seq control add to header ref on insert
	after insert do lookup to return the primary for allocation
	insert both invoice and new payment info into the sl_alloc_temp
	call stored proc and refernce the transactions within the alloc temp table
	**/

	exec AA_GET_SEQUENCE_NO_S 'SL_TRAN_ID', 1, @LS_Sequence_No OUT

	--remove any failed transactions
	delete from SL_TRN_TEMP where SL_STATUS_TEMP = @LS_Sequence_No

	--get unqiue reference from sys_seq so we look the transaction up after its posted

	if @PostVal<>0
	begin

		--insert transaction
		begin
		
		declare @PayPostVal float

		if @NegativePay=1
		set @PayPostVal = @PostVal*-1
		else
		set @PayPostVal = @PostVal

		insert into SL_TRN_TEMP
		(SL_TRAN_ID,SL_DETAIL_LINE_NO,SL_STATUS_TEMP,SL_USE_DEFAULT,SL_USER_ID,SL_MODULE,SL_TRANSACTION_TYPE,SL_CUSTOMER_CODE,SL_SUBLEDGER_CODE,SL_CURRENCY_TYPE,SL_CURRENCYCODE,SL_CURRENCYSYMBOL,SL_CURRENCY_RATE,SL_EURO_HOME_RATE,SL_BASE2_RATE,SL_CURRENCY_RATE_CHNGED,SL_EURO_HOME_RATE_CHNGED,SL_BASE2_RATE_CHNGED,SL_EC_DELIVERY_TERMS,SL_EC_TRAN_NATURE,SL_EC_TRANSPORTATN_MODE,SL_TRAN_REFERENCE,SL_BATCH_REFERENCE,SL_TRAN_DATE,SL_TRAN_YEAR,SL_TRAN_PERIOD,SL_DUE_DATE,SL_ANTICIPATED_PAY_DATE,SL_TRAN_DESCRIPTION,SL_DETAIL_ANALYSIS_CODE,SL_DETAIL_VATCODE,SL_DETAIL_HOME_VALUE,SL_DETAIL_HOME_TAX,SL_DETAIL_CURR_GROSS,SL_DETAIL_CURR_TAX,SL_DETAIL_BASE2_GROSS,SL_DETAIL_BASE2_TAX,SL_DETAIL_COSTHEADER,SL_DETAIL_COSTCENTRE,SL_DETAIL_DESCRIPTION,SL_DETAIL_DIMENSION1,SL_DETAIL_DIMENSION2,SL_DETAIL_DIMENSION3,SL_DISPUTED_FLAG,SL_SETTLE_DISCOUNT_1,SL_SETTLE_DAYS_1,SL_SETTLE_DISCOUNT_2,SL_SETTLE_DAYS2,SL_ARCHIVE_FLAG,SL_DO_NOT_BATCH,SL_HOME_GROSS_ENTRY_MODE,SL_CURRENCY_ENTRY_MODE,SL_SOURCE,SL_DETAIL_PRIMARY,SL_ENTER_DUE_RECEIPT_DATE,SL_DELETE_DETAIL_LINE,SL_HEADER_USER_CHAR1,SL_HEADER_USER_CHAR2,SL_HEADER_USER_CHAR3,SL_HEADER_USER_CHAR4,SL_HEADER_USER_FLAG1,SL_HEADER_USER_FLAG2,SL_HEADER_USER_DATE1,SL_HEADER_USER_DATE2,SL_HEADER_USER_NUMBER1,SL_HEADER_USER_NUMBER2,SL_DETAIL_USER_CHAR1,SL_DETAIL_USER_CHAR2,SL_DETAIL_USER_CHAR3,SL_DETAIL_USER_CHAR4,SL_DETAIL_USER_FLAG1,SL_DETAIL_USER_FLAG2,SL_DETAIL_USER_DATE1,SL_DETAIL_USER_DATE2,SL_DETAIL_USER_NUMBER1,SL_DETAIL_USER_NUMBER2,SL_TRAN_OPTIONS,SL_HEADER_PRIMARY)
		values(@LS_Sequence_No,1,0,null,@UserID,null,@Type,@CustCode,@Subledger,null,null,null,null,null,null,null,null,null,null,null,null,@HeaderRef,null,@Date,null,null,null,null,null,@Bank,null,@PayPostVal,0,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null)
		end

		--validate and post
		EXEC AA_PROCESS_SL_TRN_TEMP_S
			@PS_TRN_TEMP_ID = @LS_Sequence_No,
			@PS_USER_ID = @UserID,
			@PS_Proccess_Status = 2,
			@PS_Header_Primary = @LS_Header_Primary OUTPUT,
			@PS_Header_Key = @LS_Header_Key OUTPUT

		if isnull(@LS_Header_Primary,0)=0
		return

		-- update user id
		update sl_transactions set ST_USER_PUTIN=@UserID where st_primary=@LS_Header_Primary

		--now insert the allocation difference into DHC_BULK_RECEIPTS table for allocation
--		begin
--		insert into DHC_BULK_RECEIPTS(BLK_TRAN_CUST,BLK_TRAN_PRIM,BLK_TRAN_VALUE,BLK_USER_PUTIN,BLK_ALLOC_DIFF)
--		values(@CustCode,@LS_Header_Primary,@PayPostVal,@UserID,1)
--		end
-- Taken out - PG 27 Feb 2007

	end

	select @ST_PRIMARY_OUT = @LS_Header_Primary

	--now insert transaction primaries into allocation table
	declare
	@Primary as int,
	--@CurrCode as varchar(4),
	@Value float,
	@BLK_ALLOC_DIFF int


	--select the allocation values from DHC_BULK_RECEIPTS table
	declare bulkSelect cursor for
	select round(blk_tran_value,2),blk_tran_cust,blk_tran_prim,BLK_ALLOC_DIFF from DHC_BULK_RECEIPTS where blk_user_putin=@UserID and blk_tran_cust=@CustCode

	open bulkSelect
	fetch next from bulkSelect
	into @Value,@CustCode,@Primary,@BLK_ALLOC_DIFF

	while @@fetch_status=0

	begin

	set @LineNo=@LineNo+1

	--reverse sign
	if @BLK_ALLOC_DIFF=0
	begin
	if @Value<0
	set @Value=@Value*-1
	end

 	--lookup sign of transactions
	if (select top 1 st_gross from sl_transactions where st_primary=@Primary)<0
	if @Value>0 -- reverse sign
	set @Value=@Value*-1

  	insert into SL_ALLOCATION_TEMP(SL_AL_ID,SL_AL_LINE_NUMBER,SL_AL_STATUS,SL_AL_PRIMARY,SL_AL_USER_ID,SL_AL_CURRENCY_SYMBOL,SL_AL_VALUE,SL_AL_DISPUTE)
  	values(@LS_Sequence_No,@LineNo,0,@Primary,'sa',null,@Value,0)

	fetch next from bulkSelect
	into @Value,@CustCode,@Primary,@BLK_ALLOC_DIFF

	end

	--finally close the customer cursor
	close bulkSelect
	deallocate bulkSelect

	begin

	--now execute the stored proc to allocate these transactions
	DECLARE @ReturnValue int
	DECLARE @PS_ValidateOnly tinyint
	DECLARE @PS_Ledger varchar(1)
	DECLARE @PS_AllocationTempID int
	DECLARE @PS_AllocationRef varchar(10)
	DECLARE @PS_DifferenceType tinyint
	DECLARE @PS_DifferenceCurrency bit
	DECLARE @PS_HomeExchangeDifference decimal(24,8)
	DECLARE @PS_AllocDate datetime
	DECLARE @PS_AllocPeriod tinyint
	DECLARE @PS_AllocYear varchar(1)
	DECLARE @PS_AllocUser varchar(4)
	DECLARE @PS_DifferenceAnalysis varchar(25)
	DECLARE @PS_DifferenceReference varchar(10)
	DECLARE @PS_DifferenceDescription varchar(30)
	DECLARE @PS_DifferenceCurrencySymbol varchar(4)
	DECLARE @PS_Correction bit
	DECLARE @PS_Error int
	DECLARE @PS_Base2ExchangeDifference decimal(24,8)


	SELECT @PS_ValidateOnly = 0	 	-- def is 0 = validate&alloc, 1=validate, 2=validate ignore wrong yr or pd.
	SELECT @PS_Ledger = 'S'	    	-- S = sales, P = purchase
	SELECT @PS_AllocationTempID = @LS_Sequence_No	-- use SL_AL_ID or PL_AL_ID in API table
	SELECT @PS_AllocationRef = ''		-- INPUTS IGNORED sys designated ref (output only)
	SELECT @PS_AllocDate = null
	SELECT @PS_AllocPeriod = null		-- 
	SELECT @PS_AllocYear = null	--
	SELECT @PS_AllocUser = 'sa'-- user I.D.
	if @Deallocation = 1
		SELECT @PS_Correction = 1		-- def is 0 = allocation, 1 = correction
	else
		SELECT @PS_Correction = 0		-- def is 0 = allocation, 1 = correction

	EXEC @ReturnValue = [AA_TRN_MULTI_ALLOCATE_S] 
	@PS_ValidateOnly,
	@PS_Ledger, 
	@PS_AllocationTempID,
	@PS_AllocationRef OUTPUT , 
	@PS_DifferenceType OUTPUT , 
	@PS_DifferenceCurrency OUTPUT , 
	@PS_HomeExchangeDifference OUTPUT ,
	@PS_AllocDate OUTPUT ,
	@PS_AllocPeriod OUTPUT , 
	@PS_AllocYear OUTPUT , 
	@PS_AllocUser, 
	@PS_DifferenceAnalysis OUTPUT , 
	@PS_DifferenceReference OUTPUT , 
	@PS_DifferenceDescription OUTPUT , 
	@PS_DifferenceCurrencySymbol OUTPUT , 
	@PS_Correction, 
	@PS_Error OUTPUT , 
	@PS_Base2ExchangeDifference OUTPUT

	-- replace sa with actual user id 
	update sl_alloc_history set s_al_user_id=@userid where s_al_reference=@PS_AllocationRef
	--return @ReturnValue

	end

fetch next from bulkCustSelect
into @CustCode,@PostVal

end

--finally close the customer cursor
close bulkCustSelect

deallocate bulkCustSelect

--------------------------------------------------------------------------------------------------------------




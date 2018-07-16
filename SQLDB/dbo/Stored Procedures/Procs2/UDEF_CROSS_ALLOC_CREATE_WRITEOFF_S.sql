create proc UDEF_CROSS_ALLOC_CREATE_WRITEOFF_S
   @PS_Customer      varchar(10)
,  @PS_Reference     varchar(20)
,  @PS_Value         decimal(24,2)
,  @PS_UserID        varchar(4)

as
/*
=====================================================================
   Object Name:      UDEF_CROSS_ALLOC_CREATE_WRITEOFF_S
   Author:           Sam Macro
   Create Date:      26th July 2014
   Description:      Create write-off transaction for cross account allocation

   Version History:
                     : v1 - Initial Version
   14 Aug 2014 SM    : v1.1 - absolute function around value to make positive
   24 Sep 2014 SM    : v1.2 - Use head office account for write-off

======================================================================
*/
declare
   @LS_ID         int
,  @LS_ST_PRIMARY int
,  @LS_Error      varchar(2000)
,  @LS_HeadOffice varchar(10)

begin try
   select
      @LS_HeadOffice = CU_HEAD_OFFICE_CODE
      from
         SL_ACCOUNTS2
      where
         CUCODE2 = @PS_Customer

   if isnull(@LS_HeadOffice,'') <> ''
      set @PS_Customer = @LS_HeadOffice

   exec AA_GET_SEQUENCE_NO_S 
      @PS_Sequence_Field    = 'SL_TRAN_ID'
   ,  @PS_Increment         = 1
   ,  @PS_Sequence_No       = @LS_ID      out
   ,  @PS_User_Id           = @PS_UserID

   insert into SL_TRN_TEMP 
   (
      SL_TRAN_ID
   ,  SL_DETAIL_LINE_NO
   ,  SL_STATUS_TEMP
   ,  SL_USER_ID
   ,  SL_TRANSACTION_TYPE
   ,  SL_CUSTOMER_CODE
   ,  SL_TRAN_REFERENCE
   ,  SL_TRAN_DATE
   ,  SL_TRAN_DESCRIPTION
   ,  SL_DETAIL_ANALYSIS_CODE
   ,  SL_DETAIL_VATCODE
   ,  SL_DETAIL_HOME_VALUE
   ,  SL_DETAIL_HOME_TAX  
   ,  SL_DO_NOT_BATCH
   ,  SL_HOME_GROSS_ENTRY_MODE
   )
   select
      @LS_ID               -- SL_TRAN_ID
   ,  1                    -- SL_DETAIL_LINE_NO
   ,  0                    -- SL_STATUS_TEMP
   ,  @PS_UserID           -- SL_USER_ID
   ,  'ACR'                -- SL_TRANSACTION_TYPE
   ,  @PS_Customer         -- SL_CUSTOMER_CODE
   ,  @PS_Reference        -- SL_TRAN_REFERENCE
   ,  getdate()            -- SL_TRAN_DATE
   ,  'DISCOUNT'           -- SL_TRAN_DESCRIPTION
   ,  COMP_USERFIELD1      -- SL_DETAIL_ANALYSIS_CODE
   ,  null                 -- SL_DETAIL_VATCODE
   ,  abs(@PS_Value)       -- SL_DETAIL_HOME_VALUE
   ,  0                    -- SL_DETAIL_HOME_TAX  
   ,  1                    -- SL_DO_NOT_BATCH
   ,  1                    -- SL_HOME_GROSS_ENTRY_MODE
   from
   SYS_DATAINFO2 

   exec AA_PROCESS_SL_TRN_TEMP_S 
	   @PS_TRN_TEMP_ID	   = @LS_ID
   ,	@PS_USER_ID	         = @PS_UserID
   ,	@PS_Proccess_Status	= 2
   ,  @PS_Header_Primary   = @LS_ST_PRIMARY out

   select
      @LS_ST_PRIMARY
   ,  ''
end try
begin catch
   select @LS_Error = error_message()

   if @@trancount > 0
      rollback tran

   select
      0
   ,  @LS_Error
end catch


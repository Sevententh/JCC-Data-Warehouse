

create procedure SDK_WMS_POP_SPLIT_ORDER_S
   @PS_Order_Number     varchar(10) = NULL         -- order number
,  @PS_Order_Primary    int         = NULL         -- header primary
,  @PS_User_Id          varchar(4)                 -- User ID
,  @PS_Order_Line       int         = NULL         -- order line to be split
,  @PS_Detail_Primary   int         = 0      out   -- Primary of detail line being split
,  @PS_Source           varchar(1)  = ''           -- Application from where the record originated. 'N'=Dim.Net, 'T'=TB, 'A'=API, 'D'=Dimensions, 'I'=Importer, 'H'=Horizons, 'C'=csplus, ''=unknown
,  @PS_SerialSubTemp_ID int 

as
declare
   @LS_POH_STATUS                      tinyint
,  @LS_POH_TYPE                        varchar(1)
,  @LS_POD_ENTRY_TYPE                  varchar(1)
,  @LS_POD_QTYORD                      decimal(24,8)
,  @LS_POD_QTYINVD                     decimal(24,8)
,  @LS_POD_QTYDELVD                    decimal(24,8)
,  @LS_POD_QTYUNIT                     decimal(24,8)
,  @LS_POD_QTYRESERVED                 decimal(24,8)
,  @LS_POD_LOCATN                      varchar(25)
,  @LS_POD_STOCK_CODE                  varchar(25)
,  @LS_POD_PRICE_CODE                  varchar(16)
,  @LS_POD_TABLECODE                   varchar(3)
,  @LS_POD_SERIALNO                    varchar(40)
,  @LS_POD_PRIMARY                     int
,  @LS_POD_STATUS                      tinyint
,  @LS_POH_PRIORITY                    tinyint
,  @LS_POH_L_DISCVAL                   decimal(24,8)
,  @LS_POH_NETT                        decimal(24,8)
,  @LS_POH_T_DISCVAL                   decimal(24,8)
,  @LS_POH_DISC_TOT_P                  decimal(24,8)
,  @LS_POH_VAT                         decimal(24,8)
,  @LS_POH_GROSS                       decimal(24,8)
,  @LS_POH_L_DISCVAL_C                 decimal(24,8)
,  @LS_POH_NETT_C                      decimal(24,8)
,  @LS_POH_T_DISCVAL_C                 decimal(24,8)
,  @LS_POH_TAX_C                       decimal(24,8)
,  @LS_POH_GROSS_C                     decimal(24,8)
,  @LS_POH_L_DISC_BASE2                decimal(24,8)
,  @LS_POH_NETT_BASE2                  decimal(24,8)
,  @LS_POH_T_DISC_BASE2                decimal(24,8)
,  @LS_POH_VAT_BASE2                   decimal(24,8)
,  @LS_POH_GROSS_BASE2                 decimal(24,8)
,  @LS_POH_NO_OF_LINES                 decimal(24,8)
,  @LS_POH_LINES_DELVD                 decimal(24,8)
,  @LS_POH_LINES_INVD                  decimal(24,8)
,  @LS_POH_OS_INVVAL                   decimal(24,8)
,  @LS_POH_OS_DELVAL                   decimal(24,8)
,  @LS_POH_OS_INVCVAL                  decimal(24,8)
,  @LS_POH_OS_DELCVAL                  decimal(24,8)
,  @LS_POH_INV_VAL_BASE2               decimal(24,8)
,  @LS_POH_DEL_VAL_BASE2               decimal(24,8)
,  @LS_POH_BATCH_FLAG                  tinyint
,  @LS_POH_ACC_STATUS                  varchar(11)
,  @LS_POH_CURR_CODE                   varchar(4)
,  @LS_POH_CURR_TYPE                   varchar(1)
,  @LS_POH_ACCOUNT                     varchar(10)
,  @LS_POH_DEL_CHG_PCT                 decimal(24,8)
,  @LS_POH_DEL_METHOD                  varchar(20)
,  @LS_POH_ACQ_TAX                     decimal(24,8)
,  @LS_POH_ACQUISTN_BASE2              decimal(24,8)
,  @LS_POH_REVERSE_SERVICE_VAT         decimal(24,8)
,  @LS_POH_REVERSE_SERVICE_VAT_BASE2   decimal(24,8)
,  @LS_POD_TYPE                        varchar(1)
,  @LS_POD_COSTHEADER                  varchar(10)
,  @LS_POD_COSTCENTRE                  varchar(10)
,  @LS_VALUE_DPS                       tinyint
,  @LS_QUANTITY_DPS                    tinyint
,  @LS_POD_SERIALTRACK                 tinyint
,  @LS_POD_UNITCST                     decimal(24,8)
,  @LS_POD_UNITCST_C                   decimal(24,8)
,  @LS_POD_LINEDISC                    decimal(24,8)
,  @LS_POD_ANALYSIS                    varchar(25)
,  @LS_POD_VATCODE                     varchar(4)
,  @LS_POD_DETAIL                      varchar(240)
,  @LS_POD_REQDATE                     datetime
,  @LS_POD_DIMENSION1                  varchar(20)
,  @LS_POD_DIMENSION2                  varchar(20)
,  @LS_POD_DIMENSION3                  varchar(20)
,  @LS_POD_USRCHAR1                    varchar (20)
,  @LS_POD_USRCHAR2                    varchar (20)
,  @LS_POD_USRCHAR3                    varchar (100)
,  @LS_POD_USRCHAR4                    varchar (100)
,  @LS_POD_USRFLAG1                    tinyint
,  @LS_POD_USRFLAG2                    tinyint
,  @LS_POD_USRDATE1                    datetime
,  @LS_POD_USRDATE2                    datetime
,  @LS_POD_USRNUM1                     decimal(24,8)
,  @LS_POD_USRNUM2                     decimal(24,8)
,  @LS_POD_ACCOUNT                     varchar(10)
,  @LS_LOC_PRIMARY                     int
,  @LS_Update_Stock_on_Order           bit
,  @LS_Return_Status                   int
,  @LS_POD_DATE                        datetime
,  @LS_Item                            varchar(25)
,  @LS_Price_Line                      tinyint
,  @LS_Allow_Empty_Serial_No           tinyint
,  @LS_POD_NETT                        decimal(24,8)
,  @LS_POD_NETT_C                      decimal(24,8)
,  @LS_POD_NETT_BASE2                  decimal(24,8)
,  @LS_POD_T_DISCVAL                   decimal(24,8)
,  @LS_POD_L_DISCVAL                   decimal(24,8)
,  @LS_PURCH_UPDTEYEAR                 varchar(1)
,  @LS_POD_YEAR                        varchar(1)
,  @LS_POD_PERIOD                      tinyint
,  @LS_NLC_CODE                        varchar(25)
,  @LS_POH_ORIGINAL_USER_PUTIN         varchar(4)
,  @LS_POD_STOCK_ANALYSIS              varchar(25)
,  @LS_POD_SERVICE                     bit            -- Service
,  @LS_ROUND_ORDER_VAT_TO_5DP          bit
,  @LS_VATAmountDps                    tinyint
,  @LS_AccrualNominalAccount           varchar(25)
,  @LS_AccrualNoOfPeriods              smallint
,  @LS_STKSUBSNO_LINE_NO               int
,  @LS_STKSUBSNO_SUBANALYSIS           varchar(25)
,  @LS_STKSUBSNO_QUANTITY              decimal(24,8)
,  @LS_SubCount                        int
,  @LS_OutStanding_POD_QTYORD          decimal(24,8)
,  @LS_STKSUBSNO_ORDER_DETAIL_LINK     int
,  @LS_Serial_Temp_ID                  int
,  @LS_Count                           int
,  @LS_NLC_YEAR                        varchar(1)
,  @LS_NLC_PERIOD                      tinyint
,  @LS_NLC_BUDGET                      decimal(24,8)
,  @LS_NLC_YEAR2                       varchar(1)
,  @LS_NLC_PERIOD2                     tinyint
,  @LS_NLC_BUDGET2                     decimal(24,8)
,  @LS_OldMaxNLC_PRIMARY               int
,  @LS_NLC_PRIMARY                     int
,  @LS_POH_AUTHORISER_ID               varchar(4)

if       (
            @PS_Order_Number is NULL
            or
            @PS_Order_Number = ''
         )
   and   (
            @PS_Order_Primary is NULL
            or
            @PS_Order_Primary = 0
         )
   begin
      raiserror('Either the order number or order header primary must be supplied.',16,1)
      return 99
   end

if (@PS_Order_Primary is NULL or @PS_Order_Primary = 0)
   select
      @LS_POH_STATUS                = POH_STATUS
   ,  @PS_Order_Primary             = POH_PRIMARY
   ,  @LS_POH_TYPE                  = POH_TYPE
   ,  @LS_POH_ORIGINAL_USER_PUTIN   = POH_ORIGINAL_USER_PUTIN
   ,  @LS_POH_PRIORITY              = POH_PRIORITY
   ,  @LS_POH_CURR_CODE             = POH_CURR_CODE
   ,  @LS_POH_CURR_TYPE             = POH_CURR_TYPE
   ,  @LS_POH_OS_DELVAL             = POH_OS_DELVAL
   ,  @LS_POH_OS_DELCVAL            = POH_OS_DELCVAL
   ,  @LS_POH_DEL_VAL_BASE2         = POH_DEL_VAL_BASE2
   ,  @LS_POH_ACCOUNT               = POH_ACCOUNT
   ,  @LS_POH_NO_OF_LINES           = POH_NO_OF_LINES
   ,  @LS_POH_LINES_DELVD           = POH_LINES_DELVD
   ,  @LS_POH_LINES_INVD            = POH_LINES_INVD
   ,  @LS_POH_BATCH_FLAG            = POH_BATCH_FLAG
   ,  @LS_POH_ACC_STATUS            = POH_ACC_STATUS
   ,  @LS_POH_DEL_CHG_PCT           = POH_DEL_CHG_PCT
   ,  @LS_POH_DEL_METHOD            = POH_DEL_METHOD
   ,  @LS_POH_DISC_TOT_P            = POH_DISC_TOT_P
   ,  @LS_POH_AUTHORISER_ID         = POH_AUTHORISER_ID
      from
         POP_HEADER
      where
         POH_ORDER_NUMBR = @PS_Order_Number
else
   select
      @LS_POH_STATUS                = POH_STATUS
   ,  @PS_Order_Number              = POH_ORDER_NUMBR
   ,  @LS_POH_TYPE                  = POH_TYPE
   ,  @LS_POH_ORIGINAL_USER_PUTIN   = POH_ORIGINAL_USER_PUTIN
   ,  @LS_POH_PRIORITY              = POH_PRIORITY
   ,  @LS_POH_CURR_CODE             = POH_CURR_CODE
   ,  @LS_POH_CURR_TYPE             = POH_CURR_TYPE
   ,  @LS_POH_OS_DELVAL             = POH_OS_DELVAL
   ,  @LS_POH_OS_DELCVAL            = POH_OS_DELCVAL
   ,  @LS_POH_DEL_VAL_BASE2         = POH_DEL_VAL_BASE2
   ,  @LS_POH_ACCOUNT               = POH_ACCOUNT
   ,  @LS_POH_NO_OF_LINES           = POH_NO_OF_LINES
   ,  @LS_POH_LINES_DELVD           = POH_LINES_DELVD
   ,  @LS_POH_LINES_INVD            = POH_LINES_INVD
   ,  @LS_POH_BATCH_FLAG            = POH_BATCH_FLAG
   ,  @LS_POH_ACC_STATUS            = POH_ACC_STATUS
   ,  @LS_POH_DEL_CHG_PCT           = POH_DEL_CHG_PCT
   ,  @LS_POH_DEL_METHOD            = POH_DEL_METHOD
   ,  @LS_POH_DISC_TOT_P            = POH_DISC_TOT_P
   ,  @LS_POH_AUTHORISER_ID         = POH_AUTHORISER_ID
      from
         POP_HEADER
      where
         POH_PRIMARY = @PS_Order_Primary
if @@rowcount = 0
   begin
      raiserror('The order specified does not exist.',16,1)
      return 99
   end

if @LS_POH_STATUS = 2
   begin
      raiserror('The order specified is already complete.',16,1)
      return 99
   end


if isnull(@PS_Detail_Primary,0) > 0
   or
   isnull(@PS_Order_Line,0) > 0
   begin
      if isnull(@PS_Detail_Primary,0) > 0

         select
            @LS_POD_QTYDELVD  = POD_QTYDELVD
         ,  @LS_POD_QTYINVD   = POD_QTYINVD
         ,  @LS_POD_STATUS    = POD_STATUS
         ,  @PS_Order_Line    = POD_LINE_NUMBER   -- Primary Key takes priority
            from
               POP_DETAIL
            where
                     POD_ORDER_NO   = @PS_Order_Number
               and   POD_PRIMARY    = @PS_Detail_Primary
      else
         select
            @LS_POD_QTYDELVD     = POD_QTYDELVD
         ,  @LS_POD_QTYINVD      = POD_QTYINVD
         ,  @LS_POD_STATUS       = POD_STATUS
         ,  @PS_Order_Line       = POD_LINE_NUMBER
         ,  @PS_Detail_Primary   = POD_PRIMARY
            from
               POP_DETAIL
            where
                     POD_ORDER_NO      = @PS_Order_Number
               and   POD_LINE_NUMBER   = @PS_Order_Line

      if @@rowcount = 0
         begin
            raiserror('The order line specified does not exist.',16,1)
            return 99
         end

   end

-- Initialise Local Variables
select
   @LS_VALUE_DPS              = VALUE_DPS
,  @LS_QUANTITY_DPS           = QUANTITY_DPS
,  @LS_PURCH_UPDTEYEAR        = PURCH_UPDTEYEAR
,  @LS_ROUND_ORDER_VAT_TO_5DP = ROUND_ORDER_VAT_TO_5DP
   from
      SYS_DATAINFO with (nolock)
   where
      SYS_PRIMARY = 1

if @LS_VALUE_DPS < 5 and @LS_ROUND_ORDER_VAT_TO_5DP = 1
   set @LS_VATAmountDps = 5
else
   select @LS_VATAmountDps = @LS_VALUE_DPS, @LS_ROUND_ORDER_VAT_TO_5DP = 0

select
   @LS_POD_ENTRY_TYPE            = POD_ENTRY_TYPE
,  @LS_POD_TYPE                  = POD_TYPE
,  @LS_POD_QTYORD                = POD_QTYORD
,  @LS_POD_QTYINVD               = POD_QTYINVD
,  @LS_POD_QTYDELVD              = POD_QTYDELVD
,  @LS_POD_QTYUNIT               = POD_QTYUNIT
,  @LS_POD_QTYRESERVED           = POD_QTYRESERVED
,  @LS_POD_LOCATN                = POD_LOCATN
,  @LS_POD_STOCK_CODE            = POD_STOCK_CODE
,  @LS_POD_SERIALNO              = POD_SERIALNO
,  @LS_POD_PRIMARY               = POD_PRIMARY
,  @LS_POD_NETT                  = POD_NETT
,  @LS_POD_NETT_C                = POD_NETT_C
,  @LS_POD_NETT_BASE2            = POD_NETT_BASE2
,  @LS_POD_T_DISCVAL             = POD_T_DISCVAL
,  @LS_POD_L_DISCVAL             = POD_L_DISCVAL
,  @LS_POD_YEAR                  = POD_YEAR
,  @LS_POD_PERIOD                = POD_PERIOD
,  @LS_POD_COSTHEADER            = POD_COSTHEADER
,  @LS_POD_COSTCENTRE            = POD_COSTCENTRE
,  @LS_POD_SERIALTRACK           = POD_SERIALTRACK
,  @LS_POD_DATE                  = POD_DATE
,  @LS_POD_UNITCST               = POD_UNITCST
,  @LS_POD_UNITCST_C             = POD_UNITCST_C
,  @LS_POD_LINEDISC              = POD_LINEDISC
,  @LS_POD_PRICE_CODE            = POD_PRICE_CODE
,  @LS_POD_TABLECODE             = POD_TABLECODE
,  @LS_POD_ANALYSIS              = POD_ANALYSIS
,  @LS_POD_VATCODE               = POD_VATCODE
,  @LS_POD_DETAIL                = POD_DETAIL
,  @LS_POD_REQDATE               = POD_REQDATE
,  @LS_POD_DIMENSION1            = POD_DIMENSION1
,  @LS_POD_DIMENSION2            = POD_DIMENSION2
,  @LS_POD_DIMENSION3            = POD_DIMENSION3
,  @LS_POD_USRCHAR1              = POD_USRCHAR1
,  @LS_POD_USRCHAR2              = POD_USRCHAR2
,  @LS_POD_USRCHAR3              = POD_USRCHAR3
,  @LS_POD_USRCHAR4              = POD_USRCHAR4
,  @LS_POD_USRFLAG1              = POD_USRFLAG1
,  @LS_POD_USRFLAG2              = POD_USRFLAG2
,  @LS_POD_USRDATE1              = POD_USRDATE1
,  @LS_POD_USRDATE2              = POD_USRDATE2
,  @LS_POD_USRNUM1               = POD_USRNUM1
,  @LS_POD_USRNUM2               = POD_USRNUM2
,  @LS_POD_ACCOUNT               = POD_ACCOUNT
,  @LS_NLC_CODE                  = PANOMINALDR
,  @LS_POD_STOCK_ANALYSIS        = POD_STOCK_ANALYSIS
,  @LS_POD_SERVICE               = POD_SERVICE
,  @LS_AccrualNominalAccount     = isnull(PDA_ACCRUAL_NOM,'')
,  @LS_AccrualNoOfPeriods        = isnull(PDA_PERIODS,0)
   from
      POP_DETAIL
         inner join  PL_ANALYSIS with (nolock)  on PACODE         = POD_ANALYSIS
         left join   POP_DETAIL2                on POD_PRIMARY_2  = POD_PRIMARY
         left join   POP_DETAIL_ACCRUALS        on PDA_PRIMARY    = POD_PRIMARY
   where
            POD_ORDER_NO   =  @PS_Order_Number
      and   POD_PRIMARY    =  @PS_Detail_Primary
if @@error<>0 or @@rowcount=0
   begin
      raiserror('Cannot find POP order detail line for order number %s with a detail primary ID of %u.',16,1,@PS_Order_Number,@PS_Detail_Primary)
      return 99
   end

begin tran

-- Check for authorisation so that this can be temporary cleared to allow split
if @LS_POH_AUTHORISER_ID <> ''
   begin
      update POP_HEADER
         set POH_AUTHORISER_ID = ''
         where POH_PRIMARY = @PS_Order_Primary
   end

if @LS_POD_QTYDELVD > @LS_POD_QTYORD
   set @LS_OutStanding_POD_QTYORD = 0
else
   set @LS_OutStanding_POD_QTYORD = @LS_POD_QTYORD - @LS_POD_QTYDELVD

set @LS_STKSUBSNO_LINE_NO = -1
set @LS_SubCount = 0
while 1=1
   begin
      select top 1
              @LS_STKSUBSNO_LINE_NO           = min(STKSUBSNO_LINE_NO)
            , @LS_STKSUBSNO_SUBANALYSIS       = STKSUBSNO_SUBANALYSIS
            , @LS_STKSUBSNO_QUANTITY          = sum(STKSUBSNO_QUANTITY)
            , @LS_STKSUBSNO_ORDER_DETAIL_LINK = max(STKSUBSNO_ORDER_DETAIL_LINK)
         from STK_SUBANALYSIS_SERIAL_TEMP
         where
            STKSUBSNO_ID = @PS_SerialSubTemp_ID
         group by STKSUBSNO_SUBANALYSIS
         having min(STKSUBSNO_LINE_NO) > @LS_STKSUBSNO_LINE_NO
         order by min(STKSUBSNO_LINE_NO)
      if @@rowcount = 0
         begin
            if @LS_SubCount > 0
               break
            raiserror('Cannot find row in STK_SUBANALYSIS_SERIAL_TEMP with a ID of %u.',16,1,@PS_SerialSubTemp_ID)
            rollback tran
            return 99
         end
         
      set @LS_SubCount = @LS_SubCount + 1
      set @LS_OutStanding_POD_QTYORD = @LS_OutStanding_POD_QTYORD - @LS_STKSUBSNO_QUANTITY
      
      if @LS_SubCount = 1
         begin
            if @LS_STKSUBSNO_ORDER_DETAIL_LINK > 0 and @LS_POD_SERIALTRACK = 1
               begin
                  -- cannot use lines already in STK_SUBANALYSIS_SERIAL_TEMP as order detail link is populated with WMTD_PRIMARY 
                  -- and 
                  set @LS_Serial_Temp_ID = @PS_SerialSubTemp_ID + @LS_SubCount
                  
                  insert into STK_SUBANALYSIS_SERIAL_TEMP
                        (
                        STKSUBSNO_ID,
                        STKSUBSNO_LINE_NO,
                        STKSUBSNO_SUBANALYSIS,
                        STKSUBSNO_QUANTITY,
                        STKSUBSNO_SERIAL_NUMBER,
                        STKSUBSNO_LOT_NUMBER,
                        STKSUBSNO_SORT_KEY,
                        STKSUBSNO_EXCLUDE_FROM_SOP
                        )
                     select
                        @LS_Serial_Temp_ID,
                        STKSUBSNO_LINE_NO,
                        STKSUBSNO_SUBANALYSIS,
                        STKSUBSNO_QUANTITY,
                        STKSUBSNO_SERIAL_NUMBER,
                        STKSUBSNO_LOT_NUMBER,
                        STKSUBSNO_SORT_KEY,
                        STKSUBSNO_EXCLUDE_FROM_SOP
                     from
                        STK_SUBANALYSIS_SERIAL_TEMP
                     where
                        STKSUBSNO_ID = @PS_SerialSubTemp_ID
                        and STKSUBSNO_SUBANALYSIS = @LS_STKSUBSNO_SUBANALYSIS
               end
            else if @LS_POD_SERIALTRACK = 1
               set @LS_Serial_Temp_ID = @PS_SerialSubTemp_ID
            else 
               set @LS_Serial_Temp_ID = 0
            
            select @LS_OldMaxNLC_PRIMARY = max(NLC_PRIMARY) from NL_COMMITTED_BUDGETS
            
            
            exec @LS_Return_Status = AA_EDIT_POP_BATCH_DETAIL_S
               @PS_Order_Number       = @PS_Order_Number
            ,  @PS_Detail_Primary     = @LS_POD_PRIMARY
            ,  @PS_Quantity           = @LS_STKSUBSNO_QUANTITY
            ,  @PS_User_Id            = @PS_User_Id
            ,  @PS_Sub_Analysis       = @LS_STKSUBSNO_SUBANALYSIS
            ,  @PS_Serial_Temp_ID     = @LS_Serial_Temp_ID
            
            if @LS_Return_Status <> 0
               begin
                  rollback tran
                  raiserror('SDK_WMS_POP_SPLIT_ORDER_S: Execution of procedure AA_EDIT_POP_BATCH_DETAIL_S has failed!',16,1)
                  return
               end
            
            select 
                 @LS_NLC_YEAR      = NLC_YEAR
               , @LS_NLC_PERIOD    = NLC_PERIOD
               , @LS_NLC_BUDGET    = NLC_BUDGET
               from NL_COMMITTED_BUDGETS 
               where NLC_PRIMARY > @LS_OldMaxNLC_PRIMARY
                  and NLC_CODE is NULL
               
            -- Look out for bug in Dimensions API in versions less than 2.50k where null lines are inserted into NL_COMMITTED_BUDGETS rather than correcting the right line.
            if @LS_NLC_YEAR <> ''
               begin
                  select 
                       @LS_NLC_PERIOD2    = NLC_PERIOD
                     , @LS_NLC_BUDGET2    = NLC_BUDGET
                     , @LS_NLC_CODE       = NLC_CODE
                     from NL_COMMITTED_BUDGETS 
                     where NLC_PRIMARY > @LS_OldMaxNLC_PRIMARY
                        and NLC_YEAR is NULL
                   
                  delete NL_COMMITTED_BUDGETS where NLC_PRIMARY > @LS_OldMaxNLC_PRIMARY and (NLC_YEAR is NULL or NLC_CODE is NULL)
                  
                  update NL_COMMITTED_BUDGETS
                     set NLC_BUDGET = NLC_BUDGET + @LS_NLC_BUDGET
                     where NLC_CODE = @LS_NLC_CODE and NLC_YEAR = @LS_NLC_YEAR and NLC_PERIOD = @LS_NLC_PERIOD
                  
                  if @LS_PURCH_UPDTEYEAR = 'C'
                     set @LS_NLC_YEAR2 = @LS_POD_YEAR
                  else
                     set @LS_NLC_YEAR2 =   (
                                             case @LS_POD_YEAR
                                                when 'C' then 'N'
                                                when 'L' then 'C'
                                                else
                                                   'L'
                                             end
                        )
                  
                  select @LS_NLC_PRIMARY = NLC_PRIMARY
                     from NL_COMMITTED_BUDGETS
                     where NLC_CODE = @LS_NLC_CODE and NLC_YEAR = @LS_NLC_YEAR2 and NLC_PERIOD = @LS_NLC_PERIOD2
                                   
                  if @LS_NLC_PRIMARY > 0
                     update NL_COMMITTED_BUDGETS
                        set NLC_BUDGET = NLC_BUDGET + @LS_NLC_BUDGET2
                        where NLC_PRIMARY = @LS_NLC_PRIMARY
                  else
                     insert into NL_COMMITTED_BUDGETS
                     (
                        NLC_CODE,
                        NLC_YEAR,
                        NLC_YEAR_LINK,
                        NLC_PERIOD,
                        NLC_BUDGET
                     )
                     values
                     (  @LS_NLC_CODE,
                        @LS_NLC_YEAR2,
                        dbo.AA_SYS_YEAR_CODE_TO_LINK_F(@LS_NLC_YEAR2, 'NL'),
                        @LS_NLC_PERIOD2,
                        @LS_NLC_BUDGET2
                     )
                      
               end
                        
            -- workaround for bug in API
            if @LS_POD_SERIALTRACK = 1
               begin
                  select
                     @LS_Count         = count(SNOL_PRIMARY)
                  ,  @LS_POD_SERIALNO = isnull(min(SNO_SERIAL_NUMBER), '')
                     from
                        STK_SERIAL_LINK
                           inner join STK_SERIAL_NUMBERS on SNO_PRIMARY = SNOL_SERIAL_LINK
                     where
                        SNOL_ORDER_LINK = 'P' + convert(varchar, convert(decimal(16), @LS_POD_PRIMARY))
                  
                  update POP_DETAIL
                     set
                        POD_SERIALNO = case
                                          when @LS_Count > 1
                                             then '<multiple>'
                                          else
                                             @LS_POD_SERIALNO
                                       end
                     where
                        POD_PRIMARY = @PS_Detail_Primary
               end
         end
      else
         begin

            select
               @LS_Item                   =  case @LS_POD_ENTRY_TYPE
                                                when 'S' then @LS_POD_STOCK_CODE
                                                when 'P' then @LS_POD_PRICE_CODE
                                                else
                                                   null
                                             end
            ,  @LS_Price_Line             =  case @LS_POD_ENTRY_TYPE
                                                when 'S' then substring(@LS_POD_TABLECODE,2,len(@LS_POD_TABLECODE)-1)
                                                else
                                                   null
                                             end
            ,  @LS_Update_Stock_on_Order  =  case @LS_POD_QTYRESERVED
                                                when 0 then 0
                                                else
                                                   1
                                             end
            ,  @LS_Allow_Empty_Serial_No  =  case
                                                when @LS_POD_SERIALTRACK = 1 then 1
                                                else
                                                   0
                                             end

            set @PS_Detail_Primary = 0

            if @LS_POD_ENTRY_TYPE <> 'T'
               set @LS_POD_SERVICE = NULL    -- Default service flag for stock and price records in case they have changed.

            if @LS_POD_SERIALTRACK = 1
               begin
                  -- cannot use lines already in STK_SUBANALYSIS_SERIAL_TEMP as order detail link is populated with WMTD_PRIMARY 
                  -- and 
                  set @LS_Serial_Temp_ID = @PS_SerialSubTemp_ID + @LS_SubCount
                  
                  insert into STK_SUBANALYSIS_SERIAL_TEMP
                        (
                        STKSUBSNO_ID,
                        STKSUBSNO_LINE_NO,
                        STKSUBSNO_SUBANALYSIS,
                        STKSUBSNO_QUANTITY,
                        STKSUBSNO_SERIAL_NUMBER,
                        STKSUBSNO_LOT_NUMBER,
                        STKSUBSNO_SORT_KEY,
                        STKSUBSNO_EXCLUDE_FROM_SOP
                        )
                     select
                        @LS_Serial_Temp_ID,
                        STKSUBSNO_LINE_NO,
                        STKSUBSNO_SUBANALYSIS,
                        STKSUBSNO_QUANTITY,
                        STKSUBSNO_SERIAL_NUMBER,
                        STKSUBSNO_LOT_NUMBER,
                        STKSUBSNO_SORT_KEY,
                        STKSUBSNO_EXCLUDE_FROM_SOP
                     from
                        STK_SUBANALYSIS_SERIAL_TEMP
                     where
                        STKSUBSNO_ID = @PS_SerialSubTemp_ID
                        and STKSUBSNO_SUBANALYSIS = @LS_STKSUBSNO_SUBANALYSIS
               end
            else 
               set @LS_Serial_Temp_ID = 0

            exec @LS_Return_Status = AA_POP_BATCH_DETAIL_S
               @PS_Stock_Analysis               = @LS_POD_STOCK_ANALYSIS
            ,  @PS_Allow_Empty_Stock_Analysis   = 1
            ,  @PS_Order_Number                 = @PS_Order_Number
            ,  @PS_Validate_Only                = null
            ,  @PS_Defs                         = '0001000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101000000000000000000'
                                                -- 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901
                                                --          1         2         3         4         5         6         7         8         9         10        11        12
            ,  @PS_Order_Type                   = null
            ,  @PS_Account                      = @LS_POH_ACCOUNT
            ,  @PS_Subledger                    = null
            ,  @PS_Order_Date                   = null
            ,  @PS_Order_Year                   = null
            ,  @PS_Order_Period                 = null
            ,  @PS_Date_Required                = null
            ,  @PS_Supplier_Ref                 = null
            ,  @PS_Batch_Ref                    = null
            ,  @PS_Order_Description            = null
            ,  @PS_CurrencyCode                 = null
            ,  @PS_CurrencySymbol               = @LS_POH_CURR_CODE
            ,  @PS_CurrencyType                 = @LS_POH_CURR_TYPE
            ,  @PS_Currency_Rate                = null
            ,  @PS_Euro_to_Home_Rate            = null
            ,  @PS_Base2_Rate                   = null
            ,  @PS_EC_Delivery_Terms            = null
            ,  @PS_EC_Transaction_Nature        = null
            ,  @PS_EC_Transport_Method          = null
            ,  @PS_Order_Status                 = 0
            ,  @PS_Price_Key                    = null
            ,  @PS_Totaldisc_Perc               = null
            ,  @PS_Header_LineDisc_Perc         = null
            ,  @PS_Minimum_Order_Value          = null
            ,  @PS_Settlement_Disc1_Perc        = null
            ,  @PS_Settlement_Days1             = null
            ,  @PS_Settlement_Disc2_Perc        = null
            ,  @PS_Settlement_Days2             = null
            ,  @PS_Delivery_Charge              = null
            ,  @PS_Delivery_Charge_Perc         = @LS_POH_DEL_CHG_PCT
            ,  @PS_Delivery_Method              = @LS_POH_DEL_METHOD
            ,  @PS_Due_Days                     = null
            ,  @PS_Anticpated_Payment_Days      = null
            ,  @PS_Order_Terms                  = null
            ,  @PS_Delivery_Address_Type        = null
            ,  @PS_Delivery_Address_No          = null
            ,  @PS_Order_Address_No             = null
            ,  @PS_Supplier_User_Key1           = null
            ,  @PS_Supplier_User_Key2           = null
            ,  @PS_Supplier_User_Key3           = null
            ,  @PS_Update_Stock_on_Order        = @LS_Update_Stock_on_Order
            ,  @PS_Gross_Entry_Mode             = null
            ,  @PS_Currency_Entry_Mode          = null
            ,  @PS_Archive_Flag                 = null
            ,  @PS_Allow_Empty_SubAnalysis      = 1
            ,  @PS_Allow_Empty_Serial_No        = @LS_Allow_Empty_Serial_No
            ,  @PS_Entry_Type                   = @LS_POD_ENTRY_TYPE
            ,  @PS_Item_Code                    = @LS_Item
            ,  @PS_Serial_Number                = null
            ,  @PS_Sub_Analysis                 = @LS_STKSUBSNO_SUBANALYSIS
            ,  @PS_Quantity                     = @LS_STKSUBSNO_QUANTITY
            ,  @PS_Price_Line                   = @LS_Price_Line
            ,  @PS_Quantity_Unit                = @LS_POD_QTYUNIT
            ,  @PS_Home_Unit_Cost               = @LS_POD_UNITCST
            ,  @PS_Currency_Unit_Cost           = @LS_POD_UNITCST_C
            ,  @PS_Base2_Unit_Cost              = null
            ,  @PS_Linedisc_Perc                = @LS_POD_LINEDISC
            ,  @PS_Home_Linediscval             = null
            ,  @PS_Currency_Linediscval         = null
            ,  @PS_Base2_Linediscval            = null
            ,  @PS_Analysis                     = @LS_POD_ANALYSIS
            ,  @PS_VAT_Code                     = @LS_POD_VATCODE
            ,  @PS_Costheader                   = @LS_POD_COSTHEADER
            ,  @PS_Costcentre                   = @LS_POD_COSTCENTRE
            ,  @PS_Line_Detail                  = @LS_POD_DETAIL
            ,  @PS_Line_Required_Date           = @LS_POD_REQDATE
            ,  @PS_Transaction_User_Key1        = @LS_POD_DIMENSION1
            ,  @PS_Transaction_User_Key2        = @LS_POD_DIMENSION2
            ,  @PS_Transaction_User_Key3        = @LS_POD_DIMENSION3
            ,  @PS_User_Id                      = @PS_User_Id
            ,  @PS_Detail_Primary               = @PS_Detail_Primary out
            ,  @PS_Header_User_Char1            = null
            ,  @PS_Header_User_Char2            = null
            ,  @PS_Header_User_Char3            = null
            ,  @PS_Header_User_Char4            = null
            ,  @PS_Header_User_Flag1            = null
            ,  @PS_Header_User_Flag2            = null
            ,  @PS_Header_User_Date1            = null
            ,  @PS_Header_User_Date2            = null
            ,  @PS_Header_User_Number1          = null
            ,  @PS_Header_User_Number2          = null
            ,  @PS_Detail_User_Char1            = @LS_POD_USRCHAR1
            ,  @PS_Detail_User_Char2            = @LS_POD_USRCHAR2
            ,  @PS_Detail_User_Char3            = @LS_POD_USRCHAR3
            ,  @PS_Detail_User_Char4            = @LS_POD_USRCHAR4
            ,  @PS_Detail_User_Flag1            = @LS_POD_USRFLAG1
            ,  @PS_Detail_User_Flag2            = @LS_POD_USRFLAG2
            ,  @PS_Detail_User_Date1            = @LS_POD_USRDATE1
            ,  @PS_Detail_User_Date2            = @LS_POD_USRDATE2
            ,  @PS_Detail_User_Number1          = @LS_POD_USRNUM1
            ,  @PS_Detail_User_Number2          = @LS_POD_USRNUM2
            ,  @PS_Do_Not_Update_Stock          = null
            ,  @PS_Source                       = @PS_Source
            ,  @PS_Transaction_Options          = null
            ,  @PS_Order_Line                   = 0
            ,  @PS_Recreate_Order_Line          = 0
            ,  @PS_Service                      = @LS_POD_SERVICE
            ,  @PS_AccrualNominalAccount        = @LS_AccrualNominalAccount
            ,  @PS_AccrualNoOfPeriods           = @LS_AccrualNoOfPeriods
            ,  @PS_Serial_Temp_ID               = @LS_Serial_Temp_ID
            if @LS_Return_Status <> 0
               begin
                  rollback tran
                  raiserror('SDK_WMS_POP_SPLIT_ORDER_S: Execution of procedure AA_POP_BATCH_DETAIL_S has failed!',16,1)
                  return
               end
               
            insert into POP_DETAIL_PLUGINS_VCHAR
               (PODPV_DETAIL_LINK,PODPV_TAGNAME,PODPV_TAGVALUE)
               select @PS_Detail_Primary, PODPV_TAGNAME, PODPV_TAGVALUE
                  from POP_DETAIL_PLUGINS_VCHAR
                  where PODPV_DETAIL_LINK = @LS_POD_PRIMARY

            insert into POP_DETAIL_PLUGINS_DATETIME
               (PODPD_DETAIL_LINK,PODPD_TAGNAME,PODPD_TAGVALUE)
               select @PS_Detail_Primary, PODPD_TAGNAME, PODPD_TAGVALUE
                  from POP_DETAIL_PLUGINS_DATETIME
                  where PODPD_DETAIL_LINK = @LS_POD_PRIMARY               
            
            update SDK_WMS_REVIEW_DETAIL
               set WMTD_LINE_REF = @PS_Detail_Primary
               from STK_SUBANALYSIS_SERIAL_TEMP
                  join SDK_WMS_REVIEW_DETAIL on WMTD_PRIMARY = STKSUBSNO_ORDER_DETAIL_LINK
               where STKSUBSNO_ID = @PS_SerialSubTemp_ID
                  and STKSUBSNO_SUBANALYSIS = @LS_STKSUBSNO_SUBANALYSIS
               
            insert into SDK_WMS_SEND_STATUS_DETAIL (
               WMSPD_WMSP_PRIMARY,WMSPD_TRAN_PRIMARY,WMSPD_ITEM_QTY,WMSPD_PACK_QTY,WMSPD_INNER_QTY,WMSPD_OUTER_QTY,WMSPD_SITE,WMSPD_COLOUR,WMSPD_SIZE,WMSPD_BATCH)
            select 
               WMSP_PRIMARY,@PS_Detail_Primary,WMSPD_ITEM_QTY,WMSPD_PACK_QTY,WMSPD_INNER_QTY,WMSPD_OUTER_QTY,WMSPD_SITE,WMSPD_COLOUR,WMSPD_SIZE,WMSPD_BATCH
               from SDK_WMS_SEND_STATUS join SDK_WMS_SEND_STATUS_DETAIL on WMSP_PRIMARY=WMSPD_WMSP_PRIMARY
               where WMSP_TRAN_PRIMARY=@PS_Order_Primary and WMSP_TRAN_TYPE='POP' and WMSPD_TRAN_PRIMARY = @LS_POD_PRIMARY


         end
   end -- End While

 
if @LS_OutStanding_POD_QTYORD > 0
   begin
      select
         @LS_Item                   =  case @LS_POD_ENTRY_TYPE
                                          when 'S' then @LS_POD_STOCK_CODE
                                          when 'P' then @LS_POD_PRICE_CODE
                                          else
                                             null
                                       end
      ,  @LS_Price_Line             =  case @LS_POD_ENTRY_TYPE
                                          when 'S' then substring(@LS_POD_TABLECODE,2,len(@LS_POD_TABLECODE)-1)
                                          else
                                             null
                                       end
      ,  @LS_Update_Stock_on_Order  =  case @LS_POD_QTYRESERVED
                                          when 0 then 0
                                          else
                                             1
                                       end
      ,  @LS_Allow_Empty_Serial_No  =  case
                                          when @LS_POD_SERIALTRACK = 1 then 1
                                          else
                                             0
                                       end

      set @PS_Detail_Primary = 0

      if @LS_POD_ENTRY_TYPE <> 'T'
         set @LS_POD_SERVICE = NULL    -- Default service flag for stock and price records in case they have changed.

      exec @LS_Return_Status = AA_POP_BATCH_DETAIL_S
         @PS_Stock_Analysis               = @LS_POD_STOCK_ANALYSIS
      ,  @PS_Allow_Empty_Stock_Analysis   = 1
      ,  @PS_Order_Number                 = @PS_Order_Number
      ,  @PS_Validate_Only                = null
      ,  @PS_Defs                         = '0001000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101000000000000000000'
                                          -- 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901
                                          --          1         2         3         4         5         6         7         8         9         10        11        12
      ,  @PS_Order_Type                   = null
      ,  @PS_Account                      = @LS_POH_ACCOUNT
      ,  @PS_Subledger                    = null
      ,  @PS_Order_Date                   = null
      ,  @PS_Order_Year                   = null
      ,  @PS_Order_Period                 = null
      ,  @PS_Date_Required                = null
      ,  @PS_Supplier_Ref                 = null
      ,  @PS_Batch_Ref                    = null
      ,  @PS_Order_Description            = null
      ,  @PS_CurrencyCode                 = null
      ,  @PS_CurrencySymbol               = @LS_POH_CURR_CODE
      ,  @PS_CurrencyType                 = @LS_POH_CURR_TYPE
      ,  @PS_Currency_Rate                = null
      ,  @PS_Euro_to_Home_Rate            = null
      ,  @PS_Base2_Rate                   = null
      ,  @PS_EC_Delivery_Terms            = null
      ,  @PS_EC_Transaction_Nature        = null
      ,  @PS_EC_Transport_Method          = null
      ,  @PS_Order_Status                 = 0
      ,  @PS_Price_Key                    = null
      ,  @PS_Totaldisc_Perc               = null
      ,  @PS_Header_LineDisc_Perc         = null
      ,  @PS_Minimum_Order_Value          = null
      ,  @PS_Settlement_Disc1_Perc        = null
      ,  @PS_Settlement_Days1             = null
      ,  @PS_Settlement_Disc2_Perc        = null
      ,  @PS_Settlement_Days2             = null
      ,  @PS_Delivery_Charge              = null
      ,  @PS_Delivery_Charge_Perc         = @LS_POH_DEL_CHG_PCT
      ,  @PS_Delivery_Method              = @LS_POH_DEL_METHOD
      ,  @PS_Due_Days                     = null
      ,  @PS_Anticpated_Payment_Days      = null
      ,  @PS_Order_Terms                  = null
      ,  @PS_Delivery_Address_Type        = null
      ,  @PS_Delivery_Address_No          = null
      ,  @PS_Order_Address_No             = null
      ,  @PS_Supplier_User_Key1           = null
      ,  @PS_Supplier_User_Key2           = null
      ,  @PS_Supplier_User_Key3           = null
      ,  @PS_Update_Stock_on_Order        = @LS_Update_Stock_on_Order
      ,  @PS_Gross_Entry_Mode             = null
      ,  @PS_Currency_Entry_Mode          = null
      ,  @PS_Archive_Flag                 = null
      ,  @PS_Allow_Empty_SubAnalysis      = 1
      ,  @PS_Allow_Empty_Serial_No        = @LS_Allow_Empty_Serial_No
      ,  @PS_Entry_Type                   = @LS_POD_ENTRY_TYPE
      ,  @PS_Item_Code                    = @LS_Item
      ,  @PS_Serial_Number                = null
      ,  @PS_Sub_Analysis                 = null
      ,  @PS_Quantity                     = @LS_OutStanding_POD_QTYORD
      ,  @PS_Price_Line                   = @LS_Price_Line
      ,  @PS_Quantity_Unit                = @LS_POD_QTYUNIT
      ,  @PS_Home_Unit_Cost               = @LS_POD_UNITCST
      ,  @PS_Currency_Unit_Cost           = @LS_POD_UNITCST_C
      ,  @PS_Base2_Unit_Cost              = null
      ,  @PS_Linedisc_Perc                = @LS_POD_LINEDISC
      ,  @PS_Home_Linediscval             = null
      ,  @PS_Currency_Linediscval         = null
      ,  @PS_Base2_Linediscval            = null
      ,  @PS_Analysis                     = @LS_POD_ANALYSIS
      ,  @PS_VAT_Code                     = @LS_POD_VATCODE
      ,  @PS_Costheader                   = @LS_POD_COSTHEADER
      ,  @PS_Costcentre                   = @LS_POD_COSTCENTRE
      ,  @PS_Line_Detail                  = @LS_POD_DETAIL
      ,  @PS_Line_Required_Date           = @LS_POD_REQDATE
      ,  @PS_Transaction_User_Key1        = @LS_POD_DIMENSION1
      ,  @PS_Transaction_User_Key2        = @LS_POD_DIMENSION2
      ,  @PS_Transaction_User_Key3        = @LS_POD_DIMENSION3
      ,  @PS_User_Id                      = @PS_User_Id
      ,  @PS_Detail_Primary               = @PS_Detail_Primary out
      ,  @PS_Header_User_Char1            = null
      ,  @PS_Header_User_Char2            = null
      ,  @PS_Header_User_Char3            = null
      ,  @PS_Header_User_Char4            = null
      ,  @PS_Header_User_Flag1            = null
      ,  @PS_Header_User_Flag2            = null
      ,  @PS_Header_User_Date1            = null
      ,  @PS_Header_User_Date2            = null
      ,  @PS_Header_User_Number1          = null
      ,  @PS_Header_User_Number2          = null
      ,  @PS_Detail_User_Char1            = @LS_POD_USRCHAR1
      ,  @PS_Detail_User_Char2            = @LS_POD_USRCHAR2
      ,  @PS_Detail_User_Char3            = @LS_POD_USRCHAR3
      ,  @PS_Detail_User_Char4            = @LS_POD_USRCHAR4
      ,  @PS_Detail_User_Flag1            = @LS_POD_USRFLAG1
      ,  @PS_Detail_User_Flag2            = @LS_POD_USRFLAG2
      ,  @PS_Detail_User_Date1            = @LS_POD_USRDATE1
      ,  @PS_Detail_User_Date2            = @LS_POD_USRDATE2
      ,  @PS_Detail_User_Number1          = @LS_POD_USRNUM1
      ,  @PS_Detail_User_Number2          = @LS_POD_USRNUM2
      ,  @PS_Do_Not_Update_Stock          = null
      ,  @PS_Source                       = @PS_Source
      ,  @PS_Transaction_Options          = null
      ,  @PS_Order_Line                   = 0
      ,  @PS_Recreate_Order_Line          = 0
      ,  @PS_Service                      = @LS_POD_SERVICE
      ,  @PS_AccrualNominalAccount        = @LS_AccrualNominalAccount
      ,  @PS_AccrualNoOfPeriods           = @LS_AccrualNoOfPeriods
      if @LS_Return_Status <> 0
         begin
            rollback tran
            raiserror('SDK_WMS_POP_SPLIT_ORDER_S: Execution of procedure AA_POP_BATCH_DETAIL_S has failed!',16,1)
            return
         end
      
      insert into POP_DETAIL_PLUGINS_VCHAR
         (PODPV_DETAIL_LINK,PODPV_TAGNAME,PODPV_TAGVALUE)
         select @PS_Detail_Primary, PODPV_TAGNAME, PODPV_TAGVALUE
            from POP_DETAIL_PLUGINS_VCHAR
            where PODPV_DETAIL_LINK = @LS_POD_PRIMARY

      insert into POP_DETAIL_PLUGINS_DATETIME
         (PODPD_DETAIL_LINK,PODPD_TAGNAME,PODPD_TAGVALUE)
         select @PS_Detail_Primary, PODPD_TAGNAME, PODPD_TAGVALUE
            from POP_DETAIL_PLUGINS_DATETIME
            where PODPD_DETAIL_LINK = @LS_POD_PRIMARY

      insert into SDK_WMS_SEND_STATUS_DETAIL (
         WMSPD_WMSP_PRIMARY,WMSPD_TRAN_PRIMARY,WMSPD_ITEM_QTY,WMSPD_PACK_QTY,WMSPD_INNER_QTY,WMSPD_OUTER_QTY,WMSPD_SITE,WMSPD_COLOUR,WMSPD_SIZE,WMSPD_BATCH)
      select 
         WMSP_PRIMARY,@PS_Detail_Primary,WMSPD_ITEM_QTY,WMSPD_PACK_QTY,WMSPD_INNER_QTY,WMSPD_OUTER_QTY,WMSPD_SITE,WMSPD_COLOUR,WMSPD_SIZE,WMSPD_BATCH
         from SDK_WMS_SEND_STATUS join SDK_WMS_SEND_STATUS_DETAIL on WMSP_PRIMARY=WMSPD_WMSP_PRIMARY
         where WMSP_TRAN_PRIMARY=@PS_Order_Primary and WMSP_TRAN_TYPE='POP' and WMSPD_TRAN_PRIMARY = @LS_POD_PRIMARY

   end

select
   @LS_POH_L_DISCVAL                   =  sum(dbo.AA_VALUE_DPS_F(POD_L_DISCVAL))
,  @LS_POH_NETT                        =  sum(dbo.AA_VALUE_DPS_F(POD_NETT))
,  @LS_POH_T_DISCVAL                   =  sum(dbo.AA_VALUE_DPS_F(POD_T_DISCVAL))
,  @LS_POH_VAT                         =  sum(dbo.AA_VALUE_DPS_F(POD_VATAMNT))
,  @LS_POH_GROSS                       =    sum(dbo.AA_VALUE_DPS_F(POD_NETT))
                                          - sum(dbo.AA_VALUE_DPS_F(POD_T_DISCVAL))
                                          + sum(dbo.AA_VALUE_DPS_F(POD_VATAMNT))
,  @LS_POH_L_DISCVAL_C                 =  sum(dbo.AA_VALUE_DPS_F(POD_L_DISCVAL_C))
,  @LS_POH_NETT_C                      =  sum(dbo.AA_VALUE_DPS_F(POD_NETT_C))
,  @LS_POH_T_DISCVAL_C                 =  sum(dbo.AA_VALUE_DPS_F(POD_T_DISCVAL_C))
,  @LS_POH_TAX_C                       =  sum(dbo.AA_VALUE_DPS_F(POD_TAX_C))
,  @LS_POH_GROSS_C                     =    sum(dbo.AA_VALUE_DPS_F(POD_NETT_C))
                                          + sum(dbo.AA_VALUE_DPS_F(POD_TAX_C))
                                          - sum(dbo.AA_VALUE_DPS_F(POD_T_DISCVAL_C))
,  @LS_POH_L_DISC_BASE2                =  sum(dbo.AA_VALUE_DPS_F(POD_L_DISC_BASE2))
,  @LS_POH_NETT_BASE2                  =  sum(dbo.AA_VALUE_DPS_F(POD_NETT_BASE2))
,  @LS_POH_T_DISC_BASE2                =  sum(dbo.AA_VALUE_DPS_F(POD_T_DISC_BASE2))
,  @LS_POH_VAT_BASE2                   =  sum(dbo.AA_VALUE_DPS_F(POD_VAT_BASE2))
,  @LS_POH_GROSS_BASE2                 =    sum(dbo.AA_VALUE_DPS_F(POD_NETT_BASE2))
                                          + sum(dbo.AA_VALUE_DPS_F(POD_VAT_BASE2))
                                          - sum(dbo.AA_VALUE_DPS_F(POD_T_DISC_BASE2))
,  @LS_POH_ACQ_TAX                     =  sum(dbo.AA_VALUE_DPS_F
                                                 (
                                                     case EC_TYPE
                                                        when 'X' then 0
                                                        else
                                                           POD_ACQ_TAX
                                                     end
                                                  )
                                              )
,  @LS_POH_ACQUISTN_BASE2              =  sum(dbo.AA_VALUE_DPS_F
                                                 (
                                                     case EC_TYPE
                                                        when 'X' then 0
                                                        else
                                                           POD_ACQUISTN_BASE2
                                                     end
                                                  )
                                              )
,  @LS_POH_REVERSE_SERVICE_VAT         =  sum(dbo.AA_VALUE_DPS_F
                                                   (
                                                      case EC_TYPE
                                                         when 'X' then POD_ACQ_TAX
                                                         else
                                                            0
                                                      end
                                                   )
                                             )
,  @LS_POH_REVERSE_SERVICE_VAT_BASE2   =  sum(dbo.AA_VALUE_DPS_F
                                                   (
                                                      case EC_TYPE
                                                         when 'X' then POD_ACQUISTN_BASE2
                                                         else
                                                            0
                                                      end
                                                   )
                                             )
,  @LS_POH_OS_INVVAL                   =  sum
                                             (
                                                round
                                                   (
                                                      case
                                                         when  POD_STATUS = 2 then 0
                                                         when  round
                                                                  (
                                                                     (
                                                                        (
                                                                           case POD_QTYORD
                                                                              when 0 then 1
                                                                              else
                                                                                 POD_QTYORD
                                                                           end
                                                                        )
                                                                     -  POD_QTYINVD
                                                                     )
                                                                  ,  @LS_VALUE_DPS
                                                                  ) <= 0 then 0
                                                         else
                                                            round
                                                               (
                                                                  (
                                                                     (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else
                                                                              POD_QTYORD
                                                                        end
                                                                     )
                                                                  -  POD_QTYINVD
                                                                  )
                                                               *  (
                                                                     POD_NETT
                                                                  /  (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else
                                                                              POD_QTYORD
                                                                        end
                                                                     )
                                                                  )
                                                               -  round
                                                                     (
                                                                        (
                                                                           POD_T_DISCVAL
                                                                        /  (
                                                                              case POD_QTYORD
                                                                                 when 0 then 1
                                                                                 else
                                                                                    POD_QTYORD
                                                                              end
                                                                           )
                                                                        *  (
                                                                              (
                                                                                 case POD_QTYORD
                                                                                    when 0 then 1
                                                                                    else
                                                                                       POD_QTYORD
                                                                                 end
                                                                              )
                                                                           -  POD_QTYINVD
                                                                           )
                                                                        )
                                                                     ,  @LS_VALUE_DPS
                                                                     )
                                                               ,  @LS_VALUE_DPS
                                                               )
                                                      end
                                                   ,  @LS_VALUE_DPS
                                                   )
                                             )
,  @LS_POH_OS_INVCVAL                  =  sum
                                             (
                                                round
                                                   (
                                                      case
                                                         when  POD_STATUS = 2 then 0
                                                         when  round
                                                                  (
                                                                     (
                                                                        (
                                                                           case POD_QTYORD
                                                                              when 0 then 1
                                                                              else
                                                                                 POD_QTYORD
                                                                           end
                                                                        )
                                                                     -  POD_QTYINVD
                                                                     )
                                                                  ,  @LS_VALUE_DPS
                                                                  ) <= 0 then 0
                                                         else
                                                            round
                                                               (
                                                                  (
                                                                     (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else POD_QTYORD
                                                                        end
                                                                     )
                                                                  -  POD_QTYINVD
                                                                  )
                                                               *  (
                                                                     POD_NETT_C
                                                                  /  (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else
                                                                              POD_QTYORD
                                                                        end
                                                                     )
                                                                  )
                                                               -  round
                                                                     (
                                                                        (
                                                                           POD_T_DISCVAL_C
                                                                        /  (
                                                                              case POD_QTYORD
                                                                                 when 0 then 1
                                                                                 else
                                                                                    POD_QTYORD
                                                                              end
                                                                           )
                                                                        *  (
                                                                              (
                                                                                 case POD_QTYORD
                                                                                    when 0 then 1
                                                                                    else
                                                                                       POD_QTYORD
                                                                                 end
                                                                              )
                                                                           -  POD_QTYINVD
                                                                           )
                                                                        )
                                                                     ,  @LS_VALUE_DPS
                                                                     )
                                                                  ,  @LS_VALUE_DPS
                                                                  )
                                                      end
                                                   ,  @LS_VALUE_DPS
                                                   )
                                             )
,  @LS_POH_INV_VAL_BASE2               =  sum
                                             (
                                                round
                                                   (
                                                      case
                                                         when  POD_STATUS = 2 then 0
                                                         when  round
                                                                  (
                                                                     (
                                                                        (
                                                                           case POD_QTYORD
                                                                              when 0 then 1
                                                                              else
                                                                                 POD_QTYORD
                                                                           end
                                                                        )
                                                                     -  POD_QTYINVD
                                                                     )
                                                                  ,  @LS_VALUE_DPS
                                                                  ) <= 0 then 0
                                                         else  round
                                                                  (
                                                                     (
                                                                        (
                                                                           case POD_QTYORD
                                                                              when 0 then 1
                                                                              else
                                                                                 POD_QTYORD
                                                                           end
                                                                        )
                                                                     -  POD_QTYINVD
                                                                     )
                                                                  *  (
                                                                        POD_NETT_BASE2
                                                                     /  (
                                                                           case POD_QTYORD
                                                                              when 0 then 1
                                                                              else POD_QTYORD
                                                                           end
                                                                        )
                                                                     )
                                                                  -  round
                                                                        (
                                                                           (
                                                                              POD_T_DISC_BASE2
                                                                           /  (
                                                                                 case POD_QTYORD
                                                                                    when 0 then 1
                                                                                    else
                                                                                       POD_QTYORD
                                                                                 end
                                                                              )
                                                                           *  (
                                                                                 (
                                                                                    case POD_QTYORD
                                                                                       when 0 then 1
                                                                                       else
                                                                                          POD_QTYORD
                                                                                    end
                                                                                 )
                                                                              -  POD_QTYINVD
                                                                              )
                                                                           )
                                                                        ,  @LS_VALUE_DPS
                                                                        )
                                                                     ,  @LS_VALUE_DPS
                                                                     ) end
                                                   ,  @LS_VALUE_DPS
                                                   )
                                             )
,  @LS_POH_OS_DELVAL                   =  sum
                                             (
                                                round
                                                   (
                                                      case
                                                         when  POD_STATUS = 2 then 0
                                                         when  round
                                                                  (
                                                                     (
                                                                        (
                                                                           case POD_QTYORD
                                                                              when 0 then 1
                                                                              else
                                                                                 POD_QTYORD
                                                                           end
                                                                        )
                                                                     -  POD_QTYDELVD
                                                                     )
                                                                  ,  @LS_VALUE_DPS
                                                                  ) <= 0 then 0
                                                         else
                                                            round
                                                               (
                                                                  (
                                                                     (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else
                                                                              POD_QTYORD
                                                                        end
                                                                     )
                                                                  -  POD_QTYDELVD
                                                                  )
                                                               *  (
                                                                     POD_NETT
                                                                  /  (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else
                                                                              POD_QTYORD
                                                                        end
                                                                     )
                                                                  )
                                                               -  round
                                                                     (
                                                                        (
                                                                           POD_T_DISCVAL
                                                                        /  (
                                                                              case POD_QTYORD
                                                                                 when 0 then 1
                                                                                 else
                                                                                    POD_QTYORD
                                                                              end
                                                                           )
                                                                        *  (
                                                                              (
                                                                                 case POD_QTYORD
                                                                                    when 0 then 1
                                                                                    else
                                                                                       POD_QTYORD
                                                                                 end
                                                                              )
                                                                           -  POD_QTYDELVD
                                                                           )
                                                                        )
                                                                     ,  @LS_VALUE_DPS
                                                                     )
                                                               ,  @LS_VALUE_DPS
                                                               )
                                                      end
                                                   ,  @LS_VALUE_DPS
                                                   )
                                             )
,  @LS_POH_OS_DELCVAL                  =  sum
                                             (
                                                round
                                                   (
                                                      case
                                                         when  POD_STATUS = 2 then 0
                                                         when  round
                                                                  (
                                                                     (
                                                                        (
                                                                           case POD_QTYORD
                                                                              when 0 then 1
                                                                              else POD_QTYORD
                                                                           end
                                                                        )
                                                                     -  POD_QTYDELVD
                                                                     )
                                                                  ,  @LS_VALUE_DPS
                                                                  ) <= 0 then 0
                                                         else
                                                            round
                                                               (
                                                                  (
                                                                     (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else POD_QTYORD
                                                                        end
                                                                     )
                                                                  -  POD_QTYDELVD
                                                                  )
                                                               *  (
                                                                     POD_NETT_C
                                                                  /  (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else
                                                                              POD_QTYORD
                                                                        end
                                                                     )
                                                                  )
                                                               -  round
                                                                     (
                                                                        (
                                                                           POD_T_DISCVAL_C
                                                                        /  (
                                                                              case POD_QTYORD
                                                                                 when 0 then 1
                                                                                 else
                                                                                    POD_QTYORD
                                                                              end
                                                                           )
                                                                        *  (
                                                                              (
                                                                                 case POD_QTYORD
                                                                                    when 0 then 1
                                                                                    else
                                                                                       POD_QTYORD
                                                                                 end
                                                                              )
                                                                           -  POD_QTYDELVD
                                                                           )
                                                                        )
                                                                     ,  @LS_VALUE_DPS
                                                                     )
                                                               ,  @LS_VALUE_DPS
                                                               )
                                                      end
                                                   ,  @LS_VALUE_DPS
                                                   )
                                             )
,  @LS_POH_DEL_VAL_BASE2               =  sum
                                             (
                                                round
                                                   (
                                                      case
                                                         when  POD_STATUS = 2 then 0
                                                         when  round
                                                                  (
                                                                     (
                                                                        (
                                                                           case POD_QTYORD
                                                                              when 0 then 1
                                                                              else
                                                                                 POD_QTYORD
                                                                           end
                                                                        )
                                                                     -  POD_QTYDELVD
                                                                     )
                                                                  ,  @LS_VALUE_DPS
                                                                  ) <= 0 then 0
                                                         else
                                                            round
                                                               (
                                                                  (
                                                                     (
                                                                        case POD_QTYORD
                                                                           when 0 then 1
                                                                           else
                                                                              POD_QTYORD
                                                                        end
                                                                     )
                                                                  -  POD_QTYDELVD
                                                                  )
                                                               *  (
                                                                     POD_NETT_BASE2
                                                                  /  (
                                                                        case
                                                                           POD_QTYORD
                                                                           when 0 then 1
                                                                           else
                                                                              POD_QTYORD
                                                                        end
                                                                     )
                                                                  )
                                                               -  round
                                                                     (
                                                                        (
                                                                           POD_T_DISC_BASE2
                                                                        /  (
                                                                              case POD_QTYORD
                                                                                 when 0 then 1
                                                                                 else
                                                                                    POD_QTYORD
                                                                              end
                                                                           )
                                                                        *  (
                                                                              (
                                                                                 case POD_QTYORD
                                                                                    when 0 then 1
                                                                                    else
                                                                                       POD_QTYORD
                                                                                 end
                                                                              )
                                                                           -  POD_QTYDELVD
                                                                           )
                                                                        )
                                                                     ,  @LS_VALUE_DPS
                                                                     )
                                                               ,  @LS_VALUE_DPS
                                                               )
                                                      end
                                                   ,  @LS_VALUE_DPS
                                                   )
                                             )
   from
      POP_HEADER
         inner join  POP_DETAIL        on POD_ORDER_NO   = POH_ORDER_NUMBR
         inner join  SYS_VATCONTROL with(nolock)    on POD_VATCODE    = VAT_CODE
   where
      POH_PRIMARY = @PS_Order_Primary

if @LS_ROUND_ORDER_VAT_TO_5DP = 1
   begin
      with VATsummary
      as
        (
         select
            dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_VATAMNT) ))           as VAT_Home
          , dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_TAX_C) ))             as VAT_Curr
          , dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_VAT_BASE2) ))         as VAT_B2
          , dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_ACQ_TAX) ))           as VAT_ACQ_Home
          , dbo.AA_VALUE_DPS_F(sum ( dbo.AA_FIVE_DPS_F(POD_ACQUISTN_BASE2)))     as VAT_ACQ_B2
          , max(EC_TYPE)                                                         as EC_TYPE
            from POP_DETAIL join SYS_VATCONTROL with (nolock) on VAT_CODE = POD_VATCODE
            where POD_ORDER_NO = @PS_Order_Number
            group by POD_VATCODE
        )
      , VATtotal
      as
        (
         select
             dbo.AA_VALUE_DPS_F(sum(VAT_Home))                                            as VAT_Home
            ,dbo.AA_VALUE_DPS_F(sum(VAT_Curr))                                            as VAT_Curr
            ,dbo.AA_VALUE_DPS_F(sum(VAT_B2))                                              as VAT_B2
            ,dbo.AA_VALUE_DPS_F(sum(case EC_TYPE when 'X' then 0 else VAT_ACQ_Home end))  as VAT_ACQ_Home
            ,dbo.AA_VALUE_DPS_F(sum(case EC_TYPE when 'X' then 0 else VAT_ACQ_B2 end))    as VAT_ACQ_B2
            ,dbo.AA_VALUE_DPS_F(sum(case EC_TYPE when 'X' then VAT_ACQ_Home else 0 end))  as VAT_RevServiceHome
            ,dbo.AA_VALUE_DPS_F(sum(case EC_TYPE when 'X' then VAT_ACQ_B2 else 0 end))    as VAT_RevServiceB2
         from VATsummary
        )
      select
        @LS_POH_VAT                        = VAT_Home
      , @LS_POH_TAX_C                      = VAT_Curr
      , @LS_POH_VAT_BASE2                  = VAT_B2
      , @LS_POH_ACQ_TAX                    = VAT_ACQ_Home
      , @LS_POH_ACQUISTN_BASE2             = VAT_ACQ_B2
      , @LS_POH_GROSS                      = @LS_POH_NETT+VAT_Home-@LS_POH_T_DISCVAL
      , @LS_POH_GROSS_C                    = @LS_POH_NETT_C+VAT_Curr-@LS_POH_T_DISCVAL_C
      , @LS_POH_GROSS_BASE2                = @LS_POH_NETT_BASE2+VAT_B2-@LS_POH_T_DISC_BASE2
      , @LS_POH_REVERSE_SERVICE_VAT        = VAT_RevServiceHome
      , @LS_POH_REVERSE_SERVICE_VAT_BASE2  = VAT_RevServiceB2
         from VATtotal
   end

update POP_HEADER
   set
      POH_L_DISCVAL                 =  @LS_POH_L_DISCVAL
   ,  POH_NETT                      =  @LS_POH_NETT
   ,  POH_T_DISCVAL                 =  @LS_POH_T_DISCVAL
   ,  POH_VAT                       =  @LS_POH_VAT
   ,  POH_GROSS                     =  @LS_POH_GROSS
   ,  POH_L_DISCVAL_C               =  @LS_POH_L_DISCVAL_C
   ,  POH_NETT_C                    =  @LS_POH_NETT_C
   ,  POH_T_DISCVAL_C               =  @LS_POH_T_DISCVAL_C
   ,  POH_TAX_C                     =  @LS_POH_TAX_C
   ,  POH_GROSS_C                   =  @LS_POH_GROSS_C
   ,  POH_LINES_DELVD               =  @LS_POH_LINES_DELVD
   ,  POH_LINES_INVD                =  @LS_POH_LINES_INVD
   ,  POH_OS_INVVAL                 =  @LS_POH_OS_INVVAL
   ,  POH_OS_DELVAL                 =  @LS_POH_OS_DELVAL
   ,  POH_OS_INVCVAL                =  @LS_POH_OS_INVCVAL
   ,  POH_OS_DELCVAL                =  @LS_POH_OS_DELCVAL
   ,  POH_L_DISC_BASE2              =  @LS_POH_L_DISC_BASE2
   ,  POH_NETT_BASE2                =  @LS_POH_NETT_BASE2
   ,  POH_T_DISC_BASE2              =  @LS_POH_T_DISC_BASE2
   ,  POH_VAT_BASE2                 =  @LS_POH_VAT_BASE2
   ,  POH_GROSS_BASE2               =  @LS_POH_GROSS_BASE2
   ,  POH_INV_VAL_BASE2             =  @LS_POH_INV_VAL_BASE2
   ,  POH_DEL_VAL_BASE2             =  @LS_POH_DEL_VAL_BASE2
   ,  POH_ACC_STATUS                =  @LS_POH_ACC_STATUS
   ,  POH_ACQ_TAX                   =  @LS_POH_ACQ_TAX
   ,  POH_ACQUISTN_BASE2            =  @LS_POH_ACQUISTN_BASE2
   ,  POH_REVERSE_SERVICE_VAT       =  @LS_POH_REVERSE_SERVICE_VAT
   ,  POH_REVERSE_SERVICE_VAT_BASE2 =  @LS_POH_REVERSE_SERVICE_VAT_BASE2
   ,  POH_AUTHORISER_ID             =  @LS_POH_AUTHORISER_ID
   from
      POP_HEADER
   where
      POH_PRIMARY = @PS_Order_Primary
if @@rowcount = 0
   begin
      raiserror('Unable to update the order header table.',16,1)
      rollback tran
      return 99
   end

commit tran

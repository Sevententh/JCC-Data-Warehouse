
create procedure  SDK_WMS_SPLIT_POP_ORDER_S
/*
** Stored Procedure
**
** Written     :  03/10/2014 NC
** Last Amended:  17/10/2014 NC, 17/09/15 NC
**
*/
   @PS_User_Id          varchar(4)        -- User ID
,  @PS_Detail_Primary   int          out  -- Primary of detail line being completed
,  @PS_SplitQuantity    decimal(24,8)     -- Quantity to which the existing line is to be reduced to.
,  @PS_Source           varchar(1) = null -- Application from where the record originated. 'N'=Dim.Net, 'T'=TB, 'A'=API, 'D'=Dimensions, 'I'=Importer, 'H'=Horizons, 'C'=csplus, ''=unknown
as
declare
   @LS_OriginalLineQuantity            decimal(24,8)
,  @LS_POH_TYPE                        varchar(1)
,  @LS_Ratio                           decimal(24,8)
,  @LS_POD_QTYORD                      decimal(24,8)
,  @LS_POD_QTYINVD                     decimal(24,8)
,  @LS_POD_QTYUNIT                     decimal(24,8)
,  @LS_POD_QTYRESERVED                 decimal(24,8)
,  @LS_POD_LOCATN                      varchar(25)
,  @LS_POD_STOCK_CODE                  varchar(25)
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
,  @LS_POH_INV_VAL_BASE2               decimal(24,8)
,  @LS_POH_DEL_VAL_BASE2               decimal(24,8)
,  @LS_POH_BATCH_FLAG                  tinyint
,  @LS_POH_ACC_STATUS                  varchar(11)
,  @LS_POH_COMPLETED                   datetime
,  @LS_POH_CURR_CODE                   varchar(4)
,  @LS_POH_CURR_TYPE                   varchar(1)
,  @LS_POH_ACCOUNT                     varchar(10)
,  @LS_POH_DEL_CHG_PCT                 decimal(24,8)
,  @LS_POH_DEL_METHOD                  varchar(20)
,  @LS_POH_ACQ_TAX                     decimal(24,8)
,  @LS_POH_ACQUISTN_BASE2              decimal(24,8)
,  @LS_POH_REVERSE_SERVICE_VAT         decimal(24,8)
,  @LS_POH_REVERSE_SERVICE_VAT_BASE2   decimal(24,8)
,  @LS_Quantity                        decimal(24,8)
,  @LS_POD_TYPE                        varchar(1)
,  @LS_Costing_Value                   decimal(24,8)
,  @LS_POD_COSTHEADER                  varchar(10)
,  @LS_POD_COSTCENTRE                  varchar(10)
,  @LS_VALUE_DPS                       tinyint
,  @LS_QUANTITY_DPS                    tinyint
,  @LS_New_POD_QTYORD                  decimal(24,8)
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
,  @LS_Update_Fixed_Cost               tinyint
,  @LS_Update_Stock_on_Order           bit
,  @LS_Landed_Quantity                 decimal(24,8)
,  @LS_Landed_Value                    decimal(24,8)
,  @LS_Return_Status                   int
,  @LS_POD_DATE                        datetime
,  @LS_Security_Error                  varchar(150)
,  @LS_Complete_Line                   bit
,  @LS_Item                            varchar(25)
,  @LS_Price_Line                      tinyint
,  @LS_Allow_Empty_Serial_No           tinyint
,  @LS_POD_NETT                        decimal(24,8)
,  @LS_POD_NETT_C                      decimal(24,8)
,  @LS_POD_NETT_BASE2                  decimal(24,8)
,  @LS_POD_T_DISCVAL                   decimal(24,8)
,  @LS_POD_L_DISCVAL                   decimal(24,8)
,  @LS_Committed_Value                 decimal(24,8)
,  @LS_PURCH_UPDTEYEAR                 varchar(1)
,  @LS_POD_YEAR                        varchar(1)
,  @LS_NLC_YEAR                        varchar(1)
,  @LS_POD_PERIOD                      tinyint
,  @LS_POH_ORIGINAL_USER_PUTIN         varchar(4)
,  @LS_POD_STOCK_ANALYSIS              varchar(25)
,  @LS_POD_SERVICE                     bit            -- Service
,  @LS_ROUND_ORDER_VAT_TO_5DP          bit
,  @LS_VATAmountDps                    tinyint
,  @LS_AccrualNominalAccount           varchar(25)
,  @LS_AccrualNoOfPeriods              smallint
,  @LS_New_Detail_Primary              float
,  @LS_POD_ORDER_NO                    varchar(10)
,  @LS_Order_Primary                   float
,  @LS_POH_CIS_AUTHORISED              tinyint
,  @LS_WMSP_PRIMARY                    int
,  @LS_POH_SETT_DISC_1                 decimal(24,8)
,  @LS_POH_AUTHORISER_ID               varchar(4)

if isnull(@PS_Detail_Primary,0) = 0
   begin
      raiserror('The POP order line primary must be supplied.',16,1)
      return 99
   end 

select @LS_OriginalLineQuantity = POD_QTYORD
   ,  @LS_POD_STATUS                = POD_STATUS
   ,  @LS_POD_ORDER_NO              = POD_ORDER_NO
   ,  @LS_POD_TYPE                  = POD_TYPE
   ,  @LS_POD_QTYORD                = POD_QTYORD
   ,  @LS_POD_QTYINVD               = POD_QTYINVD
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
   ,  @LS_POD_STOCK_ANALYSIS        = POD_STOCK_ANALYSIS
   ,  @LS_POD_SERVICE               = POD_SERVICE
   ,  @LS_AccrualNominalAccount     = isnull(PDA_ACCRUAL_NOM,'')
   ,  @LS_AccrualNoOfPeriods        = isnull(PDA_PERIODS,0)
      from
         POP_DETAIL
            inner join  PL_ANALYSIS with (nolock)  on PACODE         = POD_ANALYSIS
            left join   POP_DETAIL2                on POD_PRIMARY_2  = POD_PRIMARY
            left join   POP_DETAIL_ACCRUALS        on PDA_PRIMARY    = POD_PRIMARY
   where POD_PRIMARY = @PS_Detail_Primary
if @@rowcount = 0 or @@error <> 0
   begin
      raiserror('The POP order line to be split nolonger exists.',16,1)
      return 99
   end

if @LS_POD_STATUS = 2
   begin
      raiserror('The POP order line is complete and therefore cannot be split.',16,1)
      return 99
   end

if @LS_OriginalLineQuantity = @PS_SplitQuantity
   return 0

if @PS_SplitQuantity > @LS_OriginalLineQuantity 
   begin
      raiserror('When splitting lines, the new quantity cannot exceed the original quantity.',16,1)
      return 99
   end

if @PS_SplitQuantity < @LS_POD_QTYINVD 
   begin
      raiserror('When splitting lines, the new quantity cannot exceed the quantity already invoiced.',16,1)
      return 99
   end

select
   @LS_Order_Primary             = POH_PRIMARY
,  @LS_POH_TYPE                  = POH_TYPE
,  @LS_POH_ORIGINAL_USER_PUTIN   = POH_ORIGINAL_USER_PUTIN
,  @LS_POH_PRIORITY              = POH_PRIORITY
,  @LS_POH_CURR_CODE             = POH_CURR_CODE
,  @LS_POH_CURR_TYPE             = POH_CURR_TYPE
,  @LS_POH_DEL_VAL_BASE2         = POH_DEL_VAL_BASE2
,  @LS_POH_ACCOUNT               = POH_ACCOUNT
,  @LS_POH_NO_OF_LINES           = POH_NO_OF_LINES
,  @LS_POH_LINES_DELVD           = POH_LINES_DELVD
,  @LS_POH_LINES_INVD            = POH_LINES_INVD
,  @LS_POH_BATCH_FLAG            = POH_BATCH_FLAG
,  @LS_POH_ACC_STATUS            = POH_ACC_STATUS
,  @LS_POH_COMPLETED             = POH_COMPLETED
,  @LS_POH_DEL_CHG_PCT           = POH_DEL_CHG_PCT
,  @LS_POH_DEL_METHOD            = POH_DEL_METHOD
,  @LS_POH_DISC_TOT_P            = POH_DISC_TOT_P
,  @LS_POH_SETT_DISC_1           = POH_SETT_DISC_1
,  @LS_POH_AUTHORISER_ID         = POH_AUTHORISER_ID
   from
      POP_HEADER
   where
      POH_ORDER_NUMBR = @LS_POD_ORDER_NO
if @@rowcount = 0 or @@error <> 0
   begin
      raiserror('The order specified does not exist.',16,1)
      return 99
   end

set @LS_New_POD_QTYORD = @LS_POD_QTYORD - @PS_SplitQuantity
set @LS_Price_Line = substring(@LS_POD_TABLECODE,2,len(@LS_POD_TABLECODE)-1)
set @LS_Update_Stock_on_Order  = case @LS_POD_QTYRESERVED
                                    when 0 then 0
                                    else
                                       1
                                 end

begin tran

-- Check for authorisation so that this can be temporary cleared to allow split
if @LS_POH_AUTHORISER_ID <> ''
   begin
      update POP_HEADER
         set POH_AUTHORISER_ID = ''
         where POH_PRIMARY = @LS_Order_Primary
   end

if @LS_POH_SETT_DISC_1 > 0
   update POP_HEADER
      set POH_SETT_DISC_1 = 0
      where POH_PRIMARY = @LS_Order_Primary

exec @LS_Return_Status = AA_EDIT_POP_BATCH_DETAIL_S
   @PS_Order_Type             = @LS_POH_TYPE
,  @PS_Order_Number           = @LS_POD_ORDER_NO
,  @PS_Quantity               = @PS_SplitQuantity
,  @PS_Linedisc_Perc          = @LS_POD_LINEDISC
,  @PS_Settlement_Disc1_Perc  = @LS_POH_SETT_DISC_1
,  @PS_User_Id                = @PS_User_Id
,  @PS_Detail_Primary         = @PS_Detail_Primary
if @LS_Return_Status > 0 or @@error <> 0
   begin
      raiserror('Error ececuting AA_EDIT_POP_BATCH_DETAIL_S.',16,1)
      if @@trancount > 0
         rollback tran
      return 99
   end

exec @LS_Return_Status = AA_POP_BATCH_DETAIL_S
   @PS_Order_Number               = @LS_POD_ORDER_NO
,  @PS_Order_Type                 = @LS_POH_TYPE
,  @PS_Account                    = @LS_POH_ACCOUNT
,  @PS_CurrencySymbol               = @LS_POH_CURR_CODE
,  @PS_CurrencyType                 = @LS_POH_CURR_TYPE
,  @PS_Update_Stock_on_Order        = @LS_Update_Stock_on_Order
,  @PS_Allow_Empty_SubAnalysis      = 1
,  @PS_Allow_Empty_Serial_No        = 1
,  @PS_Entry_Type                   = 'S'
,  @PS_Item_Code                    = @LS_POD_STOCK_CODE
,  @PS_Sub_Analysis                 = @LS_POD_LOCATN
,  @PS_Quantity                     = @LS_New_POD_QTYORD
,  @PS_Price_Line                   = @LS_Price_Line
,  @PS_Order_Status                 = @LS_POH_PRIORITY
,  @PS_Quantity_Unit                = @LS_POD_QTYUNIT
,  @PS_Home_Unit_Cost               = @LS_POD_UNITCST
,  @PS_Currency_Unit_Cost           = @LS_POD_UNITCST_C
,  @PS_Linedisc_Perc                = @LS_POD_LINEDISC
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
,  @PS_Detail_Primary               = @LS_New_Detail_Primary out
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
,  @PS_Source                       = @PS_Source
,  @PS_Authorised                   = @LS_POH_CIS_AUTHORISED
,  @PS_Service                      = @LS_POD_SERVICE
,  @PS_AccrualNominalAccount        = @LS_AccrualNominalAccount
,  @PS_AccrualNoOfPeriods           = @LS_AccrualNoOfPeriods
,  @PS_Stock_Analysis               = @LS_POD_STOCK_ANALYSIS
,  @PS_Allow_Empty_Stock_Analysis   = 1

if @LS_Return_Status > 0 or @@error <> 0
   begin
      raiserror('Error ececuting AA_EDIT_POP_BATCH_DETAIL_S.',16,1)
      if @@trancount > 0
         rollback tran
      return 99
   end

insert into POP_DETAIL_PLUGINS_VCHAR
   (PODPV_DETAIL_LINK,PODPV_TAGNAME,PODPV_TAGVALUE)
   select @LS_New_Detail_Primary,PODPV_TAGNAME,PODPV_TAGVALUE
      from POP_DETAIL_PLUGINS_VCHAR
      where PODPV_DETAIL_LINK = @PS_Detail_Primary
if @@error <> 0
   begin
      if @@trancount>0
         rollback tran
      raiserror('An error occurred while inserting POP transaction plugin xml.',16,1)
      return 99
   end
insert into POP_DETAIL_PLUGINS_DATETIME
   (PODPD_DETAIL_LINK,PODPD_TAGNAME,PODPD_TAGVALUE)
   select @LS_New_Detail_Primary, PODPD_TAGNAME, PODPD_TAGVALUE
      from POP_DETAIL_PLUGINS_DATETIME
      where PODPD_DETAIL_LINK = @PS_Detail_Primary
if @@error <> 0
   begin
      if @@trancount>0
         rollback tran
      raiserror('An error occurred while inserting POP transaction plugin xml.',16,1)
      return 99
   end

select @LS_WMSP_PRIMARY = WMSP_PRIMARY
   from SDK_WMS_SEND_STATUS
   where WMSP_TRAN_PRIMARY = @LS_Order_Primary  and WMSP_TRAN_TYPE='POP'

if @LS_WMSP_PRIMARY > 0
   begin
      insert into SDK_WMS_SEND_STATUS_DETAIL
         (WMSPD_WMSP_PRIMARY,WMSPD_TRAN_PRIMARY,WMSPD_ITEM_QTY,WMSPD_PACK_QTY,WMSPD_INNER_QTY,WMSPD_OUTER_QTY,WMSPD_SITE,WMSPD_COLOUR,WMSPD_SIZE,WMSPD_BATCH)
      select 
           @LS_WMSP_PRIMARY
         , @LS_New_Detail_Primary
         , case when WMSPD_ITEM_QTY>0 then @LS_New_POD_QTYORD else WMSPD_ITEM_QTY end
         , case when WMSPD_PACK_QTY>0 then @LS_New_POD_QTYORD else WMSPD_PACK_QTY end
         , WMSPD_INNER_QTY
         , WMSPD_OUTER_QTY
         , WMSPD_SITE
         , WMSPD_COLOUR
         , WMSPD_SIZE 
         , WMSPD_BATCH
         from SDK_WMS_SEND_STATUS_DETAIL
         where WMSPD_TRAN_PRIMARY = @PS_Detail_Primary and WMSPD_WMSP_PRIMARY = @LS_WMSP_PRIMARY
      if @@error <> 0
         begin
            if @@trancount>0
               rollback tran
            raiserror('An error occurred while inserting into the table SDK_WMS_SEND_STATUS_DETAIL.',16,1)
            return 99
         end
   end

if @LS_POH_AUTHORISER_ID <> ''
   begin
      update
            POP_HEADER
         set 
            POH_AUTHORISER_ID = @LS_POH_AUTHORISER_ID
         from
            POP_HEADER
         where
            POH_PRIMARY = @LS_Order_Primary

      if @@rowcount = 0
         begin
            raiserror('Unable to update the order header table.',16,1)
            rollback tran
            return 99
         end
   end
   
commit tran

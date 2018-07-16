CREATE PROCEDURE [dbo].[AA_EDIT_BATCH_DETAIL_LINES_S]
@PS_Order_Number VARCHAR (10) NULL, @PS_Module VARCHAR (3) NULL, @PS_Detail_Primary INT NULL, @PS_Account_Code VARCHAR (25) NULL, @PS_Account_Ref VARCHAR (10) NULL, @PS_Batch_Ref VARCHAR (10) NULL, @PS_Trn_Date DATETIME NULL, @PS_Trn_Year CHAR (1) NULL, @PS_Trn_Period TINYINT NULL, @PS_Archive_Flag TINYINT NULL, @PS_Disc_Perc_Changed BIT NULL, @PS_Applied_Tot_Disc_Perc DECIMAL (16, 2) NULL, @PS_Applied_Sett_Disc_perc DECIMAL (16, 2) NULL, @PS_Currencycode VARCHAR (4) NULL, @PS_Home_Currency_Symbol VARCHAR (4) NULL, @PS_Base2_Currency_Symbol VARCHAR (4) NULL, @PS_Currency_Type CHAR (1) NULL, @PS_Euro_Home_Rate DECIMAL (16, 6) NULL, @PS_Curr_Euro_Rate DECIMAL (16, 6) NULL, @PS_Currency_Rate DECIMAL (16, 6) NULL, @PS_Base2_Rate DECIMAL (16, 6) NULL, @PS_VAT_Rate DECIMAL (16, 6) NULL, @PS_Decimal_Places TINYINT NULL, @PS_Vat_Rounding BIT NULL, @PS_Gross_Entry_Mode BIT NULL, @PS_ExportImportCode VARCHAR (1) NULL, @PS_VatCode VARCHAR (4) NULL, @PS_VAT_EC_TYPE VARCHAR (1) NULL, @PS_Hold_Orders_Over_Limit BIT NULL, @PS_Include_Estimates_In_OS_Calc BIT NULL, @PS_ROUND_ORDER_VAT_TO_5DP BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



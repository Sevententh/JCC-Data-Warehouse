CREATE PROCEDURE [dbo].[AA_SLTRN_UPDATE_COSTING_S]
@PS_CT_CostHeader VARCHAR (10) NULL, @PS_CT_CostCentre VARCHAR (10) NULL, @PS_CT_VatCode VARCHAR (4) NULL, @PS_CT_Curr_Code VARCHAR (4) NULL, @PS_CT_Tran_Type VARCHAR (3) NULL, @PS_CT_Batch_Ref VARCHAR (10) NULL, @PS_CT_Archive_Flag TINYINT NULL, @PS_CT_Header_Ref VARCHAR (11) NULL, @PS_CT_Detail VARCHAR (240) NULL, @PS_CT_Date DATETIME NULL, @PS_CT_Period_Number TINYINT NULL, @PS_CT_Year CHAR (1) NULL, @PS_CT_Stock_Code VARCHAR (25) NULL, @PS_Det_Nominal_Cr VARCHAR (25) NULL, @PS_CT_Account_Code VARCHAR (10) NULL, @PS_CT_Analysis_Code VARCHAR (25) NULL, @PS_CT_Trans_Link INT NULL, @PS_CT_User_Putin VARCHAR (4) NULL, @PS_CT_Price DECIMAL (24, 8) NULL, @PS_CT_Quantity DECIMAL (24, 8) NULL, @PS_CT_Nett_Value DECIMAL (24, 8) NULL, @PS_CT_Vat_Value DECIMAL (24, 8) NULL, @PS_CT_Gross_Value DECIMAL (24, 8) NULL, @PS_CT_Curr_Rate DECIMAL (24, 8) NULL, @PS_CT_Curr_Value DECIMAL (24, 8) NULL, @PS_Det_Nominal_Dr VARCHAR (25) NULL, @PS_Det_Analysis_Type CHAR (1) NULL, @PS_Module VARCHAR (3) NULL, @PS_Order_Quantity DECIMAL (24, 8) NULL, @PS_Order_Nett DECIMAL (24, 8) NULL, @PS_Source VARCHAR (1) NULL, @PS_CT_Header_Link VARCHAR (20) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



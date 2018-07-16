CREATE PROCEDURE [dbo].[AA_PLTRN_CHECK_ANALYSIS_S]
@PS_Default_String VARCHAR (2) NULL, @PS_Analysis_Code VARCHAR (25) NULL OUTPUT, @PS_VAT_Code VARCHAR (4) NULL OUTPUT, @PS_Transaction_Type CHAR (3) NULL, @PS_Currency_Code VARCHAR (6) NULL, @PS_Currency_Symbol VARCHAR (4) NULL, @PS_Import_Code CHAR (1) NULL, @PS_Vat_Reg_No VARCHAR (30) NULL, @PS_Supplier_Analysis VARCHAR (25) NULL, @PS_Supplier_VAT_Code VARCHAR (4) NULL, @PS_Stock_Price_Analysis VARCHAR (25) NULL, @PS_Analysis_Type CHAR (1) NULL OUTPUT, @PS_Nominal_Debit VARCHAR (25) NULL OUTPUT, @PS_Nominal_Credit VARCHAR (25) NULL OUTPUT, @PS_Nominal_VAT VARCHAR (25) NULL OUTPUT, @PS_Force_Costing TINYINT NULL OUTPUT, @PS_VAT_Rate DECIMAL (24, 8) NULL OUTPUT, @PS_EC_Type CHAR (1) NULL OUTPUT, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ReverseChargeVatItem BIT NULL, @PS_DeliveryChargeLine BIT NULL, @PS_CISTaxable BIT NULL OUTPUT, @PS_SubAnalysisAnalysis VARCHAR (25) NULL, @PS_Service BIT NULL, @PS_Recreate_Order_Line BIT NULL, @PS_Accrue BIT NULL OUTPUT, @PS_AccrualPeriods SMALLINT NULL OUTPUT, @PS_SettlementDiscountCreditNote BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



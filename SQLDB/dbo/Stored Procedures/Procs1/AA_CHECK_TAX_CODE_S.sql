CREATE PROCEDURE [dbo].[AA_CHECK_TAX_CODE_S]
@PS_Default_VAT_Code_Flag TINYINT NULL, @PS_Export_Code CHAR (1) NULL, @PS_VAT_Reg_No VARCHAR (30) NULL, @PS_VAT_Code VARCHAR (4) NULL OUTPUT, @PS_VAT_Rate DECIMAL (24, 8) NULL OUTPUT, @PS_EC_Type CHAR (1) NULL OUTPUT, @PS_Module CHAR (1) NULL, @PS_Account_VAT_Code VARCHAR (4) NULL, @PS_User_Id VARCHAR (4) NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_VAT_Name VARCHAR (40) NULL OUTPUT, @PS_AnalysisVatCode VARCHAR (4) NULL, @PS_ReverseChargeVatItem BIT NULL, @PS_Context TINYINT NULL, @PS_DeliveryChargeLine BIT NULL, @PS_TransactionType VARCHAR (3) NULL, @PS_Service BIT NULL, @PS_Recreate_Order_Line BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



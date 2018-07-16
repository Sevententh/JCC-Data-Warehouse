CREATE PROCEDURE [dbo].[AA_CALC_TRANSACTION_VALUES_S]
@PS_Currency_Symbol VARCHAR (4) NULL, @PS_Acquisition_Tax_Flag TINYINT NULL, @PS_Currency_Type CHAR (1) NULL, @PS_Currency_Entry_Mode CHAR (1) NULL, @PS_Gross_Entry_Mode BIT NULL, @PS_Direct_Rate DECIMAL (16, 6) NULL, @PS_Euro_Home_Rate DECIMAL (16, 6) NULL, @PS_Euro_Curr_Rate DECIMAL (16, 6) NULL, @PS_Base2_Rate DECIMAL (16, 6) NULL, @PS_Settlement_Discount DECIMAL (24, 8) NULL, @PS_TAX_Rate DECIMAL (24, 8) NULL, @PS_Ignore_Values_Flag BIT NULL, @PS_Home_Value DECIMAL (24, 8) NULL, @PS_Home_Net DECIMAL (24, 8) NULL OUTPUT, @PS_Home_Gross DECIMAL (24, 8) NULL OUTPUT, @PS_Home_Vat DECIMAL (24, 8) NULL OUTPUT, @PS_Curr_Net DECIMAL (24, 8) NULL OUTPUT, @PS_Curr_Tax DECIMAL (24, 8) NULL OUTPUT, @PS_Curr_Gross DECIMAL (24, 8) NULL OUTPUT, @PS_Base2_Net DECIMAL (24, 8) NULL OUTPUT, @PS_Base2_Vat DECIMAL (24, 8) NULL OUTPUT, @PS_Base2_Gross DECIMAL (24, 8) NULL OUTPUT, @PS_Default_String VARCHAR (4) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_CurrencyGrossEntryMode BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



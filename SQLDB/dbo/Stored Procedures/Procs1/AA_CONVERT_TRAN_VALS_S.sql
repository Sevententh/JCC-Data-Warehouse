CREATE PROCEDURE [dbo].[AA_CONVERT_TRAN_VALS_S]
@PS_Currency_Type CHAR (1) NULL, @PS_Conversion_Mode TINYINT NULL, @PS_Decimal_Places TINYINT NULL, @PS_Direct_Rate DECIMAL (16, 6) NULL, @PS_Euro_Home_Rate DECIMAL (16, 6) NULL, @PS_Euro_Curr_Rate DECIMAL (16, 6) NULL, @PS_Base2_Rate DECIMAL (16, 6) NULL, @PS_Net_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Vat_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Gross_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Acquisition_Tax_Flag BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



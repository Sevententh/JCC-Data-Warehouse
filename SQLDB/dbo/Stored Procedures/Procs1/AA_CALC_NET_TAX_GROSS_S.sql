CREATE PROCEDURE [dbo].[AA_CALC_NET_TAX_GROSS_S]
@PS_Gross_Entry_Mode BIT NULL, @PS_Exclude_Sett_Discount TINYINT NULL, @PS_Settlement_Discount DECIMAL (24, 8) NULL, @PS_TAX_Rate DECIMAL (24, 8) NULL, @PS_Acquisition_Tax_Flag TINYINT NULL, @PS_Decimal_Places TINYINT NULL, @PS_Net_Value DECIMAL (24, 8) NULL OUTPUT, @PS_VAT_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Gross_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Default_Vatvalue CHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



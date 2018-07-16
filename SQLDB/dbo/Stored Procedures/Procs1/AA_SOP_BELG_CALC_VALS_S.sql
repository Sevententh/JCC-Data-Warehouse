CREATE PROCEDURE [dbo].[AA_SOP_BELG_CALC_VALS_S]
@PS_Origin VARCHAR (3) NULL, @PS_Home_Nett DECIMAL (24, 8) NULL, @PS_Curr_Nett DECIMAL (24, 8) NULL, @PS_Base2_Nett DECIMAL (24, 8) NULL, @PS_Vat DECIMAL (24, 8) NULL, @PS_Vat_Rate DECIMAL (24, 8) NULL, @PS_Curr_Tax DECIMAL (24, 8) NULL, @PS_Base2_Vat DECIMAL (24, 8) NULL, @PS_TaxRule_Percent DECIMAL (24, 8) NULL, @PS_TaxRule_Nom_Sign CHAR (1) NULL, @PS_TaxRule_Box_Sign CHAR (1) NULL, @PS_TaxRule_Type CHAR (1) NULL, @PS_TaxRule_Vat DECIMAL (24, 8) NULL OUTPUT, @PS_TaxRule_Curr_Vat DECIMAL (24, 8) NULL OUTPUT, @PS_TaxRule_Base2_Vat DECIMAL (24, 8) NULL OUTPUT, @PS_TaxBox_Value DECIMAL (24, 8) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



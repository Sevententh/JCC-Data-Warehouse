CREATE PROCEDURE [dbo].[AA_NLTRN_INSERT_SINGL_CONTRA_S]
@PS_Det_Primary INT NULL, @PS_Temp_Vat DECIMAL (24, 8) NULL, @PS_Temp_Gross DECIMAL (24, 8) NULL, @PS_Temp_Curr_Tax DECIMAL (24, 8) NULL, @PS_Temp_Curr_Gross DECIMAL (24, 8) NULL, @PS_Temp_Vat_Base2 DECIMAL (24, 8) NULL, @PS_Temp_Gross_Base2 DECIMAL (24, 8) NULL, @PS_Trn_Curr_Symbol VARCHAR (4) NULL, @PS_Trn_Curr_Rate DECIMAL (24, 8) NULL, @PS_Trn_Vat_Contra VARCHAR (25) NULL, @PS_Trn_Gross_Contra VARCHAR (25) NULL, @PS_Trn_Header_Ref VARCHAR (25) NULL, @PS_Trn_Base2_Rate DECIMAL (24, 8) NULL, @PS_Curr_Euro_Rate DECIMAL (24, 8) NULL, @PS_Home_Euro_Rate DECIMAL (24, 8) NULL, @PS_Header_Description VARCHAR (200) NULL, @PS_Trn_Curr_Rate_Chng TINYINT NULL, @PS_Curr_Euro_Rate_Chng TINYINT NULL, @PS_Home_Euro_Rate_Chng TINYINT NULL, @PS_Trn_Base2_Rate_Chng TINYINT NULL, @PS_Nt_Cheque_Payee VARCHAR (40) NULL, @PS_Source VARCHAR (1) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_Temp_Quantity DECIMAL (24, 8) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



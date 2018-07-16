CREATE PROCEDURE [dbo].[AA_NLTRN_INSERT_MULTI_CONTRA_S]
@PS_Det_Primary INT NULL, @PS_Trn_Gross_Contra VARCHAR (25) NULL, @PS_Trn_Vat_Contra VARCHAR (25) NULL, @PS_Trn_Curr_Symbol VARCHAR (4) NULL, @PS_Trn_Curr_Rate DECIMAL (24, 8) NULL, @PS_Trn_2nd_Base_Rate DECIMAL (24, 8) NULL, @PS_Curr_Euro_Rate DECIMAL (24, 8) NULL, @PS_Home_Euro_Rate DECIMAL (24, 8) NULL, @PS_Nt_Cheque_Payee VARCHAR (40) NULL, @PS_Source VARCHAR (1) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



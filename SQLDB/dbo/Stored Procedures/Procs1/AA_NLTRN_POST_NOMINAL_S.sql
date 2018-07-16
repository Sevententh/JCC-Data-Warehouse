CREATE PROCEDURE [dbo].[AA_NLTRN_POST_NOMINAL_S]
@PS_Module VARCHAR (3) NULL, @PS_Update_Flag TINYINT NULL, @PS_Tran_Currency VARCHAR (4) NULL, @PS_Det_Nom_Period TINYINT NULL, @PS_Det_Nom_Year CHAR (1) NULL, @PS_Det_Vat_Rules TINYINT NULL, @PS_Home_Nett DECIMAL (24, 8) NULL, @PS_Home_Vat DECIMAL (24, 8) NULL, @PS_Curr_Nett DECIMAL (24, 8) NULL, @PS_Curr_Tax DECIMAL (24, 8) NULL, @PS_Det_Nom_Cr VARCHAR (25) NULL OUTPUT, @PS_Det_Nom_Dr VARCHAR (25) NULL OUTPUT, @PS_Det_Srv_Status TINYINT NULL OUTPUT, @PS_Det_Reconciled TINYINT NULL OUTPUT, @PS_UserID VARCHAR (4) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



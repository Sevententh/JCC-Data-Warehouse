CREATE PROCEDURE [dbo].[AA_TRN_NOM_ANALYSIS_S]
@PS_Module VARCHAR (3) NULL, @PS_Tran_Type VARCHAR (3) NULL, @PS_Update_Sign CHAR (1) NULL, @PS_Tran_Currency VARCHAR (4) NULL, @PS_Det_Nom_Period TINYINT NULL, @PS_Det_Nom_Year CHAR (1) NULL, @PS_Det_Period_Number TINYINT NULL, @PS_Det_Year CHAR (1) NULL, @PS_Det_Analysis VARCHAR (25) NULL, @PS_Det_Vat_Rules TINYINT NULL, @PS_Home_Nett DECIMAL (24, 8) NULL, @PS_Home_Vat DECIMAL (24, 8) NULL, @PS_Curr_Nett DECIMAL (24, 8) NULL, @PS_Curr_Tax DECIMAL (24, 8) NULL, @PS_Det_Nom_Cr VARCHAR (25) NULL OUTPUT, @PS_Det_Nom_Dr VARCHAR (25) NULL OUTPUT, @PS_Det_Nom_Vat VARCHAR (25) NULL OUTPUT, @PS_Centralised TINYINT NULL OUTPUT, @PS_Det_Srv_Status TINYINT NULL OUTPUT, @PS_Det_Reconciled TINYINT NULL OUTPUT, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



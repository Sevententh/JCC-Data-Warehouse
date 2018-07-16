CREATE PROCEDURE [dbo].[AA_TRN_UPDATE_NOMINAL_S]
@PS_Update_Sign CHAR (1) NULL, @PS_Nominal_Primary INT NULL, @PS_Nominal_Type CHAR (1) NULL, @PS_Nominal_Currency VARCHAR (4) NULL, @PS_Trans_Currency VARCHAR (4) NULL, @PS_Home_Value DECIMAL (24, 8) NULL, @PS_Currency_Value DECIMAL (24, 8) NULL, @PS_DET_NOM_PERIOD TINYINT NULL, @PS_DET_NOM_YEAR CHAR (1) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



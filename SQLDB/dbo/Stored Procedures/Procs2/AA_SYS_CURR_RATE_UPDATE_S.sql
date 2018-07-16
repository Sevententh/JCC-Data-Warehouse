CREATE PROCEDURE [dbo].[AA_SYS_CURR_RATE_UPDATE_S]
@PS_User_Id VARCHAR (4) NULL, @PS_Currency_Code VARCHAR (6) NULL, @PS_Rate DECIMAL (16, 6) NULL, @PS_Date DATETIME NULL, @PS_Update_Date BIT NULL, @PS_ISO_Code VARCHAR (3) NULL, @PS_Inverse BIT NULL, @PS_Bank_Currency VARCHAR (3) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Previous_Rate DECIMAL (16, 6) NULL OUTPUT, @PS_Validate_Only BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_SYS_VAT_RETURN_UPDATE_S]
@PS_ValidateOnly BIT NULL, @PS_UserID NVARCHAR (4) NULL, @PS_From_Year NVARCHAR (1) NULL, @PS_From_Period TINYINT NULL, @PS_To_Year NVARCHAR (1) NULL, @PS_To_Period TINYINT NULL, @PS_Tax_Ref NVARCHAR (10) NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



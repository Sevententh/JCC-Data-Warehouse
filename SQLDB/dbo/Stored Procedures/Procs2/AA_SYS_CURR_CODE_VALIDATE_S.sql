CREATE PROCEDURE [dbo].[AA_SYS_CURR_CODE_VALIDATE_S]
@PS_UserID NVARCHAR (4) NULL, @PS_Currency_Rate_Code NVARCHAR (6) NULL, @PS_CalledFrom INT NULL, @PS_Currency_Symbol NVARCHAR (4) NULL, @PS_CustomerCode NVARCHAR (10) NULL, @PS_SupplierCode NVARCHAR (10) NULL, @PS_NominalCode NVARCHAR (25) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_Check2Currency BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



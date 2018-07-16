CREATE PROCEDURE [dbo].[AA_PL_ACCOUNTS_VALIDATE_S]
@PS_UserID NVARCHAR (4) NULL, @PS_SupplierCode NVARCHAR (10) NULL, @PS_CalledFrom INT NULL, @PS_DetailLinesExist TINYINT NULL, @PS_CurrencySymbol NVARCHAR (4) NULL, @PS_VATExportStatus NVARCHAR (2) NULL, @PS_BankCode NVARCHAR (25) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_PL_ACCOUNT_PROCESS_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ReturnType TINYINT NULL OUTPUT, @PS_SupplierCode NVARCHAR (10) NULL, @PS_SupplierPrimary BIGINT NULL, @PS_DetailLinesExist TINYINT NULL, @PS_CurrencySymbol NVARCHAR (4) NULL, @PS_VATExportStatus NVARCHAR (2) NULL, @PS_BankCode NVARCHAR (25) NULL, @PS_Transaction_Date DATETIME NULL, @PS_CurrencyType NVARCHAR (2) NULL, @PS_CurrencyRate DECIMAL (16, 6) NULL, @PS_CurrencyCode NVARCHAR (10) NULL, @PS_HomeEuroRate DECIMAL (16, 6) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



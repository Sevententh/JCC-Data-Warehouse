CREATE PROCEDURE [dbo].[AA_SYS_VAT_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_CodeFrom NVARCHAR (4) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo NVARCHAR (4) NULL, @PS_ECTypeFrom NVARCHAR (1) NULL, @PS_ECTypeSearch TINYINT NULL, @PS_ECTypeTo NVARCHAR (1) NULL, @PS_TaxSortKeyFrom NVARCHAR (4) NULL, @PS_TaxSortKeySearch TINYINT NULL, @PS_TaxSortKeyTo NVARCHAR (4) NULL, @PS_ModifiedUserFrom NVARCHAR (4) NULL, @PS_ModifiedUserSearch TINYINT NULL, @PS_ModifiedUserTo NVARCHAR (4) NULL, @PS_CreatedUserFrom NVARCHAR (4) NULL, @PS_CreatedUserSearch TINYINT NULL, @PS_CreatedUserTo NVARCHAR (4) NULL, @PS_VATExportStatus NVARCHAR (2) NULL, @PS_AccountCode NVARCHAR (10) NULL, @PS_AddressNo INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



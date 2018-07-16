CREATE PROCEDURE [dbo].[AA_SYS_COUNTRY_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_CodeFrom NVARCHAR (4) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo NVARCHAR (4) NULL, @PS_NameFrom NVARCHAR (20) NULL, @PS_NameSearch TINYINT NULL, @PS_NameTo NVARCHAR (20) NULL, @PS_CurrencyFrom NVARCHAR (4) NULL, @PS_CurrencySearch TINYINT NULL, @PS_CurrencyTo NVARCHAR (4) NULL, @PS_CreatedUserFrom NVARCHAR (4) NULL, @PS_CreatedUserSearch TINYINT NULL, @PS_CreatedUserTo NVARCHAR (4) NULL, @PS_ModifiedUserFrom NVARCHAR (4) NULL, @PS_ModifiedUserSearch TINYINT NULL, @PS_ModifiedUserTo NVARCHAR (4) NULL, @PS_IncludeEUCountries BIT NULL, @PS_IncludeNonEUCountries BIT NULL, @PS_IncludeHomeCountry BIT NULL, @PS_IncludeExcluded BIT NULL, @PS_VATExportStatus NVARCHAR (2) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



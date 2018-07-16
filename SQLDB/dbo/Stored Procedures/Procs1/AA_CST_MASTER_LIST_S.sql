CREATE PROCEDURE [dbo].[AA_CST_MASTER_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_CodeFrom NVARCHAR (10) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo NVARCHAR (10) NULL, @PS_NameFrom NVARCHAR (40) NULL, @PS_NameSearch TINYINT NULL, @PS_NameTo NVARCHAR (40) NULL, @PS_SalesAnalysisFrom NVARCHAR (25) NULL, @PS_SalesAnalysisSearch TINYINT NULL, @PS_SalesAnalysisTo NVARCHAR (25) NULL, @PS_PurchaseAnalysisFrom NVARCHAR (25) NULL, @PS_PurchaseAnalysisSearch TINYINT NULL, @PS_PurchaseAnalysisTo NVARCHAR (25) NULL, @PS_ResourceRateFrom TINYINT NULL, @PS_ResourceRateSearch TINYINT NULL, @PS_ResourceRateTo TINYINT NULL, @PS_IncludeFixedType TINYINT NULL, @PS_IncludeResourceType TINYINT NULL, @PS_IncludeIncomeCategory TINYINT NULL, @PS_IncludeExpenseCategory TINYINT NULL, @PS_IncludeBothCategory TINYINT NULL, @PS_ShowExcludedRecords TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



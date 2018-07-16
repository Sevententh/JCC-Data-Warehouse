CREATE PROCEDURE [dbo].[AA_PL_CHEQUES_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_FindChequesBy TINYINT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_Source NVARCHAR (1) NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_SupplierCodeFrom NVARCHAR (10) NULL, @PS_SupplierCodeSearch TINYINT NULL, @PS_SupplierCodeTo NVARCHAR (10) NULL, @PS_AccountCodeFrom NVARCHAR (10) NULL, @PS_AccountCodeSearch TINYINT NULL, @PS_AccountCodeTo NVARCHAR (10) NULL, @PS_TransactionDateFrom DATETIME NULL, @PS_TransactionDateSearch TINYINT NULL, @PS_TransactionDateTo DATETIME NULL, @PS_BankAnalysisFrom NVARCHAR (10) NULL, @PS_BankAnalysisSearch TINYINT NULL, @PS_BankAnalysisTo NVARCHAR (10) NULL, @PS_SortKeyFrom NVARCHAR (10) NULL, @PS_SortKeySearch TINYINT NULL, @PS_SortKeyTo NVARCHAR (10) NULL, @PS_User NVARCHAR (4) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



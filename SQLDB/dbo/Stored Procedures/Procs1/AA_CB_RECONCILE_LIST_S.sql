CREATE PROCEDURE [dbo].[AA_CB_RECONCILE_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_NomAccountCode VARCHAR (25) NULL, @PS_Reconcile TINYINT NULL, @PS_TransactionPrimary INT NULL, @PS_TransactionLedger INT NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_TransactionDateFrom DATETIME NULL, @PS_TransactionDateSearch TINYINT NULL, @PS_TransactionDateTo DATETIME NULL, @PS_TransactionYearPeriodFrom NVARCHAR (3) NULL, @PS_TransactionYearPeriodSearch TINYINT NULL, @PS_TransactionYearPeriodTo NVARCHAR (3) NULL, @PS_TransactionYearFrom NCHAR (1) NULL, @PS_TransactionYearSearch TINYINT NULL, @PS_TransactionYearTo NCHAR (1) NULL, @PS_TransactionPeriodFrom TINYINT NULL, @PS_TransactionPeriodSearch TINYINT NULL, @PS_TransactionPeriodTo TINYINT NULL, @PS_HeaderReferenceFrom NVARCHAR (25) NULL, @PS_HeaderReferenceSearch TINYINT NULL, @PS_HeaderReferenceTo NVARCHAR (25) NULL, @PS_StatementReferenceFrom NVARCHAR (10) NULL, @PS_StatementReferenceSearch TINYINT NULL, @PS_StatementReferenceTo NVARCHAR (10) NULL, @PS_IncludeLastYear BIT NULL, @PS_IncludeCurrentYear BIT NULL, @PS_IncludeNextYear BIT NULL, @PS_IncludeOtherYear BIT NULL, @PS_IncludeSalesLedger BIT NULL, @PS_IncludePurchaseLedger BIT NULL, @PS_IncludeNominalLedger BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



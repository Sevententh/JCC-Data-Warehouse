CREATE PROCEDURE [dbo].[AA_PL_BACS_EXPORT_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_Source NVARCHAR (1) NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_SupplierCodeFrom NVARCHAR (10) NULL, @PS_SupplierCodeSearch TINYINT NULL, @PS_SupplierCodeTo NVARCHAR (10) NULL, @PS_TransactionDateFrom DATETIME NULL, @PS_TransactionDateSearch TINYINT NULL, @PS_TransactionDateTo DATETIME NULL, @PS_User NVARCHAR (4) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



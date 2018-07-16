CREATE PROCEDURE [dbo].[AA_SL_ALLOCATION_HISTORY_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_TransactionPrimary INT NULL, @PS_AccountCodeFrom NVARCHAR (10) NULL, @PS_AccountCodeSearch TINYINT NULL, @PS_AccountCodeTo NVARCHAR (10) NULL, @PS_AllocationYearPeriodFrom NVARCHAR (3) NULL, @PS_AllocationYearPeriodSearch TINYINT NULL, @PS_AllocationYearPeriodTo NVARCHAR (3) NULL, @PS_AllocationYearFrom NCHAR (1) NULL, @PS_AllocationYearSearch TINYINT NULL, @PS_AllocationYearTo NCHAR (1) NULL, @PS_AllocationPeriodFrom TINYINT NULL, @PS_AllocationPeriodSearch TINYINT NULL, @PS_AllocationPeriodTo TINYINT NULL, @PS_AllocationReferenceFrom NVARCHAR (10) NULL, @PS_AllocationReferenceSearch TINYINT NULL, @PS_AllocationReferenceTo NVARCHAR (10) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



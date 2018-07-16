CREATE PROCEDURE [dbo].[AA_CST_RESOURCE_TRANSACTION_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_SQLOnly BIT NULL, @PS_SQLStatement NVARCHAR (4000) NULL OUTPUT, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_ProjectCodeFrom NVARCHAR (10) NULL, @PS_ProjectCodeSearch TINYINT NULL, @PS_ProjectCodeTo NVARCHAR (10) NULL, @PS_CostCentreCodeFrom NVARCHAR (10) NULL, @PS_CostCentreCodeSearch TINYINT NULL, @PS_CostCentreCodeTo NVARCHAR (10) NULL, @PS_ResourceCodeFrom NVARCHAR (16) NULL, @PS_ResourceCodeSearch TINYINT NULL, @PS_ResourceCodeTo NVARCHAR (16) NULL, @PS_YearPeriodFrom NVARCHAR (3) NULL, @PS_YearPeriodSearch TINYINT NULL, @PS_YearPeriodTo NVARCHAR (3) NULL, @PS_YearWeekFrom NVARCHAR (3) NULL, @PS_YearWeekSearch TINYINT NULL, @PS_YearWeekTo NVARCHAR (3) NULL, @PS_IncludeActual TINYINT NULL, @PS_IncludeEstimate TINYINT NULL, @PS_IncludeBatchedCosting TINYINT NULL, @PS_IncludePosted TINYINT NULL, @PS_AuditCostingDetailFrom INT NULL, @PS_AuditCostingDetailSearch TINYINT NULL, @PS_AuditCostingDetailTo INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



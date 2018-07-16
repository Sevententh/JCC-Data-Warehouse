CREATE PROCEDURE [dbo].[AA_SYS_DIARY_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod BIT NULL, @PS_OutputMode TINYINT NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_TargetDateFrom DATETIME NULL, @PS_TargetDateSearch TINYINT NULL, @PS_TargetDateTo DATETIME NULL, @PS_CodeFrom NVARCHAR (25) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo NVARCHAR (25) NULL, @PS_NameFrom NVARCHAR (80) NULL, @PS_NameSearch TINYINT NULL, @PS_NameTo NVARCHAR (80) NULL, @PS_UserEnteredFrom NVARCHAR (4) NULL, @PS_UserEnteredSearch TINYINT NULL, @PS_UserEnteredTo NVARCHAR (4) NULL, @PS_UserAssignedFrom NVARCHAR (4) NULL, @PS_UserAssignedSearch TINYINT NULL, @PS_UserAssignedTo NVARCHAR (4) NULL, @PS_IncludeCustomer BIT NULL, @PS_IncludeSupplier BIT NULL, @PS_IncludeSalesAnalysis BIT NULL, @PS_IncludePurchaseAnalysis BIT NULL, @PS_IncludeProject BIT NULL, @PS_IncludeResource BIT NULL, @PS_IncludeNominal BIT NULL, @PS_IncludeGeneral BIT NULL, @PS_IncludeCompleted BIT NULL, @PS_IncludeNonCompleted BIT NULL, @PS_IncludeHighPriority BIT NULL, @PS_IncludeNormalPriority BIT NULL, @PS_IncludeLowPriority BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



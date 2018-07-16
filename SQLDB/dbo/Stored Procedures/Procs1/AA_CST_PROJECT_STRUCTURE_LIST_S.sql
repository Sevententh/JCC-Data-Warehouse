CREATE PROCEDURE [dbo].[AA_CST_PROJECT_STRUCTURE_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_CodeFrom NVARCHAR (10) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo NVARCHAR (10) NULL, @PS_NameFrom NVARCHAR (40) NULL, @PS_NameSearch TINYINT NULL, @PS_NameTo NVARCHAR (40) NULL, @PS_SortKeyFrom NVARCHAR (20) NULL, @PS_SortKeySearch TINYINT NULL, @PS_SortKeyTo NVARCHAR (20) NULL, @PS_CreatedByFrom NVARCHAR (4) NULL, @PS_CreatedBySearch TINYINT NULL, @PS_CreatedByTo NVARCHAR (4) NULL, @PS_ModifiedByFrom TINYINT NULL, @PS_ModifiedBySearch TINYINT NULL, @PS_ModifiedByTo TINYINT NULL, @PS_ShowExcludedRecords TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



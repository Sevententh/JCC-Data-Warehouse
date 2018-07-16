CREATE PROCEDURE [dbo].[AA_CST_UNRECOVERABLE_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_ProjectCode NVARCHAR (10) NULL, @PS_ProjectName NVARCHAR (40) NULL, @PS_CentreCodeFrom NVARCHAR (10) NULL, @PS_CentreCodeSearch TINYINT NULL, @PS_CentreCodeTo NVARCHAR (10) NULL, @PS_ResourceCodeFrom NVARCHAR (16) NULL, @PS_ResourceCodeSearch TINYINT NULL, @PS_ResourceCodeTo NVARCHAR (16) NULL, @PS_ReferenceFrom NVARCHAR (10) NULL, @PS_ReferenceSearch TINYINT NULL, @PS_ReferenceTo NVARCHAR (10) NULL, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_YearPeriodFrom NVARCHAR (3) NULL, @PS_YearPeriodSearch TINYINT NULL, @PS_YearPeriodTo NVARCHAR (3) NULL, @PS_YearWeekFrom NVARCHAR (3) NULL, @PS_YearWeekSearch TINYINT NULL, @PS_YearWeekTo NVARCHAR (3) NULL, @PS_WeekNoFrom TINYINT NULL, @PS_WeekNoSearch TINYINT NULL, @PS_WeekNoTo TINYINT NULL, @PS_IncludeUnrecoverableOnly BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



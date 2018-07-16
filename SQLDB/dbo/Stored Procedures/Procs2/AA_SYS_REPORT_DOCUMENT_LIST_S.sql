CREATE PROCEDURE [dbo].[AA_SYS_REPORT_DOCUMENT_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_PrimaryFrom BIGINT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo BIGINT NULL, @PS_FileNameFrom NVARCHAR (255) NULL, @PS_FileNameSearch TINYINT NULL, @PS_FileNameTo NVARCHAR (255) NULL, @PS_ReportKeyFrom NVARCHAR (32) NULL, @PS_ReportKeySearch TINYINT NULL, @PS_ReportKeyTo NVARCHAR (32) NULL, @PS_ReportTypeIDFrom INT NULL, @PS_ReportTypeIDSearch TINYINT NULL, @PS_ReportTypeIDTo INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



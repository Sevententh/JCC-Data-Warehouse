CREATE PROCEDURE [dbo].[AA_SYS_REPORT_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_PrimaryFrom BIGINT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo BIGINT NULL, @PS_FileNameFrom NVARCHAR (255) NULL, @PS_FileNameSearch TINYINT NULL, @PS_FileNameTo NVARCHAR (255) NULL, @PS_ReportKeyFrom NVARCHAR (32) NULL, @PS_ReportKeySearch TINYINT NULL, @PS_ReportKeyTo NVARCHAR (32) NULL, @PS_ReportTypeSysDescFrom NVARCHAR (255) NULL, @PS_ReportTypeSysDescSearch TINYINT NULL, @PS_ReportTypeSysDescTo NVARCHAR (255) NULL, @PS_IncludeSalesLedger BIT NULL, @PS_IncludePurchaseLedger BIT NULL, @PS_IncludeNominalLedger BIT NULL, @PS_IncludeCosting BIT NULL, @PS_IncludeSop BIT NULL, @PS_IncludePop BIT NULL, @PS_IncludeStockControl BIT NULL, @PS_IncludeCrm BIT NULL, @PS_IncludeGeneral BIT NULL, @PS_IncludeFavourites BIT NULL, @PS_IncludeNonFavourites BIT NULL, @PS_IncludeStandardReports BIT NULL, @PS_IncludeCustomReports BIT NULL, @PS_DescriptionFrom NVARCHAR (200) NULL, @PS_DescriptionSearch TINYINT NULL, @PS_DescriptionTo NVARCHAR (200) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_CST_WIP_INV_TRANSACTION_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_CountOnly TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_CodeFrom NVARCHAR (10) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo NVARCHAR (10) NULL, @PS_CentreCodeFrom NVARCHAR (10) NULL, @PS_CentreCodeSearch TINYINT NULL, @PS_CentreCodeTo NVARCHAR (10) NULL, @PS_CustomerCodeFrom NVARCHAR (16) NULL, @PS_CustomerCodeSearch TINYINT NULL, @PS_CustomerCodeTo NVARCHAR (16) NULL, @PS_TranDateFrom DATETIME NULL, @PS_TranDateSearch TINYINT NULL, @PS_TranDateTo DATETIME NULL, @PS_WeekNoFrom INT NULL, @PS_WeekNoSearch TINYINT NULL, @PS_WeekNoTo INT NULL, @PS_YearPeriodFrom NVARCHAR (3) NULL, @PS_YearPeriodSearch TINYINT NULL, @PS_YearPeriodTo NVARCHAR (3) NULL, @PS_MilestoneDateFrom DATETIME NULL, @PS_MilestoneDateSearch TINYINT NULL, @PS_MilestoneDateTo DATETIME NULL, @PS_WIPInvoicingMethod TINYINT NULL, @PS_Currency NVARCHAR (4) NULL, @PS_AnyCurrency TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



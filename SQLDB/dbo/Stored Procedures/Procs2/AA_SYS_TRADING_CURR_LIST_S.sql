CREATE PROCEDURE [dbo].[AA_SYS_TRADING_CURR_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_CurrencyFrom NVARCHAR (4) NULL, @PS_CurrencySearch TINYINT NULL, @PS_CurrencyTo NVARCHAR (4) NULL, @PS_DescriptionFrom NVARCHAR (40) NULL, @PS_DescriptionSearch TINYINT NULL, @PS_DescriptionTo NVARCHAR (40) NULL, @PS_ISOCodeFrom NVARCHAR (3) NULL, @PS_ISOCodeSearch TINYINT NULL, @PS_ISOCodeTo NVARCHAR (3) NULL, @PS_IncludeExcluded BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



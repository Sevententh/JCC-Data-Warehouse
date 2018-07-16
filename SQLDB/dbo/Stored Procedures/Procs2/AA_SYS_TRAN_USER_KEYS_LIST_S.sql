CREATE PROCEDURE [dbo].[AA_SYS_TRAN_USER_KEYS_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_IncludeType1 TINYINT NULL, @PS_IncludeType2 TINYINT NULL, @PS_IncludeType3 TINYINT NULL, @PS_IncludeSales TINYINT NULL, @PS_IncludePurchase TINYINT NULL, @PS_IncludeNominal TINYINT NULL, @PS_IncludeSOP TINYINT NULL, @PS_IncludePOP TINYINT NULL, @PS_IncludeNotAssigned TINYINT NULL, @PS_DescriptionFrom NVARCHAR (20) NULL, @PS_DescriptionSearch TINYINT NULL, @PS_DescriptionTo NVARCHAR (20) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



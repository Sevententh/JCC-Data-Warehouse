CREATE PROCEDURE [dbo].[AA_SYS_LANGUAGE_MESSAGE_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod BIT NULL, @PS_OutputMode TINYINT NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_LanguagePrimaryFrom INT NULL, @PS_LanguagePrimarySearch TINYINT NULL, @PS_LanguagePrimaryTo INT NULL, @PS_LanguageFrom NVARCHAR (10) NULL, @PS_LanguageSearch TINYINT NULL, @PS_LanguageTo NVARCHAR (10) NULL, @PS_DescriptionFrom NVARCHAR (40) NULL, @PS_DescriptionSearch TINYINT NULL, @PS_DescriptionTo NVARCHAR (40) NULL, @PS_MessageFrom NVARCHAR (250) NULL, @PS_MessageSearch TINYINT NULL, @PS_MessageTo NVARCHAR (250) NULL, @PS_FormKeyFrom NVARCHAR (120) NULL, @PS_FormKeySearch TINYINT NULL, @PS_FormKeyTo NVARCHAR (120) NULL, @PS_MessageTagFrom NVARCHAR (120) NULL, @PS_MessageTagSearch TINYINT NULL, @PS_MessageTagTo NVARCHAR (120) NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_SYS_TRANSACTION_TEMPLATE_LIST_S]
@PS_UserID VARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartCode VARCHAR (50) NULL, @PS_StartPrimary VARCHAR (50) NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName VARCHAR (30) NULL OUTPUT, @PS_TotalRecordCount FLOAT (53) NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_PrimaryFrom INT NULL, @PS_PrimarySearch TINYINT NULL, @PS_PrimaryTo INT NULL, @PS_IncludePersonalTemplates BIT NULL, @PS_IncludeNonPersonalTemplates BIT NULL, @PS_IncludeProfileTemplates BIT NULL, @PS_IncludeNonProfileTemplates BIT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



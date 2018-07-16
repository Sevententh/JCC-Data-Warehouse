CREATE PROCEDURE [dbo].[AA_SYS_VAT_PROCESS_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ReturnType TINYINT NULL OUTPUT, @PS_VATCode NVARCHAR (4) NULL, @PS_VATExportStatus NVARCHAR (2) NULL, @PS_AccountCode NVARCHAR (10) NULL, @PS_AddressNo INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_SYS_CURR_CODE_PROCESS_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ReturnType TINYINT NULL OUTPUT, @PS_Currency_Rate_Code NVARCHAR (4) NULL, @PS_Currency_Symbol NVARCHAR (4) NULL, @PS_Transaction_Date DATETIME NULL, @PS_CustomerCode NVARCHAR (10) NULL, @PS_SupplierCode NVARCHAR (10) NULL, @PS_NominalCode NVARCHAR (25) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_NL_RECORD_PROCESS_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod BIT NULL, @PS_ReturnType TINYINT NULL OUTPUT, @PS_NominalCode NVARCHAR (25) NULL, @PS_NominalPrimary BIGINT NULL, @PS_AnalysisType NVARCHAR (1) NULL, @PS_Currency NVARCHAR (4) NULL, @PS_NominalProfileAccount NVARCHAR (25) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



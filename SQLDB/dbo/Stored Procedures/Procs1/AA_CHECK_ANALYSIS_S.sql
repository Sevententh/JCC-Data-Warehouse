CREATE PROCEDURE [dbo].[AA_CHECK_ANALYSIS_S]
@PS_Analysis_Code VARCHAR (25) NULL, @PS_Ledger NVARCHAR (1) NULL, @PS_Account_Currency_Code VARCHAR (6) NULL, @PS_Multi_Currency BIT NULL, @PS_Valid_Analysis_Types NVARCHAR (3) NULL, @PS_User_ID NVARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_EnforceLevels BIT NULL, @PS_AnalysisName NVARCHAR (40) NULL OUTPUT, @PS_AccountCode NVARCHAR (10) NULL, @PS_Tran_Currency_Symbol VARCHAR (4) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



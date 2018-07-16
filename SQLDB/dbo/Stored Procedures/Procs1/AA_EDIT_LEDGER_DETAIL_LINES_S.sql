CREATE PROCEDURE [dbo].[AA_EDIT_LEDGER_DETAIL_LINES_S]
@PS_Module VARCHAR (3) NULL, @PS_Header_Primary INT NULL, @PS_Header_Reference VARCHAR (25) NULL, @PS_Account_Code VARCHAR (10) NULL, @PS_Subledger_Code VARCHAR (10) NULL, @PS_Batch_Reference VARCHAR (10) NULL, @PS_Transaction_Date DATETIME NULL, @PS_Transaction_Period TINYINT NULL, @PS_Transaction_Year CHAR (1) NULL, @PS_Archive_Flag TINYINT NULL, @PS_Ec_Transaction_Nature VARCHAR (2) NULL, @PS_Nominal_Year CHAR (1) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_OriginalSubLedger VARCHAR (10) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



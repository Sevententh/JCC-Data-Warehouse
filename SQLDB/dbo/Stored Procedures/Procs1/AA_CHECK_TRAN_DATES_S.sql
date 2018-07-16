CREATE PROCEDURE [dbo].[AA_CHECK_TRAN_DATES_S]
@PS_Transaction_Date DATETIME NULL OUTPUT, @PS_Due_Date DATETIME NULL OUTPUT, @PS_Anticipated_Date DATETIME NULL OUTPUT, @PS_Transaction_Type CHAR (3) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_Ledger VARCHAR (2) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



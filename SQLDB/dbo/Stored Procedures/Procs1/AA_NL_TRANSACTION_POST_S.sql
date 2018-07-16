CREATE PROCEDURE [dbo].[AA_NL_TRANSACTION_POST_S]
@PS_Tran_Primary INT NULL OUTPUT, @PS_User_Id VARCHAR (4) NULL, @PS_Entry_Period TINYINT NULL OUTPUT, @PS_Entry_Year VARCHAR (2) NULL OUTPUT, @PS_Next_Posting_Date DATETIME NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_Header_Key VARCHAR (20) NULL, @PS_LockRecord BIT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_Warn_Override BIT NULL, @PS_Header_Reference VARCHAR (10) NULL OUTPUT, @PS_MaxPeriodPostings INT NULL OUTPUT, @PS_NoOfPeriodPostings INT NULL OUTPUT, @PS_PostingYearEnum INT NULL OUTPUT, @PS_ReverseToPeriod1 BIT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



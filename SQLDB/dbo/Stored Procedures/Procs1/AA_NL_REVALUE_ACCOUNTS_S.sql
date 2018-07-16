CREATE PROCEDURE [dbo].[AA_NL_REVALUE_ACCOUNTS_S]
@PS_UserID NVARCHAR (4) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_CurrencyRate DECIMAL (16, 6) NULL, @PS_CurrencyType NVARCHAR (1) NULL, @PS_Source NVARCHAR (1) NULL, @PS_JournalRef NVARCHAR (10) NULL, @PS_JournalDate DATETIME NULL, @PS_JournalDescription NVARCHAR (200) NULL, @PS_JournalYear NVARCHAR (1) NULL, @PS_JournalPeriod TINYINT NULL, @PS_ReverseStatus TINYINT NULL, @PS_BatchJournal BIT NULL, @PS_JournalBatchRef NVARCHAR (10) NULL, @PS_Bank BIT NULL, @PS_PettyCash BIT NULL, @PS_AccountCode NVARCHAR (25) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_SL_BULK_RECEIPTS_POST_S]
@PS_Source NVARCHAR (1) NULL, @PS_BatchID INT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_LinesToProcess BIT NULL, @PS_UserID VARCHAR (4) NULL, @PS_CurrencySymbol VARCHAR (4) NULL, @PS_CurrencyType VARCHAR (1) NULL, @PS_CurrencyRate DECIMAL (16, 6) NULL, @PS_EuroToHomeRate DECIMAL (16, 6) NULL, @PS_Base2Rate DECIMAL (16, 6) NULL, @PS_Reference VARCHAR (10) NULL, @PS_ReceiptDate DATETIME NULL, @PS_ReceiptPeriod TINYINT NULL, @PS_ReceiptYear VARCHAR (1) NULL, @PS_BankAnalysis VARCHAR (25) NULL OUTPUT, @PS_DiscountAnalysis VARCHAR (25) NULL OUTPUT, @PS_AllocationDate DATETIME NULL OUTPUT, @PS_AllocationPeriod TINYINT NULL OUTPUT, @PS_AllocationYear VARCHAR (1) NULL OUTPUT, @PS_IsHomeCurrency BIT NULL, @PS_Value_DPS TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ReceiptType TINYINT NULL, @PS_SettlementDiscountMethod TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



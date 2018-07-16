CREATE PROCEDURE [dbo].[AA_SLTRN_PROCESS_BULKRCT_S]
@PS_Source NVARCHAR (1) NULL, @PS_Mode TINYINT NULL, @PS_BatchID INT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_UserID VARCHAR (4) NULL, @PS_CurrencyCode VARCHAR (6) NULL, @PS_CurrencySymbol VARCHAR (4) NULL OUTPUT, @PS_CurrencyRate DECIMAL (16, 6) NULL OUTPUT, @PS_Reference VARCHAR (10) NULL OUTPUT, @PS_ReceiptDate DATETIME NULL OUTPUT, @PS_ReceiptPeriod TINYINT NULL OUTPUT, @PS_ReceiptYear VARCHAR (1) NULL OUTPUT, @PS_ReceiptYearEnum INT NULL OUTPUT, @PS_BankAnalysis VARCHAR (25) NULL OUTPUT, @PS_DiscountAnalysis VARCHAR (25) NULL OUTPUT, @PS_AllocationDate DATETIME NULL OUTPUT, @PS_AllocationPeriod TINYINT NULL OUTPUT, @PS_AllocationYear VARCHAR (1) NULL OUTPUT, @PS_AllocationYearEnum INT NULL OUTPUT, @PS_MinAllocYearEnum INT NULL OUTPUT, @PS_MinAllocPeriod TINYINT NULL OUTPUT, @PS_TotalToBeReceived DECIMAL (24, 8) NULL OUTPUT, @PS_BankAnalysisName NVARCHAR (40) NULL OUTPUT, @PS_DiscountAnalysisName NVARCHAR (40) NULL OUTPUT, @PS_HomeDifference DECIMAL (24, 8) NULL OUTPUT, @PS_HomeDifferenceType TINYINT NULL OUTPUT, @PS_Base2Difference DECIMAL (24, 8) NULL OUTPUT, @PS_Base2DifferenceType TINYINT NULL OUTPUT, @PS_DifferenceType TINYINT NULL OUTPUT, @PS_DifferenceCurrency TINYINT NULL OUTPUT, @PS_DifferenceCurrencySymbol VARCHAR (4) NULL OUTPUT, @PS_LocksAcquiredAlready BIT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ReceiptType TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



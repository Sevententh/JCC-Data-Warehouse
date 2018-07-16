CREATE PROCEDURE [dbo].[AA_POST_DIFFERENCE_S]
@PS_TranType VARCHAR (3) NULL, @PS_RoundingDifference BIT NULL, @PS_Ledger VARCHAR (1) NULL, @PS_DifferenceCurrency VARCHAR (4) NULL, @PS_CurrencyType CHAR (1) NULL, @PS_HomeExchangeDifference DECIMAL (24, 8) NULL, @PS_Base2ExchangeDifference DECIMAL (24, 8) NULL, @PS_AccountCode VARCHAR (10) NULL, @PS_AllocDate DATETIME NULL, @PS_AllocPeriod TINYINT NULL, @PS_AllocYear CHAR (1) NULL, @PS_AllocUser VARCHAR (4) NULL, @PS_DifferenceAnalysis VARCHAR (25) NULL OUTPUT, @PS_DifferenceReference VARCHAR (10) NULL OUTPUT, @PS_DifferenceDescription VARCHAR (30) NULL OUTPUT, @PS_AllocationReference VARCHAR (10) NULL, @PS_Validate_Only TINYINT NULL, @PS_Correction BIT NULL, @PS_DifferenceAnalysisName VARCHAR (40) NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_TranDate DATETIME NULL, @PS_TranPeriod TINYINT NULL, @PS_TranYear CHAR (1) NULL, @PS_IgnoreCompulsoryCosting BIT NULL, @PS_CalledFrom INT NULL, @PS_IgnoreCompulsorySubLedger BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



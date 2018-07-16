CREATE PROCEDURE [dbo].[AA_TRN_MULTI_ALLOCATE_S]
@PS_ValidateOnly TINYINT NULL, @PS_Ledger VARCHAR (1) NULL, @PS_AllocationTempID INT NULL OUTPUT, @PS_AllocationRef VARCHAR (10) NULL OUTPUT, @PS_DifferenceType TINYINT NULL OUTPUT, @PS_DifferenceCurrency BIT NULL OUTPUT, @PS_HomeExchangeDifference DECIMAL (24, 8) NULL OUTPUT, @PS_AllocDate DATETIME NULL OUTPUT, @PS_AllocPeriod TINYINT NULL OUTPUT, @PS_AllocYear VARCHAR (2) NULL OUTPUT, @PS_AllocUser VARCHAR (4) NULL, @PS_DifferenceAnalysis VARCHAR (25) NULL OUTPUT, @PS_DifferenceReference VARCHAR (10) NULL OUTPUT, @PS_DifferenceDescription VARCHAR (30) NULL OUTPUT, @PS_DifferenceCurrencySymbol VARCHAR (4) NULL OUTPUT, @PS_Correction BIT NULL OUTPUT, @PS_Error INT NULL OUTPUT, @PS_Base2ExchangeDifference DECIMAL (24, 8) NULL OUTPUT, @PS_DifferenceAnalysisName VARCHAR (40) NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_AllocYearEnum INT NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_LocksAcquiredAlready BIT NULL, @PS_OperationLocksAcquiredFor VARCHAR (2) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



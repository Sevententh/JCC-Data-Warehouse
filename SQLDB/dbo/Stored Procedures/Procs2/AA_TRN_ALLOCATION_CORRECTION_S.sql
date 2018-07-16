CREATE PROCEDURE [dbo].[AA_TRN_ALLOCATION_CORRECTION_S]
@PS_ValidateOnly TINYINT NULL, @PS_UserID VARCHAR (4) NULL, @PS_Ledger VARCHAR (1) NULL, @PS_CorrectionTempID INT NULL OUTPUT, @PS_DifferenceType TINYINT NULL OUTPUT, @PS_DifferenceCurrency BIT NULL OUTPUT, @PS_HomeExchangeDifference DECIMAL (24, 8) NULL OUTPUT, @PS_AllocDate DATETIME NULL OUTPUT, @PS_AllocPeriod TINYINT NULL OUTPUT, @PS_AllocYear VARCHAR (1) NULL OUTPUT, @PS_DifferenceAnalysis VARCHAR (25) NULL OUTPUT, @PS_DifferenceReference VARCHAR (10) NULL OUTPUT, @PS_DifferenceDescription VARCHAR (30) NULL OUTPUT, @PS_DifferenceCurrencySymbol VARCHAR (4) NULL OUTPUT, @PS_Error INT NULL OUTPUT, @PS_Base2ExchangeDifference DECIMAL (24, 8) NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod BIT NULL, @PS_DifferenceAnalysisName VARCHAR (40) NULL OUTPUT, @PS_AllocYearEnum INT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



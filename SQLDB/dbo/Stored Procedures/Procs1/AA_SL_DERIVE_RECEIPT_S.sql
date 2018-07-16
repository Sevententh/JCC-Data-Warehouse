CREATE PROCEDURE [dbo].[AA_SL_DERIVE_RECEIPT_S]
@PS_UserID NVARCHAR (4) NULL, @PS_TransactionPrimary BIGINT NULL, @PS_CalledFrom INT NULL, @PS_CustomerPrimary BIGINT NULL OUTPUT, @PS_TransactionDate DATETIME NULL OUTPUT, @PS_Year NCHAR (1) NULL OUTPUT, @PS_YearEnum INT NULL OUTPUT, @PS_Period TINYINT NULL OUTPUT, @PS_HeaderReference NVARCHAR (10) NULL OUTPUT, @PS_HeaderDescription NVARCHAR (30) NULL OUTPUT, @PS_CurrencySymbol NVARCHAR (4) NULL OUTPUT, @PS_CurrencyRate DECIMAL (16, 6) NULL OUTPUT, @PS_CurrencyType TINYINT NULL OUTPUT, @PS_HomeEuroRate DECIMAL (16, 6) NULL OUTPUT, @PS_BankAnalysisPrimary BIGINT NULL OUTPUT, @PS_BankAnalysisHomeValue DECIMAL (24, 8) NULL OUTPUT, @PS_BankAnalysisCurrValue DECIMAL (24, 8) NULL OUTPUT, @PS_DiscAnalysisPrimary BIGINT NULL OUTPUT, @PS_DiscAnalysisHomeValue DECIMAL (24, 8) NULL OUTPUT, @PS_DiscAnalysisCurrValue DECIMAL (24, 8) NULL OUTPUT, @PS_SubLedgerPrimary BIGINT NULL OUTPUT, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_BankAnalysisCode NCHAR (25) NULL OUTPUT, @PS_DiscAnalysisCode NCHAR (25) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



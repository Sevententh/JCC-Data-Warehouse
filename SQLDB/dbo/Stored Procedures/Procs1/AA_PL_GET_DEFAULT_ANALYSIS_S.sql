CREATE PROCEDURE [dbo].[AA_PL_GET_DEFAULT_ANALYSIS_S]
@PS_UserID NVARCHAR (4) NULL, @PS_AnalysisCode NVARCHAR (25) NULL OUTPUT, @PS_CurrencyCode NVARCHAR (6) NULL, @PS_CurrencySymbol NVARCHAR (4) NULL, @PS_AnalysisType NCHAR (1) NULL OUTPUT, @PS_AnalysisNominalDebit NVARCHAR (25) NULL OUTPUT, @PS_AnalysisNominalCredit NVARCHAR (25) NULL OUTPUT, @PS_AnalysisNominalVAT NVARCHAR (25) NULL OUTPUT, @PS_ForceCosting TINYINT NULL OUTPUT, @PS_TransactionType NVARCHAR (3) NULL, @PS_SupplierAnalysis NVARCHAR (25) NULL, @PS_StockPriceAnalysis NVARCHAR (25) NULL, @PS_AnalysisName NVARCHAR (40) NULL OUTPUT, @PS_AnalysisVatCode NVARCHAR (4) NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_BankCode NVARCHAR (25) NULL, @PS_CashbookMode BIT NULL, @PS_AnalysisPrimary INT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



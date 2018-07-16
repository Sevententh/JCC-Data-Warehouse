CREATE PROCEDURE [dbo].[AA_SL_GET_DEFAULT_ANALYSIS_S]
@PS_UserID NVARCHAR (4) NULL, @PS_AnalysisCode NVARCHAR (25) NULL OUTPUT, @PS_CurrencyCode NVARCHAR (4) NULL, @PS_CurrencySymbol NVARCHAR (4) NULL, @PS_AnalysisType NCHAR (1) NULL OUTPUT, @PS_NominalDebit NVARCHAR (25) NULL OUTPUT, @PS_NominalCredit NVARCHAR (25) NULL OUTPUT, @PS_NominalVAT NVARCHAR (25) NULL OUTPUT, @PS_SalesForceCosting TINYINT NULL OUTPUT, @PS_TransactionType NCHAR (3) NULL, @PS_CustomerAnalysis NVARCHAR (25) NULL, @PS_StockPriceAnalysis NVARCHAR (25) NULL, @PS_AnalysisName NVARCHAR (40) NULL OUTPUT, @PS_AnalysisVatCode NVARCHAR (4) NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_BankCode NVARCHAR (25) NULL, @PS_CashbookMode BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



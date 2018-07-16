CREATE PROCEDURE [dbo].[AA_GET_CODE_FROM_CATEGORY_S]
@PS_Ledger VARCHAR (3) NULL, @PS_TransactionType VARCHAR (3) NULL, @PS_AccountOrAnalysisPrimary INT NULL OUTPUT, @PS_AccountOrAnalysisCode VARCHAR (25) NULL OUTPUT, @PS_AccountOrAnalysisName VARCHAR (40) NULL OUTPUT, @PS_CategoryCode1 VARCHAR (6) NULL OUTPUT, @PS_CategoryCode2 VARCHAR (6) NULL OUTPUT, @PS_CategoryCode3 VARCHAR (6) NULL OUTPUT, @PS_CategoryCode4 VARCHAR (6) NULL OUTPUT, @PS_CategoryCode5 VARCHAR (6) NULL OUTPUT, @PS_CategoryCode6 VARCHAR (6) NULL OUTPUT, @PS_CategoryCode7 VARCHAR (6) NULL OUTPUT, @PS_CategoryCode8 VARCHAR (6) NULL OUTPUT, @PS_CurrencySymbol VARCHAR (4) NULL OUTPUT, @PS_CurrencyISOCode VARCHAR (3) NULL OUTPUT, @PS_UserId VARCHAR (4) NULL, @PS_UserLevel INT NULL, @PS_UserLevelExact BIT NULL, @PS_DoNotRaiseValidationErrors BIT NULL, @PS_SubAnalysisDefAnalCode VARCHAR (25) NULL, @PS_StockPriceDefAnalCode VARCHAR (25) NULL, @PS_DeliveryAddressDefAnalCode VARCHAR (25) NULL, @PS_InvoiceAddressDefAnalCode VARCHAR (25) NULL, @PS_SuppCustDefAnalCode VARCHAR (25) NULL, @PS_HomeCurrencyDefAnalCode VARCHAR (25) NULL, @PS_SystemDefaultAnalCode VARCHAR (25) NULL, @PS_OrderStage VARCHAR (1) NULL, @PS_NominalPrimary INT NULL OUTPUT, @PS_NominalCode VARCHAR (25) NULL OUTPUT, @PS_NominalName VARCHAR (40) NULL OUTPUT, @PS_PurchSalesAnalysis BIT NULL, @PS_BankAnalysis BIT NULL, @PS_DiscountAnalysis BIT NULL, @PS_StockAnalysis BIT NULL, @PS_NL_Any_Currency BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



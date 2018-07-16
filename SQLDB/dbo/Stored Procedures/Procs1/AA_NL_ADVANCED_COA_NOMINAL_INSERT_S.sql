CREATE PROCEDURE [dbo].[AA_NL_ADVANCED_COA_NOMINAL_INSERT_S]
@PS_UserId VARCHAR (4) NULL, @PS_Source VARCHAR (1) NULL, @PS_COA_Primary INT NULL, @PS_NominalPrimary INT NULL OUTPUT, @PS_NominalCode VARCHAR (25) NULL, @PS_NominalName VARCHAR (40) NULL, @PS_CurrencySymbol VARCHAR (4) NULL, @PS_CategoryCode1 VARCHAR (6) NULL, @PS_CategoryCode2 VARCHAR (6) NULL, @PS_CategoryCode3 VARCHAR (6) NULL, @PS_CategoryCode4 VARCHAR (6) NULL, @PS_CategoryCode5 VARCHAR (6) NULL, @PS_CategoryCode6 VARCHAR (6) NULL, @PS_CategoryCode7 VARCHAR (6) NULL, @PS_CategoryCode8 VARCHAR (6) NULL, @PS_YearEndCode VARCHAR (25) NULL, @PS_HomeSymbol VARCHAR (4) NULL, @PS_ANL_FullyOn BIT NULL, @PS_ANL_CAT_DETAIL_LEVEL TINYINT NULL, @PS_DefaultSales BIT NULL, @PS_DefaultSalesDiscount BIT NULL, @PS_DefaultPurchase BIT NULL, @PS_DefaultPurchaseDiscount BIT NULL, @PS_DefaultCostOfSalesLabour BIT NULL, @PS_DefaultWriteOffMaterials BIT NULL, @PS_DefaultExchangeDifference BIT NULL, @PS_DefaultSalesControl BIT NULL, @PS_DefaultBank BIT NULL, @PS_DefaultPurchaseControl BIT NULL, @PS_DefaultYearEnd BIT NULL, @PS_DefaultCurrencyRounding BIT NULL, @PS_DefaultVatControl BIT NULL, @PS_DefaultSuspense BIT NULL, @PS_DefaultAccruedIncome BIT NULL, @PS_DefaultCostOfGoodsSold BIT NULL, @PS_DefaultStockAdjustments BIT NULL, @PS_DefaultGoodsReceivedNotInvoiced BIT NULL, @PS_DefaultStockControl BIT NULL, @PS_DefaultStockAdjustmentsBS BIT NULL, @PS_DefaultAccruedIncomeBS BIT NULL, @PS_ForceCosting BIT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



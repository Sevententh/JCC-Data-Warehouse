CREATE PROCEDURE [dbo].[AA_STK_APM_GET_PRICE_S]
@PS_DefaultString VARCHAR (250) NULL OUTPUT, @PS_Account VARCHAR (10) NULL, @PS_OrderType VARCHAR (3) NULL, @PS_StockCode VARCHAR (25) NULL, @PS_SubAnalysis VARCHAR (25) NULL, @PS_OrderDate DATETIME NULL, @PS_CurrencyCode VARCHAR (6) NULL OUTPUT, @PS_Quantity FLOAT (53) NULL, @PS_CurrencyEntry TINYINT NULL OUTPUT, @PS_BatchRef VARCHAR (10) NULL OUTPUT, @PS_PriceLine INT NULL, @PS_UserChar1 VARCHAR (20) NULL, @PS_HeaderCustomerKey1 VARCHAR (20) NULL, @PS_HeaderCustomerKey2 VARCHAR (20) NULL, @PS_HeaderCustomerKey3 VARCHAR (20) NULL OUTPUT, @PS_UserID VARCHAR (20) NULL, @PS_UnitCost FLOAT (53) NULL OUTPUT, @PS_LineDiscPerc FLOAT (53) NULL OUTPUT, @PS_LineDisc FLOAT (53) NULL OUTPUT, @PS_ExchangeRate FLOAT (53) NULL OUTPUT, @PS_CurrencyUnitCost FLOAT (53) NULL OUTPUT, @PS_CurrencyLineDisc FLOAT (53) NULL OUTPUT, @PS_GrossEntry TINYINT NULL OUTPUT, @PS_CheckOrderKeys BIT NULL, @PS_SPLHeaderPrimary INT NULL OUTPUT, @PS_SPLDetailPrimary INT NULL OUTPUT, @PS_CurrencySymbol VARCHAR (4) NULL, @PS_Costprice FLOAT (53) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



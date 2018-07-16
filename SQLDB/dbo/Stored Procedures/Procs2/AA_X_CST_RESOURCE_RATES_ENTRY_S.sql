CREATE PROCEDURE [dbo].[AA_X_CST_RESOURCE_RATES_ENTRY_S]
@PS_UserId VARCHAR (4) NULL, @PS_ResourcePrimary INT NULL, @PS_RateNumber TINYINT NULL, @PS_CostPrice DECIMAL (24, 8) NULL, @PS_UpliftPercent DECIMAL (24, 8) NULL, @PS_UpliftValue DECIMAL (24, 8) NULL, @PS_CostAndUplift DECIMAL (24, 8) NULL, @PS_MarginPercent DECIMAL (24, 8) NULL, @PS_MarginValue DECIMAL (24, 8) NULL, @PS_FlatRate BIT NULL, @PS_SalesPrice DECIMAL (24, 8) NULL, @PS_CurrencyPrimary INT NULL, @PS_CurrencyCostPrice DECIMAL (24, 8) NULL, @PS_CurrencyUpliftValue DECIMAL (24, 8) NULL, @PS_CurrencyCostAndUplift DECIMAL (24, 8) NULL, @PS_CurrencyMarginValue DECIMAL (24, 8) NULL, @PS_CurrencySalesPrice DECIMAL (24, 8) NULL, @PS_CurrencyCalc VARCHAR (1) NULL, @PS_CurrencyRate DECIMAL (24, 8) NULL, @PS_DefaultString VARCHAR (20) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Error_Count INT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



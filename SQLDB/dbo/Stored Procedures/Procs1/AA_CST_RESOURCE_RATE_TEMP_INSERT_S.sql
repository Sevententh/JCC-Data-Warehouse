CREATE PROCEDURE [dbo].[AA_CST_RESOURCE_RATE_TEMP_INSERT_S]
@PS_UserId VARCHAR (4) NULL, @PS_BatchGuid UNIQUEIDENTIFIER NULL, @PS_ResourceLink INT NULL, @PS_RateNumber TINYINT NULL, @PS_CostPrice DECIMAL (24, 8) NULL, @PS_UpliftPercent DECIMAL (24, 8) NULL, @PS_UpliftValue DECIMAL (24, 8) NULL, @PS_CostUplift DECIMAL (24, 8) NULL, @PS_MarginPercent DECIMAL (24, 8) NULL, @PS_MarginValue DECIMAL (24, 8) NULL, @PS_FlatRate BIT NULL, @PS_SalesPrice DECIMAL (24, 8) NULL, @PS_CurrRate DECIMAL (24, 8) NULL, @PS_CurrLink INT NULL, @PS_CurrCostPrice DECIMAL (24, 8) NULL, @PS_CurrUpliftValue DECIMAL (24, 8) NULL, @PS_CurrCostUplift DECIMAL (24, 8) NULL, @PS_CurrMarginValue DECIMAL (24, 8) NULL, @PS_CurrencySalesPrice DECIMAL (24, 8) NULL, @PS_CurrencyCalc VARCHAR (1) NULL, @PS_DefaultString VARCHAR (20) NULL, @PS_DeleteFlag BIT NULL, @PS_ErrorInstanceId BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



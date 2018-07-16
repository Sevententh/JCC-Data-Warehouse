CREATE PROCEDURE [dbo].[AA_CO2_TRANSACTION_INSERT_S]
@PS_DefaultString VARCHAR (100) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_CarbonTransactionPrimary INT NULL OUTPUT, @PS_FirstCategoryLink INT NULL, @PS_FirstCategoryCode VARCHAR (6) NULL, @PS_SecondCategoryLink INT NULL, @PS_SecondCategoryCode VARCHAR (6) NULL, @PS_Date DATETIME NULL, @PS_Year SMALLINT NULL, @PS_Period TINYINT NULL, @PS_ConversionLink INT NULL, @PS_ClassificationLink INT NULL, @PS_EmissionsGroupID VARCHAR (2) NULL, @PS_ClassificationID VARCHAR (4) NULL, @PS_UnitOfMeasureLink INT NULL, @PS_UnitOfMeasure VARCHAR (20) NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_Notes VARCHAR (240) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod INT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_GHG_Scope TINYINT NULL, @PS_SortKey1 VARCHAR (20) NULL, @PS_SortKeyCreate1 BIT NULL, @PS_SortKey2 VARCHAR (20) NULL, @PS_SortKeyCreate2 BIT NULL, @PS_SortKey3 VARCHAR (20) NULL, @PS_SortKeyCreate3 BIT NULL, @PS_SortKey4 VARCHAR (20) NULL, @PS_SortKeyCreate4 BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



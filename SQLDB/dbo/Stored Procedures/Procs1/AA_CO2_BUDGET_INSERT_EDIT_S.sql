CREATE PROCEDURE [dbo].[AA_CO2_BUDGET_INSERT_EDIT_S]
@PS_DefaultString VARCHAR (100) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_Mode VARCHAR (1) NULL, @PS_CarbonBudgetPrimary INT NULL OUTPUT, @PS_ClassificationLink INT NULL, @PS_EmissionsGroupID VARCHAR (2) NULL, @PS_ClassificationID VARCHAR (4) NULL, @PS_FirstCategoryLink INT NULL, @PS_FirstCategoryCode VARCHAR (6) NULL, @PS_SecondCategoryLink INT NULL, @PS_SecondCategoryCode VARCHAR (6) NULL, @PS_Year SMALLINT NULL, @PS_Period TINYINT NULL, @PS_CO2 INT NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod INT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_CO2_CONVERSION_INSERT_EDIT_S]
@PS_DefaultString VARCHAR (100) NULL, @PS_Mode VARCHAR (1) NULL, @PS_ValidateOnly BIT NULL, @PS_ErrorHandlingMethod INT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_UserId VARCHAR (4) NULL, @PS_Primary INT NULL OUTPUT, @PS_EffectiveFromDate DATETIME NULL, @PS_ClassificationLink INT NULL, @PS_EmissionsGroupID VARCHAR (2) NULL, @PS_ClassificationID VARCHAR (4) NULL, @PS_UnitOfMeasureLink FLOAT (53) NULL, @PS_UnitOfMeasure VARCHAR (20) NULL, @PS_ConversionFactor DECIMAL (24, 5) NULL, @PS_Uplift DECIMAL (18, 2) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_VersionNumber INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



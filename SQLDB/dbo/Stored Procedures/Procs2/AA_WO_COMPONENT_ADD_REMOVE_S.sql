CREATE PROCEDURE [dbo].[AA_WO_COMPONENT_ADD_REMOVE_S]
@PS_DefaultString VARCHAR (30) NULL, @PS_Operation VARCHAR (2) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_WorksOrderNumber INT NULL, @PS_PartType VARCHAR (2) NULL, @PS_PartPrimary INT NULL, @PS_PartCode VARCHAR (25) NULL, @PS_PartText VARCHAR (80) NULL, @PS_AssemblyQuantity DECIMAL (24, 8) NULL, @PS_Backflush BIT NULL, @PS_Labour BIT NULL, @PS_TextLineCostPrice DECIMAL (24, 8) NULL, @PS_ComponentPrimary INT NULL OUTPUT, @PS_ChildWorksOrderNumber INT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_Source VARCHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



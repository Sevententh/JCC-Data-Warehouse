CREATE PROCEDURE [dbo].[AA_WO_WRITE_OFF_MATERIALS_S]
@PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_Date DATETIME NULL, @PS_Year CHAR (1) NULL, @PS_Period TINYINT NULL, @PS_ComponentPrimary INT NULL, @PS_WorksOrderNumber INT NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_AnalysisPrimary INT NULL, @PS_AnalysisCode VARCHAR (25) NULL, @PS_IssuePrimary INT NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



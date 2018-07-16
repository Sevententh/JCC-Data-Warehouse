CREATE PROCEDURE [dbo].[AA_WO_WORKS_ORDER_CANCEL_COMPONENT_S]
@PS_UserId NVARCHAR (4) NULL, @PS_Date DATETIME NULL, @PS_Year CHAR (1) NULL, @PS_Period TINYINT NULL, @PS_Description NVARCHAR (30) NULL, @PS_WorksOrderNumber INT NULL, @PS_ComponentPrimary INT NULL, @PS_QuantityToReturn DECIMAL (24, 8) NULL, @PS_QuantityToWriteOff DECIMAL (24, 8) NULL, @PS_ReturnAnalysisPrimary INT NULL, @PS_ReturnAnalysisCode VARCHAR (25) NULL, @PS_WriteOffAnalysisPrimary INT NULL, @PS_WriteOffAnalysisCode VARCHAR (25) NULL, @PS_SubAnalysisPrimary INT NULL, @PS_SubAnalysisCode VARCHAR (25) NULL, @PS_SerialNumber VARCHAR (40) NULL, @PS_SerialPrimary INT NULL, @PS_IssuePrimary INT NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



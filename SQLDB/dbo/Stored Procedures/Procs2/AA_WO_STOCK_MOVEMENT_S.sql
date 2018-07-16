CREATE PROCEDURE [dbo].[AA_WO_STOCK_MOVEMENT_S]
@PS_UserId VARCHAR (4) NULL, @PS_Date DATETIME NULL, @PS_Year CHAR (1) NULL, @PS_Period TINYINT NULL, @PS_Reference VARCHAR (10) NULL, @PS_StockCode VARCHAR (25) NULL, @PS_SubAnalysisCode VARCHAR (25) NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_WorksOrderNumber INT NULL, @PS_IsWorksOrder BIT NULL, @PS_MovementDirection CHAR (1) NULL, @PS_Price DECIMAL (24, 8) NULL, @PS_MaterialCost DECIMAL (24, 8) NULL, @PS_LabourCost DECIMAL (24, 8) NULL, @PS_Analysis VARCHAR (25) NULL, @PS_CostHeader VARCHAR (10) NULL, @PS_CostCentre VARCHAR (10) NULL, @PS_SerialNumber VARCHAR (40) NULL, @PS_SerialTempId INT NULL, @PS_Primary INT NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ReversePrimary INT NULL, @PS_BuildMovement BIT NULL, @PS_ComponentPrimary INT NULL, @PS_Description VARCHAR (30) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



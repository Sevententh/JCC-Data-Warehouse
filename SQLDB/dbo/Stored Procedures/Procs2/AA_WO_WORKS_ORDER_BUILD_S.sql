CREATE PROCEDURE [dbo].[AA_WO_WORKS_ORDER_BUILD_S]
@PS_UserId VARCHAR (4) NULL, @PS_Date DATETIME NULL, @PS_Year CHAR (1) NULL, @PS_Period TINYINT NULL, @PS_WorksOrderNumber INT NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_StockCode VARCHAR (25) NULL, @PS_AnalysisCode VARCHAR (25) NULL, @PS_CostHeaderCode VARCHAR (10) NULL, @PS_CostCentreCode VARCHAR (10) NULL, @PS_SubAnalysisCode VARCHAR (25) NULL, @PS_SerialNumber VARCHAR (40) NULL, @PS_SerialTempId INT NULL, @PS_CostPrice DECIMAL (24, 8) NULL OUTPUT, @PS_IssueToParentWO BIT NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL, @PS_IncludeOverIssues BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_WO_WORKS_ORDER_BUILD_COMPLETE_S]
@PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_Build BIT NULL, @PS_IssueToParentWO BIT NULL, @PS_Complete BIT NULL, @PS_Date DATETIME NULL, @PS_Year CHAR (1) NULL, @PS_Period TINYINT NULL, @PS_WorksOrderNumber INT NULL, @PS_SubAnalysisPrimary INT NULL, @PS_SubAnalysisCode VARCHAR (25) NULL, @PS_BuildQuantity DECIMAL (24, 8) NULL, @PS_BuildAnalysisPrimary INT NULL, @PS_BuildAnalysisCode VARCHAR (25) NULL, @PS_BuildSerialNumber VARCHAR (40) NULL, @PS_BuildSerialTempId INT NULL, @PS_ScrapQuantity DECIMAL (24, 8) NULL, @PS_ScrapAnalysisPrimary INT NULL, @PS_ScrapAnalysisCode VARCHAR (25) NULL, @PS_ScrapSerialNumber VARCHAR (40) NULL, @PS_ScrapSerialTempId INT NULL, @PS_CostHeaderPrimary INT NULL, @PS_CostHeaderCode VARCHAR (10) NULL, @PS_CostCentrePrimary INT NULL, @PS_CostCentreCode VARCHAR (10) NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_IncludeOverIssues BIT NULL, @PS_IgnoreSubSecurityLevels BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_WO_REVERSE_ISSUE_MATERIALS_S]
@PS_ValidateOnly BIT NULL, @PS_UserId NVARCHAR (4) NULL, @PS_Date DATETIME NULL, @PS_Year VARCHAR (2) NULL, @PS_Period TINYINT NULL, @PS_ComponentPrimary INT NULL, @PS_WorksOrderNumber INT NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_AnalysisPrimary INT NULL, @PS_AnalysisCode VARCHAR (25) NULL, @PS_SubAnalysisPrimary INT NULL, @PS_SubAnalysisCode VARCHAR (25) NULL, @PS_SerialNumber VARCHAR (40) NULL, @PS_SerialTempId INT NULL, @PS_ReversePrimary INT NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_Description VARCHAR (30) NULL, @PS_ParentWorksOrderNumber INT NULL, @PS_ComponentType VARCHAR (2) NULL, @PS_ComponentCode VARCHAR (25) NULL, @PS_ComponentText VARCHAR (80) NULL, @PS_IssueDate DATETIME NULL, @PS_DefaultString NVARCHAR (100) NULL, @PS_IgnoreSubSecurityLevels BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_CST_MILESTONES_TEMP_INSERT_S]
@PS_UserId VARCHAR (4) NULL, @PS_BatchGuid UNIQUEIDENTIFIER NULL, @PS_MilestoneLink INT NULL, @PS_ProjectLink INT NULL, @PS_Description VARCHAR (40) NULL, @PS_Date DATETIME NULL, @PS_Percentage DECIMAL (24, 8) NULL, @PS_FixedPrice DECIMAL (24, 8) NULL, @PS_WIPCentreLink INT NULL, @PS_Completed BIT NULL, @PS_Costs DECIMAL (24, 8) NULL, @PS_Invoiced DECIMAL (24, 8) NULL, @PS_Retained DECIMAL (24, 8) NULL, @PS_DefaultString VARCHAR (20) NULL, @PS_DeleteFlag BIT NULL, @PS_ErrorInstanceId BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



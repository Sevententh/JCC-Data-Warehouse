CREATE PROCEDURE [dbo].[AA_CHECK_PROJ_COST_CODES_S]
@PS_Project_Code VARCHAR (10) NULL OUTPUT, @PS_CostCentre_Code VARCHAR (10) NULL OUTPUT, @PS_Compulsory_Cost TINYINT NULL, @PS_Allow_Estimates BIT NULL, @PS_Transaction_Status CHAR (1) NULL, @PS_FORCE_COSTING TINYINT NULL, @PS_User_Id VARCHAR (5) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_IgnoreSecLevels BIT NULL, @PS_AllowEstimateCentres BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_COSTING_PURGE_S]
@PS_User_Id VARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_UpToDate DATETIME NULL, @PS_ProjectFrom VARCHAR (10) NULL, @PS_ProjectSearch TINYINT NULL, @PS_ProjectTo VARCHAR (10) NULL, @PS_CostCentreFrom VARCHAR (10) NULL, @PS_CostCentreSearch TINYINT NULL, @PS_CostCentreTo VARCHAR (10) NULL, @PS_ProjectSortFrom VARCHAR (20) NULL, @PS_ProjectSortSearch TINYINT NULL, @PS_ProjectSortTo VARCHAR (20) NULL, @PS_Estimate BIT NULL, @PS_Active BIT NULL, @PS_Suspended BIT NULL, @PS_Cancelled BIT NULL, @PS_Completed BIT NULL, @PS_ReOpened BIT NULL, @PS_Source VARCHAR (1) NULL, @PS_Records_Deleted INT NULL OUTPUT, @PS_ExtraSearchClause VARCHAR (1000) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceId BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



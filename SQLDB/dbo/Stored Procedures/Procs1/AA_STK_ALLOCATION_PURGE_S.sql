CREATE PROCEDURE [dbo].[AA_STK_ALLOCATION_PURGE_S]
@PS_UserID VARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_Status INT NULL OUTPUT, @PS_UpToDate DATETIME NULL, @PS_CustomerFrom VARCHAR (10) NULL, @PS_CustomerSearch TINYINT NULL, @PS_CustomerTo VARCHAR (10) NULL, @PS_OrderNumberFrom INT NULL, @PS_OrderNumberSearch TINYINT NULL, @PS_OrderNumberTo INT NULL, @PS_Allocations_Deleted INT NULL OUTPUT, @PS_ExtraSearchClause VARCHAR (1000) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_SOP_PURGE_S]
@PS_User_Id VARCHAR (4) NULL, @PS_Purge_Flag TINYINT NULL, @PS_MaxRecords INT NULL, @PS_UpToDate DATETIME NULL, @PS_CustomerFrom VARCHAR (10) NULL, @PS_CustomerSearch TINYINT NULL, @PS_CustomerTo VARCHAR (10) NULL, @PS_OrderNumberFrom INT NULL, @PS_OrderNumberSearch TINYINT NULL, @PS_OrderNumberTo INT NULL, @PS_Source VARCHAR (1) NULL, @PS_Orders_Deleted INT NULL OUTPUT, @PS_Allocations_Deleted INT NULL OUTPUT, @PS_ExtraSearchClause VARCHAR (1000) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



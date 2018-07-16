CREATE PROCEDURE [dbo].[AA_POP_PURGE_S]
@PS_User_Id VARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_UpToDate DATETIME NULL, @PS_SupplierFrom VARCHAR (10) NULL, @PS_SupplierSearch TINYINT NULL, @PS_SupplierTo VARCHAR (10) NULL, @PS_OrderNumberFrom VARCHAR (10) NULL, @PS_OrderNumberSearch TINYINT NULL, @PS_OrderNumberTo VARCHAR (10) NULL, @PS_Source VARCHAR (1) NULL, @PS_Orders_Deleted INT NULL OUTPUT, @PS_ExtraSearchClause VARCHAR (1000) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



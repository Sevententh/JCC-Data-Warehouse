CREATE PROCEDURE [dbo].[AA_WO_WORKS_ORDER_PURGE_S]
@PS_UserId VARCHAR (4) NULL, @PS_PurgeFlag TINYINT NULL, @PS_OrderNumberFrom INT NULL, @PS_OrderNumberSearch TINYINT NULL, @PS_OrderNumberTo INT NULL, @PS_DateFrom DATETIME NULL, @PS_DateSearch TINYINT NULL, @PS_DateTo DATETIME NULL, @PS_SortKeyFrom VARCHAR (20) NULL, @PS_SortKeySearch TINYINT NULL, @PS_SortKeyTo VARCHAR (20) NULL, @PS_PurgeCompletedOrders TINYINT NULL, @PS_PurgeCancelledOrders TINYINT NULL, @PS_PurgeMergedOrders TINYINT NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_OrdersDeleted INT NULL OUTPUT, @PS_AllocationsDeleted INT NULL OUTPUT, @PS_ValidateOnly BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



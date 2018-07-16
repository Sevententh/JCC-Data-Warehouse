CREATE PROCEDURE [dbo].[AA_WO_CHILD_WORKS_ORDER_INSERT_EDIT_S]
@PS_DefaultString VARCHAR (100) NULL, @PS_Mode VARCHAR (1) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_ParentOrderNumber INT NULL, @PS_StockPrimary INT NULL, @PS_StockCode VARCHAR (25) NULL, @PS_RoutePrimary INT NULL, @PS_RouteCode VARCHAR (10) NULL, @PS_AssemblyQty DECIMAL (24, 8) NULL, @PS_Notes TEXT NULL, @PS_OrderNumber INT NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



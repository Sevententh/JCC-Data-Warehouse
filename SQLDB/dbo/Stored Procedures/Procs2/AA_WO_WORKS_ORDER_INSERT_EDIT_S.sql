CREATE PROCEDURE [dbo].[AA_WO_WORKS_ORDER_INSERT_EDIT_S]
@PS_DefaultString NVARCHAR (100) NULL, @PS_Mode NVARCHAR (1) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_OrderNumber INT NULL OUTPUT, @PS_StockPrimary FLOAT (53) NULL, @PS_StockCode VARCHAR (25) NULL, @PS_RoutePrimary INT NULL, @PS_RouteCode VARCHAR (10) NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_StartDate DATETIME NULL, @PS_EndDate DATETIME NULL, @PS_Priority INT NULL, @PS_Notes TEXT NULL, @PS_SortKey NVARCHAR (20) NULL, @PS_IgnoreBatchQty BIT NULL, @PS_IgnoreMinBuildQty BIT NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_AutoAllocate BIT NULL, @PS_UseDefaultWoSubAnalysis BIT NULL, @PS_UseFirstSerialNumbers BIT NULL, @PS_DoNotUpdateStockWIP BIT NULL, @PS_IncludeBomNotes BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



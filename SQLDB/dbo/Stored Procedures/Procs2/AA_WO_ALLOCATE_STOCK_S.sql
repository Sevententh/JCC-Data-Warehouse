CREATE PROCEDURE [dbo].[AA_WO_ALLOCATE_STOCK_S]
@PS_UserID VARCHAR (4) NULL, @PS_Date DATETIME NULL, @PS_ComponentPrimary INT NULL, @PS_QuantityToIssue DECIMAL (24, 8) NULL, @PS_SubAnalysisStockItem BIT NULL, @PS_SubAnalysisCode VARCHAR (25) NULL, @PS_AllocQuantityChange DECIMAL (24, 8) NULL OUTPUT, @PS_UnallocQuantityChange DECIMAL (24, 8) NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_QUANTITY_DPS TINYINT NULL, @PS_PROFIT_COST_TYPE VARCHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



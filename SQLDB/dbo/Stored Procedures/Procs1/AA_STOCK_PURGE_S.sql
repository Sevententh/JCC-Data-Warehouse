CREATE PROCEDURE [dbo].[AA_STOCK_PURGE_S]
@PS_User_Id VARCHAR (4) NULL, @PS_Purge_Flag TINYINT NULL, @PS_Update_FIFO TINYINT NULL, @PS_MaxRecords INT NULL, @PS_UpToDate DATETIME NULL, @PS_StockCodeFrom VARCHAR (25) NULL, @PS_StockCodeSearch TINYINT NULL, @PS_StockCodeTo VARCHAR (25) NULL, @PS_StockSortFrom VARCHAR (20) NULL, @PS_StockSortSearch TINYINT NULL, @PS_StockSortTo VARCHAR (20) NULL, @PS_SubAnalysisFrom VARCHAR (25) NULL, @PS_SubAnalysisSearch TINYINT NULL, @PS_SubAnalysisTo VARCHAR (25) NULL, @PS_Source VARCHAR (1) NULL, @PS_Records_Deleted INT NULL OUTPUT, @PS_ExtraSearchClause VARCHAR (1000) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



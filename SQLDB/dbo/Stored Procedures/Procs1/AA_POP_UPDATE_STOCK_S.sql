CREATE PROCEDURE [dbo].[AA_POP_UPDATE_STOCK_S]
@PS_Header_Transaction_Type CHAR (1) NULL, @PS_Detail_Unit_Cost DECIMAL (24, 8) NULL, @PS_Detail_Unit_Cost_Curr DECIMAL (24, 8) NULL, @PS_Detail_Unit_Cost_Base2 DECIMAL (24, 8) NULL, @PS_Detail_Qty_Reserved DECIMAL (24, 8) NULL OUTPUT, @PS_Detail_Table_Code VARCHAR (3) NULL, @PS_SubAnalysis_Code VARCHAR (25) NULL, @PS_Stock_Move_Quantity DECIMAL (24, 8) NULL, @PS_Stock_Move_Quantity_Unit DECIMAL (24, 8) NULL, @PS_Stock_Move_Value DECIMAL (24, 8) NULL, @PS_Stock_Move_Year CHAR (1) NULL, @PS_Stock_Move_Period TINYINT NULL, @PS_Stock_Average_Value DECIMAL (24, 8) NULL, @PS_Stock_Physical_Amount DECIMAL (24, 8) NULL, @PS_Stock_Qty_Printed DECIMAL (24, 8) NULL, @PS_Stock_Primary_Key INT NULL, @PS_Stock_Cost_Price DECIMAL (24, 8) NULL, @PS_Stock_Base_Price DECIMAL (24, 8) NULL, @PS_SubAnalysis_Average_Value DECIMAL (24, 8) NULL, @PS_SubAnalysis_Physical DECIMAL (24, 8) NULL, @PS_SubAnalysis_Qty_Printed DECIMAL (24, 8) NULL, @PS_SubAnalysis_Primary_Key INT NULL, @PS_Update_Stock_Price TINYINT NULL, @PS_Movement_Curr_Symbol VARCHAR (4) NULL, @PS_Delivery_Date DATETIME NULL, @PS_Detail_Quantity_Delivered DECIMAL (24, 8) NULL, @PS_Detail_Quantity_Ordered DECIMAL (24, 8) NULL, @PS_Stock_Move_CostPrice DECIMAL (24, 8) NULL, @PS_Stock_Move_Primary INT NULL, @PS_Stock_Wapu_Value DECIMAL (24, 8) NULL, @PS_Actual_Landed_Cost DECIMAL (24, 8) NULL, @PS_SubAnalysis_Wapu_Quantity DECIMAL (24, 8) NULL, @PS_SubAnalysis_Wapu_Value DECIMAL (24, 8) NULL, @PS_Update_Fixed BIT NULL, @PS_Landed_Cost_Out_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Landed_Cost_Out_Base2 DECIMAL (24, 8) NULL OUTPUT, @PS_Originally_Empty_Location TINYINT NULL, @PS_Curr_CostPrice DECIMAL (24, 8) NULL, @PS_Base2_CostPrice DECIMAL (24, 8) NULL, @PS_Use_OriginalOrderPrices BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_STKTRN_UPDATE_STOCK_S]
@PS_Move_Stock_Code VARCHAR (25) NULL, @PS_Move_Location VARCHAR (25) NULL, @PS_Move_Serial_No VARCHAR (40) NULL, @PS_Move_Currency VARCHAR (4) NULL, @PS_Move_Status CHAR (1) NULL, @PS_Move_Year CHAR (1) NULL, @PS_Move_Period TINYINT NULL, @PS_Move_Date DATETIME NULL, @PS_Move_Price_Code VARCHAR (3) NULL, @PS_Move_Quantity DECIMAL (24, 8) NULL, @PS_Move_Qty_Unit DECIMAL (24, 8) NULL, @PS_Move_Cost_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Move_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Move_Value_C DECIMAL (24, 8) NULL, @PS_Ignore_Qty_Check BIT NULL, @PS_Update_CostPrice_Flag BIT NULL, @PS_Move_Type CHAR (1) NULL, @PS_Move_Landed_Cost_Line TINYINT NULL, @PS_Update_Landed_Cost BIT NULL, @PS_Move_Primary INT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Move_Landed_Cost DECIMAL (24, 8) NULL OUTPUT, @PS_Move_Landed_Cost_Base2 DECIMAL (24, 8) NULL OUTPUT, @PS_SM_ORDER_LINK INT NULL, @PS_Move_Origin VARCHAR (1) NULL, @PS_Variance TINYINT NULL, @PS_AllocQuantityChange DECIMAL (24, 8) NULL, @PS_UnallocQuantityChange DECIMAL (24, 8) NULL, @PS_WO_WIP_SOP_QtyChange DECIMAL (24, 8) NULL, @PS_WO_WIP_Free_QtyChange DECIMAL (24, 8) NULL, @PS_ReversePrimary INT NULL, @PS_WO_Build BIT NULL, @PS_ComponentPrimary INT NULL, @PS_SubAssemblyMovement BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



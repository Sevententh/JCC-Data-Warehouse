CREATE PROCEDURE [dbo].[AA_STK_PRICE_RATE_CHANGE_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_StockCode_From VARCHAR (25) NULL, @PS_StockCode_To VARCHAR (25) NULL, @PS_SortKey_From VARCHAR (20) NULL, @PS_SortKey_To VARCHAR (20) NULL, @PS_UserSort1_From VARCHAR (20) NULL, @PS_UserSort1_To VARCHAR (20) NULL, @PS_UserSort2_From VARCHAR (20) NULL, @PS_UserSort2_To VARCHAR (20) NULL, @PS_UserSort3_From VARCHAR (20) NULL, @PS_UserSort3_To VARCHAR (20) NULL, @PS_Price_Change_Type VARCHAR (2) NULL, @PS_Price_Line TINYINT NULL, @PS_Price_Type VARCHAR (3) NULL, @PS_Uplift_From_Cost BIT NULL, @PS_Price DECIMAL (24, 8) NULL, @PS_Percentage DECIMAL (24, 8) NULL, @PS_Supplier VARCHAR (10) NULL, @PS_Analysis VARCHAR (25) NULL, @PS_Unit DECIMAL (24, 8) NULL, @PS_Unit_Description VARCHAR (20) NULL, @PS_Minimum DECIMAL (24, 8) NULL, @PS_Qty_From DECIMAL (24, 8) NULL, @PS_Qty_To DECIMAL (24, 8) NULL, @PS_Source VARCHAR (1) NULL, @PS_Error_Count INT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



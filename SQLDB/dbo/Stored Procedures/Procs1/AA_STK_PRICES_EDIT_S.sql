CREATE PROCEDURE [dbo].[AA_STK_PRICES_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Stock_Code VARCHAR (25) NULL, @PS_Price_Line TINYINT NULL, @PS_Type VARCHAR (1) NULL, @PS_Price DECIMAL (24, 8) NULL, @PS_Currency VARCHAR (4) NULL, @PS_Currency_Price DECIMAL (24, 8) NULL, @PS_Base2_Price DECIMAL (24, 8) NULL, @PS_Analysis VARCHAR (25) NULL, @PS_Unit DECIMAL (24, 8) NULL, @PS_Unit_Description VARCHAR (20) NULL, @PS_Method VARCHAR (3) NULL, @PS_Qty_From DECIMAL (24, 8) NULL, @PS_Qty_To DECIMAL (24, 8) NULL, @PS_Percentage DECIMAL (24, 8) NULL, @PS_Uplift_from_Cost BIT NULL, @PS_Supplier VARCHAR (10) NULL, @PS_Supplier_Stock VARCHAR (25) NULL, @PS_Minimum DECIMAL (24, 8) NULL, @PS_Return_Error BIT NULL, @PS_Err_Message VARCHAR (128) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



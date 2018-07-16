CREATE PROCEDURE [dbo].[AA_CHECK_PRICE_MATRIX_S]
@PS_Default_String VARCHAR (20) NULL, @PS_Customer_Code VARCHAR (10) NULL, @PS_Customer_Sort VARCHAR (20) NULL, @PS_Customer_Defined_Sort1 VARCHAR (20) NULL, @PS_Customer_Defined_Sort2 VARCHAR (20) NULL, @PS_Customer_Defined_Sort3 VARCHAR (20) NULL, @PS_Stock_Code VARCHAR (25) NULL, @PS_Stock_Sort_Key VARCHAR (20) NULL, @PS_Stock_Sort_Key1 VARCHAR (20) NULL, @PS_Stock_Sort_Key2 VARCHAR (20) NULL, @PS_Stock_Sort_Key3 VARCHAR (20) NULL, @PS_Item_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Item_Curr_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Item_Price_Key INT NULL, @PS_Order_Line_Disc_Perc DECIMAL (24, 8) NULL OUTPUT, @PS_MatrixType VARCHAR (1) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



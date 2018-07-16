CREATE PROCEDURE [dbo].[AA_SELLING_PRICE_CALC_S]
@PS_Price_Method VARCHAR (3) NULL, @PS_Cost_Price DECIMAL (24, 8) NULL, @PS_Base_Price DECIMAL (24, 8) NULL, @PS_Line_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Line_Price_Curr DECIMAL (24, 8) NULL OUTPUT, @PS_Line_Price_Base2 DECIMAL (24, 8) NULL OUTPUT, @PS_Line_Currency_Code VARCHAR (4) NULL, @PS_Line_Uplift_Percent DECIMAL (24, 8) NULL, @PS_Using_Base2_Flag BIT NULL, @PS_Home_Currency_Symbol VARCHAR (4) NULL, @PS_Delivery_Date DATETIME NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



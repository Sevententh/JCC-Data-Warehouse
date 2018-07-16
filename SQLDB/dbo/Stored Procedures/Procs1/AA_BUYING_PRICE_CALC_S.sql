CREATE PROCEDURE [dbo].[AA_BUYING_PRICE_CALC_S]
@PS_Cost_Method VARCHAR (2) NULL, @PS_Cost_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Line_Cost DECIMAL (24, 8) NULL OUTPUT, @PS_Line_Cost_Curr DECIMAL (24, 8) NULL OUTPUT, @PS_Line_Cost_Base2 DECIMAL (24, 8) NULL OUTPUT, @PS_Line_Currency_Code VARCHAR (4) NULL, @PS_Line_Uplift_Percentage DECIMAL (24, 8) NULL, @PS_Using_Base2_Flag BIT NULL, @PS_Home_Currency_Symbol VARCHAR (4) NULL, @PS_Delivery_Date DATETIME NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



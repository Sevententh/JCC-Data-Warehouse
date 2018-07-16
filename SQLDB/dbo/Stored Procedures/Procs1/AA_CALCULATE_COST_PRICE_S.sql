CREATE PROCEDURE [dbo].[AA_CALCULATE_COST_PRICE_S]
@PS_Stock_Standard_Cost DECIMAL (24, 8) NULL, @PS_Stock_Physical DECIMAL (24, 8) NULL, @PS_Stock_Quantity_Printed DECIMAL (24, 8) NULL, @PS_Stock_Wapu_Value DECIMAL (24, 8) NULL, @PS_Stock_Wapu_Quantity DECIMAL (24, 8) NULL, @PS_Stock_Average_Value DECIMAL (24, 8) NULL, @PS_Stock_Costprice DECIMAL (24, 8) NULL, @PS_Stock_Buy_Unit DECIMAL (24, 8) NULL, @PS_Location_Standard_Cost DECIMAL (24, 8) NULL, @PS_Location_Physical DECIMAL (24, 8) NULL, @PS_Location_Quantity_Printed DECIMAL (24, 8) NULL, @PS_Location_Wapu_Value DECIMAL (24, 8) NULL, @PS_Location_Wapu_Quantity DECIMAL (24, 8) NULL, @PS_Location_Average_Value DECIMAL (24, 8) NULL, @PS_Location_Costprice DECIMAL (24, 8) NULL, @PS_Landed_Cost DECIMAL (24, 8) NULL, @PS_Profit_Cost_Type CHAR (1) NULL, @PS_Stock_Valuation_Method CHAR (1) NULL, @PS_Price_Decimal_Places TINYINT NULL, @PS_Move_SubAnalysis_Code VARCHAR (25) NULL, @PS_Move_Cost_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Move_Profit_Cost_Type VARCHAR (2) NULL OUTPUT, @PS_Stock_Code VARCHAR (25) NULL, @PS_Sub_Analysis VARCHAR (25) NULL, @PS_Quantity DECIMAL (24, 8) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



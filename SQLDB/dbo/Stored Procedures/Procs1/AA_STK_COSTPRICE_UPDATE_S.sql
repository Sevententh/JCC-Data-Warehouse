CREATE PROCEDURE [dbo].[AA_STK_COSTPRICE_UPDATE_S]
@PS_Stock_PrimaryKey INT NULL, @PS_Detail_Table_Code VARCHAR (3) NULL, @PS_Detail_Unit_Cost DECIMAL (24, 8) NULL, @PS_Detail_Unit_Cost_Curr DECIMAL (24, 8) NULL, @PS_Detail_Unit_Cost_Base2 DECIMAL (24, 8) NULL, @PS_Stock_Cost_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Stock_Base_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Movement_Curr_Symbol VARCHAR (4) NULL, @PS_Delivery_Date DATETIME NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



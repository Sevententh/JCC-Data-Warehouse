CREATE PROCEDURE [dbo].[AA_POST_LANDED_COST_DETAIL_S]
@PS_Quantity DECIMAL (24, 8) NULL, @PS_Value DECIMAL (24, 8) NULL, @PS_Tran_Committed_Quantity DECIMAL (24, 8) NULL, @PS_Tran_Committed_Value DECIMAL (24, 8) NULL, @PS_Landed_Cost_Type TINYINT NULL, @PS_Landed_Cost_Value DECIMAL (24, 8) NULL, @PS_Landed_Cost_Name VARCHAR (20) NULL, @PS_Landed_Cost_Line TINYINT NULL, @PS_Movement_Primary INT NULL, @PS_Base2_Rate DECIMAL (24, 8) NULL, @PS_Decimal_Places TINYINT NULL, @PS_Batch_Flag BIT NULL, @PS_Update_Fixed BIT NULL, @PS_Reverse_Value BIT NULL, @PS_Landed_Cost_Committed_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Landed_Cost_Total_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Actual_Landed_Cost DECIMAL (24, 8) NULL OUTPUT, @PS_Stock_Wapu_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Location_Wapu_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Originally_Empty_Location TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



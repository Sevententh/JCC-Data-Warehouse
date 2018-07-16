CREATE PROCEDURE [dbo].[AA_UPDATE_LANDED_COST_IN_S]
@PS_Sub_Analysis_Primary INT NULL, @PS_Movement_Primary INT NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_Value DECIMAL (24, 8) NULL, @PS_Tran_Committed_Quantity DECIMAL (24, 8) NULL, @PS_Tran_Committed_Value DECIMAL (24, 8) NULL, @PS_Batch_Flag BIT NULL, @PS_Update_Fixed_Cost BIT NULL, @PS_Reverse_Value BIT NULL, @PS_Location_Wapu_Quantity DECIMAL (24, 8) NULL, @PS_Transaction_Date DATETIME NULL, @PS_Actual_Landed_Cost DECIMAL (24, 8) NULL OUTPUT, @PS_Stock_Wapu_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Location_Wapu_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Originally_Empty_Location TINYINT NULL, @PS_WO_Build BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



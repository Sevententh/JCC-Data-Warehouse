CREATE PROCEDURE [dbo].[AA_STKTRN_UPDATE_COSTING_S]
@PS_User_Id VARCHAR (4) NULL, @PS_Move_Cost_Header VARCHAR (10) NULL, @PS_Move_Cost_Centre VARCHAR (10) NULL, @PS_Move_Status CHAR (1) NULL, @PS_Move_Currency VARCHAR (5) NULL, @PS_Move_Year CHAR (1) NULL, @PS_Move_Period TINYINT NULL, @PS_Move_Date DATETIME NULL, @PS_Move_Stock_Code VARCHAR (25) NULL, @PS_Move_Quantity DECIMAL (24, 8) NULL, @PS_Move_Price DECIMAL (24, 8) NULL, @PS_Move_Reference VARCHAR (10) NULL, @PS_Move_Batch_Ref VARCHAR (10) NULL, @PS_Move_Detail VARCHAR (240) NULL, @PS_Move_Serial_Tracked BIT NULL, @PS_Move_Archive BIT NULL, @PS_Move_Value DECIMAL (24, 8) NULL, @PS_Move_Value_C DECIMAL (24, 8) NULL, @PS_Move_Primary INT NULL, @PS_Source VARCHAR (1) NULL, @PS_Header_Link INT NULL, @PS_Assembly BIT NULL, @PS_Module VARCHAR (3) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



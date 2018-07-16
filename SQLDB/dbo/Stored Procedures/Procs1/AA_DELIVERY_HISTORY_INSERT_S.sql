CREATE PROCEDURE [dbo].[AA_DELIVERY_HISTORY_INSERT_S]
@PS_User_Id VARCHAR (4) NULL, @PS_Module VARCHAR (3) NULL, @PS_Order_Credit VARCHAR (1) NULL, @PS_Order_Number VARCHAR (15) NULL, @PS_Delivery_Note_Number INT NULL, @PS_Supplier_Del_Note_Number VARCHAR (15) NULL, @PS_Date DATETIME NULL, @PS_Order_Detail_Primary INT NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_Stock_Movement_Primary INT NULL, @PS_Serial_Number VARCHAR (40) NULL, @PS_Outstanding_Quantity DECIMAL (24, 8) NULL, @PS_Source VARCHAR (1) NULL, @PS_OS_ITEM_DELNOTE TINYINT NULL, @PS_LastMovementPrimary INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



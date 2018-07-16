CREATE PROCEDURE [dbo].[AA_RESERVE_STOCK_S]
@PS_Order_Detail_Link INT NULL, @PS_Serial_Number VARCHAR (40) NULL OUTPUT, @PS_Location_Code VARCHAR (25) NULL OUTPUT, @PS_QTY_Reserved DECIMAL (24, 8) NULL OUTPUT, @PS_Allocation_Quantity DECIMAL (24, 8) NULL OUTPUT, @PS_Order_Quantity_Change DECIMAL (24, 8) NULL OUTPUT, @PS_Allocation_Date DATETIME NULL, @PS_User_ID VARCHAR (4) NULL, @PS_Error_Status TINYINT NULL OUTPUT, @PS_CostPrice DECIMAL (24, 8) NULL OUTPUT, @PS_Delivery_Customer VARCHAR (10) NULL, @PS_SubAnalysisStockItem BIT NULL, @PS_DeliveryNoteAlreadyPrinted BIT NULL, @PS_Use_Raiserror BIT NULL, @PS_OrderType VARCHAR (1) NULL, @PS_NewWONumber INT NULL, @PS_NoTransaction BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



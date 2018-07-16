CREATE PROCEDURE [dbo].[AA_SOP_ORD_DET_DELIVER_S]
@PS_Order_Qty_Delivered DECIMAL (24, 8) NULL, @PS_Order_Qty DECIMAL (24, 8) NULL, @PS_Order_Qty_Invoiced DECIMAL (24, 8) NULL, @PS_Order_Invoice_Status TINYINT NULL, @PS_Order_Lines_Delivered INT NULL OUTPUT, @PS_Order_Primary INT NULL, @PS_Order_Qty_Printed DECIMAL (24, 8) NULL, @PS_Order_Qty_Reserved DECIMAL (24, 8) NULL, @PS_Order_Delivered_Value DECIMAL (24, 8) NULL, @PS_Order_Number INT NULL, @PS_Post_Origin TINYINT NULL, @PS_Purchase_Order_Link INT NULL, @PS_Invoice_Full_Order TINYINT NULL, @PS_Qty_Decimal_Place INT NULL, @PS_Actual_Qty_To_Deliver DECIMAL (24, 8) NULL, @PS_Order_Cost_Price DECIMAL (24, 8) NULL, @PS_Order_Base2_Cost_Price DECIMAL (24, 8) NULL, @PS_Price_Decimal_Place INT NULL, @PS_SerialTrack BIT NULL, @PS_CRN_DoNotUpdateStock BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



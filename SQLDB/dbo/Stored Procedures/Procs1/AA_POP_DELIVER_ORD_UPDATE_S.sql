CREATE PROCEDURE [dbo].[AA_POP_DELIVER_ORD_UPDATE_S]
@PS_Header_Lines_Delivered INT NULL OUTPUT, @PS_Header_Lines_Invoiced INT NULL OUTPUT, @PS_Header_Number_Of_Lines INT NULL, @PS_Header_INV_Status TINYINT NULL OUTPUT, @PS_Header_PrimaryKey INT NULL, @PS_Detail_Qty_Ordered DECIMAL (24, 8) NULL, @PS_Detail_Qty_Invoiced DECIMAL (24, 8) NULL, @PS_Detail_Qty_Delivered DECIMAL (24, 8) NULL, @PS_Detail_Qty_Reserved DECIMAL (24, 8) NULL, @PS_Detail_Qty_Printed DECIMAL (24, 8) NULL, @PS_Detail_Entry_Type CHAR (1) NULL, @PS_Detail_Serial_Number VARCHAR (40) NULL, @PS_Detail_SerialTracked TINYINT NULL, @PS_Detail_PrimaryKey INT NULL, @PS_Serial_No_Creation_Failed BIT NULL, @PS_Quantity_To_Deliver DECIMAL (24, 8) NULL, @PS_Status TINYINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



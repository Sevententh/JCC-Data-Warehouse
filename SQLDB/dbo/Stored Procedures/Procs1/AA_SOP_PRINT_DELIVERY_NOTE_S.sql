CREATE PROCEDURE [dbo].[AA_SOP_PRINT_DELIVERY_NOTE_S]
@PS_Document_Header_Link INT NULL, @PS_Order_Detail_Primary INT NULL, @PS_Order_Number INT NULL, @PS_VALIDATE_ONLY BIT NULL, @PS_USER_ID VARCHAR (4) NULL, @PS_Quantity DECIMAL (24, 8) NULL OUTPUT, @PS_Quantity_OutStanding DECIMAL (24, 8) NULL, @PS_Quantity_Reserved DECIMAL (24, 8) NULL, @PS_Quantity_Unit DECIMAL (24, 8) NULL, @PS_Stock_Code VARCHAR (25) NULL, @PS_SubAnalysis_Code VARCHAR (25) NULL, @PS_Serial_Number VARCHAR (40) NULL, @PS_Partial_Delivery BIT NULL, @PS_Allow_No_Partial_Delivery BIT NULL, @PS_Order_SubAnalysis_Code VARCHAR (25) NULL, @PS_Order_Serial_Number VARCHAR (40) NULL, @PS_DoNotPrint TINYINT NULL, @PS_Error_Number INT NULL OUTPUT, @PS_Date DATETIME NULL, @PS_Delivery_Account VARCHAR (10) NULL, @PS_Serial_Temp_ID INT NULL, @PS_Quantity_Printed DECIMAL (24, 8) NULL, @PS_DetailLineNumber INT NULL, @PS_StockAnalysis VARCHAR (25) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_POP_STOCK_ON_ORDER_S]
@PS_Stock_Code VARCHAR (25) NULL, @PS_SubAnalysis_Code VARCHAR (25) NULL, @PS_QTY_Ordered DECIMAL (24, 8) NULL, @PS_QTY_Delivered DECIMAL (24, 8) NULL, @PS_QTY_Unit DECIMAL (24, 8) NULL, @PS_QTY_Reserved DECIMAL (24, 8) NULL OUTPUT, @PS_Order_Last_Action CHAR (1) NULL OUTPUT, @PS_Previous_SubAnalysis_Code VARCHAR (25) NULL, @PS_OrderType VARCHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



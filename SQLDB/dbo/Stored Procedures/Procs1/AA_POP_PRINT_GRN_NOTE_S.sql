CREATE PROCEDURE [dbo].[AA_POP_PRINT_GRN_NOTE_S]
@PS_DocumentHeaderLink INT NULL, @PS_OrderDetailPrimary INT NULL, @PS_OrderNumber VARCHAR (10) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_Quantity DECIMAL (24, 8) NULL OUTPUT, @PS_QuantityOutstanding DECIMAL (24, 8) NULL, @PS_QuantityReserved DECIMAL (24, 8) NULL, @PS_QuantityOrdered DECIMAL (24, 8) NULL, @PS_Stock_Code VARCHAR (25) NULL, @PS_SubAnalysis_Code VARCHAR (25) NULL OUTPUT, @PS_Serial_Number VARCHAR (40) NULL OUTPUT, @PS_Partial_Delivery BIT NULL, @PS_Order_SubAnalysis_Code VARCHAR (25) NULL, @PS_Order_Serial_Number VARCHAR (40) NULL, @PS_DoNotPrint BIT NULL, @PS_Error_Number INT NULL OUTPUT, @PS_Serial_Temp_ID INT NULL, @PS_DetailLineNumber INT NULL, @PS_Supplier VARCHAR (10) NULL, @PS_UpdateStockToNominal BIT NULL, @PS_StockAnalysis VARCHAR (25) NULL, @PS_TransactionOptions VARCHAR (100) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



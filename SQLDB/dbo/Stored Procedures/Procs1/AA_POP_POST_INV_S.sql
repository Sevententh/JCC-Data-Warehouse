CREATE PROCEDURE [dbo].[AA_POP_POST_INV_S]
@PS_Order_Number VARCHAR (10) NULL, @PS_Post_Origin TINYINT NULL, @PS_User_Id VARCHAR (5) NULL, @PS_Inv_Period TINYINT NULL, @PS_Inv_Year CHAR (1) NULL, @PS_Inv_Date DATETIME NULL, @PS_Query_Flag TINYINT NULL, @PS_Description VARCHAR (30) NULL, @PS_Invoice_Number VARCHAR (25) NULL, @PS_Internal_Ref_No DECIMAL (15) NULL, @PS_Euro_Version TINYINT NULL, @PS_Use_Belgium_Tax_Rules TINYINT NULL, @PS_CredNte_NoUpdateOfStock TINYINT NULL, @PS_Action_Flag TINYINT NULL OUTPUT, @PS_Return_Ref VARCHAR (25) NULL OUTPUT, @PS_Revalue_Currency TINYINT NULL, @PS_Currency_Rate DECIMAL (16, 6) NULL, @PS_Revalue_Euro_Rate DECIMAL (16, 6) NULL, @PS_Source VARCHAR (1) NULL, @PS_TempID INT NULL, @PS_ConsolidateMultipleInvoices BIT NULL, @PS_PT_PRIMARY INT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



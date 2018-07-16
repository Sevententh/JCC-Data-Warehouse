CREATE PROCEDURE [dbo].[AA_IR_HEADER_INSERT_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Primary INT NULL OUTPUT, @PS_Type VARCHAR (2) NULL, @PS_Supplier VARCHAR (10) NULL, @PS_Sub_Ledger VARCHAR (10) NULL, @PS_Currency_Code VARCHAR (6) NULL, @PS_Currency_Symbol VARCHAR (4) NULL, @PS_Currency_Rate DECIMAL (16, 6) NULL, @PS_Euro_Home_Rate DECIMAL (16, 6) NULL, @PS_Base2_Rate DECIMAL (16, 6) NULL, @PS_Disputed BIT NULL, @PS_Settlement_Discount1 DECIMAL (24, 8) NULL, @PS_Settlement_Days1 INT NULL, @PS_Settlement_Discount2 DECIMAL (24, 8) NULL, @PS_Settlement_Days2 INT NULL, @PS_Invoice_Type VARCHAR (3) NULL, @PS_Invoice_Number VARCHAR (25) NULL, @PS_Batch_Reference VARCHAR (10) NULL, @PS_Date DATETIME NULL, @PS_Year VARCHAR (1) NULL, @PS_Period TINYINT NULL, @PS_Due_Date DATETIME NULL, @PS_Anticipated_Payment_Date DATETIME NULL, @PS_Description VARCHAR (30) NULL, @PS_Order_Number VARCHAR (10) NULL, @PS_Nett DECIMAL (24, 8) NULL, @PS_VAT DECIMAL (24, 8) NULL, @PS_Gross DECIMAL (24, 8) NULL, @PS_Currency_Value DECIMAL (24, 8) NULL, @PS_Approver_1 VARCHAR (4) NULL, @PS_Approver_2 VARCHAR (4) NULL, @PS_Approver_3 VARCHAR (4) NULL, @PS_Source VARCHAR (1) NULL, @PS_Invoice_Register_User VARCHAR (4) NULL, @PS_Internal_Reference DECIMAL (15) NULL, @PS_Partner_Code VARCHAR (10) NULL, @PS_DateReceived DATETIME NULL, @PS_EnterGrossAmounts BIT NULL, @PS_EnterCurrencyAmounts BIT NULL, @PS_ApproveNow BIT NULL, @PS_Currency_Nett DECIMAL (24, 8) NULL, @PS_Currency_VAT DECIMAL (24, 8) NULL, @PS_UseMultipleDueDates BIT NULL, @PS_MultipleDueDateDepositPerc DECIMAL (16, 2) NULL, @PS_MultipleDueDateDepositVal DECIMAL (24, 8) NULL, @PS_MultipleDueDateStartDate DATETIME NULL, @PS_MultipleDueDatePaymentNo INT NULL, @PS_MultipleDueDatesXml XML NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



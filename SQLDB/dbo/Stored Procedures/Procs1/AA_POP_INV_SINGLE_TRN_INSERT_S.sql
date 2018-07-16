CREATE PROCEDURE [dbo].[AA_POP_INV_SINGLE_TRN_INSERT_S]
@PS_Order_Number VARCHAR (10) NULL, @PS_User_Id VARCHAR (5) NULL, @PS_Post_Origin TINYINT NULL, @PS_Tran_Type VARCHAR (3) NULL, @PS_Tran_Year VARCHAR (3) NULL, @PS_Tran_Period TINYINT NULL, @PS_Tran_Date DATETIME NULL, @PS_Description VARCHAR (30) NULL, @PS_Invoice_Number VARCHAR (25) NULL, @PS_Internal_Ref_No DECIMAL (15) NULL, @PS_Query_Flag TINYINT NULL, @PS_Euro_Version TINYINT NULL, @PS_Purchase_Primary INT NULL OUTPUT, @PS_Posting_Status TINYINT NULL OUTPUT, @PS_Action_Flag TINYINT NULL OUTPUT, @PS_Return_Ref VARCHAR (25) NULL OUTPUT, @PS_Notify_Ref TINYINT NULL OUTPUT, @PS_Revalue_Currency TINYINT NULL, @PS_Revalue_Currency_Rate DECIMAL (16, 6) NULL, @PS_Revalue_Euro_Rate DECIMAL (16, 6) NULL, @PS_Source VARCHAR (1) NULL, @PS_TempID INT NULL, @PS_ANT_DAYS_FROM_DATES_OPT TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



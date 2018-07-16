CREATE PROCEDURE [dbo].[AA_SOP_POST_BATCH_S]
@PS_ID INT NULL, @PS_Order_Primary INT NULL, @PS_Document_Type VARCHAR (1) NULL, @PS_User_ID VARCHAR (4) NULL, @PS_Confirm TINYINT NULL, @PS_Document_Primary INT NULL, @PS_Process_Date DATETIME NULL, @PS_Process_Year VARCHAR (1) NULL, @PS_Process_Period TINYINT NULL, @PS_Invoice_Full_Order BIT NULL, @PS_CRN_DoNotUpdateStock BIT NULL, @PS_Combined_Delivery BIT NULL, @PS_Revalue_Currency BIT NULL, @PS_Revalue_Currency_Rate DECIMAL (16, 6) NULL, @PS_Revalue_Euro_Rate DECIMAL (16, 6) NULL, @PS_Revalue_Base2_Rate DECIMAL (16, 6) NULL, @PS_Source VARCHAR (1) NULL, @PS_Error_Number INT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



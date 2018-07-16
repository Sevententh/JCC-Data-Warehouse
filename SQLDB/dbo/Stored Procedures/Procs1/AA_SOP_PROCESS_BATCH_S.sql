CREATE PROCEDURE [dbo].[AA_SOP_PROCESS_BATCH_S]
@PS_Use_Temp_Table BIT NULL, @PS_ID INT NULL OUTPUT, @PS_Document_Type VARCHAR (1) NULL, @PS_User_ID VARCHAR (4) NULL, @PS_Process TINYINT NULL, @PS_Document_Number VARCHAR (10) NULL OUTPUT, @PS_Document_Primary INT NULL OUTPUT, @PS_Process_Date DATETIME NULL OUTPUT, @PS_Process_Year VARCHAR (1) NULL OUTPUT, @PS_Process_Period TINYINT NULL OUTPUT, @PS_Invoice_Full_Order BIT NULL, @PS_CRN_DoNotUpdateStock BIT NULL, @PS_Combined_Delivery BIT NULL, @PS_Revalue_Currency BIT NULL, @PS_Revalue_Currency_Rate DECIMAL (16, 6) NULL, @PS_Revalue_Euro_Rate DECIMAL (16, 6) NULL, @PS_Source VARCHAR (1) NULL, @PS_Option1 VARCHAR (3) NULL, @PS_Option2 VARCHAR (3) NULL, @PS_Error_Number INT NULL OUTPUT, @PS_PrintOrderNotes BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



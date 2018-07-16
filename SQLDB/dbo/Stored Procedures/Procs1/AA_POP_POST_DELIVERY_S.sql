CREATE PROCEDURE [dbo].[AA_POP_POST_DELIVERY_S]
@PS_Order_Number VARCHAR (10) NULL, @PS_User_ID VARCHAR (4) NULL, @PS_Post_Origin TINYINT NULL, @PS_Action_Status TINYINT NULL OUTPUT, @PS_Update_Stock_Price TINYINT NULL, @PS_Delivery_Year CHAR (1) NULL, @PS_Delivery_Period TINYINT NULL, @PS_Delivery_Date DATETIME NULL, @PS_Batched_Transaction TINYINT NULL, @PS_Blank_Field VARCHAR (20) NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_TempID INT NULL, @PS_Revalue_Currency TINYINT NULL, @PS_Currency_Rate DECIMAL (16, 6) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



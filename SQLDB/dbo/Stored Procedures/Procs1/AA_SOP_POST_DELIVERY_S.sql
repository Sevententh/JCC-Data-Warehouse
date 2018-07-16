CREATE PROCEDURE [dbo].[AA_SOP_POST_DELIVERY_S]
@PS_Order_Number INT NULL, @PS_Post_Origin TINYINT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Batched_Transaction TINYINT NULL, @PS_Action_Status TINYINT NULL OUTPUT, @PS_No_Of_Lines_Delivered INT NULL OUTPUT, @PS_Delivery_Year VARCHAR (1) NULL, @PS_Delivery_Period TINYINT NULL, @PS_Delivery_Date DATETIME NULL, @PS_Source VARCHAR (1) NULL, @PS_CRN_DoNotUpdateStock BIT NULL, @PS_BatchDetail_Id INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



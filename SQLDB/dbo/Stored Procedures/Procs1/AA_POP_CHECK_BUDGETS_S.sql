CREATE PROCEDURE [dbo].[AA_POP_CHECK_BUDGETS_S]
@PS_UserID VARCHAR (4) NULL, @PS_Detail_Value DECIMAL (24, 8) NULL, @PS_Year VARCHAR (1) NULL, @PS_Period TINYINT NULL, @PS_Nominal_Code VARCHAR (25) NULL, @PS_Order_Number VARCHAR (20) NULL, @PS_Type VARCHAR (1) NULL, @PS_Header_Primary INT NULL, @PS_Detail_Primary INT NULL, @PS_Budget_Status VARCHAR (4) NULL OUTPUT, @PS_Authorisation_Message VARCHAR (1000) NULL OUTPUT, @PS_Authorised_ID VARCHAR (4) NULL, @PS_Purchase_Update_Year VARCHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



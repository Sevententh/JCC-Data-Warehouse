CREATE PROCEDURE [dbo].[AA_POP_MULTI_DUPLICATE_S]
@PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Order_Number VARCHAR (10) NULL, @PS_Order_Primary INT NULL, @PS_Order_Type VARCHAR (1) NULL, @PS_Multiple INT NULL, @PS_First_Date DATETIME NULL, @PS_Keep_Date BIT NULL, @PS_Interval VARCHAR (1) NULL, @PS_Frequency INT NULL, @PS_Order_Prefix VARCHAR (5) NULL, @PS_First_Order_Number INT NULL, @PS_Order_Number_Length INT NULL, @PS_Update_Stock BIT NULL, @PS_Currency_Recalc VARCHAR (1) NULL, @PS_Currency_Type VARCHAR (1) NULL, @PS_Currency_Rate DECIMAL (24, 8) NULL, @PS_Euro_to_Home_Rate DECIMAL (24, 8) NULL, @PS_Base2_Rate DECIMAL (24, 8) NULL, @PS_Clear_Sub_Analysis BIT NULL, @PS_Source VARCHAR (1) NULL, @PS_Start_Order_Number VARCHAR (10) NULL OUTPUT, @PS_Authorisation_Message VARCHAR (1000) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



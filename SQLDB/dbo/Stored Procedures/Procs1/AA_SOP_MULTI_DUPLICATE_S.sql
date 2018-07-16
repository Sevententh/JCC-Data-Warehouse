CREATE PROCEDURE [dbo].[AA_SOP_MULTI_DUPLICATE_S]
@PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Order_Number INT NULL, @PS_Order_Primary INT NULL, @PS_Order_Type VARCHAR (3) NULL, @PS_Multiple INT NULL, @PS_First_Date DATETIME NULL, @PS_Keep_Date BIT NULL, @PS_Interval VARCHAR (1) NULL, @PS_Frequency INT NULL, @PS_Reserve_Stock BIT NULL, @PS_Currency_Recalc VARCHAR (1) NULL, @PS_Currency_Type VARCHAR (1) NULL, @PS_Currency_Rate DECIMAL (24, 8) NULL, @PS_Euro_to_Home_Rate DECIMAL (16, 6) NULL, @PS_Base2_Rate DECIMAL (16, 6) NULL, @PS_Clear_Sub_Analysis BIT NULL, @PS_Source VARCHAR (1) NULL, @PS_Start_Order_Number VARCHAR (10) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_SOP_POST_INV_STAGE1_S]
@PS_Order_Number INT NULL, @PS_Module CHAR (3) NULL, @PS_User_Id VARCHAR (5) NULL, @PS_Country_Code VARCHAR (4) NULL, @PS_Delivery_Due_Date_Type TINYINT NULL, @PS_Post_Origin TINYINT NULL, @PS_Use_Belguim_Tax_Rules TINYINT NULL, @PS_ST_PRIMARY INT NULL OUTPUT, @PS_Posting_Status TINYINT NULL OUTPUT, @PS_No_Of_Lines_Invd INT NULL OUTPUT, @PS_Action_Status TINYINT NULL OUTPUT, @PS_Inv_Full_Order TINYINT NULL, @PS_Revalue_Currency TINYINT NULL, @PS_Revalue_Curr_Rate DECIMAL (12, 6) NULL, @PS_Revalue_Tri_Rate1 DECIMAL (12, 6) NULL, @PS_Revalue_Base2_Rate DECIMAL (12, 6) NULL, @PS_Source VARCHAR (1) NULL, @PS_Consolidate BIT NULL, @PS_BatchDetail_Id INT NULL, @PS_ANT_DAYS_FROM_DATES_OPT TINYINT NULL, @PS_MaxYear VARCHAR (1) NULL, @PS_MaxPeriod TINYINT NULL, @PS_ROUND_ORDER_VAT_TO_5DP BIT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_SOP_POST_INV_S]
@PS_Order_Number INT NULL, @PS_Action_Status TINYINT NULL OUTPUT, @PS_Post_Origin TINYINT NULL, @PS_Module CHAR (3) NULL, @PS_User_Id VARCHAR (5) NULL, @PS_Use_Belguim_Tax_Rules TINYINT NULL, @PS_CredNte_NoUpdateOfStock TINYINT NULL, @PS_Inv_Full_Order TINYINT NULL, @PS_Revalue_Currency TINYINT NULL, @PS_Revalue_Curr_Rate DECIMAL (12, 6) NULL, @PS_Revalue_Tri_Rate1 DECIMAL (12, 6) NULL, @PS_Revalue_Base2_Rate DECIMAL (12, 6) NULL, @PS_Source VARCHAR (1) NULL, @PS_BatchDetail_Id INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_STK_COMPONENT_S]
@PS_Default_String NVARCHAR (100) NULL, @PS_Mode NVARCHAR (1) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id NVARCHAR (4) NULL, @PS_Source NVARCHAR (1) NULL, @PS_Primary INT NULL OUTPUT, @PS_Assembly_Code NVARCHAR (25) NULL, @PS_Component_Type NVARCHAR (1) NULL, @PS_Component_Code NVARCHAR (25) NULL, @PS_Component_Description NVARCHAR (80) NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_Use_First_Free_SubAnalysis BIT NULL, @PS_SubAnalysis_Code NVARCHAR (25) NULL, @PS_Cost_Price DECIMAL (24, 8) NULL, @PS_Selling_Price DECIMAL (24, 8) NULL, @PS_Update_Cost_Price BIT NULL, @PS_Update_Selling_Price BIT NULL, @PS_Date DATETIME NULL, @PS_Labour BIT NULL, @PS_BackFlush BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_STKTRN_POST_S]
@PS_Move_Primary INT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_ByPass_MU_Checks TINYINT NULL, @PS_Ignore_Qty_Check_Flag BIT NULL, @PS_Update_Cost_Price_Flag BIT NULL, @PS_Error_Status TINYINT NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_Assembly_Update_Nominal BIT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_AllocQuantityChange DECIMAL (24, 8) NULL, @PS_UnallocQuantityChange DECIMAL (24, 8) NULL, @PS_ComponentPrimary INT NULL, @PS_SubAssemblyMovement BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



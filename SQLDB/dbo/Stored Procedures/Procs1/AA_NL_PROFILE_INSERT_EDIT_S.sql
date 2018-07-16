CREATE PROCEDURE [dbo].[AA_NL_PROFILE_INSERT_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Mode VARCHAR (1) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_MainNominalCode VARCHAR (25) NULL, @PS_ProfileNominalCode VARCHAR (25) NULL, @PS_ProfilePercentage FLOAT (53) NULL, @PS_UpdateWarning BIT NULL, @PS_ProfileUsedIn_SL BIT NULL, @PS_ProfileUsedIn_PL BIT NULL, @PS_ProfileUsedIn_NL BIT NULL, @PS_Profile_Complete BIT NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod BIT NULL, @PS_UpdateProfileChild BIT NULL, @PS_ChildClassWarning BIT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_SYS_CHECK_RECORD_SECURITY_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Action VARCHAR (1) NULL, @PS_User_Id VARCHAR (4) NULL OUTPUT, @PS_Function_Key VARCHAR (10) NULL, @PS_New_Level INT NULL OUTPUT, @PS_Existing_Level INT NULL, @PS_Source VARCHAR (1) NULL OUTPUT, @PS_Allowed TINYINT NULL OUTPUT, @PS_Option_Default BIT NULL OUTPUT, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_Exact_Level INT NULL OUTPUT, @PS_Disabled BIT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_CRC_DEBT_STATUS_BULK_UPDATES_S]
@PS_Validate_Only BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Source VARCHAR (3) NULL, @PS_Trans_List_XML VARCHAR (4000) NULL, @PS_Update_Option TINYINT NULL, @PS_New_Debt_Status VARCHAR (30) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_PROCESS_NL_TRN_TEMP_S]
@PS_TRN_TEMP_ID INT NULL, @PS_USER_ID VARCHAR (4) NULL, @PS_Proccess_Status TINYINT NULL, @PS_Header_Primary INT NULL OUTPUT, @PS_Header_Key VARCHAR (20) NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Release_Lock BIT NULL, @PS_LastSaveDateTime DATETIME NULL, @PS_ConcurrentUser VARCHAR (4) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



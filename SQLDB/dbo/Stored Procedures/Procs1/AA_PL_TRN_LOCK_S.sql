CREATE PROCEDURE [dbo].[AA_PL_TRN_LOCK_S]
@PS_Primary INT NULL, @PS_UserID VARCHAR (4) NULL, @PS_Operation VARCHAR (2) NULL, @PS_Source VARCHAR (1) NULL, @PS_DeadLockAttempts TINYINT NULL, @PS_LockAcquired BIT NULL OUTPUT, @PS_ServerErrorNo INT NULL OUTPUT, @PS_ServerErrorMsg VARCHAR (8000) NULL OUTPUT, @PS_LockOwner VARCHAR (4) NULL OUTPUT, @PS_LockOperation VARCHAR (2) NULL OUTPUT, @PS_LockSource VARCHAR (1) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_PL_REMITTANCES_SET_PROCESS_FLAG_S]
@PS_ErrorHandlingMethod INT NULL, @PS_CalledFrom INT NULL, @PS_UserID VARCHAR (4) NULL, @PS_BatchID INT NULL OUTPUT, @PS_SupplierCode VARCHAR (25) NULL, @PS_EnableProcessing BIT NULL, @PS_CreateSeparateCheque BIT NULL, @PS_ChequeNo VARCHAR (25) NULL, @PS_FaxNumber NVARCHAR (64) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



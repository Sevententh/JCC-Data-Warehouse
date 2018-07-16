CREATE PROCEDURE [dbo].[AA_VALIDATE_INV_CRN_NUMBERS_S]
@PS_HeaderReference NVARCHAR (25) NULL, @PS_InternalReference BIGINT NULL, @PS_TransactionType VARCHAR (3) NULL, @PS_Module CHAR (1) NULL, @PS_CalledFrom INT NULL, @PS_SubLedger_Code NVARCHAR (10) NULL, @PS_HeaderPrimary BIGINT NULL, @PS_Supplier_Code NVARCHAR (10) NULL, @PS_ValidationMode TINYINT NULL, @PS_IsDuplicate TINYINT NULL OUTPUT, @PS_User_ID NVARCHAR (4) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



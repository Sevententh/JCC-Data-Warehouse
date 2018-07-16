CREATE PROCEDURE [dbo].[AA_CHECK_INV_CRN_NUMBERS_S]
@PS_Header_Reference VARCHAR (25) NULL OUTPUT, @PS_Transaction_Type CHAR (3) NULL, @PS_SubLedger_Code VARCHAR (10) NULL, @PS_Header_Ref_ConCat VARCHAR (26) NULL OUTPUT, @PS_Module CHAR (1) NULL, @PS_Internal_Reference DECIMAL (15) NULL, @PS_Supplier_Code VARCHAR (10) NULL, @PS_ValidateOnly BIT NULL, @PS_HideErrors BIT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_UserID VARCHAR (4) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



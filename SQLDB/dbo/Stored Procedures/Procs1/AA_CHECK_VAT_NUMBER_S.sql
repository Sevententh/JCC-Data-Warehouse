CREATE PROCEDURE [dbo].[AA_CHECK_VAT_NUMBER_S]
@PS_VAT_Number NVARCHAR (21) NULL OUTPUT, @PS_Country_Code NVARCHAR (4) NULL, @PS_User_Id NVARCHAR (4) NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_Primary INT NULL, @PS_UsersCountryCode NVARCHAR (4) NULL, @PS_TestValidityOnly BIT NULL, @PS_ValidVatNumber BIT NULL OUTPUT, @PS_ValidFormats NVARCHAR (100) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



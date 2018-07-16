CREATE PROCEDURE [dbo].[AA_CRM_CHANGE_CAMPAIGN_STATUS_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Mode VARCHAR (1) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Campaign_Code VARCHAR (20) NULL, @PS_New_Stage VARCHAR (30) NULL, @PS_Contact_Code INT NULL, @PS_Account_Code VARCHAR (10) NULL, @PS_Campaign_Primary INT NULL, @PS_Source VARCHAR (1) NULL OUTPUT, @PS_ErrorInstanceID INT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Primary INT NULL OUTPUT, @PS_TestAccountLock BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



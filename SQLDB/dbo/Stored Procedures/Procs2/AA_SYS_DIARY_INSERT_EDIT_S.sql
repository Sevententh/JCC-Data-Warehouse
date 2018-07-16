CREATE PROCEDURE [dbo].[AA_SYS_DIARY_INSERT_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Mode VARCHAR (1) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Primary INT NULL OUTPUT, @PS_User_Assigned VARCHAR (4) NULL, @PS_Date DATETIME NULL, @PS_Module VARCHAR (3) NULL, @PS_Record_Type VARCHAR (6) NULL, @PS_Record_Code VARCHAR (25) NULL, @PS_Actioned BIT NULL, @PS_Text TEXT NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_CompletedDate DATETIME NULL, @PS_Priority TINYINT NULL, @PS_Task_Contact_No INT NULL, @PS_Task_AD_LINK INT NULL, @PS_Task_Type VARCHAR (40) NULL, @PS_Task_Status VARCHAR (40) NULL, @PS_Task_Action_Time DATETIME NULL, @PS_Task_Contact_Name VARCHAR (30) NULL, @PS_Task_Primary INT NULL OUTPUT, @PS_TestAccountLock BIT NULL, @PS_LastSaveDateTime DATETIME NULL, @PS_ApplyConcurrencyCheck BIT NULL, @PS_ConcurrentUser VARCHAR (4) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



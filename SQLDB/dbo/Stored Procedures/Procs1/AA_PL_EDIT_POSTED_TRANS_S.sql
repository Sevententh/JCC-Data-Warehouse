CREATE PROCEDURE [dbo].[AA_PL_EDIT_POSTED_TRANS_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Primary_Key INT NULL, @PS_Source VARCHAR (1) NULL, @PS_Description VARCHAR (30) NULL, @PS_Due_Date DATETIME NULL, @PS_Anticipated_Pay_Date DATETIME NULL, @PS_Archived BIT NULL, @PS_Disputed BIT NULL, @PS_User_Sort_1 VARCHAR (20) NULL, @PS_User_Sort_2 VARCHAR (20) NULL, @PS_User_Sort_3 VARCHAR (20) NULL, @PS_Replace_Notes TEXT NULL, @PS_Append_Notes TEXT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod BIT NULL, @PS_UserChar1 VARCHAR (20) NULL, @PS_UserChar2 VARCHAR (20) NULL, @PS_UserChar3 VARCHAR (100) NULL, @PS_UserChar4 VARCHAR (100) NULL, @PS_UserFlag1 BIT NULL, @PS_UserFlag2 BIT NULL, @PS_UserDate1 DATETIME NULL, @PS_UserDate2 DATETIME NULL, @PS_UserNum1 FLOAT (53) NULL, @PS_UserNum2 FLOAT (53) NULL, @PS_PrependNotes TEXT NULL, @PS_DateStampNotes BIT NULL, @PS_SystemEdit BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



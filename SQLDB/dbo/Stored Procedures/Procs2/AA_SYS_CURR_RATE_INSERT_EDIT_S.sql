CREATE PROCEDURE [dbo].[AA_SYS_CURR_RATE_INSERT_EDIT_S]
@PS_Default_String VARCHAR (20) NULL, @PS_Insert_Flag BIT NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Currency_Code VARCHAR (6) NULL, @PS_Currency_Symbol VARCHAR (4) NULL, @PS_Rate DECIMAL (16, 6) NULL, @PS_Type VARCHAR (1) NULL, @PS_Date DATETIME NULL, @PS_Sales_Analysis VARCHAR (25) NULL, @PS_Purchase_Analysis VARCHAR (25) NULL, @PS_Notes VARCHAR (40) NULL, @PS_Primary_Key INT NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



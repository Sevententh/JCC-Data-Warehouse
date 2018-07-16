CREATE PROCEDURE [dbo].[AA_CST_RESOURCE_RATE_CHANGE_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Percentage_Uplift DECIMAL (16, 2) NULL OUTPUT, @PS_Uplift_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Exist_Price DECIMAL (24, 8) NULL, @PS_Exist_Percentage_Uplift DECIMAL (16, 2) NULL, @PS_Exist_Uplift_Value DECIMAL (24, 8) NULL, @PS_VALUE_DPS TINYINT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceId BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



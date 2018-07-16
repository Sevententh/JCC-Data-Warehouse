CREATE PROCEDURE [dbo].[AA_CHECK_RESOURCE_VALUES_S]
@PS_Default_String VARCHAR (20) NULL, @PS_User_Putin VARCHAR (4) NULL, @PS_Exclude_Resource_Uplift BIT NULL, @PS_Resource_Code VARCHAR (16) NULL OUTPUT, @PS_Resource_Price_Line TINYINT NULL OUTPUT, @PS_Resource_PayRoll_PayType VARCHAR (20) NULL OUTPUT, @PS_Resource_Currency VARCHAR (4) NULL OUTPUT, @PS_Resource_Uplift_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Resource_Curr_Uplft_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Resource_Uplift_Prcnt DECIMAL (16, 2) NULL OUTPUT, @PS_Resource_Employee_Code VARCHAR (10) NULL OUTPUT, @PS_Home_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Currency_Price DECIMAL (24, 8) NULL OUTPUT, @PS_Costcentre_Rate_Type CHAR (1) NULL, @PS_Costcentre_Rate DECIMAL (24, 8) NULL, @PS_User_Id VARCHAR (5) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceId BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_CST_CENTRE_INSERT_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Insert_Flag BIT NULL, @PS_Validate_Only BIT NULL, @PS_Primary INT NULL OUTPUT, @PS_Project_Code VARCHAR (10) NULL, @PS_CostCentre_Code VARCHAR (10) NULL OUTPUT, @PS_CostCentre_Name VARCHAR (40) NULL, @PS_User_SubTotal_No TINYINT NULL, @PS_Charge_Rate_Type CHAR (1) NULL, @PS_Fixed_Rate DECIMAL (24, 8) NULL, @PS_Resource_Rate_Line_No TINYINT NULL, @PS_Centre_Uplift_Type TINYINT NULL, @PS_Centre_Uplift_Value DECIMAL (24, 8) NULL, @PS_Required_Date DATETIME NULL, @PS_Duration_Type CHAR (1) NULL, @PS_Duration INT NULL, @PS_Analysis_Code VARCHAR (25) NULL, @PS_Notes VARCHAR (240) NULL, @PS_Append_Notes VARCHAR (240) NULL, @PS_CostCentre_Status VARCHAR (1) NULL, @PS_Group_Level TINYINT NULL, @PS_Group_Parent VARCHAR (10) NULL, @PS_Group_Order INT NULL, @PS_Source VARCHAR (1) NULL, @PS_User_Char1 VARCHAR (20) NULL, @PS_User_Char2 VARCHAR (20) NULL, @PS_User_Char3 VARCHAR (20) NULL, @PS_User_Char4 VARCHAR (30) NULL, @PS_User_Char5 VARCHAR (30) NULL, @PS_User_Char6 VARCHAR (30) NULL, @PS_User_Date1 DATETIME NULL, @PS_User_Date2 DATETIME NULL, @PS_User_Date3 DATETIME NULL, @PS_User_Flag1 TINYINT NULL, @PS_User_Flag2 TINYINT NULL, @PS_User_Flag3 TINYINT NULL, @PS_User_Number1 DECIMAL (24, 8) NULL, @PS_User_Number2 DECIMAL (24, 8) NULL, @PS_User_Number3 DECIMAL (24, 8) NULL, @PS_User_SubTotal VARCHAR (20) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



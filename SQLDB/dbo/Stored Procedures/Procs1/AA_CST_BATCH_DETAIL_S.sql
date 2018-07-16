CREATE PROCEDURE [dbo].[AA_CST_BATCH_DETAIL_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Validate_Only TINYINT NULL, @PS_User_Id VARCHAR (5) NULL, @PS_Module VARCHAR (3) NULL, @PS_Primary INT NULL OUTPUT, @PS_Transaction_Status CHAR (1) NULL, @PS_Transaction_Type VARCHAR (3) NULL, @PS_Transaction_Reference VARCHAR (10) NULL, @PS_Batch_Reference VARCHAR (10) NULL, @PS_Transaction_Date DATETIME NULL, @PS_Week_No TINYINT NULL, @PS_Year CHAR (1) NULL, @PS_Period_Number TINYINT NULL, @PS_Description VARCHAR (20) NULL, @PS_CostHeader VARCHAR (10) NULL, @PS_CostCentre VARCHAR (10) NULL, @PS_Resource_Code VARCHAR (16) NULL, @PS_Resource_Price_Line TINYINT NULL, @PS_Currency_Code VARCHAR (4) NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_Home_Price DECIMAL (24, 8) NULL, @PS_Currency_Price DECIMAL (24, 8) NULL, @PS_Transaction_Value DECIMAL (24, 8) NULL, @PS_Centre_Uplft_Value_Prcnt DECIMAL (24, 8) NULL, @PS_Centre_Tot_Uplft_Val DECIMAL (24, 8) NULL, @PS_Centre_Tot_Curr_Uplft_Val DECIMAL (24, 8) NULL, @PS_Resource_PayRoll_PayType VARCHAR (20) NULL, @PS_Detail VARCHAR (240) NULL, @PS_Archive_Flag TINYINT NULL, @PS_Do_Not_Batch TINYINT NULL, @PS_Exclude_Resource_Uplift TINYINT NULL, @PS_Source VARCHAR (1) NULL, @PS_Enter_Currency TINYINT NULL, @PS_User_Char1 VARCHAR (20) NULL, @PS_User_Char2 VARCHAR (20) NULL, @PS_User_Char3 VARCHAR (100) NULL, @PS_User_Char4 VARCHAR (100) NULL, @PS_User_Flag1 TINYINT NULL, @PS_User_Flag2 TINYINT NULL, @PS_User_Date1 DATETIME NULL, @PS_User_Date2 DATETIME NULL, @PS_User_Number1 DECIMAL (24, 8) NULL, @PS_User_Number2 DECIMAL (24, 8) NULL, @PS_User_Putin VARCHAR (4) NULL, @PS_Header_Link VARCHAR (20) NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceId BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_PluginDetailXML XML NULL, @PS_WorkflowFormsStatus TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



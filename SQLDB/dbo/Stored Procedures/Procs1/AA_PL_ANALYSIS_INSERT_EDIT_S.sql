CREATE PROCEDURE [dbo].[AA_PL_ANALYSIS_INSERT_EDIT_S]
@PS_Default_String VARCHAR (60) NULL, @PS_Insert_Flag TINYINT NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Analysis_Code VARCHAR (25) NULL OUTPUT, @PS_Analysis_Name VARCHAR (40) NULL, @PS_Sort VARCHAR (20) NULL, @PS_Tax_Code VARCHAR (4) NULL, @PS_Currency_Symbol VARCHAR (4) NULL, @PS_Nominal_Debit_Account VARCHAR (25) NULL, @PS_Nominal_Credit_Account VARCHAR (25) NULL, @PS_Nominal_VAT_Account VARCHAR (25) NULL, @PS_Analysis_Type CHAR (1) NULL, @PS_Home_Default BIT NULL, @PS_Profile_Level INT NULL, @PS_Update_Landed_Cost BIT NULL, @PS_Force_Costing BIT NULL, @PS_Analysis_Matrix BIT NULL, @PS_Notes TEXT NULL, @PS_User_Char1 VARCHAR (20) NULL, @PS_User_Char2 VARCHAR (20) NULL, @PS_User_Char5 VARCHAR (20) NULL, @PS_User_Char6 VARCHAR (30) NULL, @PS_User_Char7 VARCHAR (30) NULL, @PS_User_Char8 VARCHAR (30) NULL, @PS_User_Date1 DATETIME NULL, @PS_User_Date2 DATETIME NULL, @PS_User_Date3 DATETIME NULL, @PS_User_Flag1 TINYINT NULL, @PS_User_Flag2 TINYINT NULL, @PS_User_Flag3 TINYINT NULL, @PS_User_Number1 DECIMAL (24, 8) NULL, @PS_User_Number2 DECIMAL (24, 8) NULL, @PS_User_Number3 DECIMAL (24, 8) NULL, @PS_Analysis_Primary INT NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_Sort1 VARCHAR (20) NULL, @PS_Sort2 VARCHAR (20) NULL, @PS_Sort3 VARCHAR (20) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceId BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_LastSaveDateTime DATETIME NULL, @PS_ApplyConcurrencyCheck BIT NULL, @PS_ConcurrentUser VARCHAR (4) NULL OUTPUT, @PS_Append_Notes TEXT NULL, @PS_User_Char_Long1 VARCHAR (100) NULL, @PS_User_Char_Long2 VARCHAR (100) NULL, @PS_ExcludeFromLists BIT NULL, @PS_CISTaxable BIT NULL, @PS_DefaultCostCentre VARCHAR (10) NULL, @PS_Accruable BIT NULL, @PS_AccrualPeriods INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



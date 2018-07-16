CREATE PROCEDURE [dbo].[AA_CST_RESOURCE_PRICE_ENTRY_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_CodeSearchFrom VARCHAR (16) NULL, @PS_CodeSearchTo VARCHAR (16) NULL, @PS_SortKeySearch VARCHAR (20) NULL, @PS_Price_Key_No TINYINT NULL, @PS_Primary INT NULL, @PS_Home_Price DECIMAL (24, 8) NULL, @PS_Percentage_Uplift DECIMAL (16, 2) NULL, @PS_Home_Uplift_Value DECIMAL (24, 8) NULL, @PS_Currency VARCHAR (6) NULL, @PS_Currency_Price DECIMAL (24, 8) NULL, @PS_Currency_Uplift_Value DECIMAL (24, 8) NULL, @PS_CurrencyCalc VARCHAR (1) NULL, @PS_Source VARCHAR (1) NULL, @PS_Error_Count INT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceId BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



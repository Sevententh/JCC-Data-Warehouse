CREATE PROCEDURE [dbo].[AA_PRICE_RECORD_INSERT_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Validate_Only BIT NULL, @PS_Insert_Flag TINYINT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Primary INT NULL OUTPUT, @PS_Code VARCHAR (16) NULL OUTPUT, @PS_Description VARCHAR (40) NULL, @PS_Sort_Key VARCHAR (20) NULL, @PS_Text VARCHAR (240) NULL, @PS_Sell_Price DECIMAL (24, 8) NULL, @PS_Sell_Price_2nd_Base DECIMAL (24, 8) NULL, @PS_Cost_Price DECIMAL (24, 8) NULL, @PS_Cost_Price_2nd_Base DECIMAL (24, 8) NULL, @PS_Sales_Analysis VARCHAR (25) NULL, @PS_Purchase_Analysis VARCHAR (25) NULL, @PS_Notes TEXT NULL, @PS_Append_Notes TEXT NULL, @PS_RTP_Flag BIT NULL, @PS_EC_Net_Mass DECIMAL (24, 8) NULL, @PS_EC_Country_Of_Origin VARCHAR (3) NULL, @PS_EC_Commodity_Code VARCHAR (8) NULL, @PS_EC_Supplementary_Unit DECIMAL (24, 8) NULL, @PS_Level INT NULL, @PS_User_Char_1 VARCHAR (20) NULL, @PS_User_Char_2 VARCHAR (20) NULL, @PS_User_Char_3 VARCHAR (20) NULL, @PS_User_Char_4 VARCHAR (30) NULL, @PS_User_Char_5 VARCHAR (30) NULL, @PS_User_Char_6 VARCHAR (30) NULL, @PS_User_Flag_1 BIT NULL, @PS_User_Flag_2 BIT NULL, @PS_User_Flag_3 BIT NULL, @PS_User_Date_1 DATETIME NULL, @PS_User_Date_2 DATETIME NULL, @PS_User_Date_3 DATETIME NULL, @PS_User_Number_1 DECIMAL (24, 8) NULL, @PS_User_Number_2 DECIMAL (24, 8) NULL, @PS_User_Number_3 DECIMAL (24, 8) NULL, @PS_Source VARCHAR (1) NULL, @PS_Assembly_Nominal VARCHAR (25) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Module VARCHAR (3) NULL, @PS_DoNotProcessOnOwn BIT NULL, @PS_WorksOrderIssueAnalysis VARCHAR (25) NULL, @PS_WorksOrderWriteOffAnalysis VARCHAR (25) NULL, @PS_ReverseVatApplies BIT NULL, @PS_ExcludeFromLists BIT NULL, @PS_Service BIT NULL, @PS_EC_Supp_Unit_Type VARCHAR (20) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



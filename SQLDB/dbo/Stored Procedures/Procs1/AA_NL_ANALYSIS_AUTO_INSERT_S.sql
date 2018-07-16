CREATE PROCEDURE [dbo].[AA_NL_ANALYSIS_AUTO_INSERT_S]
@PS_Sales_Analysis BIT NULL, @PS_Purchase_Analysis BIT NULL, @PS_User_Id NVARCHAR (4) NULL, @PS_Majorhead_Code TINYINT NULL, @PS_Account_Code NVARCHAR (25) NULL OUTPUT, @PS_Account_Type CHAR (1) NULL, @PS_Account_Name NVARCHAR (40) NULL, @PS_Currency_Symbol NVARCHAR (4) NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Nominal_Primary BIGINT NULL, @PS_Error_On_Analysis_Existing BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



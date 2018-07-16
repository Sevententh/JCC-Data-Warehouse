CREATE PROCEDURE [dbo].[AA_CST_MASTER_INSERT_EDIT_S]
@PS_DefaultString NVARCHAR (100) NULL, @PS_Mode NVARCHAR (1) NULL, @PS_ValidateOnly BIT NULL, @PS_ErrorHandlingMethod INT NULL, @PS_UserID VARCHAR (4) NULL, @PS_Primary INT NULL OUTPUT, @PS_Code VARCHAR (10) NULL, @PS_Name VARCHAR (40) NULL, @PS_Category VARCHAR (1) NULL, @PS_Type TINYINT NULL, @PS_SalesAnalysisLink INT NULL, @PS_PurchaseAnalysisLink INT NULL, @PS_SecurityLevel INT NULL, @PS_SubtotalSortkey VARCHAR (20) NULL, @PS_UpliftPercentage FLOAT (53) NULL, @PS_UpliftValue FLOAT (53) NULL, @PS_MarkupPercentage FLOAT (53) NULL, @PS_MarkupValue FLOAT (53) NULL, @PS_ResourceRateLink INT NULL, @PS_RateType VARCHAR (1) NULL, @PS_FixedRate FLOAT (53) NULL, @PS_Notes VARCHAR (240) NULL, @PS_UserChar1 VARCHAR (20) NULL, @PS_UserChar2 VARCHAR (20) NULL, @PS_UserChar3 VARCHAR (100) NULL, @PS_UserChar4 VARCHAR (100) NULL, @PS_UserChar5 VARCHAR (20) NULL, @PS_UserChar6 VARCHAR (30) NULL, @PS_UserChar7 VARCHAR (30) NULL, @PS_UserChar8 VARCHAR (30) NULL, @PS_UserNumber1 FLOAT (53) NULL, @PS_UserNumber2 FLOAT (53) NULL, @PS_UserNumber3 FLOAT (53) NULL, @PS_UserDate1 DATETIME NULL, @PS_UserDate2 DATETIME NULL, @PS_UserDate3 DATETIME NULL, @PS_UserFlag1 TINYINT NULL, @PS_UserFlag2 TINYINT NULL, @PS_UserFlag3 TINYINT NULL, @PS_DoNotUse BIT NULL, @PS_AllowQtyBudgets BIT NULL, @PS_Source NVARCHAR (1) NULL, @PS_UpliftType TINYINT NULL, @PS_MarkupType TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



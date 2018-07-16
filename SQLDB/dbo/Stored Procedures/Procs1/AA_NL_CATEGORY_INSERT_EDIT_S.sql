CREATE PROCEDURE [dbo].[AA_NL_CATEGORY_INSERT_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Mode VARCHAR (1) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Category_Number TINYINT NULL, @PS_Code VARCHAR (6) NULL OUTPUT, @PS_Name VARCHAR (50) NULL, @PS_ShortName VARCHAR (10) NULL, @PS_Source VARCHAR (1) NULL, @PS_Primary INT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_MajorHeading TINYINT NULL, @PS_SortKey VARCHAR (20) NULL, @PS_IsBank BIT NULL, @PS_IsPettyCash BIT NULL, @PS_IsCompulsoryCosting BIT NULL, @PS_IsInactive BIT NULL, @PS_IsCarbon BIT NULL, @PS_EmissionsGroupCode CHAR (2) NULL, @PS_ClassificationCode CHAR (4) NULL, @PS_ReportingCode SMALLINT NULL, @PS_AttributeValueLinksBatchID INT NULL, @PS_RemoveAttributeValueLinksNotInBatch BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



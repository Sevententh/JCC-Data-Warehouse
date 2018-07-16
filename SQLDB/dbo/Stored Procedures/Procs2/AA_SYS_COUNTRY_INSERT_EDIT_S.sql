CREATE PROCEDURE [dbo].[AA_SYS_COUNTRY_INSERT_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Mode VARCHAR (1) NULL, @PS_Validate_Only BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_Code VARCHAR (4) NULL, @PS_Symbol VARCHAR (4) NULL, @PS_Name VARCHAR (20) NULL, @PS_TaxName VARCHAR (5) NULL, @PS_CountryType TINYINT NULL, @PS_AgentVatNo VARCHAR (15) NULL, @PS_AgentBranch VARCHAR (3) NULL, @PS_DeliveryTerms VARCHAR (3) NULL, @PS_TransactionNature INT NULL, @PS_TransportMode INT NULL, @PS_Notes TEXT NULL, @PS_Number INT NULL, @PS_Primary INT NULL OUTPUT, @PS_EMUMemberDate DATETIME NULL, @PS_VatRegPrefix VARCHAR (4) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_ExcludeFromLists BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



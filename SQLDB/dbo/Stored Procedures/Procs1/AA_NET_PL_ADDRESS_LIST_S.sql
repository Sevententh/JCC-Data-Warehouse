CREATE PROCEDURE [dbo].[AA_NET_PL_ADDRESS_LIST_S]
@PS_UserID VARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom TINYINT NULL, @PS_Type TINYINT NULL, @PS_StartCode VARCHAR (50) NULL, @PS_StartPrimary VARCHAR (50) NULL, @PS_OrderByField TINYINT NULL, @PS_OrderByFieldName VARCHAR (30) NULL OUTPUT, @PS_TotalRecordCount FLOAT (53) NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_ParentCodeFrom VARCHAR (10) NULL, @PS_ParentCodeSearch TINYINT NULL, @PS_ParentCodeTo VARCHAR (10) NULL, @PS_ParentNameFrom VARCHAR (40) NULL, @PS_ParentNameSearch TINYINT NULL, @PS_ParentNameTo VARCHAR (40) NULL, @PS_SurnameFrom VARCHAR (20) NULL, @PS_SurnameSearch TINYINT NULL, @PS_SurnameTo VARCHAR (20) NULL, @PS_TownFrom VARCHAR (30) NULL, @PS_TownSearch TINYINT NULL, @PS_TownTo VARCHAR (30) NULL, @PS_PostcodeFrom VARCHAR (12) NULL, @PS_PostcodeSearch TINYINT NULL, @PS_PostcodeTo VARCHAR (12) NULL, @PS_CountryFrom VARCHAR (35) NULL, @PS_CountrySearch TINYINT NULL, @PS_CountryTo VARCHAR (35) NULL, @PS_StatementAddress TINYINT NULL, @PS_DeliveryAddress TINYINT NULL, @PS_InvoiceAddress TINYINT NULL, @PS_RemmitanceAddress TINYINT NULL, @PS_DefaultAddress TINYINT NULL, @PS_NotActiveAddresses TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_NET_STK_RECORD_LIST_S]
@PS_UserID VARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom TINYINT NULL, @PS_Type TINYINT NULL, @PS_StartCode VARCHAR (50) NULL, @PS_StartPrimary VARCHAR (50) NULL, @PS_OrderByField TINYINT NULL, @PS_OrderByFieldName VARCHAR (30) NULL OUTPUT, @PS_TotalRecordCount FLOAT (53) NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_CodeFrom VARCHAR (25) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo VARCHAR (25) NULL, @PS_NameFrom VARCHAR (20) NULL, @PS_NameSearch TINYINT NULL, @PS_NameTo VARCHAR (20) NULL, @PS_SortKeyFrom VARCHAR (20) NULL, @PS_SortKeySearch TINYINT NULL, @PS_SortKeyTo VARCHAR (20) NULL, @PS_UserField1From VARCHAR (20) NULL, @PS_UserField1Search TINYINT NULL, @PS_UserField1To VARCHAR (20) NULL, @PS_UserField2From VARCHAR (20) NULL, @PS_UserField2Search TINYINT NULL, @PS_UserField2To VARCHAR (20) NULL, @PS_UserField3From VARCHAR (20) NULL, @PS_UserField3Search TINYINT NULL, @PS_UserField3To VARCHAR (20) NULL, @PS_NormalStockItemsOnly TINYINT NULL, @PS_SerialTrackedRecordType TINYINT NULL, @PS_SubAnalysisRecordType TINYINT NULL, @PS_AssemblyRecordType TINYINT NULL, @PS_ComponentRecordType TINYINT NULL, @PS_TemplateRecordType TINYINT NULL, @PS_LinkedItemType TINYINT NULL, @PS_AlternativeItemType TINYINT NULL, @PS_BinNumberFrom VARCHAR (15) NULL, @PS_BinNumberSearch TINYINT NULL, @PS_BinNumberTo VARCHAR (15) NULL, @PS_BelowMinimumQuantity TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



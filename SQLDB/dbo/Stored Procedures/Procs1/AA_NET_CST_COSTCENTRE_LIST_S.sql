CREATE PROCEDURE [dbo].[AA_NET_CST_COSTCENTRE_LIST_S]
@PS_UserID VARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom TINYINT NULL, @PS_Type TINYINT NULL, @PS_StartCode VARCHAR (50) NULL, @PS_StartPrimary VARCHAR (50) NULL, @PS_OrderByField TINYINT NULL, @PS_OrderByFieldName VARCHAR (30) NULL OUTPUT, @PS_TotalRecordCount FLOAT (53) NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_ParentCodeFrom VARCHAR (10) NULL, @PS_ParentCodeSearch TINYINT NULL, @PS_ParentCodeTo VARCHAR (10) NULL, @PS_ParentNameFrom VARCHAR (40) NULL, @PS_ParentNameSearch TINYINT NULL, @PS_ParentNameTo VARCHAR (40) NULL, @PS_CodeFrom VARCHAR (16) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo VARCHAR (16) NULL, @PS_NameFrom VARCHAR (40) NULL, @PS_NameSearch TINYINT NULL, @PS_NameTo VARCHAR (40) NULL, @PS_EstimateStatus TINYINT NULL, @PS_ActiveStatus TINYINT NULL, @PS_SuspendedStatus TINYINT NULL, @PS_ReopenedStatus TINYINT NULL, @PS_CancelledStatus TINYINT NULL, @PS_CompletedStatus TINYINT NULL, @PS_DateRequiredFrom DATETIME NULL, @PS_DateRequiredSearch TINYINT NULL, @PS_DateRequiredTo DATETIME NULL, @PS_DateCompletedFrom DATETIME NULL, @PS_DateCompletedSearch TINYINT NULL, @PS_DateCompletedTo DATETIME NULL, @PS_ResourceRateFrom TINYINT NULL, @PS_ResourceRateSearch TINYINT NULL, @PS_ResourceRateTo TINYINT NULL, @PS_GroupFrom TINYINT NULL, @PS_GroupSearch TINYINT NULL, @PS_GroupTo TINYINT NULL, @PS_SalesAnalysis VARCHAR (25) NULL, @PS_CustomerCode VARCHAR (10) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



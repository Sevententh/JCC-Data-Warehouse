﻿CREATE PROCEDURE [dbo].[AA_NL_CASHBOOK_RECORD_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_CreatedDateFrom DATETIME NULL, @PS_CreatedDateSearch TINYINT NULL, @PS_CreatedDateTo DATETIME NULL, @PS_ModifiedDateFrom DATETIME NULL, @PS_ModifiedDateSearch TINYINT NULL, @PS_ModifiedDateTo DATETIME NULL, @PS_CodeFrom NVARCHAR (25) NULL, @PS_CodeSearch TINYINT NULL, @PS_CodeTo NVARCHAR (25) NULL, @PS_NameFrom NVARCHAR (40) NULL, @PS_NameSearch TINYINT NULL, @PS_NameTo NVARCHAR (40) NULL, @PS_IncludeOverBudget TINYINT NULL, @PS_IncludeProfiled TINYINT NULL, @PS_CurrencySymbolFrom NVARCHAR (4) NULL, @PS_CurrencySymbolSearch TINYINT NULL, @PS_CurrencySymbolTo NVARCHAR (4) NULL, @PS_MajorHeadingFrom TINYINT NULL, @PS_MajorHeadingSearch TINYINT NULL, @PS_MajorHeadingTo TINYINT NULL, @PS_CurrentBalFrom DECIMAL (24, 8) NULL, @PS_CurrentBalSearch TINYINT NULL, @PS_CurrentBalTo DECIMAL (24, 8) NULL, @PS_NominalCategory1From NVARCHAR (6) NULL, @PS_NominalCategory1Search TINYINT NULL, @PS_NominalCategory1To NVARCHAR (6) NULL, @PS_NominalCategory2From NVARCHAR (6) NULL, @PS_NominalCategory2Search TINYINT NULL, @PS_NominalCategory2To NVARCHAR (6) NULL, @PS_NominalCategory3From NVARCHAR (6) NULL, @PS_NominalCategory3Search TINYINT NULL, @PS_NominalCategory3To NVARCHAR (6) NULL, @PS_NominalCategory4From NVARCHAR (6) NULL, @PS_NominalCategory4Search TINYINT NULL, @PS_NominalCategory4To NVARCHAR (6) NULL, @PS_NominalCategory5From NVARCHAR (6) NULL, @PS_NominalCategory5Search TINYINT NULL, @PS_NominalCategory5To NVARCHAR (6) NULL, @PS_NominalCategory6From NVARCHAR (6) NULL, @PS_NominalCategory6Search TINYINT NULL, @PS_NominalCategory6To NVARCHAR (6) NULL, @PS_NominalCategory7From NVARCHAR (6) NULL, @PS_NominalCategory7Search TINYINT NULL, @PS_NominalCategory7To NVARCHAR (6) NULL, @PS_NominalCategory8From NVARCHAR (6) NULL, @PS_NominalCategory8Search TINYINT NULL, @PS_NominalCategory8To NVARCHAR (6) NULL, @PS_IncludeBankType TINYINT NULL, @PS_IncludePCashType TINYINT NULL, @PS_ReconcileBalFrom DECIMAL (24, 8) NULL, @PS_ReconcileBalSearch TINYINT NULL, @PS_ReconcileBalTo DECIMAL (24, 8) NULL, @PS_UnReconcileBalFrom DECIMAL (24, 8) NULL, @PS_UnReconcileBalSearch TINYINT NULL, @PS_UnReconcileBalTo DECIMAL (24, 8) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



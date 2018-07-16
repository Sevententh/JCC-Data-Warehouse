﻿CREATE PROCEDURE [dbo].[AA_REP_NL_JOURNAL_SEARCH_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_PrimarySortFieldName [sysname] NULL, @PS_PrimaryOrderByDesc BIT NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_ViewName [sysname] NULL, @PS_OrderByFieldName1 [sysname] NULL, @PS_OrderByDescending1 TINYINT NULL, @PS_OrderByFieldName2 [sysname] NULL, @PS_OrderByDescending2 TINYINT NULL, @PS_OrderByFieldName3 [sysname] NULL, @PS_OrderByDescending3 TINYINT NULL, @PS_OrderByFieldName4 [sysname] NULL, @PS_OrderByDescending4 TINYINT NULL, @PS_OrderByFieldName5 [sysname] NULL, @PS_OrderByDescending5 TINYINT NULL, @PS_OrderByFieldName6 [sysname] NULL, @PS_OrderByDescending6 TINYINT NULL, @PS_OrderByFieldName7 [sysname] NULL, @PS_OrderByDescending7 TINYINT NULL, @PS_OrderByFieldName8 [sysname] NULL, @PS_OrderByDescending8 TINYINT NULL, @PS_OrderByFieldName9 [sysname] NULL, @PS_OrderByDescending9 TINYINT NULL, @PS_AccountCodeFrom NVARCHAR (10) NULL, @PS_AccountCodeSearch TINYINT NULL, @PS_AccountCodeTo NVARCHAR (10) NULL, @PS_TransactionDateFrom DATETIME NULL, @PS_TransactionDateSearch TINYINT NULL, @PS_TransactionDateTo DATETIME NULL, @PS_AuditNoFrom INT NULL, @PS_AuditNoSearch TINYINT NULL, @PS_AuditNoTo INT NULL, @PS_HeaderReferenceFrom NVARCHAR (10) NULL, @PS_HeaderReferenceSearch TINYINT NULL, @PS_HeaderReferenceTo NVARCHAR (10) NULL, @PS_YearPeriodFrom NVARCHAR (3) NULL, @PS_YearPeriodSearch TINYINT NULL, @PS_YearPeriodTo NVARCHAR (3) NULL, @PS_YearFrom NVARCHAR (1) NULL, @PS_YearSearch TINYINT NULL, @PS_YearTo NVARCHAR (1) NULL, @PS_PeriodFrom TINYINT NULL, @PS_PeriodSearch TINYINT NULL, @PS_PeriodTo TINYINT NULL, @PS_Category1From NVARCHAR (20) NULL, @PS_Category1Search TINYINT NULL, @PS_Category1To NVARCHAR (20) NULL, @PS_Category2From NVARCHAR (20) NULL, @PS_Category2Search TINYINT NULL, @PS_Category2To NVARCHAR (20) NULL, @PS_Category3From NVARCHAR (20) NULL, @PS_Category3Search TINYINT NULL, @PS_Category3To NVARCHAR (20) NULL, @PS_Category4From NVARCHAR (20) NULL, @PS_Category4Search TINYINT NULL, @PS_Category4To NVARCHAR (20) NULL, @PS_Category5From NVARCHAR (20) NULL, @PS_Category5Search TINYINT NULL, @PS_Category5To NVARCHAR (20) NULL, @PS_Category6From NVARCHAR (20) NULL, @PS_Category6Search TINYINT NULL, @PS_Category6To NVARCHAR (20) NULL, @PS_Category7From NVARCHAR (20) NULL, @PS_Category7Search TINYINT NULL, @PS_Category7To NVARCHAR (20) NULL, @PS_Category8From NVARCHAR (20) NULL, @PS_Category8Search TINYINT NULL, @PS_Category8To NVARCHAR (20) NULL, @PS_TranUserKey1From NVARCHAR (20) NULL, @PS_TranUserKey1Search TINYINT NULL, @PS_TranUserKey1To NVARCHAR (20) NULL, @PS_TranUserKey2From NVARCHAR (20) NULL, @PS_TranUserKey2Search TINYINT NULL, @PS_TranUserKey2To NVARCHAR (20) NULL, @PS_TranUserKey3From NVARCHAR (20) NULL, @PS_TranUserKey3Search TINYINT NULL, @PS_TranUserKey3To NVARCHAR (20) NULL, @PS_MajorHeadingFrom TINYINT NULL, @PS_MajorHeadingSearch TINYINT NULL, @PS_MajorHeadingTo TINYINT NULL, @PS_TranDateFrom DATETIME NULL, @PS_TranDateSearch TINYINT NULL, @PS_TranDateTo DATETIME NULL, @PS_SubLedger NVARCHAR (10) NULL, @PS_SubLedgerSearch TINYINT NULL, @PS_BatchReference NVARCHAR (10) NULL, @PS_BatchReferenceSearch TINYINT NULL, @PS_CurrencyCode NVARCHAR (4) NULL, @PS_CurrencyCodeSearch TINYINT NULL, @PS_IncludeExcludedAccounts BIT NULL, @PS_CurrentPeriodOnly BIT NULL, @PS_IncludeBatchedTrans BIT NULL, @PS_IncludePostedTrans BIT NULL, @PS_BankTransOnly BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



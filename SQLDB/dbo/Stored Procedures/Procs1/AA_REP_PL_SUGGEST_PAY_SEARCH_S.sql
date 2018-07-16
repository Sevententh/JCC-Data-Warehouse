﻿CREATE PROCEDURE [dbo].[AA_REP_PL_SUGGEST_PAY_SEARCH_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_PrimarySortFieldName [sysname] NULL, @PS_PrimaryOrderByDesc BIT NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_ViewName [sysname] NULL, @PS_OrderByFieldName1 [sysname] NULL, @PS_OrderByDescending1 TINYINT NULL, @PS_OrderByFieldName2 [sysname] NULL, @PS_OrderByDescending2 TINYINT NULL, @PS_OrderByFieldName3 [sysname] NULL, @PS_OrderByDescending3 TINYINT NULL, @PS_OrderByFieldName4 [sysname] NULL, @PS_OrderByDescending4 TINYINT NULL, @PS_OrderByFieldName5 [sysname] NULL, @PS_OrderByDescending5 TINYINT NULL, @PS_OrderByFieldName6 [sysname] NULL, @PS_OrderByDescending6 TINYINT NULL, @PS_OrderByFieldName7 [sysname] NULL, @PS_OrderByDescending7 TINYINT NULL, @PS_OrderByFieldName8 [sysname] NULL, @PS_OrderByDescending8 TINYINT NULL, @PS_OrderByFieldName9 [sysname] NULL, @PS_OrderByDescending9 TINYINT NULL, @PS_AccountCodeFrom NVARCHAR (10) NULL, @PS_AccountCodeSearch TINYINT NULL, @PS_AccountCodeTo NVARCHAR (10) NULL, @PS_AccountNameFrom NVARCHAR (40) NULL, @PS_AccountNameSearch TINYINT NULL, @PS_AccountNameTo NVARCHAR (40) NULL, @PS_SortKeyFrom NVARCHAR (20) NULL, @PS_SortKeySearch TINYINT NULL, @PS_SortKeyTo NVARCHAR (20) NULL, @PS_DateFrom DATETIME NULL, @PS_DateSearch TINYINT NULL, @PS_DateTo DATETIME NULL, @PS_IncludeFuturePeriodPost BIT NULL, @PS_IncludeDisputed BIT NULL, @PS_IncludeUnDisputed BIT NULL, @PS_UserSort1From NVARCHAR (20) NULL, @PS_UserSort1Search TINYINT NULL, @PS_UserSort1To NVARCHAR (20) NULL, @PS_UserSort2From NVARCHAR (20) NULL, @PS_UserSort2Search TINYINT NULL, @PS_UserSort2To NVARCHAR (20) NULL, @PS_UserSort3From NVARCHAR (20) NULL, @PS_UserSort3Search TINYINT NULL, @PS_UserSort3To NVARCHAR (20) NULL, @PS_SubLedgerFrom NVARCHAR (10) NULL, @PS_SubLedgerSearch TINYINT NULL, @PS_SubLedgerTo NVARCHAR (10) NULL, @PS_DueDateFrom DATETIME NULL, @PS_DueDateSearch TINYINT NULL, @PS_DueDateTo DATETIME NULL, @PS_CurrencyCodeFrom NVARCHAR (4) NULL, @PS_CurrencyCodeSearch TINYINT NULL, @PS_CurrencyCodeTo NVARCHAR (4) NULL, @PS_SettlementDateFrom DATETIME NULL, @PS_SettlementDateSearch TINYINT NULL, @PS_SettlementDateTo DATETIME NULL, @PS_PayListRefFrom NVARCHAR (10) NULL, @PS_PayListRefSearch TINYINT NULL, @PS_PayListRefTo NVARCHAR (10) NULL, @PS_ShowAllTrans BIT NULL, @PS_ShowUnapprovedTrans BIT NULL, @PS_ShowStage1Trans BIT NULL, @PS_ShowStage2Trans BIT NULL, @PS_NotInPaymentList BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



﻿CREATE PROCEDURE [dbo].[AA_REP_PL_STATEMENTS_SEARCH_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_PrimarySortFieldName [sysname] NULL, @PS_PrimaryOrderByDesc BIT NULL, @PS_Batch_GUID UNIQUEIDENTIFIER NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_StatementMessage NVARCHAR (4000) NULL, @PS_RunningBalance BIT NULL, @PS_CurrencyMode TINYINT NULL, @PS_OrderByFieldName1 [sysname] NULL, @PS_OrderByDescending1 TINYINT NULL, @PS_OrderByFieldName2 [sysname] NULL, @PS_OrderByDescending2 TINYINT NULL, @PS_OrderByFieldName3 [sysname] NULL, @PS_OrderByDescending3 TINYINT NULL, @PS_OrderByFieldName4 [sysname] NULL, @PS_OrderByDescending4 TINYINT NULL, @PS_OrderByFieldName5 [sysname] NULL, @PS_OrderByDescending5 TINYINT NULL, @PS_OrderByFieldName6 [sysname] NULL, @PS_OrderByDescending6 TINYINT NULL, @PS_OrderByFieldName7 [sysname] NULL, @PS_OrderByDescending7 TINYINT NULL, @PS_OrderByFieldName8 [sysname] NULL, @PS_OrderByDescending8 TINYINT NULL, @PS_OrderByFieldName9 [sysname] NULL, @PS_OrderByDescending9 TINYINT NULL, @PS_AccountCodeFrom NVARCHAR (10) NULL, @PS_AccountCodeSearch TINYINT NULL, @PS_AccountCodeTo NVARCHAR (10) NULL, @PS_SortKeyFrom NVARCHAR (20) NULL, @PS_SortKeySearch TINYINT NULL, @PS_SortKeyTo NVARCHAR (20) NULL, @PS_UserSort1From NVARCHAR (20) NULL, @PS_UserSort1Search TINYINT NULL, @PS_UserSort1To NVARCHAR (20) NULL, @PS_UserSort2From NVARCHAR (20) NULL, @PS_UserSort2Search TINYINT NULL, @PS_UserSort2To NVARCHAR (20) NULL, @PS_UserSort3From NVARCHAR (20) NULL, @PS_UserSort3Search TINYINT NULL, @PS_UserSort3To NVARCHAR (20) NULL, @PS_BalanceFrom DECIMAL (24, 8) NULL, @PS_BalanceSearch TINYINT NULL, @PS_BalanceTo DECIMAL (24, 8) NULL, @PS_TurnoverFrom DECIMAL (24, 8) NULL, @PS_TurnoverSearch TINYINT NULL, @PS_TurnoverTo DECIMAL (24, 8) NULL, @PS_DueDateFrom DATETIME NULL, @PS_DueDateSearch TINYINT NULL, @PS_DueDateTo DATETIME NULL, @PS_LastInvoicedDateFrom DATETIME NULL, @PS_LastInvoicedDateSearch TINYINT NULL, @PS_LastInvoicedDateTo DATETIME NULL, @PS_CurrencyCode NVARCHAR (4) NULL, @PS_CurrencyCodeSearch TINYINT NULL, @PS_AsAtYearPeriod NVARCHAR (3) NULL, @PS_StatementDate DATETIME NULL, @PS_IncludeOnStop BIT NULL, @PS_IncludeOverCreditLimit BIT NULL, @PS_IncludeZeroBalance BIT NULL, @PS_IncludeFullyAllocTrans BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



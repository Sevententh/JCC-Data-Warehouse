﻿CREATE PROCEDURE [dbo].[AA_REP_PL_ANALYSIS_SEARCH_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_PrimarySortFieldName [sysname] NULL, @PS_PrimaryOrderByDesc BIT NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_ViewName [sysname] NULL, @PS_OrderByFieldName1 [sysname] NULL, @PS_OrderByDescending1 TINYINT NULL, @PS_OrderByFieldName2 [sysname] NULL, @PS_OrderByDescending2 TINYINT NULL, @PS_OrderByFieldName3 [sysname] NULL, @PS_OrderByDescending3 TINYINT NULL, @PS_OrderByFieldName4 [sysname] NULL, @PS_OrderByDescending4 TINYINT NULL, @PS_OrderByFieldName5 [sysname] NULL, @PS_OrderByDescending5 TINYINT NULL, @PS_OrderByFieldName6 [sysname] NULL, @PS_OrderByDescending6 TINYINT NULL, @PS_OrderByFieldName7 [sysname] NULL, @PS_OrderByDescending7 TINYINT NULL, @PS_OrderByFieldName8 [sysname] NULL, @PS_OrderByDescending8 TINYINT NULL, @PS_OrderByFieldName9 [sysname] NULL, @PS_OrderByDescending9 TINYINT NULL, @PS_AnalysisCodeFrom NVARCHAR (25) NULL, @PS_AnalysisCodeSearch TINYINT NULL, @PS_AnalysisCodeTo NVARCHAR (25) NULL, @PS_AnalysisNameFrom NVARCHAR (40) NULL, @PS_AnalysisNameSearch TINYINT NULL, @PS_AnalysisNameTo NVARCHAR (40) NULL, @PS_PurchaseAnalysisType BIT NULL, @PS_BankAnalysisType BIT NULL, @PS_DiscountAnalysisType BIT NULL, @PS_StockAnalysisType BIT NULL, @PS_HomeTurnoverYTDFrom FLOAT (53) NULL, @PS_HomeTurnoverYTDSearch TINYINT NULL, @PS_HomeTurnoverYTDTo FLOAT (53) NULL, @PS_SortKeyFrom NVARCHAR (20) NULL, @PS_SortKeySearch TINYINT NULL, @PS_SortKeyTo NVARCHAR (20) NULL, @PS_UserSort1From NVARCHAR (20) NULL, @PS_UserSort1Search TINYINT NULL, @PS_UserSort1To NVARCHAR (20) NULL, @PS_UserSort2From NVARCHAR (20) NULL, @PS_UserSort2Search TINYINT NULL, @PS_UserSort2To NVARCHAR (20) NULL, @PS_UserSort3From NVARCHAR (20) NULL, @PS_UserSort3Search TINYINT NULL, @PS_UserSort3To NVARCHAR (20) NULL, @PS_CurrencyCodeFrom NVARCHAR (4) NULL, @PS_CurrencyCodeSearch TINYINT NULL, @PS_CurrencyCodeTo NVARCHAR (4) NULL, @PS_UserChar1From NVARCHAR (20) NULL, @PS_UserChar1Search TINYINT NULL, @PS_UserChar1To NVARCHAR (20) NULL, @PS_UserChar2From NVARCHAR (20) NULL, @PS_UserChar2Search TINYINT NULL, @PS_UserChar2To NVARCHAR (20) NULL, @PS_UserChar5From NVARCHAR (20) NULL, @PS_UserChar5Search TINYINT NULL, @PS_UserChar5To NVARCHAR (20) NULL, @PS_UserChar6From NVARCHAR (30) NULL, @PS_UserChar6Search TINYINT NULL, @PS_UserChar6To NVARCHAR (30) NULL, @PS_UserChar7From NVARCHAR (30) NULL, @PS_UserChar7Search TINYINT NULL, @PS_UserChar7To NVARCHAR (30) NULL, @PS_UserChar8From NVARCHAR (30) NULL, @PS_UserChar8Search TINYINT NULL, @PS_UserChar8To NVARCHAR (30) NULL, @PS_UserDate1From DATETIME NULL, @PS_UserDate1Search TINYINT NULL, @PS_UserDate1To DATETIME NULL, @PS_UserDate2From DATETIME NULL, @PS_UserDate2Search TINYINT NULL, @PS_UserDate2To DATETIME NULL, @PS_UserDate3From DATETIME NULL, @PS_UserDate3Search TINYINT NULL, @PS_UserDate3To DATETIME NULL, @PS_UserNum1From FLOAT (53) NULL, @PS_UserNum1Search TINYINT NULL, @PS_UserNum1To FLOAT (53) NULL, @PS_UserNum2From FLOAT (53) NULL, @PS_UserNum2Search TINYINT NULL, @PS_UserNum2To FLOAT (53) NULL, @PS_UserNum3From FLOAT (53) NULL, @PS_UserNum3Search TINYINT NULL, @PS_UserNum3To FLOAT (53) NULL, @PS_BudgetRevisionNumber INT NULL, @PS_LatestBudgetRevision BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



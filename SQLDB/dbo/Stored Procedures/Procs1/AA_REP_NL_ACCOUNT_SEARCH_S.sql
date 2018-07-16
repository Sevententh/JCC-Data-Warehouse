﻿CREATE PROCEDURE [dbo].[AA_REP_NL_ACCOUNT_SEARCH_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_PrimarySortFieldName [sysname] NULL, @PS_PrimaryOrderByDesc BIT NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_ViewName [sysname] NULL, @PS_Source NVARCHAR (1) NULL, @PS_OrderByFieldName1 [sysname] NULL, @PS_OrderByDescending1 TINYINT NULL, @PS_OrderByFieldName2 [sysname] NULL, @PS_OrderByDescending2 TINYINT NULL, @PS_OrderByFieldName3 [sysname] NULL, @PS_OrderByDescending3 TINYINT NULL, @PS_OrderByFieldName4 [sysname] NULL, @PS_OrderByDescending4 TINYINT NULL, @PS_OrderByFieldName5 [sysname] NULL, @PS_OrderByDescending5 TINYINT NULL, @PS_OrderByFieldName6 [sysname] NULL, @PS_OrderByDescending6 TINYINT NULL, @PS_OrderByFieldName7 [sysname] NULL, @PS_OrderByDescending7 TINYINT NULL, @PS_OrderByFieldName8 [sysname] NULL, @PS_OrderByDescending8 TINYINT NULL, @PS_OrderByFieldName9 [sysname] NULL, @PS_OrderByDescending9 TINYINT NULL, @PS_AccountCodeFrom NVARCHAR (25) NULL, @PS_AccountCodeSearch TINYINT NULL, @PS_AccountCodeTo NVARCHAR (25) NULL, @PS_AccountNameFrom NVARCHAR (40) NULL, @PS_AccountNameSearch TINYINT NULL, @PS_AccountNameTo NVARCHAR (40) NULL, @PS_CurrencyCodeFrom NVARCHAR (4) NULL, @PS_CurrencyCodeSearch TINYINT NULL, @PS_CurrencyCodeTo NVARCHAR (4) NULL, @PS_Category1From NVARCHAR (6) NULL, @PS_Category1Search TINYINT NULL, @PS_Category1To NVARCHAR (6) NULL, @PS_Category2From NVARCHAR (6) NULL, @PS_Category2Search TINYINT NULL, @PS_Category2To NVARCHAR (6) NULL, @PS_Category3From NVARCHAR (6) NULL, @PS_Category3Search TINYINT NULL, @PS_Category3To NVARCHAR (6) NULL, @PS_Category4From NVARCHAR (6) NULL, @PS_Category4Search TINYINT NULL, @PS_Category4To NVARCHAR (6) NULL, @PS_Category5From NVARCHAR (6) NULL, @PS_Category5Search TINYINT NULL, @PS_Category5To NVARCHAR (6) NULL, @PS_Category6From NVARCHAR (6) NULL, @PS_Category6Search TINYINT NULL, @PS_Category6To NVARCHAR (6) NULL, @PS_Category7From NVARCHAR (6) NULL, @PS_Category7Search TINYINT NULL, @PS_Category7To NVARCHAR (6) NULL, @PS_Category8From NVARCHAR (6) NULL, @PS_Category8Search TINYINT NULL, @PS_Category8To NVARCHAR (6) NULL, @PS_MajorHeadingFrom TINYINT NULL, @PS_MajorHeadingSearch TINYINT NULL, @PS_MajorHeadingTo TINYINT NULL, @PS_UserChar1From NVARCHAR (20) NULL, @PS_UserChar1Search TINYINT NULL, @PS_UserChar1To NVARCHAR (20) NULL, @PS_UserChar2From NVARCHAR (20) NULL, @PS_UserChar2Search TINYINT NULL, @PS_UserChar2To NVARCHAR (20) NULL, @PS_UserChar5From NVARCHAR (20) NULL, @PS_UserChar5Search TINYINT NULL, @PS_UserChar5To NVARCHAR (20) NULL, @PS_UserChar6From NVARCHAR (30) NULL, @PS_UserChar6Search TINYINT NULL, @PS_UserChar6To NVARCHAR (30) NULL, @PS_UserChar7From NVARCHAR (30) NULL, @PS_UserChar7Search TINYINT NULL, @PS_UserChar7To NVARCHAR (30) NULL, @PS_UserChar8From NVARCHAR (30) NULL, @PS_UserChar8Search TINYINT NULL, @PS_UserChar8To NVARCHAR (30) NULL, @PS_UserDate1From DATETIME NULL, @PS_UserDate1Search TINYINT NULL, @PS_UserDate1To DATETIME NULL, @PS_UserDate2From DATETIME NULL, @PS_UserDate2Search TINYINT NULL, @PS_UserDate2To DATETIME NULL, @PS_UserDate3From DATETIME NULL, @PS_UserDate3Search TINYINT NULL, @PS_UserDate3To DATETIME NULL, @PS_UserNum1From FLOAT (53) NULL, @PS_UserNum1Search TINYINT NULL, @PS_UserNum1To FLOAT (53) NULL, @PS_UserNum2From FLOAT (53) NULL, @PS_UserNum2Search TINYINT NULL, @PS_UserNum2To FLOAT (53) NULL, @PS_UserNum3From FLOAT (53) NULL, @PS_UserNum3Search TINYINT NULL, @PS_UserNum3To FLOAT (53) NULL, @PS_BudgetRevisionNumber INT NULL, @PS_LatestBudgetRevision BIT NULL, @PS_CompulsoryCostingOnly BIT NULL, @PS_ProfileAccountsOnly BIT NULL, @PS_BalanceFrom DECIMAL (24, 8) NULL, @PS_BalanceSearch TINYINT NULL, @PS_BalanceTo DECIMAL (24, 8) NULL, @PS_DateCreatedFrom DATETIME NULL, @PS_DateCreatedSearch TINYINT NULL, @PS_DateCreatedTo DATETIME NULL, @PS_DateChangedFrom DATETIME NULL, @PS_DateChangedSearch TINYINT NULL, @PS_DateChangedTo DATETIME NULL, @PS_UserCreatedFrom VARCHAR (4) NULL, @PS_UserCreatedSearch TINYINT NULL, @PS_UserCreatedTo VARCHAR (4) NULL, @PS_UserChangedFrom VARCHAR (4) NULL, @PS_UserChangedSearch TINYINT NULL, @PS_UserChangedTo VARCHAR (4) NULL, @PS_MajorHeadNameFrom VARCHAR (40) NULL, @PS_MajorHeadNameSearch TINYINT NULL, @PS_MajorHeadNameTo VARCHAR (40) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



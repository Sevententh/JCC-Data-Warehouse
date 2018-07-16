CREATE PROCEDURE [dbo].[AA_REP_NL_DETAIL_TB_SEARCH_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_PrimarySortFieldName [sysname] NULL, @PS_PrimaryOrderByDesc BIT NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_ViewName [sysname] NULL, @PS_Source NVARCHAR (1) NULL, @PS_OrderByFieldName1 [sysname] NULL, @PS_OrderByDescending1 TINYINT NULL, @PS_OrderByFieldName2 [sysname] NULL, @PS_OrderByDescending2 TINYINT NULL, @PS_OrderByFieldName3 [sysname] NULL, @PS_OrderByDescending3 TINYINT NULL, @PS_OrderByFieldName4 [sysname] NULL, @PS_OrderByDescending4 TINYINT NULL, @PS_OrderByFieldName5 [sysname] NULL, @PS_OrderByDescending5 TINYINT NULL, @PS_OrderByFieldName6 [sysname] NULL, @PS_OrderByDescending6 TINYINT NULL, @PS_OrderByFieldName7 [sysname] NULL, @PS_OrderByDescending7 TINYINT NULL, @PS_OrderByFieldName8 [sysname] NULL, @PS_OrderByDescending8 TINYINT NULL, @PS_OrderByFieldName9 [sysname] NULL, @PS_OrderByDescending9 TINYINT NULL, @PS_AccountCodeFrom NVARCHAR (25) NULL, @PS_AccountCodeSearch TINYINT NULL, @PS_AccountCodeTo NVARCHAR (25) NULL, @PS_AccountNameFrom NVARCHAR (40) NULL, @PS_AccountNameSearch TINYINT NULL, @PS_AccountNameTo NVARCHAR (40) NULL, @PS_YearPeriod NVARCHAR (3) NULL, @PS_SinglePeriodOnly BIT NULL, @PS_SuppressOtherLedgers BIT NULL, @PS_ShowSubtotalsOnly BIT NULL, @PS_ShowZeroBalance BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



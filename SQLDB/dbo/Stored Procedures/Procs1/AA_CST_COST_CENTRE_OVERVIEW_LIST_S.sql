CREATE PROCEDURE [dbo].[AA_CST_COST_CENTRE_OVERVIEW_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_ProjectCode VARCHAR (10) NULL, @PS_ProjectStyle INT NULL, @PS_BudgetType INT NULL, @PS_BudgetNumber INT NULL, @PS_ValueType INT NULL, @PS_CurrencySymbol VARCHAR (4) NULL, @PS_RevaluedRate DECIMAL (24, 8) NULL, @PS_WeekOrPeriodNumber INT NULL, @PS_Year INT NULL, @PS_SelectedWeekPeriodOnly BIT NULL, @PS_SelectedYearOnly BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



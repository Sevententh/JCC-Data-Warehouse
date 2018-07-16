CREATE PROCEDURE [dbo].[AA_SYS_CONFIG_CST_INSERT_EDIT_S]
@PS_ResourceUpd TINYINT NULL, @PS_HeaderUpd TINYINT NULL, @PS_DefaultRecStat TINYINT NULL, @PS_AutoNumberJob TINYINT NULL, @PS_NextJobNumber FLOAT (53) NULL, @PS_PayAnalyse TINYINT NULL, @PS_PayUseRate TINYINT NULL, @PS_PayMakeRsc TINYINT NULL, @PS_OrigBudgetRev1Only TINYINT NULL, @PS_WIPUpdateToNominal BIT NULL, @PS_MainTimesheetRateType VARCHAR (1) NULL, @PS_MarginCalcOn BIT NULL, @PS_WorkingHoursInDay FLOAT (53) NULL, @PS_WorkingDaysInWeek FLOAT (53) NULL, @PS_AnalyseBy BIT NULL, @PS_CostingYear TINYINT NULL, @PS_FirstWeekDays TINYINT NULL, @PS_UpliftType TINYINT NULL, @PS_MarkupType BIT NULL, @PS_SalesSalesAnalysisCode VARCHAR (25) NULL, @PS_WIPSalesAnalysisCode VARCHAR (25) NULL, @PS_CostPurchaseAnalysisCode VARCHAR (25) NULL, @PS_IncomeSalesAnalysisCode VARCHAR (25) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_CST_BUDGET_CALC_MOVE_S]
@PS_UserID VARCHAR (4) NULL, @PS_ProjectCode VARCHAR (10) NULL, @PS_CostCentreCode VARCHAR (10) NULL, @PS_BudgetYear SMALLINT NULL, @PS_BudgetRevision SMALLINT NULL, @PS_BudgetType TINYINT NULL, @PS_BudgetEnterType TINYINT NULL, @PS_PeriodMovement INT NULL, @PS_Total DECIMAL (24, 8) NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



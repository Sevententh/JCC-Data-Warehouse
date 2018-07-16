CREATE PROCEDURE [dbo].[AA_CST_BUDGET_POST_S]
@PS_UserID VARCHAR (4) NULL, @PS_ProjectCode VARCHAR (10) NULL, @PS_Year SMALLINT NULL, @PS_RevisionNumber SMALLINT NULL, @PS_BudgetRate DECIMAL (24, 8) NULL, @PS_BudgetData NTEXT NULL, @PS_Notes VARCHAR (240) NULL, @PS_Source NVARCHAR (1) NULL, @PS_InsertFlag BIT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



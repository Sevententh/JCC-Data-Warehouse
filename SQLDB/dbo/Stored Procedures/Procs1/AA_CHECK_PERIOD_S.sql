CREATE PROCEDURE [dbo].[AA_CHECK_PERIOD_S]
@PS_Origin NVARCHAR (3) NULL, @PS_Period TINYINT NULL OUTPUT, @PS_Year NCHAR (1) NULL OUTPUT, @PS_Tran_Date DATETIME NULL, @PS_Def_Period NCHAR (1) NULL, @PS_User_Id NVARCHAR (4) NULL, @PS_Nominal_Year NCHAR (1) NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_FuturePostEnabled BIT NULL OUTPUT, @PS_PostToCurrentYearOnly BIT NULL OUTPUT, @PS_PostUptoPeriod TINYINT NULL OUTPUT, @PS_CheckUserPermissions BIT NULL, @PS_AllowPastYears BIT NULL, @PS_ErrorIfPeriodClosed BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



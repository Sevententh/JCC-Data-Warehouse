CREATE PROCEDURE [dbo].[AA_BUILD_YEAR_PERIOD_SQL_S]
@PS_UserID NVARCHAR (4) NULL, @PS_YearPeriodFrom NVARCHAR (3) NULL, @PS_YearPeriodSearch TINYINT NULL, @PS_YearPeriodTo NVARCHAR (3) NULL, @PS_YearFrom NVARCHAR (1) NULL, @PS_YearSearch TINYINT NULL, @PS_YearTo NVARCHAR (1) NULL, @PS_PeriodFrom TINYINT NULL, @PS_PeriodSearch TINYINT NULL, @PS_PeriodTo TINYINT NULL, @PS_YearColumn [sysname] NULL, @PS_PeriodColumn [sysname] NULL, @PS_WhereClause NVARCHAR (4000) NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_BUILD_YEAR_WEEK_SQL_S]
@PS_UserID NVARCHAR (4) NULL, @PS_YearWeekFrom NVARCHAR (3) NULL, @PS_YearWeekSearch TINYINT NULL, @PS_YearWeekTo NVARCHAR (3) NULL, @PS_YearFrom NVARCHAR (1) NULL, @PS_YearSearch TINYINT NULL, @PS_YearTo NVARCHAR (1) NULL, @PS_WeekFrom TINYINT NULL, @PS_WeekSearch TINYINT NULL, @PS_WeekTo TINYINT NULL, @PS_YearColumn [sysname] NULL, @PS_WeekColumn [sysname] NULL, @PS_WhereClause NVARCHAR (4000) NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



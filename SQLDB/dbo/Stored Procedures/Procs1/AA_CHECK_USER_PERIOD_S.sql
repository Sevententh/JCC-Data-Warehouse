CREATE PROCEDURE [dbo].[AA_CHECK_USER_PERIOD_S]
@PS_Origin NVARCHAR (3) NULL, @PS_User_Id VARCHAR (4) NULL, @PS_No_Of_Periods TINYINT NULL, @PS_Current_Period TINYINT NULL, @PS_Current_Year NCHAR (1) NULL, @PS_Tran_Year NCHAR (1) NULL OUTPUT, @PS_Tran_Period TINYINT NULL OUTPUT, @PS_Default_Used TINYINT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_FuturePostEnabled BIT NULL OUTPUT, @PS_PostToCurrentYearOnly BIT NULL OUTPUT, @PS_PostUptoPeriod TINYINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



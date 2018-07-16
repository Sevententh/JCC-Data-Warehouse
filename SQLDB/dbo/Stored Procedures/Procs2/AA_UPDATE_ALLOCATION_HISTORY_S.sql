CREATE PROCEDURE [dbo].[AA_UPDATE_ALLOCATION_HISTORY_S]
@PS_AL_Date DATETIME NULL, @PS_AL_Period TINYINT NULL, @PS_AL_Year CHAR (1) NULL, @PS_Tran_User_Id VARCHAR (4) NULL, @PS_Tran_Header_Key VARCHAR (20) NULL, @PS_Account_Code VARCHAR (10) NULL, @PS_AL_HomeValue DECIMAL (24, 8) NULL, @PS_AL_CurrencyValue DECIMAL (24, 8) NULL, @PS_Tran_Home_Unalloc DECIMAL (24, 8) NULL, @PS_Tran_Curr_Unalloc DECIMAL (24, 8) NULL, @PS_AL_Reference INT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



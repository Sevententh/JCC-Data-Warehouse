CREATE PROCEDURE [dbo].[AA_CHECK_CURRENCY_S]
@PS_Currency_Code VARCHAR (10) NULL OUTPUT, @PS_Currency_Symbol VARCHAR (4) NULL OUTPUT, @PS_Currency_Rate DECIMAL (16, 6) NULL, @PS_Default_string VARCHAR (4) NULL, @PS_Currency_Type CHAR (2) NULL OUTPUT, @PS_Direct_Curr_Rate DECIMAL (16, 6) NULL OUTPUT, @PS_Curr_Euro_Rate DECIMAL (16, 6) NULL OUTPUT, @PS_Home_Euro_Rate DECIMAL (16, 6) NULL OUTPUT, @PS_Base2_Rate DECIMAL (16, 6) NULL OUTPUT, @PS_Direct_Rate_Overidden BIT NULL OUTPUT, @PS_Tri1_Rate_Overidden BIT NULL OUTPUT, @PS_Tri2_Rate_Overidden BIT NULL OUTPUT, @PS_Base2_Rate_Overidden BIT NULL OUTPUT, @PS_Transaction_Date DATETIME NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



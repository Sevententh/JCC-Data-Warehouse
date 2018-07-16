CREATE PROCEDURE [dbo].[AA_SLTRN_UPDATE_CUSTOMER_S]
@PS_Tran_Type VARCHAR (3) NULL, @PS_Tran_Year CHAR (1) NULL, @PS_Tran_Date DATETIME NULL, @PS_Tran_Period_Number TINYINT NULL, @PS_Tran_Currency VARCHAR (4) NULL, @PS_Customer_Primary INT NULL, @PS_Home_Nett_Val DECIMAL (24, 8) NULL, @PS_Home_Gross_Val DECIMAL (24, 8) NULL, @PS_Curr_Nett_Val DECIMAL (24, 8) NULL, @PS_Curr_Gross_Val DECIMAL (24, 8) NULL, @PS_Cost_Val DECIMAL (24, 8) NULL, @PS_Module VARCHAR (3) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



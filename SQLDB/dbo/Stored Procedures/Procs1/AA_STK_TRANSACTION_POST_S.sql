CREATE PROCEDURE [dbo].[AA_STK_TRANSACTION_POST_S]
@PS_Move_Primary INT NULL, @PS_UserID VARCHAR (4) NULL, @PS_Ignore_Qty_Check_Flag BIT NULL, @PS_Update_Cost_Price_Flag BIT NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_NoAvailabilityErrors BIT NULL, @PS_Availability TINYINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



CREATE PROCEDURE [dbo].[AA_STK_UPDATE_SERIAL_HISTORY_S]
@PS_StockCode VARCHAR (25) NULL, @PS_SerialNo VARCHAR (40) NULL OUTPUT, @PS_SubAnalysis VARCHAR (25) NULL OUTPUT, @PS_Direction VARCHAR (1) NULL, @PS_Batched TINYINT NULL, @PS_Module VARCHAR (3) NULL, @PS_OrderDetailLink INT NULL, @PS_Movementlink INT NULL, @PS_RtpLink INT NULL, @PS_LotNumber VARCHAR (20) NULL, @PS_RenewDate DATETIME NULL, @PS_SortKey VARCHAR (20) NULL, @PS_ExcludefromSop BIT NULL, @PS_SerialUserDate1 DATETIME NULL, @PS_SerialUserDate2 DATETIME NULL, @PS_SerialUserDate3 DATETIME NULL, @PS_Notes TEXT NULL, @PS_UserId VARCHAR (4) NULL, @PS_AccountRef VARCHAR (10) NULL, @PS_OrderRef VARCHAR (10) NULL, @PS_Movement_Date DATETIME NULL, @PS_Movement_Quantity INT NULL, @PS_Error_Status INT NULL OUTPUT, @PS_AppendNotes TEXT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



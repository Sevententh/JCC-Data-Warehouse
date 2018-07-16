CREATE PROCEDURE [dbo].[AA_STK_ASSIGN_FIRST_SERIAL_NO_S]
@PS_Module NVARCHAR (3) NULL, @PS_ErrorHandlingMethod INT NULL, @PS_UserID NVARCHAR (4) NULL, @PS_StockCode NVARCHAR (25) NULL, @PS_OrderDetailPrimary INT NULL, @PS_MovementDetailPrimary INT NULL, @PS_SerialNoQty INT NULL, @PS_SubAnalysisCode NVARCHAR (25) NULL, @PS_IsSubAnalysisStock BIT NULL, @PS_Batched INT NULL, @PS_OrderRef NVARCHAR (10) NULL, @PS_AccountRef NVARCHAR (10) NULL, @PS_LotNumber NVARCHAR (20) NULL, @PS_RenewDate DATETIME NULL, @PS_SortKey NVARCHAR (20) NULL, @PS_ExcludefromSop BIT NULL, @PS_SerialUserDate1 DATETIME NULL, @PS_SerialUserDate2 DATETIME NULL, @PS_SerialUserDate3 DATETIME NULL, @PS_Notes TEXT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



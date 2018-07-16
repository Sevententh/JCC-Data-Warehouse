CREATE PROCEDURE [dbo].[AA_STK_FIFO_ALLOCATE_S]
@PS_StockCode VARCHAR (25) NULL, @PS_SubAnalysis VARCHAR (25) NULL, @PS_AllocationQuantity DECIMAL (24, 8) NULL, @PS_AllocationLink INT NULL, @PS_CostPrice DECIMAL (24, 8) NULL OUTPUT, @PS_Origin VARCHAR (1) NULL, @PS_Estimate TINYINT NULL, @PS_Detail_Primary INT NULL, @PS_Value DECIMAL (24, 8) NULL OUTPUT, @PS_OutMovementKey INT NULL, @PS_NoTransaction BIT NULL, @PS_ReturnErrorStatus BIT NULL, @PS_ErrorStatus TINYINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



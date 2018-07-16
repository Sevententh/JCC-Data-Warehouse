CREATE PROCEDURE [dbo].[AA_CHECK_ALLOC_PERIOD_S]
@PS_Origin NVARCHAR (3) NULL, @PS_User_Id NVARCHAR (4) NULL, @PS_FuturePostEnabled BIT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_TranYear NVARCHAR (1) NULL, @PS_TranPeriod TINYINT NULL, @PS_AllocYear NCHAR (1) NULL OUTPUT, @PS_AllocPeriod TINYINT NULL OUTPUT, @PS_LatestTranYear NVARCHAR (1) NULL, @PS_LatestTranPeriod TINYINT NULL, @PS_LatestAllocYear NVARCHAR (1) NULL, @PS_LatestAllocPeriod TINYINT NULL, @PS_MinAllocYear NCHAR (1) NULL OUTPUT, @PS_MinAllocPeriod TINYINT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



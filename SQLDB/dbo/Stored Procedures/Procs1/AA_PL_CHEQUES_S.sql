CREATE PROCEDURE [dbo].[AA_PL_CHEQUES_S]
@PS_Source NVARCHAR (1) NULL, @PS_Mode TINYINT NULL, @PS_BatchID INT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_IncrementChequeNo BIT NULL, @PS_TestPrint BIT NULL, @PS_ViewName [sysname] NULL, @PS_UserID NVARCHAR (4) NULL, @PS_ChequeNo NVARCHAR (25) NULL OUTPUT, @PS_ChequeDate DATETIME NULL OUTPUT, @PS_ChequeNoAlreadyUsed BIT NULL OUTPUT, @PS_ChequeDateInFuture BIT NULL OUTPUT, @PS_ChequeDateOver60DaysAgo BIT NULL OUTPUT, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



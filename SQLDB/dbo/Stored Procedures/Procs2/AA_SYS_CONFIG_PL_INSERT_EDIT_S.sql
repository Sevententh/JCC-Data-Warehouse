CREATE PROCEDURE [dbo].[AA_SYS_CONFIG_PL_INSERT_EDIT_S]
@PS_AutomaticTranRef BIT NULL, @PS_NextReference INT NULL, @PS_ShowRefNotAudit BIT NULL, @PS_ChequesNumber VARCHAR (10) NULL, @PS_PaymentStages TINYINT NULL, @PS_DisableTaxPrompt BIT NULL, @PS_StatementsAllocMatch BIT NULL, @PS_AgeingByDays BIT NULL, @PS_AgeingDays1 TINYINT NULL, @PS_AgeingDays2 TINYINT NULL, @PS_AgeingDays3 TINYINT NULL, @PS_AgeingDays4 TINYINT NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



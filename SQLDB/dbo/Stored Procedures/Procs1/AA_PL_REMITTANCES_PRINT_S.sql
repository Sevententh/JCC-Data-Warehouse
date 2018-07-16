CREATE PROCEDURE [dbo].[AA_PL_REMITTANCES_PRINT_S]
@PS_Source NVARCHAR (1) NULL, @PS_BatchID INT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_RemittanceType TINYINT NULL, @PS_UserID VARCHAR (4) NULL, @PS_CreateSeparateCheque BIT NULL, @PS_RemittanceWithChequeAttached BIT NULL, @PS_CurrencySymbol VARCHAR (4) NULL, @PS_PaymentDate DATETIME NULL, @PS_IsHomeCurrency BIT NULL, @PS_CISSubcontractor BIT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



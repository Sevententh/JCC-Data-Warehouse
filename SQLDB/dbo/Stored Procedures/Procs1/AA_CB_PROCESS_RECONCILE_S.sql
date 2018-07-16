CREATE PROCEDURE [dbo].[AA_CB_PROCESS_RECONCILE_S]
@PS_ReconTempID INT NULL, @PS_UserID VARCHAR (4) NULL, @PS_NomAccountCode VARCHAR (25) NULL, @PS_NomAccountPrimary INT NULL, @PS_StatementRef VARCHAR (10) NULL, @PS_StatementDate DATETIME NULL, @PS_ClosingBalance DECIMAL (24, 8) NULL, @PS_Reconcile BIT NULL, @PS_CurrencySymbol VARCHAR (4) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_CalledFromABR BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



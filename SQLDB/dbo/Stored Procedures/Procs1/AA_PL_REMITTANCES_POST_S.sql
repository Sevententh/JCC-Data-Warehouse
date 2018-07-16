CREATE PROCEDURE [dbo].[AA_PL_REMITTANCES_POST_S]
@PS_Source NVARCHAR (1) NULL, @PS_BatchID INT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_CalledFrom INT NULL, @PS_RemittanceType TINYINT NULL, @PS_LinesToProcess BIT NULL, @PS_UserID VARCHAR (4) NULL, @PS_CreateSeparateCheque BIT NULL, @PS_RemittanceWithChequeAttached BIT NULL, @PS_CurrencySymbol VARCHAR (4) NULL, @PS_CurrencyType VARCHAR (1) NULL, @PS_CurrencyRate DECIMAL (16, 6) NULL, @PS_EuroToHomeRate DECIMAL (16, 6) NULL, @PS_Base2Rate DECIMAL (16, 6) NULL, @PS_PaymentDate DATETIME NULL, @PS_PaymentPeriod TINYINT NULL, @PS_PaymentYear VARCHAR (1) NULL, @PS_BankAnalysis VARCHAR (25) NULL OUTPUT, @PS_DiscountAnalysis VARCHAR (25) NULL OUTPUT, @PS_AllocationDate DATETIME NULL OUTPUT, @PS_AllocationPeriod TINYINT NULL OUTPUT, @PS_AllocationYear VARCHAR (1) NULL OUTPUT, @PS_IsHomeCurrency BIT NULL, @PS_Value_DPS TINYINT NULL, @PS_CISTaxCode VARCHAR (25) NULL, @PS_CITBLevyCode VARCHAR (25) NULL, @PS_CISSubcontractor BIT NULL, @PS_Printed BIT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_BACS_Format TINYINT NULL, @PS_BACSHeaderReference VARCHAR (25) NULL, @PS_CIS_UseNewCITBlevyCalc BIT NULL, @PS_SettlementDiscountMethod TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



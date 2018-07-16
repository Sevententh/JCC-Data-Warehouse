CREATE PROCEDURE [dbo].[AA_TRN_CHECK_MULTIPLE_DUE_DATES_S]
@PS_MultipleDueDateDepositPerc DECIMAL (16, 2) NULL OUTPUT, @PS_MultipleDueDateDepositVal FLOAT (53) NULL OUTPUT, @PS_MultipleDueDateStartDate DATETIME NULL OUTPUT, @PS_MultipleDueDatePaymentNo INT NULL OUTPUT, @PS_MultipleDueDatesXML XML NULL OUTPUT, @PS_MultipleDueDatesRelativeToTaxDate BIT NULL OUTPUT, @PS_UseMultipleDueDates BIT NULL OUTPUT, @PS_TranHeaderLink FLOAT (53) NULL, @PS_Inserting BIT NULL, @PS_UserID VARCHAR (4) NULL, @PS_Ledger VARCHAR (2) NULL, @PS_DefaultStartDate DATETIME NULL, @PS_DefaultString VARCHAR (6) NULL, @PS_DefaultMDDRelativeToTaxDate BIT NULL, @PS_DefaultMDDFrequencyUnit TINYINT NULL, @PS_DefaultMDDFrequencyNoOfUnits INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



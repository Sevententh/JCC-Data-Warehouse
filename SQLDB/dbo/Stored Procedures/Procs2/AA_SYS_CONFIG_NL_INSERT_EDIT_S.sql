CREATE PROCEDURE [dbo].[AA_SYS_CONFIG_NL_INSERT_EDIT_S]
@PS_MinimumCodeLength TINYINT NULL, @PS_FixedCodeLength TINYINT NULL, @PS_NumericCodesOnly BIT NULL, @PS_AutoCreateAnalysis TINYINT NULL, @PS_AutoTransactionRef BIT NULL, @PS_NextReference INT NULL, @PS_SalesAccount VARCHAR (25) NULL, @PS_SalesDiscountAccount VARCHAR (25) NULL, @PS_PurchaseAccount VARCHAR (25) NULL, @PS_PurchaseDiscountAccount VARCHAR (25) NULL, @PS_ExchangeDiffAccount VARCHAR (25) NULL, @PS_SalesControlAccount VARCHAR (25) NULL, @PS_PurchaseControlAccount VARCHAR (25) NULL, @PS_VATControlAccount VARCHAR (25) NULL, @PS_YearEndAccount VARCHAR (25) NULL, @PS_SuspenseAccount VARCHAR (25) NULL, @PS_RoundingDiffAccount VARCHAR (25) NULL, @PS_AllowAnalysisAnyCurrency BIT NULL, @PS_CategoryDisplayStyle TINYINT NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



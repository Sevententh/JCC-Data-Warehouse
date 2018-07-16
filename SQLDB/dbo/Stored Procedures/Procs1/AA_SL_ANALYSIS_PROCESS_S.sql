CREATE PROCEDURE [dbo].[AA_SL_ANALYSIS_PROCESS_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_ReturnType TINYINT NULL OUTPUT, @PS_AnalysisCode NVARCHAR (25) NULL, @PS_AnalysisPrimary BIGINT NULL, @PS_CurrencySymbol NVARCHAR (4) NULL, @PS_AnyCurrency BIT NULL, @PS_ProjectCode NVARCHAR (10) NULL, @PS_BankCode NVARCHAR (25) NULL, @PS_DefaultVatCodeReqd BIT NULL, @PS_ExistingLine BIT NULL, @PS_DeliveryAccountCode NVARCHAR (10) NULL, @PS_DeliveryAddressNo INT NULL, @PS_VatCode NVARCHAR (4) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



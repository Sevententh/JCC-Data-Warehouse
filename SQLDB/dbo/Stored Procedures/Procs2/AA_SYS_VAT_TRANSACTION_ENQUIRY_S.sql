CREATE PROCEDURE [dbo].[AA_SYS_VAT_TRANSACTION_ENQUIRY_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_EnquiryType TINYINT NULL, @PS_InclRelTableDefs TINYINT NULL, @PS_HeaderMaxRecords INT NULL, @PS_HeaderStartValue SQL_VARIANT NULL, @PS_HeaderStartPrimary INT NULL, @PS_HeaderOrderByFieldName [sysname] NULL, @PS_VatReturnBox INT NULL, @PS_TaxAuditPrimary INT NULL, @PS_HeaderAuditNoFrom INT NULL, @PS_HeaderAuditNoSearch TINYINT NULL, @PS_HeaderAuditNoTo INT NULL, @PS_DetailMaxRecords INT NULL, @PS_DetailStartValue SQL_VARIANT NULL, @PS_DetailStartPrimary INT NULL, @PS_DetailOrderByFieldName [sysname] NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



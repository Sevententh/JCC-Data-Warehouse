﻿CREATE PROCEDURE [dbo].[AA_SL_BATCH_HEADER_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_CountOnly TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_SQLOnly BIT NULL, @PS_SQLStatement NVARCHAR (4000) NULL OUTPUT, @PS_InvAccountCodeFrom NVARCHAR (10) NULL, @PS_InvAccountCodeSearch TINYINT NULL, @PS_InvAccountCodeTo NVARCHAR (10) NULL, @PS_InvAccountNameFrom NVARCHAR (40) NULL, @PS_InvAccountNameSearch TINYINT NULL, @PS_InvAccountNameTo NVARCHAR (40) NULL, @PS_HeaderReferenceFrom NVARCHAR (10) NULL, @PS_HeaderReferenceSearch TINYINT NULL, @PS_HeaderReferenceTo NVARCHAR (10) NULL, @PS_BatchReferenceFrom NVARCHAR (10) NULL, @PS_BatchReferenceSearch TINYINT NULL, @PS_BatchReferenceTo NVARCHAR (10) NULL, @PS_GrossFrom DECIMAL (24, 8) NULL, @PS_GrossSearch TINYINT NULL, @PS_GrossTo DECIMAL (24, 8) NULL, @PS_TransactionDateFrom DATETIME NULL, @PS_TransactionDateSearch TINYINT NULL, @PS_TransactionDateTo DATETIME NULL, @PS_AnalysisFrom NVARCHAR (25) NULL, @PS_AnalysisSearch TINYINT NULL, @PS_AnalysisTo NVARCHAR (25) NULL, @PS_ProjectCodeFrom NVARCHAR (10) NULL, @PS_ProjectCodeSearch TINYINT NULL, @PS_ProjectCodeTo NVARCHAR (10) NULL, @PS_HeaderAuditNoFrom INT NULL, @PS_HeaderAuditNoSearch TINYINT NULL, @PS_HeaderAuditNoTo INT NULL, @PS_TransactionYearPeriodFrom NVARCHAR (3) NULL, @PS_TransactionYearPeriodSearch TINYINT NULL, @PS_TransactionYearPeriodTo NVARCHAR (3) NULL, @PS_TransactionYearFrom NCHAR (1) NULL, @PS_TransactionYearSearch TINYINT NULL, @PS_TransactionYearTo NCHAR (1) NULL, @PS_TransactionPeriodFrom TINYINT NULL, @PS_TransactionPeriodSearch TINYINT NULL, @PS_TransactionPeriodTo TINYINT NULL, @PS_EnteredByFrom NVARCHAR (4) NULL, @PS_EnteredBySearch TINYINT NULL, @PS_EnteredByTo NVARCHAR (4) NULL, @PS_IncludeInvoice BIT NULL, @PS_IncludeCreditNote BIT NULL, @PS_IncludeReceipt BIT NULL, @PS_IncludeAdjustDR BIT NULL, @PS_IncludeAdjustCR BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



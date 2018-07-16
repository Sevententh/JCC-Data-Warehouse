﻿CREATE PROCEDURE [dbo].[AA_NL_RECJNL_BATCH_ENQUIRY_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_CountOnly TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_EnquiryType TINYINT NULL, @PS_InclRelTableDefs TINYINT NULL, @PS_HeaderMaxRecords INT NULL, @PS_HeaderStartValue SQL_VARIANT NULL, @PS_HeaderStartPrimary INT NULL, @PS_HeaderOrderByFieldName [sysname] NULL, @PS_ContraAccountFrom NVARCHAR (25) NULL, @PS_ContraAccountSearch TINYINT NULL, @PS_ContraAccountTo NVARCHAR (25) NULL, @PS_NomAccountCodeFrom NVARCHAR (25) NULL, @PS_NomAccountCodeSearch TINYINT NULL, @PS_NomAccountCodeTo NVARCHAR (25) NULL, @PS_VoucherReferenceFrom NVARCHAR (10) NULL, @PS_VoucherReferenceSearch TINYINT NULL, @PS_VoucherReferenceTo NVARCHAR (10) NULL, @PS_BatchReferenceFrom NVARCHAR (10) NULL, @PS_BatchReferenceSearch TINYINT NULL, @PS_BatchReferenceTo NVARCHAR (10) NULL, @PS_NextPostingDateFrom DATETIME NULL, @PS_NextPostingDateSearch TINYINT NULL, @PS_NextPostingDateTo DATETIME NULL, @PS_YearPeriodFrom NVARCHAR (3) NULL, @PS_YearPeriodSearch TINYINT NULL, @PS_YearPeriodTo NVARCHAR (3) NULL, @PS_YearFrom NCHAR (1) NULL, @PS_YearSearch TINYINT NULL, @PS_YearTo NCHAR (1) NULL, @PS_PeriodFrom TINYINT NULL, @PS_PeriodSearch TINYINT NULL, @PS_PeriodTo TINYINT NULL, @PS_UserEnteredFrom NVARCHAR (4) NULL, @PS_UserEnteredSearch TINYINT NULL, @PS_UserEnteredTo NVARCHAR (4) NULL, @PS_TranUserKey1From NVARCHAR (20) NULL, @PS_TranUserKey1Search TINYINT NULL, @PS_TranUserKey1To NVARCHAR (20) NULL, @PS_TranUserKey2From NVARCHAR (20) NULL, @PS_TranUserKey2Search TINYINT NULL, @PS_TranUserKey2To NVARCHAR (20) NULL, @PS_TranUserKey3From NVARCHAR (20) NULL, @PS_TranUserKey3Search TINYINT NULL, @PS_TranUserKey3To NVARCHAR (20) NULL, @PS_HeaderPrimaryFrom INT NULL, @PS_HeaderPrimarySearch TINYINT NULL, @PS_HeaderPrimaryTo INT NULL, @PS_DetailMaxRecords INT NULL, @PS_DetailStartValue SQL_VARIANT NULL, @PS_DetailStartPrimary INT NULL, @PS_DetailOrderByFieldName [sysname] NULL, @PS_DetailPrimaryFrom INT NULL, @PS_DetailPrimarySearch TINYINT NULL, @PS_DetailPrimaryTo INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



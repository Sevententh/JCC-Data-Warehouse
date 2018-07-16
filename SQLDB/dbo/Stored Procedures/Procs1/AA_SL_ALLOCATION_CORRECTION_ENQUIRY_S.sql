﻿CREATE PROCEDURE [dbo].[AA_SL_ALLOCATION_CORRECTION_ENQUIRY_S]
@PS_UserID NVARCHAR (4) NULL, @PS_CalledFrom INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_AccountCode VARCHAR (10) NULL, @PS_EnquiryType TINYINT NULL, @PS_InclRelTableDefs TINYINT NULL, @PS_HeaderMaxRecords INT NULL, @PS_HeaderStartValue SQL_VARIANT NULL, @PS_HeaderStartPrimary INT NULL, @PS_HeaderOrderByFieldName [sysname] NULL, @PS_HeaderPrimaryFrom INT NULL, @PS_HeaderPrimarySearch TINYINT NULL, @PS_HeaderPrimaryTo INT NULL, @PS_TransactionDateFrom DATETIME NULL, @PS_TransactionDateSearch TINYINT NULL, @PS_TransactionDateTo DATETIME NULL, @PS_TransactionYearPeriodFrom NVARCHAR (3) NULL, @PS_TransactionYearPeriodSearch TINYINT NULL, @PS_TransactionYearPeriodTo NVARCHAR (3) NULL, @PS_TransactionYearFrom NCHAR (1) NULL, @PS_TransactionYearSearch TINYINT NULL, @PS_TransactionYearTo NCHAR (1) NULL, @PS_TransactionPeriodFrom TINYINT NULL, @PS_TransactionPeriodSearch TINYINT NULL, @PS_TransactionPeriodTo TINYINT NULL, @PS_TransactionValueFrom FLOAT (53) NULL, @PS_TransactionValueSearch TINYINT NULL, @PS_TransactionValueTo FLOAT (53) NULL, @PS_TransactionRefFrom NVARCHAR (10) NULL, @PS_TransactionRefSearch TINYINT NULL, @PS_TransactionRefTo NVARCHAR (10) NULL, @PS_TransactionDescFrom NVARCHAR (30) NULL, @PS_TransactionDescSearch TINYINT NULL, @PS_TransactionDescTo NVARCHAR (30) NULL, @PS_AllocationRefFrom NVARCHAR (10) NULL, @PS_AllocationRefSearch TINYINT NULL, @PS_AllocationRefTo NVARCHAR (10) NULL, @PS_AllocationDateFrom DATETIME NULL, @PS_AllocationDateSearch TINYINT NULL, @PS_AllocationDateTo DATETIME NULL, @PS_AllocationUserFrom NVARCHAR (4) NULL, @PS_AllocationUserSearch TINYINT NULL, @PS_AllocationUserTo NVARCHAR (4) NULL, @PS_UserChar1From NVARCHAR (20) NULL, @PS_UserChar1Search TINYINT NULL, @PS_UserChar1To NVARCHAR (20) NULL, @PS_UserChar2From NVARCHAR (20) NULL, @PS_UserChar2Search TINYINT NULL, @PS_UserChar2To NVARCHAR (20) NULL, @PS_UserChar3From NVARCHAR (100) NULL, @PS_UserChar3Search TINYINT NULL, @PS_UserChar3To NVARCHAR (100) NULL, @PS_UserChar4From NVARCHAR (100) NULL, @PS_UserChar4Search TINYINT NULL, @PS_UserChar4To NVARCHAR (100) NULL, @PS_UserNum1From FLOAT (53) NULL, @PS_UserNum1Search TINYINT NULL, @PS_UserNum1To FLOAT (53) NULL, @PS_UserNum2From FLOAT (53) NULL, @PS_UserNum2Search TINYINT NULL, @PS_UserNum2To FLOAT (53) NULL, @PS_UserDate1From DATETIME NULL, @PS_UserDate1Search TINYINT NULL, @PS_UserDate1To DATETIME NULL, @PS_UserDate2From DATETIME NULL, @PS_UserDate2Search TINYINT NULL, @PS_UserDate2To DATETIME NULL, @PS_SubLedgerFrom NVARCHAR (10) NULL, @PS_SubLedgerSearch TINYINT NULL, @PS_SubLedgerTo NVARCHAR (10) NULL, @PS_UserSort1From NVARCHAR (20) NULL, @PS_UserSort1Search TINYINT NULL, @PS_UserSort1To NVARCHAR (20) NULL, @PS_UserSort2From NVARCHAR (20) NULL, @PS_UserSort2Search TINYINT NULL, @PS_UserSort2To NVARCHAR (20) NULL, @PS_UserSort3From NVARCHAR (20) NULL, @PS_UserSort3Search TINYINT NULL, @PS_UserSort3To NVARCHAR (20) NULL, @PS_ShowUnbalanced BIT NULL, @PS_DetailMaxRecords INT NULL, @PS_DetailStartValue SQL_VARIANT NULL, @PS_DetailStartPrimary INT NULL, @PS_DetailOrderByFieldName [sysname] NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



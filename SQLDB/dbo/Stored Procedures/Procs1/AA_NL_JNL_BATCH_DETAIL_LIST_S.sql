﻿CREATE PROCEDURE [dbo].[AA_NL_JNL_BATCH_DETAIL_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_CountOnly TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_HeaderSQLStatement NVARCHAR (4000) NULL, @PS_HeaderPrimaryFrom INT NULL, @PS_HeaderPrimarySearch TINYINT NULL, @PS_HeaderPrimaryTo INT NULL, @PS_DetailAuditNoFrom INT NULL, @PS_DetailAuditNoSearch TINYINT NULL, @PS_DetailAuditNoTo INT NULL, @PS_NomAccountCodeFrom NVARCHAR (25) NULL, @PS_NomAccountCodeSearch TINYINT NULL, @PS_NomAccountCodeTo NVARCHAR (25) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



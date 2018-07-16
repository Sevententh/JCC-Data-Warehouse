CREATE PROCEDURE [dbo].[AA_SL_ANAL_TRANSACTION_DETAIL_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary INT NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue INT NULL OUTPUT, @PS_HeaderSQLStatement NVARCHAR (4000) NULL, @PS_HeaderAuditNoFrom INT NULL, @PS_HeaderAuditNoSearch TINYINT NULL, @PS_HeaderAuditNoTo INT NULL, @PS_DetailAuditNoFrom INT NULL, @PS_DetailAuditNoSearch TINYINT NULL, @PS_DetailAuditNoTo INT NULL, @PS_InvAccountCodeFrom NVARCHAR (10) NULL, @PS_InvAccountCodeSearch TINYINT NULL, @PS_InvAccountCodeTo NVARCHAR (10) NULL, @PS_OrdAccountCodeFrom NVARCHAR (10) NULL, @PS_OrdAccountCodeSearch TINYINT NULL, @PS_OrdAccountCodeTo NVARCHAR (10) NULL, @PS_StockCodeFrom NVARCHAR (25) NULL, @PS_StockCodeSearch TINYINT NULL, @PS_StockCodeTo NVARCHAR (25) NULL, @PS_PriceCodeFrom NVARCHAR (16) NULL, @PS_PriceCodeSearch TINYINT NULL, @PS_PriceCodeTo NVARCHAR (16) NULL, @PS_ProjectCodeFrom NVARCHAR (10) NULL, @PS_ProjectCodeSearch TINYINT NULL, @PS_ProjectCodeTo NVARCHAR (10) NULL, @PS_CostCentreCodeFrom NVARCHAR (10) NULL, @PS_CostCentreCodeSearch TINYINT NULL, @PS_CostCentreCodeTo NVARCHAR (10) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



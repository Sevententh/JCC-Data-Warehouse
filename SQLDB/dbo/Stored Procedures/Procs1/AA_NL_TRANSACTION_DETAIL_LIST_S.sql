CREATE PROCEDURE [dbo].[AA_NL_TRANSACTION_DETAIL_LIST_S]
@PS_UserID NVARCHAR (4) NULL, @PS_MaxRecords INT NULL, @PS_CalledFrom INT NULL, @PS_StartValue SQL_VARIANT NULL, @PS_StartPrimary DECIMAL (30) NULL, @PS_OrderByDescending TINYINT NULL, @PS_OrderByFieldName [sysname] NULL, @PS_TotalRecordCount INT NULL OUTPUT, @PS_AdvancedResponse TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_OutputMode TINYINT NULL, @PS_GetMinPrimary BIT NULL, @PS_MinPrimaryValue DECIMAL (30) NULL OUTPUT, @PS_HeaderSQLStatement NVARCHAR (4000) NULL, @PS_AnalysisFrom NVARCHAR (25) NULL, @PS_AnalysisSearch TINYINT NULL, @PS_AnalysisTo NVARCHAR (25) NULL, @PS_StockCodeFrom NVARCHAR (25) NULL, @PS_StockCodeSearch TINYINT NULL, @PS_StockCodeTo NVARCHAR (25) NULL, @PS_PriceCodeFrom NVARCHAR (16) NULL, @PS_PriceCodeSearch TINYINT NULL, @PS_PriceCodeTo NVARCHAR (16) NULL, @PS_ProjectCodeFrom NVARCHAR (10) NULL, @PS_ProjectCodeSearch TINYINT NULL, @PS_ProjectCodeTo NVARCHAR (10) NULL, @PS_CostCentreCodeFrom NVARCHAR (10) NULL, @PS_CostCentreCodeSearch TINYINT NULL, @PS_CostCentreCodeTo NVARCHAR (10) NULL, @PS_DetailAuditNoFrom INT NULL, @PS_DetailAuditNoSearch TINYINT NULL, @PS_DetailAuditNoTo INT NULL, @PS_DetailHeaderKey VARCHAR (10) NULL, @PS_DetailDate DATETIME NULL, @PS_DetailPerSort INT NULL, @PS_DetailNominalPrimary INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



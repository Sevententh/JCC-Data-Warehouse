CREATE FUNCTION [dbo].[AA_CREATE_LIST_SELECT_MULTI_ORDER_STATEMENT_F]
(@PS_MaxRecords INT NULL, @PS_Fields NVARCHAR (1000) NULL, @PS_ViewName [sysname] NULL, @PS_PrimarySortFieldName [sysname] NULL, @PS_StartPrimarySort NVARCHAR (50) NULL, @PS_PrimaryOrderByDesc BIT NULL, @PS_StartValue1 SQL_VARIANT NULL, @PS_OrderByFieldName1 [sysname] NULL, @PS_OrderByDescending1 BIT NULL, @PS_StartValue2 SQL_VARIANT NULL, @PS_OrderByFieldName2 [sysname] NULL, @PS_OrderByDescending2 BIT NULL, @PS_StartValue3 SQL_VARIANT NULL, @PS_OrderByFieldName3 [sysname] NULL, @PS_OrderByDescending3 BIT NULL, @PS_StartValue4 SQL_VARIANT NULL, @PS_OrderByFieldName4 [sysname] NULL, @PS_OrderByDescending4 BIT NULL, @PS_WhereClause NVARCHAR (4000) NULL, @PS_CreateCountSelect TINYINT NULL)
RETURNS NVARCHAR (4000)
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN NULL
END


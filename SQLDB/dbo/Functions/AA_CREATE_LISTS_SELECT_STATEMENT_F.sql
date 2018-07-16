CREATE FUNCTION [dbo].[AA_CREATE_LISTS_SELECT_STATEMENT_F]
(@PS_MaxRecords INT NULL, @PS_Fields NVARCHAR (1000) NULL, @PS_TableName [sysname] NULL, @PS_PrimarySortFieldName [sysname] NULL, @PS_StartPrimarySort NVARCHAR (50) NULL, @PS_StartValue NVARCHAR (50) NULL, @PS_OrderByFieldName [sysname] NULL, @PS_OrderByDescending TINYINT NULL, @PS_WhereClause NVARCHAR (4000) NULL, @PS_CreateCountSelect TINYINT NULL)
RETURNS NVARCHAR (4000)
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN NULL
END


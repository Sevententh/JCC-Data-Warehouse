CREATE PROCEDURE [dbo].[AA_AOI_INXL2_GET_NOMINAL_WITH_NL_ATTRIBUTES]
@return_used_nl_attributes_types_column_names_as_resultset BIT NULL, @return_ncoded_nl_attributes_types_for_whereclause_as_resultset BIT NULL, @use_nl_attributes_types_as_column_names BIT NULL, @where_clause_XML_ArrayOfInXLGetNominalWithNLattributesXMLItem XML NULL, @limit_to_nl_attributes_type_code1 NVARCHAR (15) NULL, @limit_to_nl_attributes_type_code2 NVARCHAR (15) NULL, @sql_join_table_alias_name_prefix_for_AA_AOI_INXL2_NL_CATEGORIES_VIEW NVARCHAR (30) NULL, @sql_natt_columns_returnstring NVARCHAR (MAX) NULL OUTPUT, @sql_natt_insert_columns_returnstring NVARCHAR (MAX) NULL OUTPUT, @sql_natt_output_columns_returnstring NVARCHAR (MAX) NULL OUTPUT, @sql_natt_leftjoins_returnstring NVARCHAR (MAX) NULL OUTPUT, @sql_where_clause_returnstring NVARCHAR (MAX) NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END



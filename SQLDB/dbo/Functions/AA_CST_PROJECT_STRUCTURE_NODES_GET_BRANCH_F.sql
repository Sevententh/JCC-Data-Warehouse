CREATE FUNCTION [dbo].[AA_CST_PROJECT_STRUCTURE_NODES_GET_BRANCH_F]
(@PS_NodePrimary INT NULL)
RETURNS 
    @GeneratedTableName TABLE (
        [AC_Node]      INT NULL,
        [AC_Parent]    INT NULL,
        [AC_Level]     INT NULL,
        [AC_Index]     INT NULL,
        [AC_Processed] BIT NULL)
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


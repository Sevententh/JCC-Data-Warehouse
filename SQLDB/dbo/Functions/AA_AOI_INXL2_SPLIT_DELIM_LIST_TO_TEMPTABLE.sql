CREATE FUNCTION [dbo].[AA_AOI_INXL2_SPLIT_DELIM_LIST_TO_TEMPTABLE]
(@List NVARCHAR (MAX) NULL, @SplitOn VARCHAR (1) NULL)
RETURNS 
    @GeneratedTableName TABLE (
        [Value] VARCHAR (MAX) NULL)
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


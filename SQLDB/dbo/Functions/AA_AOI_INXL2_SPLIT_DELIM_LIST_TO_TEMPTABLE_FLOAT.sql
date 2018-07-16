CREATE FUNCTION [dbo].[AA_AOI_INXL2_SPLIT_DELIM_LIST_TO_TEMPTABLE_FLOAT]
(@List NVARCHAR (MAX) NULL, @SplitOn VARCHAR (1) NULL, @OptionalMinimumCount INT NULL)
RETURNS 
    @GeneratedTableName TABLE (
        [ID]    INT        NULL,
        [Value] FLOAT (53) NULL)
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


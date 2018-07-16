CREATE FUNCTION DHC_GETDATEDIFF(
	@SM_DATE DATETIME
) RETURNS INT
AS BEGIN
	DECLARE @DIFF INT

	SELECT @DIFF = datediff(month,dbo.dhc_getMonthStartDate(@SM_DATE,0),dbo.dhc_getMonthStartDate(getdate(),0))

	RETURN @DIFF
END

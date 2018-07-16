CREATE Procedure Udef_WFF_STKENQ_PriceBookColumn
	@UserID							Varchar(4),
	@DetailConfigID					Int, -- CFSD_PRIMARY.TS_CUSTOM_FORM_SETUP_DETAIL
	@CurrentLogEntryID				Int, -- APAL_PRIMARY.TS_APPROVAL_LOG
	@FormID							Int,
	@__OUTPUT						TinyInt	Output,
	@PriceBook						Varchar(20),
	@Customer_Code					Varchar(10)
As
Begin
	Declare
	@LS_ColumnName					Varchar(40)

	Select @LS_ColumnName = Replace(CFSD_FIELD_TEXT, 'Price', '') from TS_CUSTOM_FORM_SETUP_DETAIL With (NoLock) Where CFSD_PRIMARY = @DetailConfigID

	If Convert(Int, @LS_ColumnName) = Convert(Int, @PriceBook) Or IsNull(@Customer_Code,'') = ''
	Begin
		Set @__OUTPUT = 1
	End
	Else
	Begin
		Set @__OUTPUT = 0
	End 
End




Select * from TS_CUSTOM_FORM_SETUP_DETAIL


Update
TS_CUSTOM_FORM_SETUP_DETAIL
Set
CFSD_SHOW_TYPE = 3,
CFSD_FIELD_SHOW_CONFIG_PROC = 'Udef_WFF_STKENQ_PriceBookColumn'
Where
CFSD_PRIMARY > 67
create view DASHBOARD.AA_ARSDB_CREDITOR_DAYS_DATE_BASED_VIEW
/*
** Written:      30/07/09 NC
** Last Amended:
**
**
*/
as
select
  DASHBOARD.AA_ARSDB_CREDITOR_DAYS_DATE_BASED_F(getdate(),0) CreditorDays
, DASHBOARD.AA_ARSDB_CREDITOR_DAYS_DATE_BASED_F(getdate(),1) CreditorDaysExcludingUnallocatedCredits

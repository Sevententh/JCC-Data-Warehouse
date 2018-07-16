create view DASHBOARD.AA_ARSDB_DEBTOR_DAYS_PERIOD_BASED_VIEW
/*
** Written:      30/07/09 NC
** Last Amended:
**
**
*/
as
select
  DASHBOARD.AA_ARSDB_DEBTOR_DAYS_PERIOD_BASED_F(getdate(),0) DebtorDays
, DASHBOARD.AA_ARSDB_DEBTOR_DAYS_PERIOD_BASED_F(getdate(),1) DebtorDaysExcludingUnallocatedCredits

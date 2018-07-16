create view AA_CST_TIMESHEET_SECURITY_VIEW
/*
** TODO: This view needs filling in.
**
** Written:     20/01/06 SR
** Last Amended:
** Comments: Returns Security Profile settings for Costing Timesheets
*/
As

Select
UP_CODE as PROFILECODE,
UP_MODULE as PROFILEMODULE,
1 as ARCHIVE_TRANSACTION,
1 as BATCH_TRANSACTION,
1 as COPY_RESOURCE_DETAIL,
1 as ENTER_CURRENCY_AMOUNTS,
1 as EXCLUDE_RESOURCE_UPLIFT,
1 as OPTIONS,
1 as TRANSACTION_DEFAULTS

From SYS_USER_PROFILE
Where UP_MODULE = 'CST'
create view AA_SYS_RECORD_TEMPLATE_LIST_VIEW

/*
**
** Merges both the saved templates and the default templates.
** Due to the need to show the default template for a single user a filter needs to be applied e.g. LOGON_USER_ID = [USER_ID]
**
** Written: 4/1/06 LM
** Last Amended:
**
*/

as

select lu.[USER_ID] as LOGON_USER_ID,
       s.RECORD_ID as BUSINESS_OPERATION_ID,
       s.TEMPLATE_ID,
       s.TEMPLATE_ID as [PRIMARY],
       s.ENTERED_BY,
       su.[USER_NAME] as ENTERED_BY_NAME,
       s.TEMPLATE_NAME,
       su.USER_PROFILE_CODE as PROFILE_NAME,
       cast(case when d.USER_ID is null then 0 else 1 end as bit) as USER_DEFAULT,
       s.SYSTEM_DEFAULT,
       s.DATE_EDITED as DATE_EDITED
from SYS_USER as lu
cross join SYS_RECORD_TEMPLATE s
left outer join SYS_DEFAULT_RECORD_TEMPLATE d
   on d.RECORD_ID = s.RECORD_ID
   and d.TEMPLATE_ID = s.TEMPLATE_ID
   and d.[USER_ID] = lu.[USER_ID]
inner join SYS_USER as su
   on su.[USER_ID] = s.ENTERED_BY
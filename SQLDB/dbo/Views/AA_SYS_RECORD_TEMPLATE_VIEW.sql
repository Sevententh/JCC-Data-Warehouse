create view AA_SYS_RECORD_TEMPLATE_VIEW

/*
**
** Merges both the user templates and the default templates.
** Due to the need to show the default search for a single user a filter needs to be applied e.g. LOGON_USER_ID = [USER_ID]
**
** Written:      4/1/06 LM
** Last Amended:
**
*/

as

select recordTemplate.TEMPLATE_ID,
       recordTemplate.DISPLAY_LAYOUT,
       recordTemplate.TAB_CONFIGURATION,
       recordTemplate.TEMPLATE_NAME,
       recordTemplate.ENTERED_BY,
       recordTemplate.RECORD_ID as BUSINESS_OPERATION_ID,
       recordTemplate.SYSTEM_DEFAULT,
       recordTemplate.DATE_EDITED,
       recordTemplate.SPLITTER_CONFIGURATION,
       (case when defaultTemplate.[USER_ID] is null then 0 else 1 end) as USER_DEFAULT,
       LogonUser.[USER_ID] as LOGON_USER_ID
from SYS_USER LogonUser
cross join SYS_RECORD_TEMPLATE recordTemplate
left outer join SYS_DEFAULT_RECORD_TEMPLATE defaultTemplate
   on defaultTemplate.TEMPLATE_ID = recordTemplate.TEMPLATE_ID
   and defaultTemplate.[USER_ID] = LogonUser.[USER_ID]
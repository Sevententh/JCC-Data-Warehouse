create view AA_SYS_TRANSACTION_TEMPLATE_LIST_VIEW
/*
** Merges both the saved templates and the default templates.  Due to the need to show
** the default template for a single user. A filter needs to be applied e.g. LOGON_USER_ID = [USER_ID]
**
** Written     :  17/04/2004 SRB
** Last Amended:  22/11/2004 SRB, 22/12/2005 ROBB, 07/02/2007 DB
**
*/
as
select
   u.[USER_ID]                               LOGON_USER_ID
,  tt.TRANSACTION_ID                         BUSINESS_OPERATION_ID
,  tt.TEMPLATE_ID
,  tt.TEMPLATE_ID                            [PRIMARY]
,  tt.ENTERED_BY
,  isnull(tu.[USER_NAME],'')                 ENTERED_BY_NAME
,  tt.TEMPLATE_NAME
,  isnull(tu.USER_PROFILE_CODE,'')           PROFILE_NAME
,  cast
   (
      case
         when dtt.[USER_ID] is null then 0
         else
            1
      end
      as bit
   )                                         USER_DEFAULT
,  tt.SYSTEM_DEFAULT
,  tt.DATE_EDITED                            DATE_EDITED
   from
      SYS_USER                   u
      cross join
      SYS_TRANSACTION_TEMPLATE   tt
         left  join SYS_DEFAULT_TRANSACTION_TEMPLATE  dtt   on       dtt.TRANSACTION_ID   = tt.TRANSACTION_ID
                                                               and   dtt.TEMPLATE_ID      = tt.TEMPLATE_ID
                                                               and   dtt.[USER_ID]        = u.[USER_ID]
         left  join SYS_USER                          tu    on       tu.[USER_ID]         = tt.ENTERED_BY
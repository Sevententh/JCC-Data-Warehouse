create view AA_SYS_TRANSACTION_TEMPLATE_VIEW
/*
** Merges both the templates and the default templates.  Due to the need to show
** the default search for a single user. A filter needs to be applied e.g. LOGON_USER_ID = [USER_ID]
**
** Written     :  17/11/2004 SRB
** Last Amended:  10/02/2005 ROBB, 11/02/2005 ROBB, 22/12/2005 ROBB, 04/01/2006 LM, 08/02/2007 DB
**
*/
as

select
   transactionTemplate.TEMPLATE_ID
,  transactionTemplate.DISPLAY_LAYOUT
,  transactionTemplate.COPY_LINE_FIELDS
,  transactionTemplate.OPTIONS
,  transactionTemplate.TAB_CONFIGURATION
,  transactionTemplate.TEMPLATE_NAME
,  transactionTemplate.ENTERED_BY
,  transactionTemplate.TRANSACTION_ID                    BUSINESS_OPERATION_ID
,  transactionTemplate.SYSTEM_DEFAULT
,  transactionTemplate.DATE_EDITED
,  transactionTemplate.SPLITTER_CONFIGURATION
,  transactionTemplate.TABBING_ORDER
,  (
      case
         when defaultTemplate.[USER_ID] is null then 0
         else
            1
      end
   )                                                     USER_DEFAULT
,  LogonUser.[USER_ID]                                   LOGON_USER_ID
   from
      SYS_USER                   LogonUser
      cross join
      SYS_TRANSACTION_TEMPLATE   transactionTemplate
         left  join  SYS_DEFAULT_TRANSACTION_TEMPLATE defaultTemplate
                        on       defaultTemplate.TEMPLATE_ID   = transactionTemplate.TEMPLATE_ID
                           and   defaultTemplate.[USER_ID]     = LogonUser.[USER_ID]
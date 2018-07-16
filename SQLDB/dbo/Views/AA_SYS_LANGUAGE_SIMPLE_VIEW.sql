create view AA_SYS_LANGUAGE_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_SYS_LANGUAGE_LIST_S
** Written:      18/05/04 NC
** Last Amended: 19/05/04 NC, 13/06/05 NC, 12/07/05 SR
**
*/
as

select
     LANGUAGE_PRIMARY as [PRIMARY]
   , LANGUAGE_CODE as [LANGUAGE]
   , DESCRIPTION
   , SYSTEM_DEFAULT as [SYSTEM_DEFAULT]
   , LABEL_MODIFIED_DATE
   , MESSAGE_MODIFIED_DATE
   from SYS_LANGUAGES
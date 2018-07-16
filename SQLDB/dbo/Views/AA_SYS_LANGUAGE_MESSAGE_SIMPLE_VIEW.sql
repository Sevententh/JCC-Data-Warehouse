﻿create view AA_SYS_LANGUAGE_MESSAGE_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_SYS_LANGUAGE_MESSAGE_LIST_S
** Written:      27/05/04 NC
** Last Amended: 28/05/04 NC, 04/10/05 NC
**
*/
as

select
     LK.LANGUAGE_MESSAGE_LINK_PRIMARY as [PRIMARY]
   , L.LANGUAGE_PRIMARY as LANGUAGE_PRIMARY
   , L.LANGUAGE_CODE as LANGUAGE_CODE
   , LL.FORM_KEY
   , LL.MESSAGE_TAG
   , LL.DESCRIPTION
   , T.LANGUAGE_MESSAGE_TEXT as LANGUAGE_MESSAGE_TEXT
   , LK.MODIFIED_DATE
   from SYS_LANGUAGE_MESSAGE_TEXT_LINK as LK
      join SYS_LANGUAGES as L on LANGUAGE_PRIMARY = LK.LANGUAGE_FK
      join SYS_LANGUAGE_MESSAGE_TEXT as T on T.LANGUAGE_MESSAGE_TEXT_PRIMARY = LK.LANGUAGE_MESSAGE_TEXT_FK
      join SYS_LANGUAGE_MESSAGES as LL on LL.LANGUAGE_MESSAGE_PRIMARY = LK.LANGUAGE_MESSAGE_FK
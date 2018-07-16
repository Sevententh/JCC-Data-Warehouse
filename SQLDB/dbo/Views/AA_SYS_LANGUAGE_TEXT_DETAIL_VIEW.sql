create view AA_SYS_LANGUAGE_TEXT_DETAIL_VIEW
/*
** Returns a table to be used specifically with AA_SYS_LANGUAGE_TEXT_DETAIL_LIST_S
** Written:      05/09/05 NC
** Last Amended: 09/09/2005 SR
**
*/
as

select
     LK.LANGUAGE_LINK_PRIMARY as [PRIMARY] -- Detail Primary
   , T.LANGUAGE_LABEL_TEXT_PRIMARY as [TEXT_PRIMARY] -- Link to Text
   , LK.LANGUAGE_FK as LANGUAGE_PRIMARY -- needed for search
   , LL.FORM_KEY
   , LL.LABEL_TAG   
   , cast(1 as bit) as APPLY_CHANGE
   from SYS_LANGUAGE_LABEL_TEXT as T
      join SYS_LANGUAGE_LABEL_TEXT_LINK as LK on LK.LANGUAGE_TEXT_FK = T.LANGUAGE_LABEL_TEXT_PRIMARY
      join SYS_LANGUAGE_LABELS as LL on LL.LANGUAGE_LABEL_PRIMARY = LK.LANGUAGE_LABEL_FK
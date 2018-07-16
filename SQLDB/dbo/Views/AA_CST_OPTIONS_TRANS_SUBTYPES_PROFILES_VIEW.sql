create view AA_CST_OPTIONS_TRANS_SUBTYPES_PROFILES_VIEW
/*
** Returns Costing Transaction Sub Types Security Profiles.
**
** Written:      16/03/2006 SH
** Last Amended: 
*/
as

select S.CSS_SUBTYPE_LINK as SUBTYPE_PRIMARY,
      S.CSS_USER_PROFILE_LINK as PROFILE_PRIMARY,
      P.UPG_DESCRIPTION as PROFILE_NAME
   from CST_SUBTYPE_SECURITY S
      inner join SYS_USER_PROFILE_GLOBAL P on P.UPG_PRIMARY = S.CSS_USER_PROFILE_LINK

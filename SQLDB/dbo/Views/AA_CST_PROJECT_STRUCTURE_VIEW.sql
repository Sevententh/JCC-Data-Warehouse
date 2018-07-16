create view AA_CST_PROJECT_STRUCTURE_VIEW
/*
** Returns a table to be used specifically with AA_CST_PROJECT_STRUCTURE_RETRIEVE_S
**
** Written     :  03/01/2006 DB
** Last Amended:  06/01/2006 DB
**
*/
as

select
   CPS_PRIMARY
,  CPS_CODE
,  isnull(CPS_NAME,'')        as CPS_NAME
,  isnull(CPS_SORT_KEY,'')    as CPS_SORT_KEY
,  CPS_DATE_PUTIN
,  CPS_DATE_EDITED
,  isnull(CPS_USER_PUTIN,'')  as CPS_USER_PUTIN
,  isnull(CPS_USER_EDITED,'') as CPS_USER_EDITED
,  CPS_DO_NOT_USE
,  CPS_SHARED
   from
      CST_PROJECT_STRUCTURE
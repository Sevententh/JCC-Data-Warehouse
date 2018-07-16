create view AA_CST_PROJECT_STRUCTURE_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_CST_PROJECT_STRUCTURE_SIMPLE_VIEW
**
** Written     :  25/11/2005 SR
** Last Amended:  03/01/2006 DB, 06/01/2006 DB
**
*/
as

select
   CPS_PRIMARY                as [PRIMARY]
,  CPS_CODE
,  isnull(CPS_NAME,'')        as CPS_NAME
,  isnull(CPS_SORT_KEY,'')    as CPS_SORT_KEY
,  CPS_DATE_PUTIN
,  CPS_DATE_EDITED
,  isnull(CPS_USER_PUTIN,'')  as CPS_USER_PUTIN
,  isnull(CPS_USER_EDITED,'') as CPS_USER_EDITED
,  CPS_DO_NOT_USE
   from
      CST_PROJECT_STRUCTURE
   where
      CPS_SHARED = 1    -- Only list lines that have been created as generic structures
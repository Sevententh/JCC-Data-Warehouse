create view AA_REP_NL_CATEGORY_VIEW
/*
** Returns the nominal category codes for use with crystal reports
** Written:      10/11/2005 RV
** Last Amended: 22/05/2006 SB
**
*/
as

   select

    NC_PRIMARY as [PRIMARY]
   ,NL_CATEGORYNO
   ,substring(NL_CAT_SORTCODE,2,len(NL_CAT_SORTCODE)-1)  as CATEGORYCODE
   ,coalesce(NL_CATEGORYNAME,'')                         as NL_CATEGORYNAME
   ,coalesce(NL_SHORTNAME,'')                            as NL_SHORTNAME
   --Searchable Field
   ,NL_CATEGORYNAME                                      as CATEGORYNAME
   from NL_CATEGORY

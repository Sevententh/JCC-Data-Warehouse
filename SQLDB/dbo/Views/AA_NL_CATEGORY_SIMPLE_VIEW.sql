create view AA_NL_CATEGORY_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_NL_CATEGORY_LIST_S
** Written:      27/05/2004 DG
** Last Amended: 30/06/2004 DG
**
*/
as

	select
	
	 NC_PRIMARY as [PRIMARY]
	,NL_CATEGORYNO
	,substring(NL_CAT_SORTCODE,2,len(NL_CAT_SORTCODE)-1) as CATEGORYCODE
	,coalesce(NL_CATEGORYNAME,'') as NL_CATEGORYNAME
	,coalesce(NL_SHORTNAME,'') as NL_SHORTNAME
	from NL_CATEGORY


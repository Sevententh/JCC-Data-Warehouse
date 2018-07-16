create view AA_NL_MAJOR_HEADING_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_NL_MAJOR_HEADING_LIST_S
** Written:      27/05/2004 DG
** Last Amended: 13/06/2005 SH
**
*/
as

	select
	
	 NM_PRIMARY as [PRIMARY]
	,NL_MAJORCODE
	,NL_MAJORNAME
	,case NL_MAJORMARKER
		when 'P' then 'P&L'
		when 'B' then 'Bal'
		else NL_MAJORMARKER
	end as NL_MAJORMARKER
	from NL_MAJORHEADING
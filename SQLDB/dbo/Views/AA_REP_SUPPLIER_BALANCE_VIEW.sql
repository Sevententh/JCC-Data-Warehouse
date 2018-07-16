create view AA_REP_SUPPLIER_BALANCE_VIEW
/*
** Returns all Purchase Transaction Headers
**
** Written: 15/04/2005 SH
** Last Amended: 
**
*/
as

select PT_PRIMARY as [PRIMARY],
		PT_TRANTYPE,
		PT_HEADER_REF,
		PT_YEAR,
		PT_PERIODNUMBER,
		PT_GROSS,
		PT_NETT,
		PT_VAT,
		PT_DATE,
		PT_COPYSUPP,
		PT_BATCH_FLAG,
		PT_QUERY_FLAG,
		PT_UNALLOCATED,
		isnull( PT_SUB_LEDGER, '' ) as ST_SUB_LEDGER
	from PL_TRANSACTIONS
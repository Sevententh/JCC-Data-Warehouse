create view AA_REP_CUSTOMER_BALANCE_VIEW
/*
** Returns all Sales Transaction Headers
**
** Written: 15/04/2005 SH
** Last Amended: 
**
*/
as

select ST_PRIMARY as [PRIMARY],
		ST_TRANTYPE,
		ST_HEADER_REF,
		ST_YEAR,
		ST_PERIODNUMBER,
		ST_GROSS,
		ST_NETT,
		ST_VAT,
		ST_DATE,
		ST_COPYCUST,
		ST_BATCH_FLAG,
		ST_QUERY_FLAG,
		ST_UNALLOCATED,
		isnull( ST_SUB_LEDGER, '' ) as ST_SUB_LEDGER
	from SL_TRANSACTIONS
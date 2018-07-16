create view AA_CUSTOMER_PERIOD_BALANCE_VIEW
/*
** View
**
** Written:      23/07/2003 NC   
** Last Amended: 23/07/2003 NC
*/
 as
select ST_COPYCUST CUSTOMER, ST_YEAR YEAR, ST_PERIODNUMBER PERIOD
	, case ST_YEAR when 'L' then 13 when 'C' then 26 when 'N' then 39 else 0 end 
	 + ST_PERIODNUMBER PERIOD_SORT
	,sum(case when ST_TRANTYPE = 'INV' then ST_GROSS
                   when ST_TRANTYPE = 'ADR' then ST_GROSS
                   else -ST_GROSS end) PERIOD_BALANCE
from SL_TRANSACTIONS, SL_ACCOUNTS
where ST_COPYCUST = CUCODE and ST_BATCH_FLAG <> 1
group by ST_COPYCUST,ST_YEAR,ST_PERIODNUMBER
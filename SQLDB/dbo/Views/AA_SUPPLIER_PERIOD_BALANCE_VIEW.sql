create view AA_SUPPLIER_PERIOD_BALANCE_VIEW
/*
** View
**
** Written:      23/07/2003 NC   
** Last Amended: 23/07/2003 NC
*/
as
select PT_COPYSUPP SUPPLIER, PT_YEAR YEAR, PT_PERIODNUMBER PERIOD
	, case PT_YEAR when 'L' then 13 when 'C' then 26 when 'N' then 39 else 0 end 
	 + PT_PERIODNUMBER PERIOD_SORT
	,sum(case when PT_TRANTYPE = 'INV' then PT_GROSS
                   when PT_TRANTYPE = 'ACR' then PT_GROSS
                   else -PT_GROSS end) PERIOD_BALANCE
from PL_TRANSACTIONS, PL_ACCOUNTS
where PT_COPYSUPP = SUCODE and PT_BATCH_FLAG <> 1
group by PT_COPYSUPP, PT_YEAR, PT_PERIODNUMBER
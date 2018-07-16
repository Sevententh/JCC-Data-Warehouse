CREATE VIEW DATACHK_SL_Trans_Balances AS
select cucode CustCode,
isnull(sum(case det_type
  when 'CRN' then (det_gross*-1)
  when 'PAY' then (det_gross*-1)
  when 'ACR' then (det_gross*-1)
  else det_gross end),0) SLTransactionBalance
from sl_pl_nl_detail (nolock) right outer join sl_accounts (nolock)
on det_account=cucode
where det_origin like 'S%'
and det_batch_flag <> 1
group by cucode
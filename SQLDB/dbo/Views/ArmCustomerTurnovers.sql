Create VIEW ArmCustomerTurnovers as
select st_copycust CustCode,
st_year TranYear,
st_periodnumber Period,
sum(case st_trantype
  when 'CRN' then (st_nett*-1)
  when 'INV' then (st_nett)
  else 0 end) NewTurnover 
from sl_transactions 
where st_batch_flag <> 1
and st_trantype in ('INV','CRN')
group by st_copycust, st_year, st_periodnumber
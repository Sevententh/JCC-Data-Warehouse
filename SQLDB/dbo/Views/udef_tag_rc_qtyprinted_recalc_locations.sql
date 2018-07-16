CREATE view udef_tag_rc_qtyprinted_recalc_locations as
select LOC_STOCK_CODE Stock_Code, od_locatn Location, loc_qtyprinted Total_On_Location, sum(od_qtyprinted) Total_Ordered_For_Location
from ORD_DETAIL 
join STK_LOCATION
on OD_LOCATN = LOC_CODE
and OD_STOCK_CODE = LOC_STOCK_CODE
where OD_STATUS <> 2
and OD_BATCH_FLAG <> 0
and OD_TYPE = 'O'
group by LOC_STOCK_CODE, OD_LOCATN, LOC_QTYPRINTED
having sum(od_qtyprinted)<>loc_qtyprinted
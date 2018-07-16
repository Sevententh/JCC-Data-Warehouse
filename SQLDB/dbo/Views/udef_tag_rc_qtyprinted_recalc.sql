CREATE view udef_tag_rc_qtyprinted_recalc as
select od_stock_code Stock_Code, stk_qtyprinted Total_On_Stk_Record, sum(od_qtyprinted) Total_Ordered
from ORD_DETAIL join STK_STOCK on OD_STOCK_CODE = stkcode
where OD_STATUS <> 2
and OD_BATCH_FLAG <> 0
and OD_TYPE = 'O'
group by OD_STOCK_CODE, stk_QTYPRINTED
having sum(od_qtyprinted)<>stk_qtyprinted
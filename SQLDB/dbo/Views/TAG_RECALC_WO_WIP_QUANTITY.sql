create view TAG_RECALC_WO_WIP_QUANTITY as
 select stkcode StockCode, STK_WO_WIP_SOP_QUANTITY, isnull(SOPWIPQty,0) SOPWIPCorrect
      ,STK_WO_FREE_WIP_QUANTITY, isnull(WO_WIP_QUANTITY-SOPWIPQty,0) FreeWIPCorrect
   from STK_STOCK
      left join 
            (select isnull(sum(case when WO_WIP_QUANTITY < SOPQty then WO_WIP_QUANTITY else SOPQty end),0) SOPWIPQty
               , isnull(sum(WO_WIP_QUANTITY),0) WO_WIP_QUANTITY
               , WO_STOCK_LINK
               from
               (select isnull(sum(isnull(((OD_QTYORD-OD_QTYDELVD)*OD_QTYUNIT)-OD_QTYRESERVED,0)),0) SOPQty
                     , WO_STOCK_LINK
                     , WO_ORDER_NUMBER
                     , max(case when WO_QUANTITY<WO_QUANTITY_BUILT then 0 else WO_QUANTITY-WO_QUANTITY_BUILT end) WO_WIP_QUANTITY
                  from WO_ORDERS 
                     left join ORD_DETAIL on OD_WO_NUMBER = WO_ORDER_NUMBER and OD_WO_NUMBER > 0
                  where WO_STATUS<10 and WO_LEVEL = 1
                  group by WO_ORDER_NUMBER,WO_STOCK_LINK) Orders
               group by WO_STOCK_LINK) SOPWIP
            on STK_PRIMARY = WO_STOCK_LINK
             where STK_ASSEMBLY='A'
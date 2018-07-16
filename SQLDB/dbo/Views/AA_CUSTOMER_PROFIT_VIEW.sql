create view AA_CUSTOMER_PROFIT_VIEW
/*
** Written: 03/11/2003 SR   
** Last Amended: 
*/
(CustomerCode
,OrderNumber
,Sales
,CostOfSalesInvoiced
,CostOfSalesOrdered
,ProfitInvoiced
,ProfitOrdered
)
as
select
OH_ACCOUNT
,OH_ORDER_NUMBER
,case when OD_QTYORD=0 then (OD_NETT-OD_T_DISCVAL) when OD_QTYDELVD=0 then (OD_NETT-OD_T_DISCVAL) else (((OD_NETT-OD_T_DISCVAL)/OD_QTYORD)*OD_QTYDELVD) end * case OH_TYPE when 'C' then -1 else 1 end
,((case when OD_QTYDELVD=0 then 1 else OD_QTYDELVD end)*((case when OD_QTYUNIT = 0 then 1 else OD_QTYUNIT end)*OD_COSTPRICE)) * case OH_TYPE when 'C' then -1 else 1 end
,((case when OD_QTYORD=0 then 1 else OD_QTYORD end)*((case when OD_QTYUNIT = 0 then 1 else OD_QTYUNIT end)*OD_COSTPRICE)) * case OH_TYPE when 'C' then -1 else 1 end
,(case when OD_QTYORD=0 then (OD_NETT-OD_T_DISCVAL) when OD_QTYDELVD=0 then (OD_NETT-OD_T_DISCVAL) else (((OD_NETT-OD_T_DISCVAL)/OD_QTYORD)*OD_QTYDELVD) end * case OH_TYPE when 'C' then -1 else 1 end)-(((case when OD_QTYDELVD=0 then 1 else OD_QTYDELVD end)*((case when OD_QTYUNIT = 0 then 1 else OD_QTYUNIT end)*OD_COSTPRICE)) * case OH_TYPE when 'C' then -1 else 1 end)
,(case when OD_QTYORD=0 then (OD_NETT-OD_T_DISCVAL) when OD_QTYDELVD=0 then (OD_NETT-OD_T_DISCVAL) else (((OD_NETT-OD_T_DISCVAL)/OD_QTYORD)*OD_QTYDELVD) end * case OH_TYPE when 'C' then -1 else 1 end)-(((case when OD_QTYORD=0 then 1 else OD_QTYORD end)*((case when OD_QTYUNIT = 0 then 1 else OD_QTYUNIT end)*OD_COSTPRICE)) * case OH_TYPE when 'C' then -1 else 1 end)
from
ORD_HEADER
,ORD_DETAIL
where
OH_ORDER_NUMBER=OD_ORDER_NUMBER
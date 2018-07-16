
CREATE VIEW [dbo].[UDEF_AOI_Outstanding_POrders]
 AS 
SELECT POH_ORDER_NUMBR as [Order No], 
isnull(CAST(CONVERT(datetime,POH_DATE) as bigint),0) as [Order Date], 
POH_ACCOUNT as [Supplier Code] , 
SUNAME as [Supplier Name] , POD_QTYORD as [Qty Ord], POD_NETT as [Nett], POD_QTYDELVD as [Qty Del], 
POH_CURR_CODE as [Curr], POD_NETT_C as [PO Curr Nett], POD_CURR_RATE as [PO Curr Rate], 
POD_QTYINVD as [Qty Inv],  POD_UNITCST as [Unit Cost], POD_UNITCST_C as [Unit Cost Curr], 
round((POD_UNITCST) * (POD_QTYORD - POD_QTYINVD),2) as [O/s Exp],
round((POD_UNITCST_C) * (POD_QTYORD - POD_QTYINVD),2) as [O/s Exp Curr],
 POD_ANALYSIS as [Analysis], POD_COSTHEADER as [Project], 
 POD_COSTCENTRE as [C/Ctr], POD_DETAIL as [Description],
 isnull(CAST(CONVERT(datetime,POD_REQDATE)+2 as bigint),0) as [Date Req],
 pod_reqdate,
 isnull(pod_stock_code,'') as [Stock code],
 isnull(STKNAME,'') as [Stock Name]

FROM   dbo.PL_ACCOUNTS 
 INNER JOIN (POP_HEADER INNER JOIN POP_DETAIL ON POH_ORDER_NUMBR=POD_ORDER_NO) ON SUCODE=POD_ACCOUNT
 left outer join stk_stock on POD_STOCK_CODE = STKCODE
WHERE  POH_STATUS<2 AND POH_ORDER_NUMBR<>'*' 


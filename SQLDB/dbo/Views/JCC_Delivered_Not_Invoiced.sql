




CREATE VIEW [dbo].[JCC_Delivered_Not_Invoiced]

/*
** Written     :  01/08/2017 AKT
** Last Amended:  02/08/2017 AKT	
**
*/

AS

SELECT [OD_HEADER_REF]
      ,[OD_ORDER_REF]
      ,[OD_TYPE]
      ,[OD_STATUS]
      ,[OH_STATUS]
      ,CASE
      WHEN [OH_PRIORITY] = 0 THEN 'Normal Order'
      WHEN [OH_PRIORITY] = 3 THEN 'Pro Formas'
      WHEN [OH_PRIORITY] = 4 THEN 'Estimates'
      WHEN [OH_PRIORITY] = 5 THEN 'Progress Claims'
      END AS 'Order Type'
      ,[OD_ENTRY_TYPE]
      ,[OD_DATE]
      ,[OD_REQDATE]
      ,[OD_STOCK_CODE]
      ,[OD_DETAIL]
      ,[OD_QTYORD] as 'Qty Ordered'
      ,[OD_QTYDELVD] as 'Qty Delivered'
      ,[OD_QTYORD] - [OD_QTYDELVD] as 'Outstanding to Deliver'
      ,[OD_QTYINVD] as 'Qty Invoiced'
      ,[OD_QTYORD] - [OD_QTYINVD] as 'Outstanding to Invoice'
      ,[OD_QTYDELVD] - [OD_QTYINVD] as 'Delivered Not Invoiced'
      ,([OD_QTYDELVD] - [OD_QTYINVD]) * [OD_UNITCST] as 'Delivered Not Invoiced Value'
      ,[OH_GROSS] as 'Total Order Gross Value'
      ,[OH_WORK_STATUS] as 'Order Status'
      --,[OD_QTYRESERVED]
      --,[OD_QTYPRINTED]
      ,[Free] as 'Delta Free Stock'
      ,[On Order In] as 'Delta Order In'
      ,[OD_UNITCST]
      ,[OD_NETT]
      ,[OD_ORDER_NUMBER]
      ,[OH_ORDER_NUMBER]
      ,[OD_ACCOUNT]
      ,[OD_LINE_NUMBER]
      ,[OD_WO_NUMBER]
  FROM [JCC_PROD_LIVE].[dbo].[ORD_DETAIL] (NOLOCK)
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[ORD_HEADER] (NOLOCK)
  ON [OD_ORDER_NUMBER] = [OH_ORDER_NUMBER]
  INNER JOIN [JCC_PROD_LIVE].[dbo].[AA_ORDER_VIEW_UDEF_STOCK_QUANTITIES_DELTA] (NOLOCK)
  ON [Stock Code] = [OD_STOCK_CODE]
  WHERE
  ([OD_QTYDELVD] - [OD_QTYINVD]) > 0
  --[OD_QTYORD] <> [OD_QTYDELVD]
  AND
  [OD_ENTRY_TYPE] = 'S'
  AND
  [OH_WORK_STATUS] = 'From WMS'
  --ORDER BY [OD_ORDER_NUMBER]









CREATE VIEW [dbo].[JCC_MOQ_vs_Forecast]

/*
** Written     :  10/10/2013 AKT
** Last Amended:  18/10/2013 AKT	
**
*/

AS

SELECT DISTINCT [STKCODE] as 'SKU Code'
      ,[STKNAME] as 'Stock Description'
      ,[STK_P_CURRCDE1] as 'Currency'
      ,[STK_P_CURRCST1] as 'Currency Cost'
      ,[STK_COSTPRICE] as 'GBP Cost Price'
	  ,[STK_USRCHAR2] as 'Classification'
	  --,[STK_SUPPLIER1] as 'Supplier'
	  ,[STK_SORT_KEY2] as 'Supplier Code'
	  ,[STK_MIN_ORDER1] as 'MOQ'
	  ,MAX([STK_PHYSICAL] - ([STK_WO_UNALLOC_QUANTITY] + [STK_RESERVE_OUT] + [STK_BACK_ORDER_QTY])) AS 'Free Stock'
	  ,SUM([POD_QTYORD] - [POD_QTYDELVD]) as 'Purchase Order Outstanding Qty'
  FROM [JCC_PROD_LIVE].[dbo].[STK_STOCK]
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[STK_STOCK_2]
  ON [STKCODE] = [STKCODE2]
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[STK_STOCK3]
  ON [STKCODE] = [STKCODE3]
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[POP_DETAIL]
  ON [STKCODE] = [POD_STOCK_CODE]
  GROUP BY [STKCODE], [STKNAME], [STK_P_CURRCDE1], [STK_P_CURRCST1], [STK_COSTPRICE], [STK_USRCHAR2], [STK_SORT_KEY2], [STK_MIN_ORDER1]



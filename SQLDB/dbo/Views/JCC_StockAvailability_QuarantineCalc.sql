






CREATE VIEW [dbo].[JCC_StockAvailability_QuarantineCalc]

/*
** Written     :  03/05/2013 AKT
** Last Amended:  08/05/2013 AKT	
**
*/

AS

SELECT DISTINCT [STKCODE] as StockCode
      ,[STKNAME] as StockDescription
      ,
      CASE
      WHEN [LOC_CODE] = 'QU'
      THEN SUM([STK_PHYSICAL]) - SUM([STK_RESERVE_OUT]+[STK_BACK_ORDER_QTY]) - SUM([LOC_PHYSICAL])
      ELSE SUM([STK_PHYSICAL]) - SUM([STK_RESERVE_OUT]+[STK_BACK_ORDER_QTY])
      END
      as FreeStock
  FROM [JCC_PROD_LIVE].[dbo].[STK_STOCK]
  LEFT JOIN
  [JCC_PROD_LIVE].[dbo].[STK_LOCATION]
  ON [STKCODE] = [LOC_STOCK_CODE]
  WHERE LEFT([STKCODE],2) = 'JC'
  AND [STK_PHYSICAL] > 0
  AND [STK_DO_NOT_USE] = 0
  --AND [LOC_CODE] = 'QU'
  GROUP BY [STKCODE], [STKNAME], [LOC_STOCK_CODE], [LOC_CODE]



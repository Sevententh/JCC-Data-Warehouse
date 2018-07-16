




CREATE VIEW [dbo].[JCC_Stock_Assemblies_By_Classification]

/*
** Written     :  10/01/2013 AKT
** Last Amended:  10/01/2013 AKT	
**
*/

AS

SELECT TOP 1000 [STKCODE] as 'Stock Code'
      ,[STKNAME] as 'Stock Description'
      ,[STK_SORT_KEY2] as 'Supplier Code'
      ,[STK_USRCHAR2] as 'Classification'
      ,[AS_MAIN_STKCODE] as 'Parent SKU'
      ,CASE WHEN [AS_MAIN_STKCODE] IS NULL THEN 'Top Level Assembly'
      ELSE 'Component'
      END as 'SKU Type'
  FROM [JCC_PROD_LIVE].[dbo].[STK_STOCK]
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[STK_STOCK3]
  ON [STKCODE] = [STKCODE3]
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[STK_ASSEMBLIES]
  ON [STKCODE] = [AS_PART_CODE]
  WHERE [STK_DO_NOT_USE] = 0








CREATE VIEW [dbo].[JCC_ZZDELTA_ReservedStock] 

/*
** Written     :  11/16/2017 AKT
** Last Amended:  11/16/2017 AKT	
**
*/

AS

SELECT [OD_STOCK_CODE] as 'Stock Code'
	    ,[OD_DETAIL] as 'Description'
	    ,[OD_QTYORD] as 'Qty Held'
	    ,[OD_QTYRESERVED] as 'Qty Allocated'
	    ,[OD_DATE_PUTIN] as 'Date'
  FROM [JCC_PROD_LIVE].[dbo].[ORD_DETAIL]
  WHERE [OD_ACCOUNT] = 'ZZDELTA'



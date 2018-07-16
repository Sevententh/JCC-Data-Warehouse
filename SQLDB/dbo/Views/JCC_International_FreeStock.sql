









CREATE VIEW [dbo].[JCC_International_FreeStock]

/*
** Written     :  01/07/2015 AKT
** Last Amended:  07/08/2017 AKT	
**
*/

AS

SELECT

[LOC_STOCK_CODE] as 'Stock Code'
	  --,[LOC_CODE] as 'Sub-Analysis Code'
	  ,[STKNAME] as 'Product Description'
	  --,SUM([LOC_PHYSICAL]) as 'Physcial Stock'
	  ,[Physical] as 'Physical Stock'
	  --,SUM([LOC_RESERVE_OUT]) as 'Allocated Stock'
	  ,[Warehouse Allocated] as 'Allocated Stock'
	  --,SUM([LOC_BACK_ORDER_QTY]) as 'Unallocated Stock'
	  ,[Unallocated Orders] as 'Unallocated Stock'
	  --,SUM([LOC_WO_ALLOC_QUANTITY]) as 'Works Order Allocated'
	  --,SUM([LOC_WO_UNALLOC_QUANTITY]) as 'Works Order Unallocated'
	  --,SUM([LOC_PHYSICAL] - ([LOC_RESERVE_OUT] + [LOC_BACK_ORDER_QTY] + [LOC_WO_ALLOC_QUANTITY] + [LOC_WO_UNALLOC_QUANTITY])) as 'Free Stock'
	  ,[Free] as 'Free Stock'
	  ,[STK_USRCHAR5] as 'Classification'
	  ,CASE WHEN [STK_DO_NOT_USE] = 1 THEN 'Inactive'
	  WHEN [STK_DO_NOT_USE] = 0 THEN 'Active' END as 'Inactive Flag'
	  ,[STK_COSTPRICE1] as 'Cost Price'
	  ,[STK_FIFO_VALU] as 'FIFO Value'
	  ,[STK_ORDER_IN] as 'Stock On Order'
	  ,[STK_WO_FREE_WIP_QUANTITY] + [STK_WO_WIP_SOP_QUANTITY] as 'Works Order Inbound'
	  ,[STK_SORT_KEY2] as 'Supplier Account'
  FROM [JCC_PROD_LIVE].[dbo].[STK_LOCATION] WITH (NOLOCK)
  INNER JOIN [JCC_PROD_LIVE].[dbo].[STK_STOCK3] WITH (NOLOCK) ON [LOC_STOCK_CODE] = [STKCODE3]
  INNER JOIN [JCC_PROD_LIVE].[dbo].[STK_STOCK] WITH (NOLOCK) ON [LOC_STOCK_CODE] = [STKCODE]
  INNER JOIN [JCC_PROD_LIVE].[dbo].[STK_STOCK_2] WITH (NOLOCK) ON [LOC_STOCK_CODE] = [STKCODE2]
  INNER JOIN [JCC_PROD_LIVE].[dbo].[AA_ORDER_VIEW_UDEF_STOCK_QUANTITIES_DELTA] WITH (NOLOCK) ON [LOC_STOCK_CODE] = [Stock Code]
  WHERE [LOC_CODE] in ('BOGNOR')
  --GROUP BY [STKNAME], [LOC_STOCK_CODE], [STK_USRCHAR5], [STK_DO_NOT_USE], [STK_SORT_KEY2], [STK_COSTPRICE1]
  --ORDER BY [LOC_STOCK_CODE]









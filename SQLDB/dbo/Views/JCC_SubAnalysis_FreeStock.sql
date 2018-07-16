





CREATE VIEW [dbo].[JCC_SubAnalysis_FreeStock]

/*
** Written     :  01/07/2015 AKT
** Last Amended:  01/07/2015 AKT	
**
*/

AS

SELECT

[LOC_STOCK_CODE] as 'Stock Code'
	  --,[LOC_CODE] as 'Sub-Analysis Code'
	  --,[LOC_NAME]
	  ,SUM([LOC_PHYSICAL]) as 'Physcial Stock'
	  ,SUM([LOC_RESERVE_OUT]) as 'Allocated Stock'
	  ,SUM([LOC_BACK_ORDER_QTY]) as 'Unallocated Stock'
	  ,SUM([LOC_WO_ALLOC_QUANTITY]) as 'Works Order Allocated'
	  ,SUM([LOC_WO_UNALLOC_QUANTITY]) as 'Works Order Unallocated'
	  ,SUM([LOC_PHYSICAL] - ([LOC_RESERVE_OUT] + [LOC_BACK_ORDER_QTY] + [LOC_WO_ALLOC_QUANTITY] + [LOC_WO_UNALLOC_QUANTITY])) as 'Free Stock'
  FROM [JCC_PROD_LIVE].[dbo].[STK_LOCATION] WITH (NOLOCK)
  WHERE [LOC_CODE] in ('BULK', 'PICK', 'EXT')
  GROUP BY [LOC_STOCK_CODE]

















CREATE VIEW [dbo].[JCC_SalesTeam_Daily_Perfomance_Summary]

/*
** Written     :  11/09/2013 AKT
** Last Amended:  30/06/2014 AKT	
**
*/

AS

SELECT [OD_ORDER_NUMBER] as OrderNumber
      ,[OD_ACCOUNT] as OrderAccount
      ,[CUNAME] as 'Customer Name'
      ,[CU_ADDRESS_USER1] as 'Town'
      ,[OD_ORDER_REF] as CustomerReference
      ,CASE
	   WHEN [OD_TYPE] = 'C' THEN 'Credit Note'
	   WHEN [OD_TYPE] = 'O' THEN 'Order'
	   END as Order_or_Credit
	  ,CASE
	  WHEN [OD_STATUS] = 0 THEN 'Incomplete'
	  WHEN [OD_STATUS] = 1 THEN 'Delivered, part Invoiced'
	  WHEN [OD_STATUS] = 2 THEN 'Complete'
	  END as OrderStatus
      ,CASE
      WHEN [OD_ENTRY_TYPE] = 'S' THEN 'Stock'
      WHEN [OD_ENTRY_TYPE] = 'T' THEN 'Text'
      WHEN [OD_ENTRY_TYPE] = 'P' THEN 'Price'
      END as EntryType
      ,[OH_WORK_STATUS] as OrderType
      ,CONVERT(VARCHAR(11),[OD_DATE],103) as OrderDate
	  ,CONVERT(VARCHAR(11),[OD_REQDATE],103) as RequiredByDate
	  ,[OD_STOCK_CODE] as StockCode
      ,[OD_DETAIL] as StockDescription
      ,[Range] as KeyProductRange
      ,[OD_QTYORD] as QuantityOrdered
      ,[OD_QTYDELVD] as QuantityDelivered
      ,[OD_QTYINVD] as QuantityInvoiced
      ,[OH_CURRENCYCODE] as 'Currency'
      ,[OD_UNITCST] as UnitCost
      ,CASE
      WHEN [OD_TYPE] = 'C' THEN ([OD_NETT] * -1)
      ELSE [OD_NETT]
      END as NettValue
      ,CASE
      WHEN [OD_TYPE] = 'C' THEN ([OD_GROSS] * -1)
      ELSE [OD_GROSS]
      END as GrossValue
      ,[OD_LINEDISC] as 'LineDiscount%'
      ,[OD_L_DISCVAL] as DiscountValue
      ,[OD_COSTPRICE] as CostPrice
      ,[OD_LOCATN] as SubAnalysisLocation
      ,[OD_PRICE_CODE] as PriceCode
      ,CONVERT(VARCHAR(11),[OD_DATE_PUTIN],103) as DateEntered
      ,CASE
       WHEN CONVERT(VARCHAR(11),[OD_DATE_PUTIN],103) = CONVERT(VARCHAR(11),GETDATE(),103)
       --CONVERT(VARCHAR(11),GETDATE(),103)
       THEN CONVERT(VARCHAR(8),[OD_DATE_PUTIN],108)
       END as OrderTime
       ,CASE
       WHEN [OH_PRIORITY] = 0 THEN 'Standard Order'
       WHEN [OH_PRIORITY] = 3 THEN 'Pro Forma'
       WHEN [OH_PRIORITY] = 4 THEN 'Estimate'
       WHEN [OH_PRIORITY] = 5 THEN 'Progress Claims'
       END as SystemTransactionType
       ,[SalesManagerName] as 'ASM'
       ,[CUUSER1] as 'Buying Group'
       ,[ProductGroup] as 'IPG'
       ,[OH_BATCH_REF] as ProjectReference
,
CASE
WHEN [OH_SUB_LEDGER] = 'DHPROJECT' THEN 'Daniel Holden'
WHEN [OH_SUB_LEDGER] = 'ITPROJECT' THEN 'Ian Tucker'
WHEN [OH_SUB_LEDGER] = 'JIPROJECT' THEN 'Jason Ingham'
WHEN [OH_SUB_LEDGER] = 'NCPROJECT' THEN 'Noel Cox'
WHEN [OH_SUB_LEDGER] = 'SCPROJECT' THEN 'Sebastiano Crismann'
WHEN [OH_SUB_LEDGER] = 'WJPROJECT' THEN 'Will Jennings'
ELSE ''
END
as ProjectManager
,[OD_ANALYSIS] as 'Nominal Account Code'
       ,'Dimensions Live DB' as DatabaseName
  FROM [JCC_PROD_LIVE].[dbo].[ORD_DETAIL]
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[ORD_HEADER]
  ON [OD_ORDER_NUMBER] = [OH_ORDER_NUMBER]
  LEFT OUTER JOIN [JCC_DW_PRD_Presentation].[dbo].[DimProduct]
  ON [OD_STOCK_CODE] COLLATE DATABASE_DEFAULT = [ProductCode] COLLATE DATABASE_DEFAULT
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[SL_ACCOUNTS]
  ON [OD_ACCOUNT] = [CUCODE]
  LEFT OUTER JOIN [JCC_DW_PRD_Presentation].[dbo].[DimSalesManager]
  ON SUBSTRING([CUSORT], 1, 4) COLLATE DATABASE_DEFAULT = [SalesManagerCode] COLLATE DATABASE_DEFAULT
  WHERE CONVERT(VARCHAR(11),[OD_DATE],103) = CONVERT(VARCHAR(11),GETDATE(),103)
  
  UNION ALL
  
  SELECT [OD_ORDER_NUMBER] as OrderNumber
      ,[OD_ACCOUNT] as OrderAccount
      ,[CUNAME] as 'Customer Name'
      ,[CU_ADDRESS_USER1] as 'Town'
      ,[OD_ORDER_REF] as CustomerReference
      ,CASE
	   WHEN [OD_TYPE] = 'C' THEN 'Credit Note'
	   WHEN [OD_TYPE] = 'O' THEN 'Order'
	   END as Order_or_Credit
	  ,CASE
	  WHEN [OD_STATUS] = 0 THEN 'Incomplete'
	  WHEN [OD_STATUS] = 1 THEN 'Delivered, part Invoiced'
	  WHEN [OD_STATUS] = 2 THEN 'Complete'
	  END as OrderStatus
      ,CASE
      WHEN [OD_ENTRY_TYPE] = 'S' THEN 'Stock'
      WHEN [OD_ENTRY_TYPE] = 'T' THEN 'Text'
      WHEN [OD_ENTRY_TYPE] = 'P' THEN 'Price'
      END as EntryType
      ,[OH_WORK_STATUS] as OrderType
      ,CONVERT(VARCHAR(11),[OD_DATE],103) as OrderDate
	  ,CONVERT(VARCHAR(11),[OD_REQDATE],103) as RequiredByDate
	  ,[OD_STOCK_CODE] as StockCode
      ,[OD_DETAIL] as StockDescription
      ,[Range] as KeyProductRange
      ,[OD_QTYORD] as QuantityOrdered
      ,[OD_QTYDELVD] as QuantityDelivered
      ,[OD_QTYINVD] as QuantityInvoiced
      ,[OH_CURRENCYCODE] as 'Currency'
      ,[OD_UNITCST] as UnitCost
      ,CASE
      WHEN [OD_TYPE] = 'C' THEN ([OD_NETT] * -1)
      ELSE [OD_NETT]
      END as NettValue
      ,CASE
      WHEN [OD_TYPE] = 'C' THEN ([OD_GROSS] * -1)
      ELSE [OD_GROSS]
      END as GrossValue
      ,[OD_LINEDISC] as 'LineDiscount%'
      ,[OD_L_DISCVAL] as DiscountValue
      ,[OD_COSTPRICE] as CostPrice
      ,[OD_LOCATN] as SubAnalysisLocation
      ,[OD_PRICE_CODE] as PriceCode
      ,CONVERT(VARCHAR(11),[OD_DATE_PUTIN],103) as DateEntered
      ,CASE
       WHEN CONVERT(VARCHAR(11),[OD_DATE_PUTIN],103) = CONVERT(VARCHAR(11),GETDATE(),103)
       --CONVERT(VARCHAR(11),GETDATE(),103)
       THEN CONVERT(VARCHAR(8),[OD_DATE_PUTIN],108)
       END as OrderTime
       ,CASE
       WHEN [OH_PRIORITY] = 0 THEN 'Standard Order'
       WHEN [OH_PRIORITY] = 3 THEN 'Pro Forma'
       WHEN [OH_PRIORITY] = 4 THEN 'Estimate'
       WHEN [OH_PRIORITY] = 5 THEN 'Progress Claims'
       END as SystemTransactionType
       ,[SalesManagerName] as 'ASM'
       ,[CUUSER1] as 'Buying Group'
       ,[ProductGroup] as 'IPG'
       ,[OH_BATCH_REF] as ProjectReference
,
CASE
WHEN [OH_SUB_LEDGER] = 'DHPROJECT' THEN 'Daniel Holden'
WHEN [OH_SUB_LEDGER] = 'ITPROJECT' THEN 'Ian Tucker'
WHEN [OH_SUB_LEDGER] = 'JIPROJECT' THEN 'Jason Ingham'
WHEN [OH_SUB_LEDGER] = 'NCPROJECT' THEN 'Noel Cox'
WHEN [OH_SUB_LEDGER] = 'SCPROJECT' THEN 'Sebastiano Crismann'
WHEN [OH_SUB_LEDGER] = 'WJPROJECT' THEN 'Will Jennings'
ELSE ''
END
as ProjectManager
,[OD_ANALYSIS] as 'Nominal Account Code'
       ,'Dimensions Projects DB' as DatabaseName
  FROM [JCC_PROJECTS].[dbo].[ORD_DETAIL]
  LEFT OUTER JOIN [JCC_PROJECTS].[dbo].[ORD_HEADER]
  ON [OD_ORDER_NUMBER] = [OH_ORDER_NUMBER]
  LEFT OUTER JOIN [JCC_DW_PRD_Presentation].[dbo].[DimProduct]
  ON [OD_STOCK_CODE] COLLATE DATABASE_DEFAULT = [ProductCode] COLLATE DATABASE_DEFAULT
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[SL_ACCOUNTS]
  ON [OD_ACCOUNT] = [CUCODE]
  LEFT OUTER JOIN [JCC_DW_PRD_Presentation].[dbo].[DimSalesManager]
  ON SUBSTRING([CUSORT], 1, 4) COLLATE DATABASE_DEFAULT = [SalesManagerCode] COLLATE DATABASE_DEFAULT
  WHERE CONVERT(VARCHAR(11),[OD_DATE],103) = CONVERT(VARCHAR(11),GETDATE(),103)
  
  --WHERE CONVERT(VARCHAR(11),[OD_DATE],103) = '03/09/2013'
  --CONVERT(VARCHAR(11),GETDATE(),103)







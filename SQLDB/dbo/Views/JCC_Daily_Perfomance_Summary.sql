






CREATE VIEW [dbo].[JCC_Daily_Perfomance_Summary]

/*
** Written     :  11/09/2013 AKT
** Last Amended:  11/09/2013 AKT	
**
*/

AS

SELECT [OD_ORDER_NUMBER] as OrderNumber
      ,[OD_ACCOUNT] as OrderAccount
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
      ,CASE
       WHEN [OD_STOCK_CODE] IN ('JC94198BN', 'JC94198CH', 'JC94198WH', 'JC94199BN', 'JC94199CH', 'JC94199WH', 'SFRD3LEDC-CW', 'SFRD3LEDC-WW', 'SFRD3LEDN-CW', 'SFRD3LEDN-WW', 'SFRD3LEDW-CW', 'SFRD3LEDW-WW', 'AC47034', 'AC47035', 'AC47036', 'AC47037', 'AC47038', 'AC47039') THEN 'FGLED3'
       WHEN [OD_STOCK_CODE] IN ('JC23201WOP', 'JC23201WPR', 'JC23202WOP', 'JC23202WPR', 'JC23203WOP', 'JC23203WPR', 'JC23204WOP', 'JC23205WOP', 'JC23206WOP', 'JC23207WOP', 'JC23208WOP', 'JC23209WOP', 'JC23211WOP', 'JC23211WPR', 'JC23212WOP', 'JC23212WPR', 'JC23213WOP', 'JC23213WPR', 'JC23215WOP', 'JC23217WOP', 'JC23219WOP', 'AC47044', 'AC47045', 'AC47046', 'AC47047', 'AC47048', 'AC47049', 'AC47050', 'AC47051', 'AC47053', 'AC47055', 'SJC23201WOP', 'SJC23201WPR', 'SJC23202WOP', 'SJC23202WPR', 'SJC23203WOP', 'SJC23203WPR', 'SJC23205WOP', 'SJC23207WOP', 'SJC23209WOP', 'SJC23211WOP', 'SJC23211WPR', 'SJC23212WOP', 'SJC23212WPR', 'SJC23213WOP', 'SJC23213WPR', 'SJC23215WOP', 'SJC23217WOP', 'SJC23219WOP') THEN 'RadiaLED'
       WHEN [OD_STOCK_CODE] IN ('JC71301', 'JC71302', 'JC71303', 'JC71304', 'JC71305', 'JC71306', 'JC71307', 'JC71308', 'JC71309') THEN 'Skytile Surface'
       ELSE 'Standard Stock'
       END as KeyProductRange
      ,[OD_QTYORD] as QuantityOrdered
      ,[OD_QTYDELVD] as QuantityDelivered
      ,[OD_QTYINVD] as QuantityInvoiced
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
       --THEN CONVERT(VARCHAR(8),[OD_DATE_PUTIN],108)
       THEN [OD_DATE_PUTIN]
       END as OrderTime
       ,CASE
       WHEN [OH_PRIORITY] = 0 THEN 'Standard Order'
       WHEN [OH_PRIORITY] = 3 THEN 'Pro Forma'
       WHEN [OH_PRIORITY] = 4 THEN 'Estimate'
       WHEN [OH_PRIORITY] = 5 THEN 'Progress Claims'
       END as SystemTransactionType
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
       ,'Dimensions Live DB' as DatabaseName
  FROM [JCC_PROD_LIVE].[dbo].[ORD_DETAIL]
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[ORD_HEADER]
  ON [OD_ORDER_NUMBER] = [OH_ORDER_NUMBER]
  WHERE CONVERT(VARCHAR(11),[OD_DATE],103) = CONVERT(VARCHAR(11),GETDATE(),103)
  
  UNION ALL
  
  SELECT [OD_ORDER_NUMBER] as OrderNumber
      ,[OD_ACCOUNT] as OrderAccount
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
      ,CASE
       WHEN [OD_STOCK_CODE] IN ('JC94198BN', 'JC94198CH', 'JC94198WH', 'JC94199BN', 'JC94199CH', 'JC94199WH', 'SFRD3LEDC-CW', 'SFRD3LEDC-WW', 'SFRD3LEDN-CW', 'SFRD3LEDN-WW', 'SFRD3LEDW-CW', 'SFRD3LEDW-WW', 'AC47034', 'AC47035', 'AC47036', 'AC47037', 'AC47038', 'AC47039') THEN 'FGLED3'
       WHEN [OD_STOCK_CODE] IN ('JC23201WOP', 'JC23201WPR', 'JC23202WOP', 'JC23202WPR', 'JC23203WOP', 'JC23203WPR', 'JC23204WOP', 'JC23205WOP', 'JC23206WOP', 'JC23207WOP', 'JC23208WOP', 'JC23209WOP', 'JC23211WOP', 'JC23211WPR', 'JC23212WOP', 'JC23212WPR', 'JC23213WOP', 'JC23213WPR', 'JC23215WOP', 'JC23217WOP', 'JC23219WOP', 'AC47044', 'AC47045', 'AC47046', 'AC47047', 'AC47048', 'AC47049', 'AC47050', 'AC47051', 'AC47053', 'AC47055', 'SJC23201WOP', 'SJC23201WPR', 'SJC23202WOP', 'SJC23202WPR', 'SJC23203WOP', 'SJC23203WPR', 'SJC23205WOP', 'SJC23207WOP', 'SJC23209WOP', 'SJC23211WOP', 'SJC23211WPR', 'SJC23212WOP', 'SJC23212WPR', 'SJC23213WOP', 'SJC23213WPR', 'SJC23215WOP', 'SJC23217WOP', 'SJC23219WOP') THEN 'RadiaLED'
       WHEN [OD_STOCK_CODE] IN ('JC71301', 'JC71302', 'JC71303', 'JC71304', 'JC71305', 'JC71306', 'JC71307', 'JC71308', 'JC71309') THEN 'Skytile Surface'
       ELSE 'Standard Stock'
       END as KeyProductRange
      ,[OD_QTYORD] as QuantityOrdered
      ,[OD_QTYDELVD] as QuantityDelivered
      ,[OD_QTYINVD] as QuantityInvoiced
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
       --THEN CONVERT(VARCHAR(8),[OD_DATE_PUTIN],108)
       THEN [OD_DATE_PUTIN]
       END as OrderTime
       ,CASE
       WHEN [OH_PRIORITY] = 0 THEN 'Standard Order'
       WHEN [OH_PRIORITY] = 3 THEN 'Pro Forma'
       WHEN [OH_PRIORITY] = 4 THEN 'Estimate'
       WHEN [OH_PRIORITY] = 5 THEN 'Progress Claims'
       END as SystemTransactionType
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
       ,'Dimensions Projects DB' as DatabaseName
  FROM [JCC_PROJECTS].[dbo].[ORD_DETAIL]
  LEFT OUTER JOIN [JCC_PROJECTS].[dbo].[ORD_HEADER]
  ON [OD_ORDER_NUMBER] = [OH_ORDER_NUMBER]
  WHERE CONVERT(VARCHAR(11),[OD_DATE],103) = CONVERT(VARCHAR(11),GETDATE(),103)







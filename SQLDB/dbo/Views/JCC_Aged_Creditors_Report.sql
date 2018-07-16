





CREATE VIEW [dbo].[JCC_Aged_Creditors_Report]

/*
** Written     :  12/09/2013 AKT
** Last Amended:  24/10/2013 AKT	
**
*/

AS

SELECT [SupplierCode]
      ,[SupplierName]
      ,MAX([Balance]) as Balance
      ,CASE WHEN [OutstandingUpto30byTransactionDate] < 0 THEN 0
      ELSE SUM([OutstandingUpto30byTransactionDate]) END as 'Up to 30 Days'
      ,CASE WHEN [Outstanding31to60byTransactionDate] < 0 THEN 0
      ELSE SUM([Outstanding31to60byTransactionDate]) END as '31-60 Days'
      ,CASE WHEN SUM([Outstanding61to90byTransactionDate] + [Outstanding91to120byTransactionDate] + [Outstanding121to180byTransactionDate]+ [OutstandingOver180byTransactionDate]) < 0 THEN 0
      ELSE SUM([Outstanding61to90byTransactionDate] + [Outstanding91to120byTransactionDate] + [Outstanding121to180byTransactionDate]+ [OutstandingOver180byTransactionDate]) END as 'Over 60 Days'
      ,CASE WHEN [Outstanding] < 0 THEN SUM([Outstanding]) * -1
      ELSE 0
      END AS 'Unallocated Debts'
      ,'JCC Prod Live' as 'Database Name'
  FROM [JCC_PROD_LIVE].[DASHBOARD].[AA_ARSDB_AGED_CREDITORS_VIEW]
  GROUP BY [SupplierCode],[SupplierName],[Outstanding],[OutstandingUpto30byTransactionDate],[Outstanding31to60byTransactionDate]

UNION ALL

SELECT [SupplierCode]
      ,[SupplierName]
      ,MAX([Balance]) as Balance
      ,CASE WHEN [OutstandingUpto30byTransactionDate] < 0 THEN 0
      ELSE SUM([OutstandingUpto30byTransactionDate]) END as 'Up to 30 Days'
      ,CASE WHEN [Outstanding31to60byTransactionDate] < 0 THEN 0
      ELSE SUM([Outstanding31to60byTransactionDate]) END as '31-60 Days'
      ,CASE WHEN SUM([Outstanding61to90byTransactionDate] + [Outstanding91to120byTransactionDate] + [Outstanding121to180byTransactionDate]+ [OutstandingOver180byTransactionDate]) < 0 THEN 0
      ELSE SUM([Outstanding61to90byTransactionDate] + [Outstanding91to120byTransactionDate] + [Outstanding121to180byTransactionDate]+ [OutstandingOver180byTransactionDate]) END as 'Over 60 Days'
      ,CASE WHEN [Outstanding] < 0 THEN SUM([Outstanding]) * -1
      ELSE 0
      END AS 'Unallocated Debts'
      ,'Shires Holdings' as 'Database Name'
  FROM [SHIRES_HOLDINGS].[DASHBOARD].[AA_ARSDB_AGED_CREDITORS_VIEW]
  GROUP BY [SupplierCode],[SupplierName],[Outstanding],[OutstandingUpto30byTransactionDate],[Outstanding31to60byTransactionDate]











CREATE VIEW [dbo].[JCC_Purchase_IPG_Summary]

/*
** Written     :  04/09/2014 AKT
** Last Amended:  04/09/2014 AKT	
**
*/

AS

 SELECT [DET_NOMINALDR] as 'Nominal Code'
		,[DET_ANALYSIS] as 'Analysis'
	    ,[NNAME] as 'Nominal Name'
	    ,CASE WHEN [NNAME] like 'COS 00%' THEN SUBSTRING([NNAME],4,6)
	    END AS 'IPG'
	    ,[DET_TYPE] as 'Transaction Type'
	    ,[DET_ACCOUNT] as 'Account Code'
	    ,[SUNAME] as 'Account Name'
	    ,[DET_COUNTRY_CDE] as 'Country Code'
	    ,[DET_STOCK_CODE] as 'Stock Code'
	    --,CASE WHEN [DET_DESCRIPTION] = '' THEN [STKNAME]
	    --ELSE [DET_DESCRIPTION] END as 'Stock Description'
	    ,[DET_QUANTITY] as 'Quantity'
	    ,[DET_NETT] as 'Nett Value'
	    ,[DET_DATE] as 'Transaction Date'
	    ,[DET_DATE_PUTIN] as 'Date Entered'
	    ,[DET_PRIMARY] as 'Audit No'
  FROM [JCC_PROD_LIVE].[dbo].[SL_PL_NL_DETAIL]
  INNER JOIN [JCC_PROD_LIVE].[dbo].[NL_ACCOUNTS]
  ON [DET_NOMINALDR] = [NCODE]
  INNER JOIN [JCC_PROD_LIVE].[dbo].[PL_ACCOUNTS]
  ON [DET_ACCOUNT] = [SUCODE]
  INNER JOIN [JCC_PROD_LIVE].[dbo].[STK_STOCK]
  ON [DET_STOCK_CODE] = [STKCODE]
  WHERE [DET_LEDGER] = 'PL'
  AND [DET_NOMINALDR] like '5%'
  AND [DET_DATE] >= '2013-01-01 00:00:00.000'






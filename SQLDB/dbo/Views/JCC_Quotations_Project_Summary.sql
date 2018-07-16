









CREATE VIEW [dbo].[JCC_Quotations_Project_Summary]

/*
** Written     :  23/05/2013 AKT
** Last Amended:  23/08/2013 AKT	
**
*/

AS

SELECT

-- ProjectsDB.[OH_ORDER_NUMBER] as QuoteNumber
 ProjectsDB.[OH_ORDER_REF] as ProjectName
--,ProjectsDB.[OH_DESCRIPTION] as AdditonalDescription
--,CONVERT(CHAR(4), ProjectsDB.[OH_DATE], 100) + CONVERT(CHAR(4), ProjectsDB.[OH_DATE], 120) as QuoteYearMonth
,
--CASE
--WHEN
--ProjectsDB.[OH_SUB_LEDGER] <> ''
--COUNT(ProjectsDB.[OH_ORDER_REF]) < 2
--THEN
CASE
WHEN ProjectsDB.[OH_BATCH_REF] = ''
THEN
SUBSTRING(ProjectsDB.[OH_SUB_LEDGER],0,3) + CONVERT(CHAR(2), MIN(ProjectsDB.[OH_DATE]), 103) + CONVERT(CHAR(2), MIN(ProjectsDB.[OH_DATE]), 101) + RIGHT(MIN(ProjectsDB.[OH_ORDER_NUMBER]),2)
ELSE ProjectsDB.[OH_BATCH_REF]
END
as ProjectReference
,MIN(ProjectsDB.[OH_DATE]) as FirstQuoteDate
,MAX(ProjectsDB.[OH_DATE]) as LastQuoteDate
,COUNT(ProjectsDB.[OH_DATE]) as NumberOfQuotes
,COUNT(DISTINCT ProjectsDB.[OH_ACCOUNT]) as NumberOfCustomersQuoted
--,ProjectsCustomerRef.[CUNAME] as QuoteCustomerName
--,ProjectsDB.[OH_PROBABILITY] as Probability
--,SUBSTRING(ProjectsDB.[OH_CUSORT],6,255) as ASM
--,ProjectsDB.[OH_BATCH_REF] as ProjectReference
,
CASE
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'DHPROJECT' THEN 'Daniel Holden'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'ITPROJECT' THEN 'Ian Tucker'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'JIPROJECT' THEN 'Jason Ingham'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'NCPROJECT' THEN 'Noel Cox'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'SCPROJECT' THEN 'Sebastiano Crismann'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'WJPROJECT' THEN 'Will Jennings'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'LWPROJECT' THEN 'Lucy Wilson'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'DTPROJECT' THEN 'Danielle Tuck'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'ARPROJECT' THEN 'Annelise Roberts'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'YHPROJECT' THEN 'Yazmin Hills'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'AMPROJECT' THEN 'Anthony McCreadie'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'ENPROJECT' THEN 'Ellie Noble'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'LGPROJECT' THEN 'Luke Gibson'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'RLPROJECT' THEN 'Robert Ljubojev'
ELSE ''
END
as ProjectManager
,SUM(ProjectsDB.[OH_GROSS]) as TotalQuoteGrossValue
,SUM(ProjectsDB.[OH_NETT]) as TotalQuoteNettValue
--,CASE
--WHEN ProjectsDB.[OH_ORDER_REF] IN (LiveDB.[OH_ORDER_REF], LiveDB.[OH_DESCRIPTION])
--AND LiveDB.[OH_NETT] > 0
----AND ProjectsDB.[OH_ACCOUNT] = LiveDB.[OH_ACCOUNT]
--THEN 'WON'
--WHEN
--ProjectsDB.[OH_WORK_STATUS] = 'Quote - Lost'
--THEN 'LOST'
--ELSE 'PENDING'
--END
--as WonLostPending
--,CASE
--WHEN ProjectsDB2.[OH_PRIORITY] = 0
--AND ProjectsDB.[OH_ORDER_REF] = ProjectsDB2.[OH_ORDER_REF]
--THEN ProjectsDB2.[OH_ORDER_NUMBER]
--ELSE
--LiveDB.[OH_ORDER_NUMBER]
--END
--as OrderNumber
,MIN(LiveDB.[OH_DATE]) as FirstOrderDate
,MAX(LiveDB.[OH_DATE]) as LastOrderDate
--,LiveDB.[OH_ACCOUNT] as OrderAccountCode
--,OrderCustomerRef.[CUNAME] as OrderCustomerName
,SUM(LiveDB.[OH_NETT]) as TotalOrderValue
--,'Quote Notes: ' + CAST(ProjectsDB.[OH_INTERNL_NOTE] AS nvarchar(max)) + CHAR(13)+CHAR(10) + 'Order Notes: ' + CAST(LiveDB.[OH_INTERNL_NOTE] AS nvarchar(max)) as Notes
--,CASE
--WHEN
--ProjectsDB.[OH_PRIORITY] = 0
--AND LiveDB.[OH_PRIORITY] = 0
--THEN 'Full Order'
--WHEN
--ProjectsDB.[OH_PRIORITY] = 4
--AND LiveDB.[OH_PRIORITY] = 0
--THEN 'Quoted and Ordered'
--WHEN ProjectsDB.[OH_PRIORITY] = 4
--AND LiveDB.[OH_PRIORITY] = 4
--THEN 'Quote'
--ELSE ''
--END
--AS QuoteOrOrder
,'Projects' as 'Database'
FROM [JCC_PROJECTS].[dbo].[ORD_HEADER] ProjectsDB WITH (NOLOCK)
LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[ORD_HEADER] LiveDB WITH (NOLOCK)
ON ProjectsDB.[OH_ORDER_REF] = LiveDB.[OH_ORDER_REF]
LEFT OUTER JOIN [JCC_PROJECTS].[dbo].[ORD_HEADER] ProjectsDB2 WITH (NOLOCK)
ON ProjectsDB.[OH_ORDER_REF] = ProjectsDB2.[OH_ORDER_REF]
AND ProjectsDB2.[OH_PRIORITY] = 0
--AND ProjectsDB.[OH_ACCOUNT] = LiveDB.[OH_ACCOUNT]
LEFT OUTER JOIN [JCC_PROJECTS].[dbo].[SL_ACCOUNTS] ProjectsCustomerRef WITH (NOLOCK)
ON ProjectsDB.[OH_ACCOUNT] = ProjectsCustomerRef.[CUCODE]
LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[SL_ACCOUNTS] OrderCustomerRef WITH (NOLOCK)
ON LiveDB.[OH_ACCOUNT] = OrderCustomerRef.[CUCODE]
WHERE ProjectsDB.[OH_PRIORITY] = 4
AND ProjectsDB.[OH_SUB_LEDGER] <> ''
--ORDER BY ProjectsDB.[OH_DATE]
GROUP BY ProjectsDB.[OH_ORDER_REF], ProjectsDB.[OH_SUB_LEDGER], ProjectsDB.[OH_BATCH_REF]
--ORDER BY FirstQuoteDate


UNION ALL


SELECT

-- ProjectsDB.[OH_ORDER_NUMBER] as QuoteNumber
 ProjectsDB.[OH_ORDER_REF] as ProjectName
--,ProjectsDB.[OH_DESCRIPTION] as AdditonalDescription
--,CONVERT(CHAR(4), ProjectsDB.[OH_DATE], 100) + CONVERT(CHAR(4), ProjectsDB.[OH_DATE], 120) as QuoteYearMonth
,
--CASE
--WHEN
--ProjectsDB.[OH_SUB_LEDGER] <> ''
--COUNT(ProjectsDB.[OH_ORDER_REF]) < 2
--THEN
CASE
WHEN ProjectsDB.[OH_BATCH_REF] = ''
THEN
SUBSTRING(ProjectsDB.[OH_SUB_LEDGER],0,3) + CONVERT(CHAR(2), MIN(ProjectsDB.[OH_DATE]), 103) + CONVERT(CHAR(2), MIN(ProjectsDB.[OH_DATE]), 101) + RIGHT(CAST(MIN(ProjectsDB.[OH_ORDER_NUMBER]) as INT),2)
ELSE ProjectsDB.[OH_BATCH_REF]
END
as ProjectReference
,MIN(ProjectsDB.[OH_DATE]) as FirstQuoteDate
,MAX(ProjectsDB.[OH_DATE]) as LastQuoteDate
,COUNT(ProjectsDB.[OH_DATE]) as NumberOfQuotes
,COUNT(DISTINCT ProjectsDB.[OH_ACCOUNT]) as NumberOfCustomersQuoted
--,ProjectsCustomerRef.[CUNAME] as QuoteCustomerName
--,ProjectsDB.[OH_PROBABILITY] as Probability
--,SUBSTRING(ProjectsDB.[OH_CUSORT],6,255) as ASM
--,ProjectsDB.[OH_BATCH_REF] as ProjectReference
,
CASE
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'DHPROJECT' THEN 'Daniel Holden'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'ITPROJECT' THEN 'Ian Tucker'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'JIPROJECT' THEN 'Jason Ingham'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'NCPROJECT' THEN 'Noel Cox'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'SCPROJECT' THEN 'Sebastiano Crismann'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'WJPROJECT' THEN 'Will Jennings'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'LWPROJECT' THEN 'Lucy Wilson'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'DTPROJECT' THEN 'Danielle Tuck'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'ARPROJECT' THEN 'Annelise Roberts'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'YHPROJECT' THEN 'Yazmin Hills'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'AMPROJECT' THEN 'Anthony McCreadie'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'ENPROJECT' THEN 'Ellie Noble'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'LGPROJECT' THEN 'Luke Gibson'
WHEN ProjectsDB.[OH_SUB_LEDGER] = 'RLPROJECT' THEN 'Robert Ljubojev'
ELSE ''
END
as ProjectManager
,SUM(ProjectsDB.[OH_GROSS]) as TotalQuoteGrossValue
,SUM(ProjectsDB.[OH_NETT]) as TotalQuoteNettValue
--,CASE
--WHEN ProjectsDB.[OH_ORDER_REF] IN (LiveDB.[OH_ORDER_REF], LiveDB.[OH_DESCRIPTION])
--AND LiveDB.[OH_NETT] > 0
----AND ProjectsDB.[OH_ACCOUNT] = LiveDB.[OH_ACCOUNT]
--THEN 'WON'
--WHEN
--ProjectsDB.[OH_WORK_STATUS] = 'Quote - Lost'
--THEN 'LOST'
--ELSE 'PENDING'
--END
--as WonLostPending
--,CASE
--WHEN ProjectsDB2.[OH_PRIORITY] = 0
--AND ProjectsDB.[OH_ORDER_REF] = ProjectsDB2.[OH_ORDER_REF]
--THEN ProjectsDB2.[OH_ORDER_NUMBER]
--ELSE
--LiveDB.[OH_ORDER_NUMBER]
--END
--as OrderNumber
,MIN(LiveDB.[OH_DATE]) as FirstOrderDate
,MAX(LiveDB.[OH_DATE]) as LastOrderDate
--,LiveDB.[OH_ACCOUNT] as OrderAccountCode
--,OrderCustomerRef.[CUNAME] as OrderCustomerName
,SUM(LiveDB.[OH_NETT]) as TotalOrderValue
--,'Quote Notes: ' + CAST(ProjectsDB.[OH_INTERNL_NOTE] AS nvarchar(max)) + CHAR(13)+CHAR(10) + 'Order Notes: ' + CAST(LiveDB.[OH_INTERNL_NOTE] AS nvarchar(max)) as Notes
--,CASE
--WHEN
--ProjectsDB.[OH_PRIORITY] = 0
--AND LiveDB.[OH_PRIORITY] = 0
--THEN 'Full Order'
--WHEN
--ProjectsDB.[OH_PRIORITY] = 4
--AND LiveDB.[OH_PRIORITY] = 0
--THEN 'Quoted and Ordered'
--WHEN ProjectsDB.[OH_PRIORITY] = 4
--AND LiveDB.[OH_PRIORITY] = 4
--THEN 'Quote'
--ELSE ''
--END
--AS QuoteOrOrder
,'Live' as 'Database'
FROM [JCC_PROD_LIVE].[dbo].[ORD_HEADER] ProjectsDB WITH (NOLOCK)
LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[ORD_HEADER] LiveDB WITH (NOLOCK)
ON ProjectsDB.[OH_ORDER_REF] = LiveDB.[OH_ORDER_REF]
LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[ORD_HEADER] ProjectsDB2 WITH (NOLOCK)
ON ProjectsDB.[OH_ORDER_REF] = ProjectsDB2.[OH_ORDER_REF]
AND ProjectsDB2.[OH_PRIORITY] = 0
--AND ProjectsDB.[OH_ACCOUNT] = LiveDB.[OH_ACCOUNT]
LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[SL_ACCOUNTS] ProjectsCustomerRef WITH (NOLOCK)
ON ProjectsDB.[OH_ACCOUNT] = ProjectsCustomerRef.[CUCODE]
LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[SL_ACCOUNTS] OrderCustomerRef WITH (NOLOCK)
ON LiveDB.[OH_ACCOUNT] = OrderCustomerRef.[CUCODE]
WHERE ProjectsDB.[OH_PRIORITY] = 4
AND ProjectsDB.[OH_SUB_LEDGER] <> ''
--ORDER BY ProjectsDB.[OH_DATE]
GROUP BY ProjectsDB.[OH_ORDER_REF], ProjectsDB.[OH_SUB_LEDGER], ProjectsDB.[OH_BATCH_REF]
--ORDER BY FirstQuoteDate


















CREATE VIEW [dbo].[JCC_Quotations_ProjectDetail_Data]

/*
** Written     :  07/05/2013 AKT
** Last Amended:  10/21/2015 AKT	
**
*/

AS

SELECT

 ProjectsDB.[OH_ORDER_NUMBER] as QuoteNumber
,ProjectsDB.[OH_ORDER_REF] as ProjectName
,ProjectsDB.[OH_DESCRIPTION] as AdditonalDescription
--,CONVERT(CHAR(4), ProjectsDB.[OH_DATE], 100) + CONVERT(CHAR(4), ProjectsDB.[OH_DATE], 120) as QuoteYearMonth
,
CASE
WHEN ProjectsDB.[OH_SUB_LEDGER] <> ''
AND ProjectsDB.[OH_BATCH_REF] = ''
THEN
SUBSTRING(ProjectsDB.[OH_SUB_LEDGER],0,3) + CONVERT(CHAR(2), ProjectsDB.[OH_DATE], 103) + CONVERT(CHAR(2), ProjectsDB.[OH_DATE], 101) + RIGHT(ProjectsDB.[OH_ORDER_NUMBER],2)
ELSE ''
END
as AutoProjectRef
,ProjectsDB.[OH_DATE] as QuoteDate
,ProjectsDB.[OH_ACCOUNT] as QuoteAccountCode
,ProjectsCustomerRef.[CUNAME] as QuoteCustomerName
,ProjectsDB.[OH_PROBABILITY] as Probability
,SUBSTRING(ProjectsDB.[OH_CUSORT],6,255) as ASM
,CASE WHEN ProjectsDB.[OH_BATCH_REF] <> '' THEN ProjectsDB.[OH_BATCH_REF]
ELSE SUBSTRING(ProjectsDB.[OH_SUB_LEDGER],0,3) + CONVERT(CHAR(2), ProjectsDB.[OH_DATE], 103) + CONVERT(CHAR(2), ProjectsDB.[OH_DATE], 101) + RIGHT(ProjectsDB.[OH_ORDER_NUMBER],2) END as ProjectReference
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
,ProjectsDB.[OH_GROSS] as QuoteGrossValue
,ProjectsDB.[OH_NETT] as QuoteNettValue
,CASE
WHEN ProjectsDB.[OH_ORDER_REF] IN (LiveDB.[OH_ORDER_REF], LiveDB.[OH_DESCRIPTION])

AND LiveDB.[OH_NETT] > 0
--AND ProjectsDB.[OH_ACCOUNT] = LiveDB.[OH_ACCOUNT]
THEN 'WON'
WHEN
ProjectsDB.[OH_WORK_STATUS] = 'Quote - Lost'
THEN 'LOST'
ELSE 'PENDING'
END
as WonLostPending
,CASE
WHEN ProjectsDB2.[OH_PRIORITY] = 0
AND ProjectsDB.[OH_ORDER_REF] = ProjectsDB2.[OH_ORDER_REF]
OR ProjectsDB.[OH_BATCH_REF] = ProjectsDB2.[OH_BATCH_REF]
THEN ProjectsDB2.[OH_ORDER_NUMBER]
ELSE
LiveDB.[OH_ORDER_NUMBER]
END
as OrderNumber
,LiveDB.[OH_DATE] as OrderDate
,LiveDB.[OH_ACCOUNT] as OrderAccountCode
,OrderCustomerRef.[CUNAME] as OrderCustomerName
,[OD_STOCK_CODE] as 'Stock Code'
,[OD_DETAIL] as 'Stock Description'
,[Range]
,[Subrange]
,[OD_QTYORD] as 'Quantity Ordered'
,[OD_NETT] as 'Nett Value'
,LiveDB.[OH_NETT] as OrderValue
,CASE
WHEN LiveDB.[OH_INTERNL_NOTE] is NULL
THEN 'Quote Notes: ' + CAST(ProjectsDB.[OH_INTERNL_NOTE] AS nvarchar(max))
ELSE
'Quote Notes: ' + CAST(ProjectsDB.[OH_INTERNL_NOTE] AS nvarchar(max)) + CHAR(13)+CHAR(10) + 'Order Notes: ' + CAST(LiveDB.[OH_INTERNL_NOTE] AS nvarchar(max))
END
as Notes
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
,CASE
WHEN LiveDB.[OH_WORK_STATUS] = 'Lighting Design' THEN 'Lighting Design'
WHEN ProjectsDB.[OH_WORK_STATUS] = 'Lighting Design' THEN 'Lighting Design'
WHEN ProjectsDB2.[OH_WORK_STATUS] = 'Lighting Design' THEN 'Lighting Design'
ELSE ''
END as LightingDesign
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
LEFT OUTER JOIN [JCC_PROJECTS].[dbo].[ORD_DETAIL] WITH (NOLOCK)
ON ProjectsDB.[OH_ORDER_NUMBER] = [OD_ORDER_NUMBER]
LEFT OUTER JOIN [JCC_DW_PRD_Presentation].[dbo].[DimProduct] WITH (NOLOCK)
ON [OD_STOCK_CODE] = [ProductCode] collate DATABASE_DEFAULT
WHERE ProjectsDB.[OH_PRIORITY] = 4
--AND ProjectsDB.[OH_SUB_LEDGER] <> ''
AND [OD_STOCK_CODE] <> ''
--ORDER BY ProjectsDB.[OH_DATE]


UNION ALL


SELECT

 ProjectsDB.[OH_ORDER_NUMBER] as QuoteNumber
,ProjectsDB.[OH_ORDER_REF] as ProjectName
,ProjectsDB.[OH_DESCRIPTION] as AdditonalDescription
--,CONVERT(CHAR(4), ProjectsDB.[OH_DATE], 100) + CONVERT(CHAR(4), ProjectsDB.[OH_DATE], 120) as QuoteYearMonth
,
CASE
WHEN ProjectsDB.[OH_SUB_LEDGER] <> ''
AND ProjectsDB.[OH_BATCH_REF] = ''
THEN
SUBSTRING(ProjectsDB.[OH_SUB_LEDGER],0,3) + CONVERT(CHAR(2), ProjectsDB.[OH_DATE], 103) + CONVERT(CHAR(2), ProjectsDB.[OH_DATE], 101) + RIGHT(CAST(ProjectsDB.[OH_ORDER_NUMBER] as INT),2)
ELSE ''
END
as AutoProjectRef
,ProjectsDB.[OH_DATE] as QuoteDate
,ProjectsDB.[OH_ACCOUNT] as QuoteAccountCode
,ProjectsCustomerRef.[CUNAME] as QuoteCustomerName
,ProjectsDB.[OH_PROBABILITY] as Probability
,SUBSTRING(ProjectsDB.[OH_CUSORT],6,255) as ASM
,CASE WHEN ProjectsDB.[OH_BATCH_REF] <> '' THEN ProjectsDB.[OH_BATCH_REF]
ELSE SUBSTRING(ProjectsDB.[OH_SUB_LEDGER],0,3) + CONVERT(CHAR(2), ProjectsDB.[OH_DATE], 103) + CONVERT(CHAR(2), ProjectsDB.[OH_DATE], 101) + RIGHT(CAST(ProjectsDB.[OH_ORDER_NUMBER] as INT),2) END as ProjectReference
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
,ProjectsDB.[OH_GROSS] as QuoteGrossValue
,ProjectsDB.[OH_NETT] as QuoteNettValue
,CASE
WHEN ProjectsDB.[OH_ORDER_REF] IN (LiveDB.[OH_ORDER_REF], LiveDB.[OH_DESCRIPTION])

AND LiveDB.[OH_NETT] > 0
--AND ProjectsDB.[OH_ACCOUNT] = LiveDB.[OH_ACCOUNT]
THEN 'WON'
WHEN
ProjectsDB.[OH_WORK_STATUS] = 'Quote - Lost'
THEN 'LOST'
ELSE 'PENDING'
END
as WonLostPending
,CASE
WHEN ProjectsDB2.[OH_PRIORITY] = 0
AND ProjectsDB.[OH_ORDER_REF] = ProjectsDB2.[OH_ORDER_REF]
OR ProjectsDB.[OH_BATCH_REF] = ProjectsDB2.[OH_BATCH_REF]
THEN ProjectsDB2.[OH_ORDER_NUMBER]
ELSE
LiveDB.[OH_ORDER_NUMBER]
END
as OrderNumber
,LiveDB.[OH_DATE] as OrderDate
,LiveDB.[OH_ACCOUNT] as OrderAccountCode
,OrderCustomerRef.[CUNAME] as OrderCustomerName
,[OD_STOCK_CODE] as 'Stock Code'
,[OD_DETAIL] as 'Stock Description'
,[Range]
,[Subrange]
,[OD_QTYORD] as 'Quantity Ordered'
,[OD_NETT] as 'Nett Value'
,LiveDB.[OH_NETT] as OrderValue
,CASE
WHEN LiveDB.[OH_INTERNL_NOTE] is NULL
THEN 'Quote Notes: ' + CAST(ProjectsDB.[OH_INTERNL_NOTE] AS nvarchar(max))
ELSE
'Quote Notes: ' + CAST(ProjectsDB.[OH_INTERNL_NOTE] AS nvarchar(max)) + CHAR(13)+CHAR(10) + 'Order Notes: ' + CAST(LiveDB.[OH_INTERNL_NOTE] AS nvarchar(max))
END
as Notes
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
,CASE
WHEN LiveDB.[OH_WORK_STATUS] = 'Lighting Design' THEN 'Lighting Design'
WHEN ProjectsDB.[OH_WORK_STATUS] = 'Lighting Design' THEN 'Lighting Design'
WHEN ProjectsDB2.[OH_WORK_STATUS] = 'Lighting Design' THEN 'Lighting Design'
ELSE ''
END as LightingDesign
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
LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[ORD_DETAIL] WITH (NOLOCK)
ON ProjectsDB.[OH_ORDER_NUMBER] = [OD_ORDER_NUMBER]
LEFT OUTER JOIN [JCC_DW_PRD_Presentation].[dbo].[DimProduct] WITH (NOLOCK)
ON [OD_STOCK_CODE] = [ProductCode] collate DATABASE_DEFAULT
WHERE ProjectsDB.[OH_PRIORITY] = 4
--AND ProjectsDB.[OH_SUB_LEDGER] <> ''
AND [OD_STOCK_CODE] <> ''
--ORDER BY ProjectsDB.[OH_DATE]











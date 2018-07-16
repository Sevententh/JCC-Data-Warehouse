
CREATE VIEW  [AA_AOI_ADM_GET_SALES_INVOICE_TRANSACTION] AS

SELECT 
ST_PRIMARY AS [Primary],
ST_COPYCUST AS [Account Code],
CUNAME AS [Account Name],
ST_HEADER_REF AS [Header Reference],
ST_DESCRIPTION AS [Description],
ST_DATE AS [Date],
'' AS [Order Number],
ST_NETT AS [Net],
ST_GROSS AS [Gross],
ST_VAT AS [Vat],
ST_USER1 AS [Transaction User Key 1],
ST_USER2 AS [Transaction User Key 2],
ST_USER3 AS [Transaction User Key 3],
'INV' AS [Transaction Type]
FROM SL_TRANSACTIONS INNER JOIN SL_ACCOUNTS ON ST_COPYCUST = CUCODE




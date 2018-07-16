

CREATE VIEW  [AA_AOI_ADM_GET_PURCHASE_INVOICE_TRANSACTION] AS

SELECT 
PT_PRIMARY AS [Primary],
SUNAME AS [Account Name],
PT_COPYSUPP AS [Account Code],
PT_DESCRIPTION AS [Description],
PT_HEADER_REF AS [Header Reference],
PT_DATE AS [Date],
'' AS [Order Number],
PT_NETT AS [Net],
PT_VAT AS [Vat],
PT_GROSS AS [Gross],
PT_USER1 AS [Transaction User Key 1],
PT_USER2 AS [Transaction User Key 2],
PT_USER3 AS [Transaction User Key 3],
PT_TRANTYPE AS [Transaction Type]
FROM [PL_TRANSACTIONS] inner join PL_ACCOUNTS ON SUCODE = PT_COPYSUPP




﻿CREATE VIEW AA_ED_SALES_DETAIL_ANALYSIS_TXT_VIEW
AS
SELECT     'T' AS ITEMTYPE, '' AS PRODUCT_CODE, SUBSTRING(DET_DESCRIPTION, 1, 40) AS PRODUCT_NAME, '' AS PRODUCT_SORT_KEY, 
                      '' AS PRODUCT_SORT_KEY1, '' AS PRODUCT_SORT_KEY2, '' AS PRODUCT_SORT_KEY3, dbo.SL_PL_NL_DETAIL.DET_ACCOUNT, 
                      dbo.SL_ACCOUNTS.CUNAME, dbo.SL_ACCOUNTS.CUSORT AS CUSTOMER_SORT_KEY, dbo.SL_ACCOUNTS.CUUSER1 AS CUSTOMER_SORT_KEY1, 
                      dbo.SL_ACCOUNTS.CUUSER2 AS CUSTOMER_SORT_KEY2, dbo.SL_ACCOUNTS.CUUSER3 AS CUSTOMER_SORT_KEY3, 
                      dbo.SL_PL_NL_DETAIL.DET_ANALYSIS, DET_PERIOD_SORT,dbo.SL_PL_NL_DETAIL.DET_PRIMARY, dbo.SL_PL_NL_DETAIL.DET_HEADER_KEY, 
                      dbo.SL_PL_NL_DETAIL.DET_PERIODNUMBR, dbo.SL_PL_NL_DETAIL.DET_YEAR, dbo.SL_PL_NL_DETAIL.DET_DATE, 
                      dbo.SL_PL_NL_DETAIL.DET_ORIGIN, DET_COSTHEADER, DET_COSTCENTRE, 
                      (CASE DET_TYPE WHEN 'INV' THEN DET_QUANTITY WHEN 'CRN' THEN DET_QUANTITY * - 1 END) AS TRAN_QUANTITY, 
                      (CASE DET_TYPE WHEN 'INV' THEN DET_NETT WHEN 'CRN' THEN DET_NETT * - 1 END) AS TRAN_NET, 
                      (CASE DET_TYPE WHEN 'INV' THEN DET_VAT WHEN 'CRN' THEN DET_VAT * - 1 END) AS TRAN_VAT, 
                      (CASE DET_TYPE WHEN 'INV' THEN DET_GROSS WHEN 'CRN' THEN DET_GROSS * - 1 END) AS TRAN_GROSS, 
                      (CASE DET_TYPE WHEN 'INV' THEN DET_COSTPRICE WHEN 'CRN' THEN DET_COSTPRICE * - 1 END) AS TRAN_COSTPRICE
FROM         dbo.SL_ACCOUNTS INNER JOIN
                      dbo.SL_PL_NL_DETAIL ON dbo.SL_ACCOUNTS.CUCODE = dbo.SL_PL_NL_DETAIL.DET_ACCOUNT
WHERE     (dbo.SL_PL_NL_DETAIL.DET_TYPE = 'INV' OR
                      dbo.SL_PL_NL_DETAIL.DET_TYPE = 'CRN') AND (dbo.SL_PL_NL_DETAIL.DET_ORIGIN = 'SO' AND DET_STOCK_CODE = '' AND DET_PRICE_CODE = '')
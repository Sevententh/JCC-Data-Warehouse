﻿CREATE VIEW AA_ED_SALES_DETAIL_ANALYSIS_ALL_VIEW
AS
SELECT     ITEMTYPE, PRODUCT_CODE, PRODUCT_NAME, PRODUCT_SORT_KEY, PRODUCT_SORT_KEY1, PRODUCT_SORT_KEY2, PRODUCT_SORT_KEY3, 
                      DET_ACCOUNT, CUNAME, CUSTOMER_SORT_KEY, CUSTOMER_SORT_KEY1, CUSTOMER_SORT_KEY2, CUSTOMER_SORT_KEY3, DET_ANALYSIS, 
                      DET_PRIMARY, DET_HEADER_KEY, DET_PERIODNUMBR, DET_YEAR,DET_PERIOD_SORT, DET_DATE, DET_ORIGIN, DET_COSTHEADER, DET_COSTCENTRE, 
                      TRAN_QUANTITY, TRAN_NET, TRAN_VAT, TRAN_GROSS, TRAN_COSTPRICE
FROM         dbo.AA_ED_SALES_DETAIL_ANALYSIS_PRC_VIEW
UNION
SELECT     ITEMTYPE, PRODUCT_CODE, PRODUCT_NAME, PRODUCT_SORT_KEY, PRODUCT_SORT_KEY1, PRODUCT_SORT_KEY2, PRODUCT_SORT_KEY3, 
                      DET_ACCOUNT, CUNAME, CUSTOMER_SORT_KEY, CUSTOMER_SORT_KEY1, CUSTOMER_SORT_KEY2, CUSTOMER_SORT_KEY3, DET_ANALYSIS, 
                      DET_PRIMARY, DET_HEADER_KEY, DET_PERIODNUMBR, DET_YEAR,DET_PERIOD_SORT, DET_DATE, DET_ORIGIN, DET_COSTHEADER, DET_COSTCENTRE, 
                      TRAN_QUANTITY, TRAN_NET, TRAN_VAT, TRAN_GROSS, TRAN_COSTPRICE
FROM         dbo.AA_ED_SALES_DETAIL_ANALYSIS_STK_VIEW
UNION
SELECT     ITEMTYPE, PRODUCT_CODE, PRODUCT_NAME, PRODUCT_SORT_KEY, PRODUCT_SORT_KEY1, PRODUCT_SORT_KEY2, PRODUCT_SORT_KEY3, 
                      DET_ACCOUNT, CUNAME, CUSTOMER_SORT_KEY, CUSTOMER_SORT_KEY1, CUSTOMER_SORT_KEY2, CUSTOMER_SORT_KEY3, DET_ANALYSIS, 
                      DET_PRIMARY, DET_HEADER_KEY, DET_PERIODNUMBR, DET_YEAR,DET_PERIOD_SORT, DET_DATE, DET_ORIGIN, DET_COSTHEADER, DET_COSTCENTRE, 
                      TRAN_QUANTITY, TRAN_NET, TRAN_VAT, TRAN_GROSS, TRAN_COSTPRICE
FROM         dbo.AA_ED_SALES_DETAIL_ANALYSIS_TXT_VIEW
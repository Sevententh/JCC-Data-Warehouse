







CREATE VIEW [dbo].[JCC_Deliverable_Report_Data_OLD]

/*
** Written     :  13/07/2015 AKT
** Last Amended:  28/10/2015 AKT	
**
*/

AS

SELECT CASE WHEN [OH_TYPE] = 'O' THEN 'Sales Order'
      WHEN [OH_TYPE] = 'C' THEN 'Credit Note'
      END AS 'Transaction Type'
      ,CASE WHEN [OH_STATUS] = 0 THEN 'New'
      WHEN [OH_STATUS] = 1 THEN 'Part-Processed'
      WHEN [OH_STATUS] = 2 THEN 'Complete'
      END AS 'Order Header Status'
      ,CASE WHEN [OD_ORDER_NUMBER] IS NULL THEN [OH_ORDER_NUMBER]
      ELSE [OD_ORDER_NUMBER] END as 'Order Number'
      ,CASE WHEN [OD_ENTRY_TYPE] = 'P' THEN 'Price'
      WHEN [OD_ENTRY_TYPE] = 'S' THEN 'Stock'
      WHEN [OD_ENTRY_TYPE] = 'T' THEN 'Text'
      END AS 'Detail Entry Type'
      ,CASE WHEN [OD_PRICE_CODE] <> '' THEN [OD_PRICE_CODE]
      ELSE [OD_STOCK_CODE] END AS 'Price or Stock Code'
      ,[OD_DETAIL] as 'Description'
      ,[Range]
      ,[Subrange]
      ,[Physcial Stock]
      ,[Free Stock]
      ,[OD_QTYORD] as 'Quantity Ordered'
      ,[OD_QTYORD] * [OD_UNITCST] as 'Value Ordered'
      ,[OD_QTYDELVD] as 'Quantity Delivered'
      ,[OD_QTYDELVD] * [OD_UNITCST] as 'Value Delivered'
      ,[OD_QTYRESERVED] as 'Quantity Allocated'
      ,[OD_QTYRESERVED] * [OD_UNITCST] as 'Value Allocated'
      ,CASE WHEN [OD_STATUS] = 0 THEN 'New'
      WHEN [OD_STATUS] = 1 THEN 'Part-Processed'
      WHEN [OD_STATUS] = 2 THEN 'Complete'
      END AS 'Detail Line Status'
      ,[OH_DATE] as 'Order Date'
      ,[OH_REQUIREDDATE] as 'Order Header Required Date'
      ,[OD_REQDATE] as 'Order Detail Required Date'
      ,[OH_WORK_STATUS] as 'Order Process Type'
      ,[OH_NETT] as 'Order Nett Value'
      ,[OH_NETT_C] as 'Order Nett Currency Value'
      ,[OH_VAT] as 'Order VAT Total'
      ,[OH_TAX_C] as 'Currency Tax or VAT'
      ,[OH_GROSS] as 'Order Gross Value'
      ,[OH_GROSS_C] as 'Order Gross Currency Value'
      ,[OH_CURRENCYRATE] as 'Currency Rate'
      ,[OH_CURRENCYCODE] as 'Order Currency'
      ,[OH_DEL_DATE] as 'Order Delivery Date'
      --,[OH_INV_ADD]
      --,[OH_DEL_ADD]
      ,[OH_NO_OF_LINES] as 'Number of Order Lines'
      ,[OH_LINES_INVD] as 'Number of Order Lines Invoiced'
      ,[OH_LINES_DELVD] as 'Number of Order Lines Delivered'
      ,[OD_UNITCST] as 'Unit Cost'
      --,[OH_INV_VALUE]
      --,[OH_DEL_VALUE]
      ,CASE WHEN [OH_PRIORITY] = 0 THEN 'Sales Order'
      WHEN [OH_PRIORITY] = 3 THEN 'Pro-Forma'
      WHEN [OH_PRIORITY] = 4 THEN 'Quote'
      END as 'Order Type'
      ,[OH_USER_PUTIN] as 'Created By User'
      ,[OH_DATE_PUTIN] as 'Created Date'
      --,[OH_INV_STATUS] 
      --,[OH_DEL_STATUS]
      ,CASE WHEN [OH_CONFIRMED] = 1 THEN 'Yes'
      WHEN [OH_CONFIRMED] = 0 THEN 'No'
      END as 'Order Confirmation Printed?'
      ,[OH_ACCOUNT] as 'Order Header Account'
      ,[OH_ACCOUNT_ORDER] as 'Order Account'
      ,[OH_ACCOUNT_DELIVERY] as 'Delivery Account'
      --,[OH_ACCOUNT_DELIVERY] + CAST([OH_DEL_ADD] as varchar) as 'Delivery Address'
      --,[AD_ACC_CODE] + CAST([AD_CODE] as varchar) as 'Account Address'
      ,delcust1.[CUNAME] as 'Customer Name'
      ,delad1.[AD_ADDRESS] as 'Delivery Address'
      ,delad1.[AD_ADDRESS_USER1] as 'Delivery Town'
      ,delad1.[AD_ADDRESS_USER2] as 'Delivery County'
      ,delad1.[AD_POSTCODE] as 'Delivery PostCode'
      ,CASE
		WHEN delcust1.[CUSORT] = '' THEN 'None'
		WHEN delcust1.[CUSORT] = 'H-99-HOUSE ACCOUNT' THEN 'House Account'
		WHEN delcust1.[CUSORT] = 'I-29-IRELAND' THEN 'Ireland'
		WHEN delcust1.[CUSORT] = 'M-36-INTERNATIONAL' THEN 'International'
		WHEN delcust1.[CUSORT] = 'N-21-BILL MONAGHAN' THEN 'Bill Monaghan'
		WHEN delcust1.[CUSORT] = 'N-22-DUNCAN DAVIDSON' THEN 'Duncan Davidson'
		WHEN delcust1.[CUSORT] = 'N-24-ADRIAN CRISP' THEN 'Adrian Crisp'
		WHEN delcust1.[CUSORT] = 'N-25-JAIME ELLINGHAM' THEN 'Jaime Ellingham'
		WHEN delcust1.[CUSORT] = 'N-26-LAUREN KELSEY' THEN 'Lauren Kelsey'
		WHEN delcust1.[CUSORT] = 'N-33-CLAIRE HIGGINS' THEN 'Claire Higgins'
		WHEN delcust1.[CUSORT] = 'N-34-BEN SWIFT' THEN 'Ben Swift'
		WHEN delcust1.[CUSORT] = 'N-35-RICHARD BRISTOW' THEN 'Richard Bristowe'
		WHEN delcust1.[CUSORT] = 'N-37-CHRIS CARR' THEN 'Chris Carr'
		WHEN delcust1.[CUSORT] = 'N-39-ADAM SAVAGE' THEN 'Adam Savage'
		WHEN delcust1.[CUSORT] = 'N-40-GARETH THOMAS' THEN 'Gareth Thomas'
		WHEN delcust1.[CUSORT] = 'S-28-STEVEN LAMB' THEN 'Steven Lamb'
		END AS 'Delivery Account Manager'
		,[CU_USRCHAR9] as 'Delivered To Merchandiser'
      ,invad1.[AD_ADDRESS] as 'Invoice Address'
      ,invad1.[AD_ADDRESS_USER1] as 'Invoice Town'
      ,invad1.[AD_ADDRESS_USER2] as 'Invoice County'
      ,invad1.[AD_POSTCODE] as 'Invoice PostCode'
      ,CASE
		WHEN invcust1.[CUSORT] = '' THEN 'None'
		WHEN invcust1.[CUSORT] = 'H-99-HOUSE ACCOUNT' THEN 'House Account'
		WHEN invcust1.[CUSORT] = 'I-29-IRELAND' THEN 'Ireland'
		WHEN invcust1.[CUSORT] = 'M-36-INTERNATIONAL' THEN 'International'
		WHEN invcust1.[CUSORT] = 'N-21-BILL MONAGHAN' THEN 'Bill Monaghan'
		WHEN invcust1.[CUSORT] = 'N-22-DUNCAN DAVIDSON' THEN 'Duncan Davidson'
		WHEN invcust1.[CUSORT] = 'N-24-ADRIAN CRISP' THEN 'Adrian Crisp'
		WHEN invcust1.[CUSORT] = 'N-25-JAIME ELLINGHAM' THEN 'Jaime Ellingham'
		WHEN invcust1.[CUSORT] = 'N-26-LAUREN KELSEY' THEN 'Lauren Kelsey'
		WHEN invcust1.[CUSORT] = 'N-33-CLAIRE HIGGINS' THEN 'Claire Higgins'
		WHEN invcust1.[CUSORT] = 'N-34-BEN SWIFT' THEN 'Ben Swift'
		WHEN invcust1.[CUSORT] = 'N-35-RICHARD BRISTOW' THEN 'Richard Bristowe'
		WHEN invcust1.[CUSORT] = 'N-37-CHRIS CARR' THEN 'Chris Carr'
		WHEN invcust1.[CUSORT] = 'N-39-ADAM SAVAGE' THEN 'Adam Savage'
		WHEN invcust1.[CUSORT] = 'N-40-GARETH THOMAS' THEN 'Gareth Thomas'
		WHEN invcust1.[CUSORT] = 'S-28-STEVEN LAMB' THEN 'Steven Lamb'
		END AS 'Invoice Account Manager'
  FROM [JCC_PROD_LIVE].[dbo].[ORD_HEADER] WITH (NOLOCK)
  
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[ORD_DETAIL] WITH (NOLOCK)
  ON [OD_ORDER_NUMBER] = [OH_ORDER_NUMBER]
  
  LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[STK_STOCK] WITH (NOLOCK)
  ON [OD_STOCK_CODE] = [STKCODE]
  
  INNER JOIN [JCC_PROD_LIVE].[dbo].[SL_ADDRESSES] delad1 WITH (NOLOCK)
  ON delad1.[AD_ACC_CODE] + CAST(delad1.[AD_CODE] as varchar) = [OH_ACCOUNT_DELIVERY] + CAST([OH_DEL_ADD] as varchar)
  
  INNER JOIN [JCC_PROD_LIVE].[dbo].[SL_ACCOUNTS] delcust1 WITH (NOLOCK)
  ON [OH_ACCOUNT_DELIVERY] = delcust1.[CUCODE]
  
  INNER JOIN [JCC_PROD_LIVE].[dbo].[SL_ACCOUNTS2] WITH (NOLOCK)
  ON [OH_ACCOUNT_DELIVERY] = [CUCODE2]
  
  INNER JOIN [JCC_PROD_LIVE].[dbo].[SL_ADDRESSES] invad1 WITH (NOLOCK)
  ON invad1.[AD_ACC_CODE] + CAST(invad1.[AD_CODE] as varchar) = [OH_ACCOUNT] + CAST([OH_INV_ADD] as varchar)
  
  INNER JOIN [JCC_PROD_LIVE].[dbo].[SL_ACCOUNTS] invcust1 WITH (NOLOCK)
  ON [OH_ACCOUNT] = invcust1.[CUCODE]
  
  INNER JOIN [JCC_PROD_LIVE].[dbo].[JCC_SubAnalysis_FreeStock] WITH (NOLOCK)
  ON [Stock Code] = [OD_STOCK_CODE]
  
  INNER JOIN [JCC_DW_PRD_Presentation].[dbo].[DimProduct] WITH (NOLOCK)
  ON [STKCODE] = [ProductCode] collate DATABASE_DEFAULT
  
  --LEFT OUTER JOIN [JCC_PROD_LIVE].[dbo].[STK_LOCATION]
  --ON [OD_STOCK_CODE] = [LOC_STOCK_CODE]
  
  WHERE [OH_STATUS] < 2
  AND [OH_PRIORITY] <= 3
  --AND [LOC_CONCATCODE] in ('PICK', 'BULK', 'EXT')
  
  --ORDER BY [OD_ORDER_NUMBER]




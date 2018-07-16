create view AA_SYS_TRADING_CURRENCY_VIEW
/*
** Returns a table for the trading currency record
** Written: 21/09/2004 SR; 22/10/04; 25/10/04 SRB
** Last Amended: 02/11/2004 SH, 13/12/05 NC, 22/06/06 SH
*/
as

select 
   CURREC_PRIMARY,
   CURREC_SYMBOL,
   CURREC_DESCRIPTION,
   CURREC_NL_SUFFIX,
   CURREC_ISO_CODE,
   CURREC_EURO_CURRENCY,
   (case CURREC_CURRENCY_TYPE    
               when 'H' then 0
               when 'E' then 1 
               when '2' then 2               
               when 'D' then 3 
               else 0 end) as CURREC_CURRENCY_TYPE,
   CURREC_EMU_DATE,
   CURREC_NOTES,
   CURREC_DATE_PUTIN,
   CURREC_USER_PUTIN,
   CURREC_DATE_EDITED,
   CURREC_USER_EDITED,

   -- sales
   CURREC_SALES_AN,
   Sales.SANAME as SALES_AN_NAME,
   CURREC_SALES_AN_BNK,
   SalesBank.SANAME as SALES_AN_BNK_NAME,
   CURREC_SALES_AN_DIS,
   SalesDiscount.SANAME as SALES_AN_DIS_NAME,
   CURREC_SALES_AN_EX,
   SalesExchange.SANAME as SALES_AN_EX_NAME,
   CURREC_SALES_AN_RND,
   SalesRounding.SANAME as SALES_AN_RND_NAME,
   CURREC_SALES_AN_STK,
   SalesStock.SANAME as SALES_AN_STK_NAME,
   CURREC_STK_OUT_ANALYSIS,
   StockOut.SANAME as STOCK_OUT_NAME,

   -- purchase
   CURREC_PURCH_AN,
   Purchase.PANAME as PURCH_AN_NAME,
   CURREC_PURCH_AN_BNK,
   PurchaseBank.PANAME as PURCH_AN_BNK_NAME,
   CURREC_PURCH_AN_DIS,
   PurchaseDiscount.PANAME as PURCH_AN_DIS_NAME,
   CURREC_PURCH_AN_EX,
   PurchaseExchange.PANAME as PURCH_AN_EX_NAME,
   CURREC_PURCH_AN_RND,
   PurchaseRounding.PANAME as PURCH_AN_RND_NAME,
   CURREC_PURCH_AN_STK,
   PurchaseStock.PANAME as PURCH_AN_STK_NAME,
   CURREC_STK_IN_ANALYSIS,
   StockIn.PANAME as STOCK_IN_NAME,

   -- nominal
   CURREC_NOM_SALES,
   NominalSales.NNAME as NOM_SALES_NAME,
   CURREC_NOM_SALEDIS,
   NominalSalesDiscount.NNAME as NOM_SALEDIS_NAME,
   CURREC_NOM_PURCH,
   NominalPurchase.NNAME as NOM_PURCH_NAME,
   CURREC_NOM_PURDIS,
   NominalPurchaseDiscount.NNAME as NOM_PURDIS_NAME,
   CURREC_NOM_EXDIFF,
   NominalExchange.NNAME as NOM_EXDIFF_NAME,
   CURREC_NOM_SALECON,
   NominalSalesControl.NNAME as NOM_SALECON_NAME,
   CURREC_NOM_BANK,
   NominalBank.NNAME as NOM_BANK_NAME,
   CURREC_NOM_PURCHCON,
   NominalPurchaseControl.NNAME as NOM_PURCHCON_NAME,
   CURREC_NOM_YEAR_END,
   NominalYearEnd.NNAME as NOM_YEAR_END_NAME,
   CURREC_NOM_ROUND,
   NominalRounding.NNAME as NOM_ROUND_NAME,

   -- stock nominal
   CURREC_NOM_PL_ACCRUED_INCOME,
   NominalPurchaseAccruedIncome.NNAME as NOM_PL_ACCRUED_NAME,
   CURREC_NOM_COST_OF_GOODS,
   NominalCostOfGoods.NNAME as NOM_COST_OF_GOODS_NAME,
   CURREC_NOM_PL_STOCK_ADJUSTMENTS,
   NominalPurchaseStockAdjustments.NNAME as NOM_PL_STOCK_ADJUSTMENTS_NAME,
   CURREC_NOM_GOODS_RCVD_NOT_INV,
   NominalGoodsReceivedNotInvoiced.NNAME as NOM_GOODS_RCVD_NOT_INV_NAME,
   CURREC_NOM_STOCK_CONTROL,
   NominalStockControl.NNAME as NOM_STOCK_CONTROL_NAME,
   CURREC_NOM_BS_STOCK_ADJUSTMENTS,
   NominalBalanceStockAdjustments.NNAME as NOM_BS_STOCK_ADJUSTMENTS_NAME,
   CURREC_NOM_BS_ACCRUED_INCOME,
   NominalBalanceAccruedIncome.NNAME as NOM_BS_ACCRUED_INCOME_NAME,
   
   -- home only
   (case CURREC_CURRENCY_TYPE when 'H' then NOM_VAT_CNTRL else '' end) as NOM_VAT_CONTROL,
   (case CURREC_CURRENCY_TYPE when 'H' then NominalVatControl.NNAME else '' end) as NOM_VAT_CONTROL_NAME,
   (case CURREC_CURRENCY_TYPE when 'H' then NOM_SUSPENSE else '' end) as NOM_SUSPENSE,
   (case CURREC_CURRENCY_TYPE when 'H' then NominalSuspense.NNAME else '' end) as NOM_SUSPENSE_NAME,

   dbo.AA_SYS_CURRENCY_REC_EDITABLE_F( CURREC_SYMBOL ) as CURRENCY_SYMBOL_EDITABLE,
   1 as CURREC_EURO_CURRENCY_EDITABLE, -- Always editable
   CURREC_DO_NOT_USE as CURREC_EXCLUDED
from
   SYS_CURRENCY_REC
   -- sales
   left outer join SL_ANALYSIS Sales on CURREC_SALES_AN = Sales.SACODE
   left outer join SL_ANALYSIS SalesBank on CURREC_SALES_AN_BNK = SalesBank.SACODE
   left outer join SL_ANALYSIS SalesDiscount on CURREC_SALES_AN_DIS = SalesDiscount.SACODE
   left outer join SL_ANALYSIS SalesExchange on CURREC_SALES_AN_EX = SalesExchange.SACODE
   left outer join SL_ANALYSIS SalesRounding on CURREC_SALES_AN_RND = SalesRounding.SACODE
   left outer join SL_ANALYSIS SalesStock on CURREC_SALES_AN_STK = SalesStock.SACODE
   left outer join SL_ANALYSIS StockOut on CURREC_STK_OUT_ANALYSIS = StockOut.SACODE
   -- purchase
   left outer join PL_ANALYSIS Purchase on CURREC_PURCH_AN = Purchase.PACODE
   left outer join PL_ANALYSIS PurchaseBank on CURREC_PURCH_AN_BNK = PurchaseBank.PACODE
   left outer join PL_ANALYSIS PurchaseDiscount on CURREC_PURCH_AN_DIS = PurchaseDiscount.PACODE
   left outer join PL_ANALYSIS PurchaseExchange on CURREC_PURCH_AN_EX = PurchaseExchange.PACODE
   left outer join PL_ANALYSIS PurchaseRounding on CURREC_PURCH_AN_RND = PurchaseRounding.PACODE
   left outer join PL_ANALYSIS PurchaseStock on CURREC_PURCH_AN_STK = PurchaseStock.PACODE
   left outer join PL_ANALYSIS StockIn on CURREC_STK_IN_ANALYSIS = StockIn.PACODE
   -- nominal
   left outer hash join NL_ACCOUNTS NominalSales on CURREC_NOM_SALES = NominalSales.NCODE
   left outer hash join NL_ACCOUNTS NominalSalesDiscount on CURREC_NOM_SALEDIS = NominalSalesDiscount.NCODE
   left outer hash join NL_ACCOUNTS NominalPurchase on CURREC_NOM_PURCH = NominalPurchase.NCODE
   left outer hash join NL_ACCOUNTS NominalPurchaseDiscount on CURREC_NOM_PURDIS = NominalPurchaseDiscount.NCODE
   left outer hash join NL_ACCOUNTS NominalExchange on CURREC_NOM_EXDIFF = NominalExchange.NCODE
   left outer hash join NL_ACCOUNTS NominalSalesControl on CURREC_NOM_SALECON = NominalSalesControl.NCODE
   left outer hash join NL_ACCOUNTS NominalBank on CURREC_NOM_BANK = NominalBank.NCODE
   left outer hash join NL_ACCOUNTS NominalPurchaseControl on CURREC_NOM_PURCHCON = NominalPurchaseControl.NCODE
   left outer hash join NL_ACCOUNTS NominalYearEnd on CURREC_NOM_YEAR_END = NominalYearEnd.NCODE
   left outer hash join NL_ACCOUNTS NominalRounding on CURREC_NOM_ROUND = NominalRounding.NCODE
   -- stock nominal
   left outer hash join NL_ACCOUNTS NominalPurchaseAccruedIncome on CURREC_NOM_PL_ACCRUED_INCOME = NominalPurchaseAccruedIncome.NCODE
   left outer hash join NL_ACCOUNTS NominalCostOfGoods on CURREC_NOM_COST_OF_GOODS = NominalCostOfGoods.NCODE
   left outer hash join NL_ACCOUNTS NominalPurchaseStockAdjustments on CURREC_NOM_PL_STOCK_ADJUSTMENTS = NominalPurchaseStockAdjustments.NCODE
   left outer hash join NL_ACCOUNTS NominalGoodsReceivedNotInvoiced on CURREC_NOM_GOODS_RCVD_NOT_INV = NominalGoodsReceivedNotInvoiced.NCODE
   left outer hash join NL_ACCOUNTS NominalStockControl on CURREC_NOM_STOCK_CONTROL = NominalStockControl.NCODE
   left outer hash join NL_ACCOUNTS NominalBalanceStockAdjustments on CURREC_NOM_BS_STOCK_ADJUSTMENTS = NominalBalanceStockAdjustments.NCODE
   left outer hash join NL_ACCOUNTS NominalBalanceAccruedIncome on CURREC_NOM_BS_ACCRUED_INCOME = NominalBalanceAccruedIncome.NCODE
   -- home only
   inner join SYS_DATAINFO on SYS_PRIMARY = 1
   left outer join NL_ACCOUNTS NominalVatControl on NOM_VAT_CNTRL = NominalVatControl.NCODE
   left outer join NL_ACCOUNTS NominalSuspense on NOM_SUSPENSE = NominalSuspense.NCODE
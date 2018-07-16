CREATE VIEW AA_REP_STK_LANDED_VIEW

/*
** View for use with landed costs audit crystal report
**
** Written     :  07/06/2006 RV
** Last Amended:  19/07/2006 RV, 18/10/2006 RV
**
** Used by     :  FIFO Landed Costs Audit Trail.rpt
*/
(
  Movement_Primary
, Tran_Date
, Tran_Year
, Period
, Reference
, Customer_or_Supplier_Code
, Tran_Type
, Direction
, Stock_Code
, Total_Quantity
, Cost_Price
, Cost_Value
, Batched
, Landed_Costs
, Stock_Name
, Stock_Physical
, Stock_Sort_Key
, Stock_User_Sort1
, Stock_User_Sort2
, Stock_User_Sort3
, Language_Link

)
as
select
  SM1.SM_PRIMARY
, SM1.SM_DATE                     -- Date
, SM1.SM_YEAR                     -- Year
, SM1.SM_PERIODNUM                -- Period
, SM1.SM_REFERENCE
, SM1.SM_ACCOUNT
, SM1.SM_TYPE
, SM1.SM_STATUS
, SM1.SM_STOCK_CODE
, SM1.SM_QUANTITY * SM1.SM_QTYUNIT       -- Total_Quantity
, SM1.SM_COSTPRICE                   -- CostPrice
, (case
   when SM1.SM_STATUS = 'I' and SM1.SM_ORIGIN ='S' then SM1.SM_COSTPRICE * SM1.SM_QUANTITY * SM1.SM_QTYUNIT
   when SM1.SM_STATUS = 'O' and substring(SM1.SM_PRICECODE,1,1) = 'S' and SM1.SM_TYPE<>'L' and SM1.SM_QUANTITY <> 0 and SM1.SM_ORIGIN <> 'P'
      then SM1.SM_COSTPRICE * SM1.SM_QUANTITY * SM1.SM_QTYUNIT
   else SM1.SM_VALUE
   end)       -- Cost_Value

, Cast(SM1.SM_BATCH_FLAG as Bit)
, case
   when SM1.SM_TYPE = 'L'
      then SM1.SM_VALUE
   when SM1.SM_STATUS = 'O'
      then SM1.SM_LC_OUT
   when SM1.SM_EXCLUDE_FROM_WEIGHTED_VAL = 0
      then (select isnull(sum(LD_COST),0) from STK_LANDED_DETAIL where LD_MOVEMENT_LINK = SM1.SM_PRIMARY)
   else 0
  end

, STK_STOCK.STKNAME
, STK_STOCK.STK_PHYSICAL + STK_STOCK.STK_QTYPRINTED
, STK_STOCK.STK_SORT_KEY
, STK_STOCK.STK_SORT_KEY1
, STK_STOCK.STK_SORT_KEY2
, STK_STOCK.STK_SORT_KEY3
, 'ENGLISH   '

from STK_MOVEMENTS SM1

   Inner join STK_STOCK
   On SM1.SM_STOCK_CODE = STK_STOCK.STKCODE

-- Inner join STK_LOCATION
-- On SM1.SM_LOCATION = STK_LOCATION.LOC_CODE And SM1.SM_STOCK_CODE = STK_LOCATION.LOC_STOCK_CODE

   Left Outer Join STK_MOVEMENTS SM2 On (SM2.SM_DATE > SM1.SM_DATE Or (SM1.SM_DATE = SM2.SM_DATE And SM2.SM_PRIMARY > SM1.SM_PRIMARY)) And SM2.SM_STOCK_CODE = SM1.SM_STOCK_CODE and
(SM2.SM_STATUS = 'I' Or SM2.SM_TYPE = 'L') and SM2.SM_BATCH_FLAG = 0

Where   (SM1.SM_STATUS = 'I' Or SM1.SM_TYPE = 'L') and SM1.SM_BATCH_FLAG = 0 and
   (STK_STOCK.STK_PHYSICAL + STK_STOCK.STK_QTYPRINTED)  <> 0.00 and isnull(SM1.SM_LOCATION,'') <> ''
group by
  stkcode
, sm1.sm_primary
, SM1.SM_YEAR
, SM1.SM_PERIODNUM
, SM1.SM_REFERENCE
, SM1.SM_ACCOUNT
, SM1.SM_TYPE
, SM1.SM_STATUS
, SM1.SM_STOCK_CODE
, SM1.SM_COSTPRICE
, SM1.SM_DATE
, SM1.SM_QUANTITY
, SM1.SM_QTYUNIT
, SM1.SM_ORIGIN
, SM1.SM_PRICECODE
, SM1.SM_VALUE
, SM1.SM_BATCH_FLAG
, SM1.SM_LC_OUT
, SM1.SM_EXCLUDE_FROM_WEIGHTED_VAL
, STK_STOCK.STKNAME
, STK_STOCK.STK_PHYSICAL
, STK_STOCK.STK_QTYPRINTED
, STK_STOCK.STK_SORT_KEY
, STK_STOCK.STK_SORT_KEY1
, STK_STOCK.STK_SORT_KEY2
, STK_STOCK.STK_SORT_KEY3
having isnull(sum(SM2.SM_QUANTITY * SM2.SM_QTYUNIT),0)  < (min(STK_STOCK.STK_PHYSICAL) + min(STK_STOCK.STK_QTYPRINTED))
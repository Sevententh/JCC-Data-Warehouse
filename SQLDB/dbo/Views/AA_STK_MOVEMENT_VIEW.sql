create view AA_STK_MOVEMENT_VIEW
/*
** View to split serial number ins and outs into separate movements
**
** Written:      15/01/2003 NC   
** Last Amended: 30/01/2003 NC, 13/10/03 NC,30/10/03 SR, 12/11/2003 RL, 28/11/03 SR, 6/1/2004 RL,  19/1/2004 RL, 01/03/04 NC, 24/9/2004 RL,10/2/05chw, 29/06/05 NC, 13/7/2005 WW;28/2/08chw,29/2/08chw, 28/3/08 NC
*/
( Movement_Primary
, Origin
, Tran_Date
, Tran_Year
, Period
, Required_date
, Reference
, Order_Ref -- Order Number
, Customer_or_Supplier_Code
, Detail
, Tran_Type
, Description
, Direction
, Stock_Code
, Sub_Analysis
, Assembly
, Serialised
, Serial_Number
, Weight
, Quantity
, Quantity_Unit
, Total_Quantity
, Price_Type
, Price_Line
, Price
, Cost_Price
, Sell_Price
, Base2_Price
, Base2_Cost_Price
, Base2_Sell_Price
, Value
, Cost_Value
, Sell_Value
, Base2_Value
, Base2_Cost_Value
, Base2_Sell_Value
, Currency_Symbol
, Currency_Value
, Weighted_Value
, Landed_Cost_Line
, Landed_Cost_Updated
, Outward_Landed_Costs
, Base2_Outward_Landed_Costs
, Archive
, Batched
, Batch_Reference
, User_Created
, Date_Created
, Multi_User_Status
, Fifo_Quantity
, Cost_Header
, Cost_Centre
, Order_Detail_Link
, Order_Header_Link
, Exclude_From_Weighted_Value
, Profit_Cost_Type
, Analysis
, Price_Adjustment_Flag
, Period_Sort
, Works_Order_Number
, Order_Account
, Delivery_Account
, Invoice_Account
)
as
select
  m.SM_PRIMARY
, m.SM_ORIGIN                   -- Origin
, m.SM_DATE                     -- Date
, m.SM_YEAR                     -- Year
, m.SM_PERIODNUM                -- Period
, m.SM_REQUIRED_DATE            -- Required_date
, m.SM_REFERENCE
, m.SM_ORDER_REF
, m.SM_ACCOUNT
, m.SM_DETAIL
, m.SM_TYPE
, m.SM_DESCRIPTION
, m.SM_STATUS
, m.SM_STOCK_CODE
, m.SM_LOCATION
, m.SM_ASSEMBLY
, m.SM_SERIALTRACK
, m.SM_SERIALNUMBER
, m.SM_WEIGHT
, m.SM_QUANTITY                    -- Quantity
, m.SM_QTYUNIT                     -- Quantity_Unit
, m.SM_QUANTITY * m.SM_QTYUNIT       -- Total_Quantity
, substring(m.SM_PRICECODE,1,1)    -- Price_Type
, substring(m.SM_PRICECODE,2,2)    -- Price_Line
, (case when m.SM_ORIGIN = 'S' and (m.SM_QUANTITY * m.SM_QTYUNIT) <> 0 then m.SM_VALUE/(m.SM_QUANTITY * m.SM_QTYUNIT)
       when m.SM_ORIGIN = 'M' and isnull(m.SM_ASSEMBLY,0)=0 and m.SM_STATUS='O' and (m.SM_QUANTITY * m.SM_QTYUNIT) <> 0 then m.SM_VALUE/(m.SM_QUANTITY * m.SM_QTYUNIT)
       else m.SM_COSTPRICE end)   -- Price
, m.SM_COSTPRICE                  -- CostPrice
, (case when m.SM_ORIGIN = 'S' and (m.SM_QUANTITY * m.SM_QTYUNIT) <> 0 and m.SM_STATUS='O' then m.SM_VALUE/(m.SM_QUANTITY * m.SM_QTYUNIT)
       when m.SM_ORIGIN = 'M' and isnull(m.SM_ASSEMBLY,0)=0 and m.SM_STATUS='O' and (m.SM_QUANTITY * m.SM_QTYUNIT) <> 0 then m.SM_VALUE/(m.SM_QUANTITY * m.SM_QTYUNIT)
       else 0 end)              -- SellPrice

, (case when m.SM_ORIGIN = 'S' and (m.SM_QUANTITY * m.SM_QTYUNIT) <> 0 then m.SM_VALUE_BASE2/(m.SM_QUANTITY * m.SM_QTYUNIT)
       when m.SM_ORIGIN = 'M' and isnull(m.SM_ASSEMBLY,0)=0 and m.SM_STATUS='O' and (m.SM_QUANTITY * m.SM_QTYUNIT) <> 0 then m.SM_VALUE_BASE2/(m.SM_QUANTITY * m.SM_QTYUNIT)
       else m.SM_COSTPRICE_BASE2 end)   -- Base2Price
, m.SM_COSTPRICE_BASE2                   -- Base2CostPrice
, (case when m.SM_ORIGIN = 'S' and (m.SM_QUANTITY * m.SM_QTYUNIT) <> 0 then m.SM_VALUE_BASE2/(m.SM_QUANTITY * m.SM_QTYUNIT)
       when m.SM_ORIGIN = 'M' and isnull(m.SM_ASSEMBLY,0)=0 and m.SM_STATUS='O' and (m.SM_QUANTITY * m.SM_QTYUNIT) <> 0 then m.SM_VALUE_BASE2/(m.SM_QUANTITY * m.SM_QTYUNIT)
       else 0 end)              -- Base2SellPrice

, m.SM_VALUE       -- Value
, (case
   when m.SM_STATUS = 'I' and m.SM_ORIGIN ='S' then m.SM_COSTPRICE * m.SM_QUANTITY * m.SM_QTYUNIT
   when m.SM_STATUS = 'O' and m.SM_TYPE<>'L' and m.SM_QUANTITY <> 0 and m.SM_ORIGIN <> 'P' and isnull(m.SM_ASSEMBLY,0)=0
      then m.SM_COSTPRICE * m.SM_QUANTITY * m.SM_QTYUNIT
   else m.SM_VALUE
   end)       -- Cost_Value
, (case when m.SM_ORIGIN = 'S' then m.SM_VALUE
       when m.SM_ORIGIN = 'M' and m.SM_STATUS = 'O'and isnull(m.SM_ASSEMBLY,0)=0 and m.SM_QUANTITY <> 0 then m.SM_VALUE
       else 0 end) -- Sell_Value

, m.SM_VALUE_BASE2  -- Base2_Value
, (case
   when m.SM_STATUS = 'I' and m.SM_ORIGIN ='S' then m.SM_COSTPRICE_BASE2 * m.SM_QUANTITY * m.SM_QTYUNIT
   when m.SM_STATUS = 'O' and isnull(m.SM_ASSEMBLY,0)=0 and m.SM_TYPE<>'L' and m.SM_QUANTITY <> 0 and m.SM_ORIGIN <> 'P'
      then m.SM_COSTPRICE_BASE2 * m.SM_QUANTITY * m.SM_QTYUNIT
   else m.SM_VALUE_BASE2
   end)       -- Base2_Cost_Value
, (case when m.SM_ORIGIN = 'S' then m.SM_VALUE_BASE2
       when m.SM_STATUS = 'O' and m.SM_ORIGIN = 'M' and isnull(m.SM_ASSEMBLY,0)=0 and m.SM_QUANTITY <> 0 then m.SM_VALUE_BASE2
       else 0 end)              -- Base2_Sell_Value

, m.SM_CURRENCY                    -- Currency_Symbol
, m.SM_VALUE_C                     -- Currency_Value
, (case when m.SM_EXCLUDE_FROM_WEIGHTED_VAL = 0 and m.SM_STATUS ='I' then m.SM_VALUE
       else 0 end)              -- Weighted_Value
, m.SM_LC_LINE                     -- Landed_Cost_Line
, m.SM_UPDATE_LC                   -- Landed_Cost_Updated
, m.SM_LC_OUT                      -- Outward_Landed_Costs
, m.SM_LC_OUT_BASE2                -- Base2_Outward_Landed_Costs
, m.SM_ARCHIVE
, m.SM_BATCH_FLAG
, m.SM_BATCH_REF
, m.SM_USER_PUTIN
, m.SM_DATE_PUTIN
, m.SM_MU_STATUS
, m.SM_FIFO_QTY
, m.SM_COSTHEADER
, m.SM_COSTCENTRE
, m.SM_ORDER_LINK
, case when m.SM_ORIGIN = 'S' and isnull(m.SM_ORDER_REF,'')<>'' then 'S' + m.SM_ORDER_REF
      when m.SM_ORIGIN = 'P' and isnull(m.SM_ORDER_REF,'')<>'' then 'P' + m.SM_ORDER_REF
      when m.SM_ORIGIN = 'M' and isnull(m.SM_ORDER_LINK,0)<>0 then 'M' + convert(varchar,convert(decimal(16),m.SM_ORDER_LINK))
      else 'MI' + convert(varchar,convert(decimal(16),m.SM_PRIMARY)) end
, m.SM_EXCLUDE_FROM_WEIGHTED_VAL
, m.SM_PROFIT_COST_TYPE
, m.SM_ANALYSIS
, isnull(m.SM_VARIANCE, 0)
, charindex(m.SM_YEAR, 'OLCN') * 13 + m.SM_PERIODNUM - 26
, m.SM_WO_NUMBER
, (case when m.SM_ORIGIN = 'S' --Order Account
        then o.OH_ACCOUNT_ORDER
        else m.SM_ACCOUNT 
        end)
, (case when m.SM_ORIGIN = 'S' --Delivery Account
        then m.SM_ACCOUNT 
        else (case when m.SM_ORIGIN = 'P' 
                   then (case when p.POH_DEL_ADD_POINT ='CU'
                              then --a.AD_ACC_CODE
                                 (select a.AD_ACC_CODE from SL_ADDRESSES a with (nolock) where a.SL_AD_PRIMARY=p.POH_DEL_ADD)
                              else m.SM_ACCOUNT
                              end)
                   else m.SM_ACCOUNT
                   end)
        end)
, (case when m.SM_ORIGIN = 'S' -- Invoice Account
        then o.OH_ACCOUNT
        else  m.SM_ACCOUNT
        end)

from STK_MOVEMENTS m
   left join ORD_HEADER o with (nolock) on m.SM_ORIGIN = 'S' 
                                          and o.OH_ORDER_NUMBER = convert(int,(case isnumeric(m.SM_ORDER_REF) when 1 then m.SM_ORDER_REF else 0 end))
   left join POP_HEADER p with (nolock) on m.SM_ORIGIN = 'P' and p.POH_ORDER_NUMBR=m.SM_ORDER_REF
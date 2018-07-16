create view AA_STK_LANDED_VIEW
/*
** View to split serial number ins and outs into separate movements and include landed cost values in the Weighted Value column
**
** Written:      3/3/2004 RL   
** Last Amended: 12/3/2004 RL, 24/9/2004 RL,27/7/06chw, 6/10/2006 RL,  27/2/2007 RL, 28/2/2007 RL, 8/3/2007 RL,28/2/08chw;29/2/08chw
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
, Landed_Costs
, Period_Sort
, Works_Order_Number
, Order_Account
, Delivery_Account
, Invoice_Account
)
as
select
  SM_PRIMARY
, SM_ORIGIN                   -- Origin
, SM_DATE                     -- Date
, SM_YEAR                     -- Year
, SM_PERIODNUM                -- Period
, SM_REQUIRED_DATE            -- Required_date
, SM_REFERENCE
, SM_ORDER_REF
, SM_ACCOUNT
, SM_DETAIL
, SM_TYPE
, SM_DESCRIPTION
, SM_STATUS
, SM_STOCK_CODE
, SM_LOCATION
, SM_ASSEMBLY
, SM_SERIALTRACK
, SM_SERIALNUMBER
, SM_WEIGHT
, SM_QUANTITY                    -- Quantity
, SM_QTYUNIT                     -- Quantity_Unit
, SM_QUANTITY * SM_QTYUNIT       -- Total_Quantity
, substring(SM_PRICECODE,1,1)    -- Price_Type
, substring(SM_PRICECODE,2,2)    -- Price_Line
, (case when SM_ORIGIN = 'S' and (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE/(SM_QUANTITY * SM_QTYUNIT)
		 when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' and (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE/(SM_QUANTITY * SM_QTYUNIT)
		 else SM_COSTPRICE end)   -- Price
, SM_COSTPRICE                   -- CostPrice
, (case when SM_ORIGIN = 'S' and (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE/(SM_QUANTITY * SM_QTYUNIT)
		 when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' and (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE/(SM_QUANTITY * SM_QTYUNIT)
		 else 0 end)              -- SellPrice

, (case when SM_ORIGIN = 'S' and (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE_BASE2/(SM_QUANTITY * SM_QTYUNIT)
		 when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' and (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE_BASE2/(SM_QUANTITY * SM_QTYUNIT)
		 else SM_COSTPRICE_BASE2 end)   -- Base2Price
, SM_COSTPRICE_BASE2                   -- Base2CostPrice
, (case when SM_ORIGIN = 'S' and (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE_BASE2/(SM_QUANTITY * SM_QTYUNIT)
		 when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' and (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE_BASE2/(SM_QUANTITY * SM_QTYUNIT)
		 else 0 end)              -- Base2SellPrice

, SM_VALUE       -- Value
, (case
   when SM_STATUS = 'I' and SM_ORIGIN ='S' then SM_COSTPRICE * SM_QUANTITY * SM_QTYUNIT
   when SM_STATUS = 'O' and SM_TYPE<>'L' and SM_QUANTITY <> 0 and SM_ORIGIN <> 'P' and isnull(SM_ASSEMBLY,0)=0
      then SM_COSTPRICE * SM_QUANTITY * SM_QTYUNIT
   else SM_VALUE
   end)       -- Cost_Value
, (case when SM_ORIGIN = 'S' then SM_VALUE
		 when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' and SM_QUANTITY <> 0 then SM_VALUE
		 else 0 end)              -- Sell_Value

, SM_VALUE_BASE2  -- Base2_Value
, (case
	when SM_STATUS = 'I' and SM_ORIGIN ='S' then SM_COSTPRICE_BASE2 * SM_QUANTITY * SM_QTYUNIT
	when SM_STATUS = 'O' and substring(SM_PRICECODE,1,1) = 'S' and SM_TYPE<>'L' and SM_QUANTITY <> 0 and SM_ORIGIN <> 'P'
		then SM_COSTPRICE_BASE2 * SM_QUANTITY * SM_QTYUNIT
	else SM_VALUE_BASE2
   end)       -- Base2_Cost_Value
, (case when SM_ORIGIN = 'S' then SM_VALUE_BASE2
		 when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' and SM_QUANTITY <> 0 then SM_VALUE_BASE2
		 else 0 end)              -- Base2_Sell_Value

, SM_CURRENCY                    -- Currency_Symbol
, SM_VALUE_C                     -- Currency_Value
, (case when SM_STATUS ='I' and (STK_USR_VALUATN = 'X' or PROFIT_COST_TYPE = 'X' or WO_ISSUE_COST_METHOD = 'X' or SM_EXCLUDE_FROM_WEIGHTED_VAL = 0)
	then SM_VALUE + (select isnull(sum(LD_COST),0) from STK_LANDED_DETAIL where LD_MOVEMENT_LINK = SM_PRIMARY)
	else 0 
	end)              -- Weighted_Value
, SM_LC_LINE                     -- Landed_Cost_Line
, SM_UPDATE_LC                   -- Landed_Cost_Updated
, SM_LC_OUT                      -- Outward_Landed_Costs
, SM_LC_OUT_BASE2                -- Base2_Outward_Landed_Costs
, SM_ARCHIVE
, SM_BATCH_FLAG
, SM_BATCH_REF
, SM_USER_PUTIN
, SM_DATE_PUTIN
, SM_MU_STATUS
, SM_FIFO_QTY
, SM_COSTHEADER
, SM_COSTCENTRE
, SM_ORDER_LINK
, case when SM_ORIGIN = 'S' and isnull(SM_ORDER_REF,'')<>'' then 'S' + SM_ORDER_REF
		when SM_ORIGIN = 'P' and isnull(SM_ORDER_REF,'')<>'' then 'P' + SM_ORDER_REF
		when SM_ORIGIN = 'M' and isnull(SM_ORDER_LINK,0)<>0 then 'M' + convert(varchar,convert(decimal(16),SM_ORDER_LINK))
		else 'MI' + convert(varchar,convert(decimal(16),SM_PRIMARY)) end
, SM_EXCLUDE_FROM_WEIGHTED_VAL
, isnull(SM_PROFIT_COST_TYPE,'')
, SM_ANALYSIS
, isnull(SM_VARIANCE, 0)
, case 								-- Landed Costs
	when SM_TYPE = 'L' 
		then SM_VALUE
	when SM_STATUS = 'O'
		then SM_LC_OUT
	when (STK_USR_VALUATN = 'X' or PROFIT_COST_TYPE = 'X' or WO_ISSUE_COST_METHOD = 'X' or SM_EXCLUDE_FROM_WEIGHTED_VAL = 0)
		then (select isnull(sum(LD_COST),0) from STK_LANDED_DETAIL where LD_MOVEMENT_LINK = SM_PRIMARY)
	else 0
  end
, charindex(SM_YEAR, 'OLCN') * 13 + SM_PERIODNUM - 26		-- Period_Sort
, SM_WO_NUMBER	--Works Order Number
, (case when SM_ORIGIN = 'S' --Order Account
	then (Select OH_ACCOUNT_ORDER from ORD_HEADER where OH_ORDER_NUMBER=SM_ORDER_REF)
	else SM_ACCOUNT 
    	end)
, (case when SM_ORIGIN = 'S' --Delivery Account
        then SM_ACCOUNT 
        else (case when SM_ORIGIN = 'P' 
                   then (case when (select POH_DEL_ADD_POINT from POP_HEADER where POH_ORDER_NUMBR=SM_ORDER_REF) ='CU'
                              then (select CUCODE from SL_ACCOUNTS join SL_ADDRESSES on CUCODE = AD_ACC_CODE join POP_HEADER on SL_AD_PRIMARY=POH_DEL_ADD where POH_ORDER_NUMBR=SM_ORDER_REF)
                              else SM_ACCOUNT
                              end)
                   else SM_ACCOUNT
                   end)
        end)
, (case when SM_ORIGIN = 'S' -- Invoice Account
	then (Select OH_ACCOUNT from ORD_HEADER where OH_ORDER_NUMBER=SM_ORDER_REF) 
	else  SM_ACCOUNT
	end)

from STK_MOVEMENTS,
SYS_DATAINFO,
SYS_DATAINFO2
where SYS_PRIMARY = 1
and SYS_PRIMARY_2 = 1
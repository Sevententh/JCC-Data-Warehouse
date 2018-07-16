CREATE VIEW AA_STK_SERIAL_HISTORY_VIEW
/*
**
** Written:      13/10/2003 NC
** Last Amended: 20/10/2003 NC, 08/12/2003 NC, 16/01/04 SR, 14/06/04 NC, 15/6/04chw, 15/07/04 NC,4/4/05chw,20/10/05chw, 15/12/2005 RL, 3/2/09 NC
*/
( Serial_Number
, Stock_Code
, Current_Status -- I or O
, Batched
, Current_Sub_Analysis
, Transaction_Sub_Analysis
, Current_Lot_Number
, Transaction_Lot_Number
, Current_Serial_Sort_Key
, Transaction_Serial_Sort_Key
, Current_Renew_Date
, Transaction_Renew_Date
, Exclude_From_SOP
, Serial_User_Date1
, Serial_User_Date2
, Serial_User_Date3
, Serial_Notes
, Serial_Last_Edited_User
, Serial_Last_Edited_Date
, Date_Entered
, Movement_Primary
, Origin -- P, M, S, R
, Transaction_Date
, Transaction_Year
, Transaction_Period
, Movement_Date
, Movement_Reference
, Order_Ref -- Order Number
, Account_Ref -- Customer or Supplier_Code
, Detail
, Tran_Type
, Direction -- I or O
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
, Archive
, Batch_Reference
, Cost_Header
, Cost_Centre
, Order_Detail_Link
, Order_Number_Link -- SOP only (use Order_Ref for POP)
, Current_Batched_Status -- blank, I or O
, Component_Link  -- WO only
, WO_Number    -- WO only
, Serial_Link_Primary
)
as
Select
    SNO_SERIAL_NUMBER
  , SNO_STOCK_CODE
  , case when SNO_STATUS='O' and SNO_BATCH_FLAG>=1 then 'I' when SNO_STATUS='I' and SNO_BATCH_FLAG=0 then 'I' else 'O' end
  , case SM_ORIGIN when 'M' then SM_BATCH_FLAG else 0 end
  , SNO_SUBANALYSIS
  , SM_LOCATION
  , SNO_LOT_NUMBER
  , SNOL_LOT_NUMBER
  , SNO_SORT_KEY
  , SNOL_SORT_KEY
  , SNO_RENEW_DATE
  , SNOL_RENEW_DATE
  , SNO_EXCLUDE_FROM_SOP
  , SNO_USRDATE1
  , SNO_USRDATE2
  , SNO_USRDATE3
  , SNO_NOTES
  , SNO_USER_EDITED
  , SNO_DATE_EDITED
  , SNOL_DATE_ENTERED
  , SM_PRIMARY
  , SM_ORIGIN
  , SM_DATE                     -- Date
  , SM_YEAR                     -- Year
  , SM_PERIODNUM                -- Period
  , SM_DATE
  , SM_REFERENCE
  , SNOL_ORDER_REF
  , SNOL_ACCOUNT_REF
  , SM_DETAIL
  , SM_TYPE + case when SM_ORIGIN = 'S' and SM_STATUS = 'I' then 'C'
               when SM_ORIGIN = 'S' and SM_STATUS = 'O' then 'O'
               when SM_ORIGIN = 'P' and SM_STATUS = 'I' then 'O'
               when SM_ORIGIN = 'P' and SM_STATUS = 'O' then 'C'
               else '' end
  , SM_STATUS  --direction

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

  , (case when (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE/(SM_QUANTITY * SM_QTYUNIT)
          else SM_VALUE end)      -- Value
  , (case when SM_ORIGIN = 'S' then SM_COSTPRICE
          when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' then SM_COSTPRICE
          when (SM_QUANTITY * SM_QTYUNIT) <> 0 then SM_VALUE/(SM_QUANTITY * SM_QTYUNIT)
          else SM_VALUE end)       -- Cost_Value
  , (case when SM_ORIGIN = 'S' then SM_VALUE/(SM_QUANTITY * SM_QTYUNIT)
          when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' then SM_VALUE/(SM_QUANTITY * SM_QTYUNIT)
          else 0 end)              -- Sell_Value

  , SM_VALUE_BASE2  -- Base2_Value
  , (case when SM_ORIGIN = 'S' then SM_COSTPRICE_BASE2
          when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' then SM_COSTPRICE_BASE2
          else SM_VALUE_BASE2/(SM_QUANTITY * SM_QTYUNIT) end)       -- Base2_Cost_Value
  , (case when SM_ORIGIN = 'S' then SM_VALUE_BASE2/(SM_QUANTITY * SM_QTYUNIT)
          when SM_ORIGIN = 'M' and substring(SM_PRICECODE,1,1) = 'S' then SM_VALUE_BASE2/(SM_QUANTITY * SM_QTYUNIT)
          else 0 end)              -- Base2_Sell_Value
  , SM_ARCHIVE
  , SM_BATCH_REF
  , SM_COSTHEADER
  , SM_COSTCENTRE
  , SM_ORDER_LINK
  , case when SM_ORIGIN = 'S' then (select OD_ORDER_NUMBER from ORD_DETAIL with (nolock) where OD_PRIMARY = SM_ORDER_LINK)
    else NULL end
  , case when SNO_BATCH_FLAG >= 1 then SNO_STATUS else '' end -- current batch status
  , case when SM_ORIGIN = 'W' then SM_COMPONENT_LINK else null end
  , case when SM_ORIGIN = 'W' then SM_WO_NUMBER else null end
  , SNOL_PRIMARY
   from STK_SERIAL_NUMBERS with (nolock)
      join STK_SERIAL_LINK with (nolock) on SNOL_SERIAL_LINK = SNO_PRIMARY
      join STK_MOVEMENTS with (nolock) on SM_PRIMARY = SNOL_MOVEMENT_LINK
   where SNOL_MOVEMENT_LINK <> 0

union all

Select
    SNO_SERIAL_NUMBER
  , SNO_STOCK_CODE
  , case when SNO_STATUS='O' and SNO_BATCH_FLAG>=1 then 'I' when SNO_STATUS='I' and SNO_BATCH_FLAG=0 then 'I' else 'O' end
  , case SNOL_DIRECTION when 'N' then '' else SNO_BATCH_FLAG end
  , SNO_SUBANALYSIS
  , OD_LOCATN
  , SNO_LOT_NUMBER
  , SNOL_LOT_NUMBER
  , SNO_SORT_KEY
  , SNOL_SORT_KEY
  , SNO_RENEW_DATE
  , SNOL_RENEW_DATE
  , SNO_EXCLUDE_FROM_SOP
  , SNO_USRDATE1
  , SNO_USRDATE2
  , SNO_USRDATE3
  , SNO_NOTES
  , SNO_USER_EDITED
  , SNO_DATE_EDITED
  , SNOL_DATE_ENTERED
  , 0
  , 'S'   -- Origin
  , OD_DATE                     -- Date
  , (case SALES_UPDTEYEAR when 'C' then OD_YEAR else substring('LCNN',charindex(OD_YEAR,'OLCN'),1) end)    -- Year
  , OD_PERIOD                   -- Period
  , NULL
  , ''
  , SNOL_ORDER_REF
  , SNOL_ACCOUNT_REF
  , OD_DETAIL
  , 'S'+OD_TYPE
  , case when OD_TYPE = 'O' then 'O' when SNOL_DIRECTION = 'N' then '' else 'I' end  -- Direction

  , OD_UNITCST   -- Price
  , OD_COSTPRICE                   -- CostPrice
  , OD_UNITCST              -- SellPrice

  , OD_UNITCST_BASE2   -- Base2Price
  , OD_COSTPRICE_BASE2                   -- Base2CostPrice
  , OD_UNITCST_BASE2              -- Base2SellPrice

  , OD_NETT/OD_QTYORD       -- Value
  , OD_COSTPRICE       -- Cost_Value
  , OD_NETT/OD_QTYORD              -- Sell_Value

  , OD_NETT_BASE2/OD_QTYORD  -- Base2_Value
  , OD_COSTPRICE_BASE2 -- Base2_Cost_Value
  , OD_NETT_BASE2/OD_QTYORD       -- Base2_Sell_Value
  , OD_ARCHIVE
  , OD_BATCH_REF
  , OD_COSTHEADER
  , OD_COSTCENTRE
  , 0
  , OD_ORDER_NUMBER
  , case when SNO_BATCH_FLAG >= 1 then SNO_STATUS else '' end -- current batch status
  , null -- Component link
  , null -- WO number
  , SNOL_PRIMARY
   from STK_SERIAL_NUMBERS with (nolock)
      join STK_SERIAL_LINK with (nolock) on SNOL_SERIAL_LINK = SNO_PRIMARY
      join ORD_DETAIL with (nolock) on OD_PRIMARY = convert(int,substring(SNOL_ORDER_LINK,2,20))
      join SYS_DATAINFO with (nolock) on SYS_PRIMARY = 1
   where substring(SNOL_ORDER_LINK,1,1) = 'S'
      and isnull(SNOL_MOVEMENT_LINK,0) = 0

union all

Select
    SNO_SERIAL_NUMBER
  , SNO_STOCK_CODE
  , case when SNO_STATUS='O' and SNO_BATCH_FLAG>=1 then 'I' when SNO_STATUS='I' and SNO_BATCH_FLAG=0 then 'I' else 'O' end
  , SNO_BATCH_FLAG
  , SNO_SUBANALYSIS
  , POD_LOCATN
  , SNO_LOT_NUMBER
  , SNOL_LOT_NUMBER
  , SNO_SORT_KEY
  , SNOL_SORT_KEY
  , SNO_RENEW_DATE
  , SNOL_RENEW_DATE
  , SNO_EXCLUDE_FROM_SOP
  , SNO_USRDATE1
  , SNO_USRDATE2
  , SNO_USRDATE3
  , SNO_NOTES
  , SNO_USER_EDITED
  , SNO_DATE_EDITED
  , SNOL_DATE_ENTERED
  , 0
  , 'P'   -- Origin
  , POD_DATE                     -- Date
  , (case PURCH_UPDTEYEAR when 'C' then POD_YEAR else substring('LCNN',charindex(POD_YEAR,'OLCN'),1) end)        -- Year
  , POD_PERIOD                     -- Period
  , NULL
  , ''
  , SNOL_ORDER_REF
  , SNOL_ACCOUNT_REF
  , POD_DETAIL
  , 'P'+POD_TYPE
  , case POD_TYPE when 'O' then 'I' else 'O' end

  , POD_UNITCST   -- Price
  , POD_UNITCST                   -- CostPrice
  , 0              -- SellPrice

  , POD_UNITCST_BASE2   -- Base2Price
  , POD_UNITCST_BASE2                   -- Base2CostPrice
  , 0              -- Base2SellPrice

  , POD_NETT/POD_QTYORD       -- Value
  , POD_NETT/POD_QTYORD       -- Cost_Value
  , 0              -- Sell_Value

  , POD_NETT_BASE2/POD_QTYORD  -- Base2_Value
  , POD_NETT_BASE2/POD_QTYORD -- Base2_Cost_Value
  , 0       -- Base2_Sell_Value
  , POD_ARCHIVE
  , POD_BATCH_REF
  , POD_COSTHEADER
  , POD_COSTCENTRE
  , 0
  , NULL
  , case when SNO_BATCH_FLAG >= 1 then SNO_STATUS else '' end -- current batch status
  , null -- Component link
  , null -- WO number
  , SNOL_PRIMARY
   from STK_SERIAL_NUMBERS with (nolock)
      join STK_SERIAL_LINK with (nolock) on SNOL_SERIAL_LINK = SNO_PRIMARY
      join POP_DETAIL with (nolock) on POD_PRIMARY = convert(int,substring(SNOL_ORDER_LINK,2,20))
      join SYS_DATAINFO with (nolock) on SYS_PRIMARY = 1
   where substring(SNOL_ORDER_LINK,1,1) = 'P'
      and isnull(SNOL_MOVEMENT_LINK,0) = 0

union all

Select
    SNO_SERIAL_NUMBER
  , SNO_STOCK_CODE
  , case when SNO_STATUS='O' and SNO_BATCH_FLAG>=1 then 'I' when SNO_STATUS='I' and SNO_BATCH_FLAG=0 then 'I' else 'O' end
  , SNO_BATCH_FLAG
  , SNO_SUBANALYSIS
  , RPD_LOCATN
  , SNO_LOT_NUMBER
  , SNOL_LOT_NUMBER
  , SNO_SORT_KEY
  , SNOL_SORT_KEY
  , SNO_RENEW_DATE
  , SNOL_RENEW_DATE
  , SNO_EXCLUDE_FROM_SOP
  , SNO_USRDATE1
  , SNO_USRDATE2
  , SNO_USRDATE3
  , SNO_NOTES
  , SNO_USER_EDITED
  , SNO_DATE_EDITED
  , SNOL_DATE_ENTERED
  , 0
  , 'R'   -- Origin
  , RPD_DATE                     -- Date
  , (case PURCH_UPDTEYEAR when 'C' then RPD_YEAR else substring('LCNN',charindex(RPD_YEAR,'OLCN'),1) end)        -- Year
  , RPD_PERIOD                     -- Period
  , NULL
  , ''
  , RPD_ORDER_NO
  , RPD_ACCOUNT
  , RPD_DETAIL
  , 'P'
  , case RPD_TYPE when 'O' then 'I' else 'O' end

  , RPD_UNITCST   -- Price
  , RPD_UNITCST                   -- CostPrice
  , 0              -- SellPrice

  , RPD_UNITCST_BASE2   -- Base2Price
  , RPD_UNITCST_BASE2                   -- Base2CostPrice
  , 0              -- Base2SellPrice

  , RPD_NETT/RPD_QTYORD       -- Value
  , RPD_NETT/RPD_QTYORD       -- Cost_Value
  , 0              -- Sell_Value

  , RPD_NETT_BASE2/RPD_QTYORD  -- Base2_Value
  , RPD_NETT_BASE2/RPD_QTYORD -- Base2_Cost_Value
  , 0       -- Base2_Sell_Value
  , RPD_ARCHIVE
  , RPD_BATCH_REF
  , RPD_COSTHEADER
  , RPD_COSTCENTRE
  , 0
  , NULL
  , case when SNO_BATCH_FLAG >= 1 then SNO_STATUS else '' end -- current batch status
  , null -- Component link
  , null -- WO number
  , SNOL_PRIMARY
   from STK_SERIAL_NUMBERS with (nolock)
      join STK_SERIAL_LINK with (nolock) on SNOL_SERIAL_LINK = SNO_PRIMARY
      join RTP_DETAIL with (nolock) on RPD_PRIMARY = convert(int,substring(SNOL_ORDER_LINK,2,20))
      join SYS_DATAINFO with (nolock) on SYS_PRIMARY = 1
   where substring(SNOL_ORDER_LINK,1,1) = 'R'
      and isnull(SNOL_MOVEMENT_LINK,0) = 0

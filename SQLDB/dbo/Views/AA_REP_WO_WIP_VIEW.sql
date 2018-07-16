CREATE VIEW AA_REP_WO_WIP_VIEW

/*
** Written     :  02/03/2006 RV
** Last Amended:
**
** Used by     :  Work In Progress Report Using Average Valuation.rpt
**                Work In Progress Report Using Latest Valuation.rpt
**                Work In Progress Report Using Standard Valuation.rpt
**                Work In Progress Report Using Weighted Valuation.rpt
*/
AS

SELECT
--
WC_TYPE,
WC_PART_LINK,
WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0) As QTY_OUTSTANDING,
isnull(WC_ORIGINAL_COST_PRICE,0) As WC_ORIGINAL_COST_PRICE,
isnull(WC_LABOUR,0) As WC_LABOUR,

--Labour Costs

case  when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'T'
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * isnull(WC_ORIGINAL_COST_PRICE,0)
   else 0
end As LAB_OUTSTANDING_TEXT_VALUE,

case  when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'P'
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * isnull(PR_BASE_COST,0)
   else 0
end As LAB_OUTSTANDING_PRICE_VALUE,
--Stock Average Value (Labour)
case  when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is not null --sub analysis
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *   case when (LOC_PHYSICAL + LOC_QTYPRINTED) <> 0
                                 then dbo.AA_PRICE_DPS_F((LOC_AV_VALU / (LOC_PHYSICAL + LOC_QTYPRINTED)))
                                 else case when STK_BUY_UNIT1 <> 0
                                    then (dbo.AA_PRICE_DPS_F(LOC_COSTPRICE / STK_BUY_UNIT1))
                                    else dbo.AA_PRICE_DPS_F(LOC_COSTPRICE)
                                      end
                              end
   when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is null -- sub analysis not entered
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *   case when (COMP.STK_PHYSICAL + COMP.STK_QTYPRINTED) <> 0
                                 then dbo.AA_PRICE_DPS_F((COMP.STK_AV_VALU / (COMP.STK_PHYSICAL + COMP.STK_QTYPRINTED)))
                                 else case when STK_BUY_UNIT1 <> 0
                                    then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                                    else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                                      end
                              end
   when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN <> 1 -- main stock
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *   case when (COMP.STK_PHYSICAL + COMP.STK_QTYPRINTED) <> 0
                                 then dbo.AA_PRICE_DPS_F((COMP.STK_AV_VALU / (COMP.STK_PHYSICAL + COMP.STK_QTYPRINTED)))
                                 else case when STK_BUY_UNIT1 <> 0
                                    then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                                    else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                                      end
                              end
   else 0
end As LAB_OUTSTANDING_STOCK_AVERAGE_VALUE,
--Stock Latest Value (Labour)
case  when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is not null --sub analysis
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when STK_BUY_UNIT1 <> 0
            then (dbo.AA_PRICE_DPS_F(LOC_COSTPRICE / STK_BUY_UNIT1))
            else dbo.AA_PRICE_DPS_F(LOC_COSTPRICE)
            end
   when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is null -- sub analysis not entered
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when STK_BUY_UNIT1 <> 0
            then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
            else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
            end
   when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN <> 1 -- main stock
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when STK_BUY_UNIT1 <> 0
            then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
            else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
            end
   else 0
end As LAB_OUTSTANDING_STOCK_LATEST_VALUE,
--Stock Weighted Value (Labour)
case  when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is not null --sub analysis
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when (LOC_WAPU_VALUE <> 0 And LOC_WAPU_QUANTITY <> 0)
            then (dbo.AA_PRICE_DPS_F(LOC_WAPU_VALUE / LOC_WAPU_QUANTITY))
            else  case when STK_BUY_UNIT1 <> 0
                  then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                  else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                  end
            end
   when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is null -- sub analysis not entered
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when (COMP.STK_WAPU_VALUE <> 0 And COMP.STK_WAPU_QUANTITY <> 0)
            then (dbo.AA_PRICE_DPS_F(COMP.STK_WAPU_VALUE / COMP.STK_WAPU_QUANTITY))
            else  case when STK_BUY_UNIT1 <> 0
                  then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                  else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                  end
            end
   when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN <> 1 -- main stock
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when (COMP.STK_WAPU_VALUE <> 0 And COMP.STK_WAPU_QUANTITY <> 0)
            then (dbo.AA_PRICE_DPS_F(COMP.STK_WAPU_VALUE / COMP.STK_WAPU_QUANTITY))
            else  case when STK_BUY_UNIT1 <> 0
                  then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                  else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                  end
            end
   else 0
end As LAB_OUTSTANDING_STOCK_WEIGHTED_VALUE,
--Stock Standard Value (Labour)
case  when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is not null --sub analysis
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * LOC_STNDRD_COST
   when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is null -- sub analysis not entered
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * COMP.STK_STNDRD_COST
   when isnull(WC_LABOUR,0)= 1 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN <> 1 -- main stock
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * COMP.STK_STNDRD_COST
   else 0
end As LAB_OUTSTANDING_STOCK_STANDARD_VALUE,

--Material Costs

case  when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'T'
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * isnull(WC_ORIGINAL_COST_PRICE,0)
   else 0
end As MAT_OUTSTANDING_TEXT_VALUE,

case  when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'P'
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * isnull(PR_BASE_COST,0)
   else 0
end As MAT_OUTSTANDING_PRICE_VALUE,
--Stock Average Value (Material)
case  when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is not null --sub analysis
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *   case when (LOC_PHYSICAL + LOC_QTYPRINTED) <> 0
                                 then dbo.AA_PRICE_DPS_F((LOC_AV_VALU / (LOC_PHYSICAL + LOC_QTYPRINTED)))
                                 else case when STK_BUY_UNIT1 <> 0
                                    then dbo.AA_PRICE_DPS_F((LOC_COSTPRICE / STK_BUY_UNIT1))
                                    else dbo.AA_PRICE_DPS_F(LOC_COSTPRICE)
                                      end
                              end
   when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is null -- sub analysis not entered
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *   case when (COMP.STK_PHYSICAL + COMP.STK_QTYPRINTED) <> 0
                                 then dbo.AA_PRICE_DPS_F((COMP.STK_AV_VALU / (COMP.STK_PHYSICAL + COMP.STK_QTYPRINTED)))
                                 else case when STK_BUY_UNIT1 <> 0
                                    then dbo.AA_PRICE_DPS_F((COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                                    else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                                      end
                              end
   when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN <> 1 -- main stock
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *   case when (COMP.STK_PHYSICAL + COMP.STK_QTYPRINTED) <> 0
                                 then dbo.AA_PRICE_DPS_F((COMP.STK_AV_VALU / (COMP.STK_PHYSICAL + COMP.STK_QTYPRINTED)))
                                 else case when STK_BUY_UNIT1 <> 0
                                    then dbo.AA_PRICE_DPS_F((COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                                    else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                                      end
                              end
   else 0
end As MAT_OUTSTANDING_STOCK_AVERAGE_VALUE,
--Stock Latest Value (Material)
case  when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is not null --sub analysis
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when STK_BUY_UNIT1 <> 0
            then (dbo.AA_PRICE_DPS_F(LOC_COSTPRICE / STK_BUY_UNIT1))
            else dbo.AA_PRICE_DPS_F(LOC_COSTPRICE)
            end
   when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is null --sub analysis not entered
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when STK_BUY_UNIT1 <> 0
            then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
            else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
            end
   when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN <> 1 -- main stock
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when STK_BUY_UNIT1 <> 0
            then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
            else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
            end
   else 0
end As MAT_OUTSTANDING_STOCK_LATEST_VALUE,

--Stock Weighted Value (Material)
case  when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is not null --sub analysis
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when (LOC_WAPU_VALUE <> 0 And LOC_WAPU_QUANTITY <> 0)
            then (dbo.AA_PRICE_DPS_F(LOC_WAPU_VALUE / LOC_WAPU_QUANTITY))
            else  case when STK_BUY_UNIT1 <> 0
                  then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                  else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                  end
            end
   when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is null -- sub analysis not entered
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when (COMP.STK_WAPU_VALUE <> 0 And COMP.STK_WAPU_QUANTITY <> 0)
            then (dbo.AA_PRICE_DPS_F(COMP.STK_WAPU_VALUE / COMP.STK_WAPU_QUANTITY))
            else  case when STK_BUY_UNIT1 <> 0
                  then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                  else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                  end
            end
   when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN <> 1 -- main stock
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) *
         case when (COMP.STK_WAPU_VALUE <> 0 And COMP.STK_WAPU_QUANTITY <> 0)
            then (dbo.AA_PRICE_DPS_F(COMP.STK_WAPU_VALUE / COMP.STK_WAPU_QUANTITY))
            else  case when STK_BUY_UNIT1 <> 0
                  then (dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE / STK_BUY_UNIT1))
                  else dbo.AA_PRICE_DPS_F(COMP.STK_COSTPRICE)
                  end
            end
   else 0
end As MAT_OUTSTANDING_STOCK_WEIGHTED_VALUE,
--Stock Standard Value (Material)
case  when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is not null --sub analysis
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * LOC_STNDRD_COST
   when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN = 1 And WC_SUB_ANALYSIS_LINK is null -- sub analysis not entered
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * COMP.STK_STNDRD_COST
   when isnull(WC_LABOUR,0)= 0 And WC_TYPE = 'S' And COMP.STK_MULTILOCATN <> 1 -- main stock
      then (WC_QUANTITY_REQUIRED - isnull(WC_QUANTITY_ISSUED,0)) * COMP.STK_STNDRD_COST
   else 0
end As MAT_OUTSTANDING_STOCK_STANDARD_VALUE,

WC_TOP_LEVEL_ORDER_NUMBER,

WO_ORDERS.WO_ORDER_NUMBER,
WO_ORDERS.WO_QUANTITY,
WO_ORDERS.WO_QUANTITY_ISSUED,
WO_ORDERS.WO_END_DATE,
WO_ORDERS.WO_MAT_ACTUAL_COST,
WO_ORDERS.WO_LAB_ACTUAL_COST,
isnull(WO_ORDERS.WO_SORT_KEY,'') As WO_SORT_KEY,
WO_ORDERS.WO_TOP_LEVEL_ORDER_NUMBER,
WO_ORDERS.WO_PARENT_ORDER_NUMBER,
case when WO_PARENT_ORDER_NUMBER = 0 then
   (case when WO_PRIORITY = 0 then 99
    else WO_PRIORITY
    end
   )
     else 0
end as WO_PRIORITY,

WO_ORDERS.WO_STATUS,

ASSEMBLY.STKCODE,
ASSEMBLY.STKNAME,
ASSEMBLY.STK_SORT_KEY,
COMP.STKCODE As COMP_LOC_CODE,
COMP.STK_MULTILOCATN,
WC_SUB_ANALYSIS_LINK,
STK_LOCATION.LOC_PRIMARY,
STK_LOCATION.LOC_CODE,
STK_LOCATION.LOC_STOCK_CODE,
STK_LOCATION.LOC_COSTPRICE,
STK_BUY_UNIT1,
COMP.STK_COSTPRICE,

'ENGLISH   ' As LANGUAGE_LINK


from WO_COMPONENTS

   join WO_ORDERS on WO_ORDER_NUMBER = WC_ORDER_NUMBER

   Left OUTER JOIN STK_STOCK ASSEMBLY
   ON WO_ORDERS.WO_STOCK_LINK = ASSEMBLY.STK_PRIMARY and WC_TYPE = 'S'

   Left OUTER JOIN STK_STOCK COMP
   ON WO_COMPONENTS.WC_PART_LINK = COMP.STK_PRIMARY and WC_TYPE = 'S'

   Left Outer Join PRC_PRICE_RECS
   On WC_PART_LINK = PR_PRIMARY and WC_TYPE = 'P'

   Left Outer join STK_STOCK_2
   On STK_PRIMARY_2 = COMP.STK_PRIMARY

   Left Outer Join STK_LOCATION
   On COMP.STKCODE = STK_LOCATION.LOC_STOCK_CODE and STK_LOCATION.LOC_PRIMARY = WC_SUB_ANALYSIS_LINK

   Left Outer Join STK_LOCATION2
   On STK_LOCATION2.LOC_PRIMARY2 = STK_LOCATION.LOC_PRIMARY and STK_LOCATION2.LOC_PRIMARY2 = WC_SUB_ANALYSIS_LINK

where  WO_STATUS < 10 --and WO_LEVEL = 1

/*

*/


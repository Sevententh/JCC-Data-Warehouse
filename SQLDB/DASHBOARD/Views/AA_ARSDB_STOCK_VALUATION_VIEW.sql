create view DASHBOARD.AA_ARSDB_STOCK_VALUATION_VIEW
/*
** Written:       04/08/09 NC
** Last Amended:
**
**
*/
as

select
    s.STKCODE                                          StockCode
   ,s.STKNAME                                          StockName
   ,s.STK_SORT_KEY                                     SortKey
   ,s.STK_SORT_KEY1                                    UserSort1
   ,s.STK_SORT_KEY2                                    UserSort2
   ,s.STK_SORT_KEY3                                    UserSort3
   ,s.STK_DO_NOT_USE                                   InActive
   ,(  dbo.AA_QUANTITY_DPS_F(s.STK_PHYSICAL)
     + dbo.AA_QUANTITY_DPS_F(s.STK_QTYPRINTED)
    )                                                  Physical

   ,dbo.AA_VALUE_DPS_F(STK_FIFO_VALU)                  FifoValuation
   ,dbo.AA_VALUE_DPS_F(STK_AV_VALU)                    AverageValue
   ,dbo.AA_VALUE_DPS_F
      (dbo.AA_PRICE_DPS_F(STK_COSTPRICE)
       * (  dbo.AA_QUANTITY_DPS_F(s.STK_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(s.STK_QTYPRINTED)
         )
      )                                                LatestValue
   ,dbo.AA_VALUE_DPS_F
      (  case STK_WAPU_QUANTITY
            when 0 then 0
            else (STK_WAPU_VALUE / STK_WAPU_QUANTITY)
         end
       *
         (  dbo.AA_QUANTITY_DPS_F(s.STK_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(s.STK_QTYPRINTED)
         )
      )                                                WeightedValue
   ,dbo.AA_VALUE_DPS_F
      (dbo.AA_PRICE_DPS_F(STK_STNDRD_COST)
       * (  dbo.AA_QUANTITY_DPS_F(s.STK_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(s.STK_QTYPRINTED)
         )
      )                                                StandardValue

   from STK_STOCK  s with (nolock)
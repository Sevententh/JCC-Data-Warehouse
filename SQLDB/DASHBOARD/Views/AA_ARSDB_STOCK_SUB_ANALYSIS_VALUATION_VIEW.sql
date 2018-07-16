create view DASHBOARD.AA_ARSDB_STOCK_SUB_ANALYSIS_VALUATION_VIEW
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
   ,s.STK_SORT_KEY1                                    StockUserSort1
   ,s.STK_SORT_KEY2                                    StockUserSort2
   ,s.STK_SORT_KEY3                                    StockUserSort3
   ,s.STK_DO_NOT_USE                                   StockInActive
   ,(  dbo.AA_QUANTITY_DPS_F(s.STK_PHYSICAL)
     + dbo.AA_QUANTITY_DPS_F(s.STK_QTYPRINTED)
    )                                                  StockPhysical

   ,dbo.AA_VALUE_DPS_F(s.STK_FIFO_VALU)                  StockFifoValuation
   ,dbo.AA_VALUE_DPS_F(s.STK_AV_VALU)                    StockAverageValue
   ,dbo.AA_VALUE_DPS_F
      (dbo.AA_PRICE_DPS_F(s.STK_COSTPRICE)
       * (  dbo.AA_QUANTITY_DPS_F(s.STK_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(s.STK_QTYPRINTED)
         )
      )                                                StockLatestValue
   ,dbo.AA_VALUE_DPS_F
      (  case s.STK_WAPU_QUANTITY
            when 0 then 0
            else (s.STK_WAPU_VALUE / s.STK_WAPU_QUANTITY)
         end
       *
         (  dbo.AA_QUANTITY_DPS_F(s.STK_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(s.STK_QTYPRINTED)
         )
      )                                                StockWeightedValue
   ,dbo.AA_VALUE_DPS_F
      (dbo.AA_PRICE_DPS_F(s.STK_STNDRD_COST)
       * (  dbo.AA_QUANTITY_DPS_F(s.STK_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(s.STK_QTYPRINTED)
         )
      )                                                StockStandardValue

   ,l.LOC_CODE                                         SubAnalysisCode
   ,l.LOC_NAME                                         SubAnalysisDescription
   ,l.LOC_USERSORT1                                    SubAnalysisUserSort1
   ,l.LOC_USERSORT2                                    SubAnalysisUserSort2
   ,l.LOC_USERSORT3                                    SubAnalysisUserSort3
   ,l.LOC_USERSORT4                                    SubAnalysisUserSort4
   ,l.LOC_USERSORT5                                    SubAnalysisUserSort5
   ,l.LOC_USERSORT6                                    SubAnalysisUserSort6
   ,(  dbo.AA_QUANTITY_DPS_F(l.LOC_PHYSICAL)
     + dbo.AA_QUANTITY_DPS_F(l.LOC_QTYPRINTED)
    )                                                  SubAnalysisPhysical

   ,dbo.AA_VALUE_DPS_F(l.LOC_FIFO_VALU)                  SubAnalysisFifoValuation
   ,dbo.AA_VALUE_DPS_F(l.LOC_AV_VALU)                    SubAnalysisAverageValue
   ,dbo.AA_VALUE_DPS_F
      (dbo.AA_PRICE_DPS_F(l.LOC_COSTPRICE)
       * (  dbo.AA_QUANTITY_DPS_F(l.LOC_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(l.LOC_QTYPRINTED)
         )
      )                                                SubAnalysisLatestValue
   ,dbo.AA_VALUE_DPS_F
      (  case l.LOC_WAPU_QUANTITY
            when 0 then 0
            else (l.LOC_WAPU_VALUE / l.LOC_WAPU_QUANTITY)
         end
       *
         (  dbo.AA_QUANTITY_DPS_F(l.LOC_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(l.LOC_QTYPRINTED)
         )
      )                                                SubAnalysisWeightedValue
   ,dbo.AA_VALUE_DPS_F
      (dbo.AA_PRICE_DPS_F(l.LOC_STNDRD_COST)
       * (  dbo.AA_QUANTITY_DPS_F(l.LOC_PHYSICAL)
          + dbo.AA_QUANTITY_DPS_F(l.LOC_QTYPRINTED)
         )
      )                                                SubAnalysisStandardValue

   from STK_STOCK s with (nolock)
      join STK_LOCATION l with (nolock) on l.LOC_STOCK_CODE = s.STKCODE
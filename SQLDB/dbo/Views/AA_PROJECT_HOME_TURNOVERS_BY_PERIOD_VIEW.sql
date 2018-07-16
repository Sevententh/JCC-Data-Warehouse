create view AA_PROJECT_HOME_TURNOVERS_BY_PERIOD_VIEW
/*
** Written:
** Last Amended:
**
**
*/
as
select
    CostHeaderCode
   ,d.COSTING_PERIOD                                        CurrentCostingPeriod
   ,convert(tinyint,Period)                                 Period
   ,CurrentYearPeriodTurnover
   ,case Period
      when 1 then TurnoverLYP1
      when 2 then TurnoverLYP2
      when 3 then TurnoverLYP3
      when 4 then TurnoverLYP4
      when 5 then TurnoverLYP5
      when 6 then TurnoverLYP6
      when 7 then TurnoverLYP7
      when 8 then TurnoverLYP8
      when 9 then TurnoverLYP9
      when 10 then TurnoverLYP10
      when 11 then TurnoverLYP11
      when 12 then TurnoverLYP12
      when 13 then TurnoverLYP13
   end
    LastYearPeriodTurnover
     from
     (select
          CostHeader.CH_CODE                                         CostHeaderCode
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_1)                 TurnoverCYP1
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_2)                 TurnoverCYP2
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_3)                 TurnoverCYP3
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_4)                 TurnoverCYP4
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_5)                 TurnoverCYP5
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_6)                 TurnoverCYP6
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_7)                 TurnoverCYP7
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_8)                 TurnoverCYP8
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_9)                 TurnoverCYP9
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_10)                TurnoverCYP10
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_11)                TurnoverCYP11
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_12)                TurnoverCYP12
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_13)                TurnoverCYP13
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_1)                 TurnoverLYP1
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_2)                 TurnoverLYP2
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_3)                 TurnoverLYP3
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_4)                 TurnoverLYP4
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_5)                 TurnoverLYP5
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_6)                 TurnoverLYP6
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_7)                 TurnoverLYP7
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_8)                 TurnoverLYP8
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_9)                 TurnoverLYP9
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_10)                TurnoverLYP10
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_11)                TurnoverLYP11
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_12)                TurnoverLYP12
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_L_13)                TurnoverLYP13
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_1)                 [1]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_2)                 [2]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_3)                 [3]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_4)                 [4]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_5)                 [5]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_6)                 [6]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_7)                 [7]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_8)                 [8]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_9)                 [9]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_10)                [10]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_11)                [11]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_12)                [12]
         ,dbo.AA_VALUE_DPS_F(CostHeader.CH_COST_C_13)                [13]
      from CST_COSTHEADER CostHeader with(nolock)
   ) p
UNPIVOT
   (CurrentYearPeriodTurnover FOR Period IN
      ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )AS unpvt
   cross join SYS_DATAINFO d with (nolock)
   cross join SYS_DATAINFO2 d2 with (nolock)
   where d.SYS_PRIMARY=1 and d2.SYS_PRIMARY_2=1

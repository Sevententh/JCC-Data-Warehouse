create view DASHBOARD.AA_ARSDB_CUSTOMER_TURNOVERS_BY_PERIOD_VIEW
/*
** Written:
** Last Amended:
**
**
*/
as
select
    CustomerCode
   ,CustomerName
   ,SortKey
   ,UserSort1
   ,UserSort2
   ,UserSort3
   ,Balance
   ,d.SALES_PERIOD                  CurrentSalesPeriod
   ,convert(tinyint,Period)         Period
   ,case Period
      when 1 then left(datename(mm,d2.ENDDATE_P1),3)
      when 2 then left(datename(mm,d2.ENDDATE_P2),3)
      when 3 then left(datename(mm,d2.ENDDATE_P3),3)
      when 4 then left(datename(mm,d2.ENDDATE_P4),3)
      when 5 then left(datename(mm,d2.ENDDATE_P5),3)
      when 6 then left(datename(mm,d2.ENDDATE_P6),3)
      when 7 then left(datename(mm,d2.ENDDATE_P7),3)
      when 8 then left(datename(mm,d2.ENDDATE_P8),3)
      when 9 then left(datename(mm,d2.ENDDATE_P9),3)
      when 10 then left(datename(mm,d2.ENDDATE_P10),3)
      when 11 then left(datename(mm,d2.ENDDATE_P11),3)
      when 12 then left(datename(mm,d2.ENDDATE_P12),3)
      when 13 then left(datename(mm,isnull(d2.ENDDATE_P13,'')),3)
      else ''
    end Month
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
   ,  TurnoverCYP1
    + case when Period >=2  then TurnoverCYP2  else 0 end
    + case when Period >=3  then TurnoverCYP3  else 0 end
    + case when Period >=4  then TurnoverCYP4  else 0 end
    + case when Period >=5  then TurnoverCYP5  else 0 end
    + case when Period >=6  then TurnoverCYP6  else 0 end
    + case when Period >=7  then TurnoverCYP7  else 0 end
    + case when Period >=8  then TurnoverCYP8  else 0 end
    + case when Period >=9  then TurnoverCYP9  else 0 end
    + case when Period >=10 then TurnoverCYP10 else 0 end
    + case when Period >=11 then TurnoverCYP11 else 0 end
    + case when Period >=12 then TurnoverCYP12 else 0 end
    + case when Period >=13 then TurnoverCYP13 else 0 end
     CurrentYearCumulativePeriodTurnover
   ,  TurnoverLYP1
    + case when Period >=2  then TurnoverLYP2  else 0 end
    + case when Period >=3  then TurnoverLYP3  else 0 end
    + case when Period >=4  then TurnoverLYP4  else 0 end
    + case when Period >=5  then TurnoverLYP5  else 0 end
    + case when Period >=6  then TurnoverLYP6  else 0 end
    + case when Period >=7  then TurnoverLYP7  else 0 end
    + case when Period >=8  then TurnoverLYP8  else 0 end
    + case when Period >=9  then TurnoverLYP9  else 0 end
    + case when Period >=10 then TurnoverLYP10 else 0 end
    + case when Period >=11 then TurnoverLYP11 else 0 end
    + case when Period >=12 then TurnoverLYP12 else 0 end
    + case when Period >=13 then TurnoverLYP13 else 0 end
     LastYearCumulativePeriodTurnover
from
   (select
          c.CUCODE                                          CustomerCode
         ,c.CUNAME                                          CustomerName
         ,c.CUSORT                                          SortKey
         ,c.CUUSER1                                         UserSort1
         ,c.CUUSER2                                         UserSort2
         ,c.CUUSER3                                         UserSort3
         ,dbo.AA_VALUE_DPS_F(c.CUBALANCE)                   Balance
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C1)                TurnoverCYP1
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C2)                TurnoverCYP2
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C3)                TurnoverCYP3
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C4)                TurnoverCYP4
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C5)                TurnoverCYP5
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C6)                TurnoverCYP6
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C7)                TurnoverCYP7
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C8)                TurnoverCYP8
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C9)                TurnoverCYP9
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C10)               TurnoverCYP10
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C11)               TurnoverCYP11
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C12)               TurnoverCYP12
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C13)               TurnoverCYP13
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L1)                TurnoverLYP1
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L2)                TurnoverLYP2
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L3)                TurnoverLYP3
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L4)                TurnoverLYP4
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L5)                TurnoverLYP5
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L6)                TurnoverLYP6
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L7)                TurnoverLYP7
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L8)                TurnoverLYP8
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L9)                TurnoverLYP9
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L10)               TurnoverLYP10
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L11)               TurnoverLYP11
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L12)               TurnoverLYP12
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L13)               TurnoverLYP13
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C1)                [1]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C2)                [2]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C3)                [3]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C4)                [4]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C5)                [5]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C6)                [6]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C7)                [7]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C8)                [8]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C9)                [9]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C10)               [10]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C11)               [11]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C12)               [12]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C13)               [13]
      from SL_ACCOUNTS c with (nolock)
      where c.CUCODE <> ''
   ) p
UNPIVOT
   (CurrentYearPeriodTurnover FOR Period IN
      ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )AS unpvt
   cross join SYS_DATAINFO d with (nolock)
   cross join SYS_DATAINFO2 d2 with (nolock)
   where d.SYS_PRIMARY=1 and d2.SYS_PRIMARY_2=1

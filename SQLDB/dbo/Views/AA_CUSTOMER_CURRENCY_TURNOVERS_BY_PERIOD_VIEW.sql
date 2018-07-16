create view AA_CUSTOMER_CURRENCY_TURNOVERS_BY_PERIOD_VIEW
/*
** Written:
** Last Amended:
**
**
*/
as
select
    CustomerCode
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
   ,CurrentYearPeriodTurnoverC
   ,case Period
      when 1 then TurnoverLYP1C
      when 2 then TurnoverLYP2C
      when 3 then TurnoverLYP3C
      when 4 then TurnoverLYP4C
      when 5 then TurnoverLYP5C
      when 6 then TurnoverLYP6C
      when 7 then TurnoverLYP7C
      when 8 then TurnoverLYP8C
      when 9 then TurnoverLYP9C
      when 10 then TurnoverLYP10C
      when 11 then TurnoverLYP11C
      when 12 then TurnoverLYP12C
      when 13 then TurnoverLYP13C
   end
    LastYearPeriodTurnoverC
   ,  TurnoverCYP1C
    + case when Period >=2  then TurnoverCYP2C  else 0 end
    + case when Period >=3  then TurnoverCYP3C  else 0 end
    + case when Period >=4  then TurnoverCYP4C  else 0 end
    + case when Period >=5  then TurnoverCYP5C  else 0 end
    + case when Period >=6  then TurnoverCYP6C  else 0 end
    + case when Period >=7  then TurnoverCYP7C else 0 end
    + case when Period >=8  then TurnoverCYP8C  else 0 end
    + case when Period >=9  then TurnoverCYP9C  else 0 end
    + case when Period >=10 then TurnoverCYP10C else 0 end
    + case when Period >=11 then TurnoverCYP11C else 0 end
    + case when Period >=12 then TurnoverCYP12C else 0 end
    + case when Period >=13 then TurnoverCYP13C else 0 end
     CurrentYearCumulativePeriodTurnoverC
   ,  TurnoverLYP1C
    + case when Period >=2  then TurnoverLYP2C  else 0 end
    + case when Period >=3  then TurnoverLYP3C  else 0 end
    + case when Period >=4  then TurnoverLYP4C  else 0 end
    + case when Period >=5  then TurnoverLYP5C  else 0 end
    + case when Period >=6  then TurnoverLYP6C  else 0 end
    + case when Period >=7  then TurnoverLYP7C  else 0 end
    + case when Period >=8  then TurnoverLYP8C  else 0 end
    + case when Period >=9  then TurnoverLYP9C  else 0 end
    + case when Period >=10 then TurnoverLYP10C else 0 end
    + case when Period >=11 then TurnoverLYP11C else 0 end
    + case when Period >=12 then TurnoverLYP12C else 0 end
    + case when Period >=13 then TurnoverLYP13C else 0 end
     LastYearCumulativePeriodTurnoverC
from
   (select
          c.CUCODE                                            CustomerCode
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C1_C)                TurnoverCYP1C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C2_C)                TurnoverCYP2C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C3_C)                TurnoverCYP3C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C4_C)                TurnoverCYP4C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C5_C)                TurnoverCYP5C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C6_C)                TurnoverCYP6C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C7_C)                TurnoverCYP7C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C8_C)                TurnoverCYP8C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C9_C)                TurnoverCYP9C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C10_C)               TurnoverCYP10C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C11_C)               TurnoverCYP11C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C12_C)               TurnoverCYP12C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C13_C)               TurnoverCYP13C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L1_C)                TurnoverLYP1C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L2_C)                TurnoverLYP2C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L3_C)                TurnoverLYP3C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L4_C)                TurnoverLYP4C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L5_C)                TurnoverLYP5C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L6_C)                TurnoverLYP6C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L7_C)                TurnoverLYP7C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L8_C)                TurnoverLYP8C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L9_C)                TurnoverLYP9C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L10_C)               TurnoverLYP10C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L11_C)               TurnoverLYP11C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L12_C)               TurnoverLYP12C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L13_C)               TurnoverLYP13C
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C1_C)                [1]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C2_C)                [2]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C3_C)                [3]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C4_C)                [4]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C5_C)                [5]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C6_C)                [6]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C7_C)                [7]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C8_C)                [8]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C9_C)                [9]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C10_C)               [10]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C11_C)               [11]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C12_C)               [12]
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C13_C)               [13]
      from SL_ACCOUNTS c with (nolock)
      where c.CUCODE <> ''
   ) p
UNPIVOT
   (CurrentYearPeriodTurnoverC FOR Period IN
      ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )AS unpvt
   cross join SYS_DATAINFO d with (nolock)
   cross join SYS_DATAINFO2 d2 with (nolock)
   where d.SYS_PRIMARY=1 and d2.SYS_PRIMARY_2=1

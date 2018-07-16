create view AA_NOMINAL_TURNOVERS_BY_PERIOD_VIEW
/*
** Written:
** Last Amended:
**
**
*/
as
select
    NominalCode
   ,NominalName
   ,cast(Period as tinyint)                                 Period
   ,lastyear.YEAR_LABEL                                   LastYear
   ,curyear.YEAR_LABEL                                    CurrentYear
   ,nextyear.YEAR_LABEL                                  NextYear
   ,case Period
      when 1 then TurnoverCYP1
      when 2 then TurnoverCYP2
      when 3 then TurnoverCYP3
      when 4 then TurnoverCYP4
      when 5 then TurnoverCYP5
      when 6 then TurnoverCYP6
      when 7 then TurnoverCYP7
      when 8 then TurnoverCYP8
      when 9 then TurnoverCYP9
      when 10 then TurnoverCYP10
      when 11 then TurnoverCYP11
      when 12 then TurnoverCYP12
      when 13 then TurnoverCYP13
   end                                                      CurrentYearPeriodTurnover
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
   end                                                      LastYearPeriodTurnover
   ,case Period
      when 1 then TurnoverNYP1
      when 2 then TurnoverNYP2
      when 3 then TurnoverNYP3
      when 4 then TurnoverNYP4
      when 5 then TurnoverNYP5
      when 6 then TurnoverNYP6
      when 7 then TurnoverNYP7
      when 8 then TurnoverNYP8
      when 9 then TurnoverNYP9
      when 10 then TurnoverNYP10
      when 11 then TurnoverNYP11
      when 12 then TurnoverNYP12
      when 13 then TurnoverNYP13
   end                                                      NextYearPeriodTurnover
   ,case Period
      when 1 then TurnoverCYP1_C
      when 2 then TurnoverCYP2_C
      when 3 then TurnoverCYP3_C
      when 4 then TurnoverCYP4_C
      when 5 then TurnoverCYP5_C
      when 6 then TurnoverCYP6_C
      when 7 then TurnoverCYP7_C
      when 8 then TurnoverCYP8_C
      when 9 then TurnoverCYP9_C
      when 10 then TurnoverCYP10_C
      when 11 then TurnoverCYP11_C
      when 12 then TurnoverCYP12_C
      when 13 then TurnoverCYP13_C
   end                                                      CurrentYearPeriodTurnover_C
   ,case Period
      when 1 then TurnoverLYP1_C
      when 2 then TurnoverLYP2_C
      when 3 then TurnoverLYP3_C
      when 4 then TurnoverLYP4_C
      when 5 then TurnoverLYP5_C
      when 6 then TurnoverLYP6_C
      when 7 then TurnoverLYP7_C
      when 8 then TurnoverLYP8_C
      when 9 then TurnoverLYP9_C
      when 10 then TurnoverLYP10_C
      when 11 then TurnoverLYP11_C
      when 12 then TurnoverLYP12_C
      when 13 then TurnoverLYP13_C
   end                                                      LastYearPeriodTurnover_C
   ,case Period
      when 1 then TurnoverNYP1_C
      when 2 then TurnoverNYP2_C
      when 3 then TurnoverNYP3_C
      when 4 then TurnoverNYP4_C
      when 5 then TurnoverNYP5_C
      when 6 then TurnoverNYP6_C
      when 7 then TurnoverNYP7_C
      when 8 then TurnoverNYP8_C
      when 9 then TurnoverNYP9_C
      when 10 then TurnoverNYP10_C
      when 11 then TurnoverNYP11_C
      when 12 then TurnoverNYP12_C
      when 13 then TurnoverNYP13_C
   end                                                      NextYearPeriodTurnover_C
   ,isnull(CurYearBud.B_VALUE,0)                            CurrentYearPeriodBudget
   ,isnull(LastYearBud.B_VALUE,0)                           LastYearPeriodBudget    --nmajorheading to invert sign
   ,isnull(NextYearBud.B_VALUE,0)                           NextYearPeriodBudget
   ,isnull(CurYearBud.B_REVISION_NUMBER,0)                  CurrentYearBudgetRevision
   ,isnull(LastYearBud.B_REVISION_NUMBER,0)                 LastYearBudgetRevision
   ,isnull(NextYearBud.B_REVISION_NUMBER,0)                 NextYearBudgetRevision

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
   ,  TurnoverNYP1
    + case when Period >=2  then TurnoverNYP2  else 0 end
    + case when Period >=3  then TurnoverNYP3  else 0 end
    + case when Period >=4  then TurnoverNYP4  else 0 end
    + case when Period >=5  then TurnoverNYP5  else 0 end
    + case when Period >=6  then TurnoverNYP6  else 0 end
    + case when Period >=7  then TurnoverNYP7  else 0 end
    + case when Period >=8  then TurnoverNYP8  else 0 end
    + case when Period >=9  then TurnoverNYP9  else 0 end
    + case when Period >=10 then TurnoverNYP10 else 0 end
    + case when Period >=11 then TurnoverNYP11 else 0 end
    + case when Period >=12 then TurnoverNYP12 else 0 end
    + case when Period >=13 then TurnoverNYP13 else 0 end
                                                            NextYearCumulativePeriodTurnover
   ,  TurnoverCYP1_C
    + case when Period >=2  then TurnoverCYP2_C  else 0 end
    + case when Period >=3  then TurnoverCYP3_C  else 0 end
    + case when Period >=4  then TurnoverCYP4_C  else 0 end
    + case when Period >=5  then TurnoverCYP5_C  else 0 end
    + case when Period >=6  then TurnoverCYP6_C  else 0 end
    + case when Period >=7  then TurnoverCYP7_C  else 0 end
    + case when Period >=8  then TurnoverCYP8_C  else 0 end
    + case when Period >=9  then TurnoverCYP9_C  else 0 end
    + case when Period >=10 then TurnoverCYP10_C else 0 end
    + case when Period >=11 then TurnoverCYP11_C else 0 end
    + case when Period >=12 then TurnoverCYP12_C else 0 end
    + case when Period >=13 then TurnoverCYP13_C else 0 end
                                                            CurrentYearCumulativePeriodTurnover_C
   ,  TurnoverLYP1_C
    + case when Period >=2  then TurnoverLYP2_C  else 0 end
    + case when Period >=3  then TurnoverLYP3_C  else 0 end
    + case when Period >=4  then TurnoverLYP4_C  else 0 end
    + case when Period >=5  then TurnoverLYP5_C  else 0 end
    + case when Period >=6  then TurnoverLYP6_C  else 0 end
    + case when Period >=7  then TurnoverLYP7_C  else 0 end
    + case when Period >=8  then TurnoverLYP8_C  else 0 end
    + case when Period >=9  then TurnoverLYP9_C  else 0 end
    + case when Period >=10 then TurnoverLYP10_C else 0 end
    + case when Period >=11 then TurnoverLYP11_C else 0 end
    + case when Period >=12 then TurnoverLYP12_C else 0 end
    + case when Period >=13 then TurnoverLYP13_C else 0 end
                                                            LastYearCumulativePeriodTurnover_C
   ,  TurnoverNYP1_C
    + case when Period >=2  then TurnoverNYP2_C  else 0 end
    + case when Period >=3  then TurnoverNYP3_C  else 0 end
    + case when Period >=4  then TurnoverNYP4_C  else 0 end
    + case when Period >=5  then TurnoverNYP5_C  else 0 end
    + case when Period >=6  then TurnoverNYP6_C  else 0 end
    + case when Period >=7  then TurnoverNYP7_C  else 0 end
    + case when Period >=8  then TurnoverNYP8_C  else 0 end
    + case when Period >=9  then TurnoverNYP9_C  else 0 end
    + case when Period >=10 then TurnoverNYP10_C else 0 end
    + case when Period >=11 then TurnoverNYP11_C else 0 end
    + case when Period >=12 then TurnoverNYP12_C else 0 end
    + case when Period >=13 then TurnoverNYP13_C else 0 end
                                                            NextYearCumulativePeriodTurnoveR_C

	,BudgetCYP1												BudgetCurrentYearPeriod1
	,BudgetCYP2												BudgetCurrentYearPeriod2
	,BudgetCYP3												BudgetCurrentYearPeriod3
	,BudgetCYP4												BudgetCurrentYearPeriod4
	,BudgetCYP5												BudgetCurrentYearPeriod5
	,BudgetCYP6												BudgetCurrentYearPeriod6
	,BudgetCYP7												BudgetCurrentYearPeriod7
	,BudgetCYP8												BudgetCurrentYearPeriod8
	,BudgetCYP9												BudgetCurrentYearPeriod9
	,BudgetCYP10											BudgetCurrentYearPeriod10
	,BudgetCYP11											BudgetCurrentYearPeriod11
	,BudgetCYP12											BudgetCurrentYearPeriod12
	,BudgetCYP13											BudgetCurrentYearPeriod13	
	,BudgetLYP1												BudgetLastYearPeriod1
	,BudgetLYP2												BudgetLastYearPeriod2
	,BudgetLYP3												BudgetLastYearPeriod3
	,BudgetLYP4												BudgetLastYearPeriod4
	,BudgetLYP5												BudgetLastYearPeriod5
	,BudgetLYP6												BudgetLastYearPeriod6
	,BudgetLYP7												BudgetLastYearPeriod7
	,BudgetLYP8												BudgetLastYearPeriod8
	,BudgetLYP9												BudgetLastYearPeriod9
	,BudgetLYP10											BudgetLastYearPeriod10
	,BudgetLYP11											BudgetLastYearPeriod11
	,BudgetLYP12											BudgetLastYearPeriod12
	,BudgetLYP13											BudgetLastYearPeriod13
	,BudgetNYP1												BudgetNextYearPeriod1
	,BudgetNYP2												BudgetNextYearPeriod2
	,BudgetNYP3												BudgetNextYearPeriod3
	,BudgetNYP4												BudgetNextYearPeriod4
	,BudgetNYP5												BudgetNextYearPeriod5
	,BudgetNYP6												BudgetNextYearPeriod6
	,BudgetNYP7												BudgetNextYearPeriod7
	,BudgetNYP8												BudgetNextYearPeriod8
	,BudgetNYP9												BudgetNextYearPeriod9
	,BudgetNYP10											BudgetNextYearPeriod10
	,BudgetNYP11											BudgetNextYearPeriod11
	,BudgetNYP12											BudgetNextYearPeriod12
	,BudgetNYP13											BudgetNextYearPeriod13

from
   (select
          n.NCODE                                           NominalCode
         ,n.NNAME                                           NominalName
         ,n.NTYPE                                           NominalType
         ,case when n.NCODE = t.CURREC_NOM_STOCK_CONTROL
            then 1 else 0
          end                                               StockControlAccount
         ,n.NMAJORHEADCODE                                  MajorHeadingNumber
         ,m.NL_MAJORNAME                                    MajorHeadingName
         ,n.NCATEGORYCODE1                                  Category1Code
         ,n.NCATEGORYCODE2                                  Category2Code
         ,n.NCATEGORYCODE3                                  Category3Code
         ,n.NCATEGORYCODE4                                  Category4Code
         ,n.NCATEGORYCODE5                                  Category5Code
         ,n.NCATEGORYCODE6                                  Category6Code
         ,n.NCATEGORYCODE7                                  Category7Code
         ,n.NCATEGORYCODE8                                  Category8Code
         ,isnull(c1.NCAT_NAME,'')                           Category1Name
         ,isnull(c2.NCAT_NAME,'')                           Category2Name
         ,isnull(c3.NCAT_NAME,'')                           Category3Name
         ,isnull(c4.NCAT_NAME,'')                           Category4Name
         ,isnull(c5.NCAT_NAME,'')                           Category5Name
         ,isnull(c6.NCAT_NAME,'')                           Category6Name
         ,isnull(c7.NCAT_NAME,'')                           Category7Name
         ,isnull(c8.NCAT_NAME,'')                           Category8Name
         ,dbo.AA_VALUE_DPS_F(n.NBALANCE)                    Balance
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C1)                  BudgetCYP1
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C2)                  BudgetCYP2
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C3)                  BudgetCYP3
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C4)                  BudgetCYP4
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C5)                  BudgetCYP5
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C6)                  BudgetCYP6
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C7)                  BudgetCYP7
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C8)                  BudgetCYP8
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C9)                  BudgetCYP9
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C10)                 BudgetCYP10
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C11)                 BudgetCYP11
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C12)                 BudgetCYP12
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C13)                 BudgetCYP13
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L1)                  BudgetLYP1
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L2)                  BudgetLYP2
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L3)                  BudgetLYP3
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L4)                  BudgetLYP4
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L5)                  BudgetLYP5
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L6)                  BudgetLYP6
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L7)                  BudgetLYP7
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L8)                  BudgetLYP8
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L9)                  BudgetLYP9
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L10)                 BudgetLYP10
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L11)                 BudgetLYP11
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L12)                 BudgetLYP12
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L13)                 BudgetLYP13
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N1)                  BudgetNYP1
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N2)                  BudgetNYP2
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N3)                  BudgetNYP3
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N4)                  BudgetNYP4
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N5)                  BudgetNYP5
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N6)                  BudgetNYP6
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N7)                  BudgetNYP7
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N8)                  BudgetNYP8
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N9)                  BudgetNYP9
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N10)                 BudgetNYP10
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N11)                 BudgetNYP11
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N12)                 BudgetNYP12
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N13)                 BudgetNYP13
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C1)                TurnoverCYP1
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C2)                TurnoverCYP2
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C3)                TurnoverCYP3
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C4)                TurnoverCYP4
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C5)                TurnoverCYP5
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C6)                TurnoverCYP6
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C7)                TurnoverCYP7
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C8)                TurnoverCYP8
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C9)                TurnoverCYP9
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C10)               TurnoverCYP10
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C11)               TurnoverCYP11
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C12)               TurnoverCYP12
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C13)               TurnoverCYP13
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L1)                TurnoverLYP1
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L2)                TurnoverLYP2
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L3)                TurnoverLYP3
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L4)                TurnoverLYP4
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L5)                TurnoverLYP5
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L6)                TurnoverLYP6
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L7)                TurnoverLYP7
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L8)                TurnoverLYP8
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L9)                TurnoverLYP9
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L10)               TurnoverLYP10
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L11)               TurnoverLYP11
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L12)               TurnoverLYP12
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L13)               TurnoverLYP13
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N1)                TurnoverNYP1
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N2)                TurnoverNYP2
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N3)                TurnoverNYP3
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N4)                TurnoverNYP4
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N5)                TurnoverNYP5
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N6)                TurnoverNYP6
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N7)                TurnoverNYP7
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N8)                TurnoverNYP8
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N9)                TurnoverNYP9
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N10)               TurnoverNYP10
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N11)               TurnoverNYP11
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N12)               TurnoverNYP12
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N13)               TurnoverNYP13
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C1_C)              TurnoverCYP1_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C2_C)              TurnoverCYP2_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C3_C)              TurnoverCYP3_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C4_C)              TurnoverCYP4_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C5_C)              TurnoverCYP5_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C6_C)              TurnoverCYP6_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C7_C)              TurnoverCYP7_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C8_C)              TurnoverCYP8_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C9_C)              TurnoverCYP9_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C10_C)             TurnoverCYP10_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C11_C)             TurnoverCYP11_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C12_C)             TurnoverCYP12_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C13_C)             TurnoverCYP13_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L1_C)              TurnoverLYP1_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L2_C)              TurnoverLYP2_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L3_C)              TurnoverLYP3_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L4_C)              TurnoverLYP4_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L5_C)              TurnoverLYP5_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L6_C)              TurnoverLYP6_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L7_C)              TurnoverLYP7_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L8_C)              TurnoverLYP8_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L9_C)              TurnoverLYP9_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L10_C)             TurnoverLYP10_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L11_C)             TurnoverLYP11_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L12_C)             TurnoverLYP12_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L13_C)             TurnoverLYP13_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N1_C)              TurnoverNYP1_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N2_C)              TurnoverNYP2_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N3_C)              TurnoverNYP3_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N4_C)              TurnoverNYP4_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N5_C)              TurnoverNYP5_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N6_C)              TurnoverNYP6_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N7_C)              TurnoverNYP7_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N8_C)              TurnoverNYP8_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N9_C)              TurnoverNYP9_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N10_C)             TurnoverNYP10_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N11_C)             TurnoverNYP11_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N12_C)             TurnoverNYP12_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N13_C)             TurnoverNYP13_C
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C1)                [1]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C2)                [2]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C3)                [3]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C4)                [4]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C5)                [5]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C6)                [6]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C7)                [7]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C8)                [8]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C9)                [9]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C10)               [10]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C11)               [11]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C12)               [12]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C13)               [13]
      from NL_ACCOUNTS n with (nolock)
         join NL_MAJORHEADING m with (nolock) on m.NL_MAJORCODE = n.NMAJORHEADCODE
         left join NL_CATEGORIES c1 on c1.NCAT_CODE = n.NCATEGORYCODE1 and c1.NCAT_NUMBER = 1
         left join NL_CATEGORIES c2 on c2.NCAT_CODE = n.NCATEGORYCODE2 and c2.NCAT_NUMBER = 2
         left join NL_CATEGORIES c3 on c3.NCAT_CODE = n.NCATEGORYCODE3 and c3.NCAT_NUMBER = 3
         left join NL_CATEGORIES c4 on c4.NCAT_CODE = n.NCATEGORYCODE4 and c4.NCAT_NUMBER = 4
         left join NL_CATEGORIES c5 on c5.NCAT_CODE = n.NCATEGORYCODE5 and c5.NCAT_NUMBER = 5
         left join NL_CATEGORIES c6 on c6.NCAT_CODE = n.NCATEGORYCODE6 and c6.NCAT_NUMBER = 6
         left join NL_CATEGORIES c7 on c7.NCAT_CODE = n.NCATEGORYCODE7 and c7.NCAT_NUMBER = 7
         left join NL_CATEGORIES c8 on c8.NCAT_CODE = n.NCATEGORYCODE8 and c8.NCAT_NUMBER = 8
         left join SYS_CURRENCY_REC t with (nolock) on t.CURREC_CURRENCY_TYPE = 'H'
   ) p
UNPIVOT
   (CurrentYearPeriodTurnover FOR Period IN
      ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )AS unpvt
   left outer join SYS_BUDGETS lastyearbud with(nolock) on lastyearbud.B_ACCOUNT_CODE = NominalCode and lastyearbud.B_BUDGET_TYPE = 'B' and lastyearbud.B_RECORD_TYPE = 'N' and lastyearbud.B_PERIOD = Period and lastyearbud.B_YEAR = -1
   left outer join SYS_BUDGETS curyearbud with(nolock) on curyearbud.B_ACCOUNT_CODE = NominalCode and curyearbud.B_BUDGET_TYPE = 'B' and curyearbud.B_RECORD_TYPE = 'N' and curyearbud.B_PERIOD = Period and curyearbud.B_YEAR = 0
   left outer join SYS_BUDGETS nextyearbud with(nolock) on nextyearbud.B_ACCOUNT_CODE = NominalCode and nextyearbud.B_BUDGET_TYPE = 'B' and nextyearbud.B_RECORD_TYPE = 'N' and nextyearbud.B_PERIOD = Period and nextyearbud.B_YEAR = 1
   left outer join SYS_YEAR lastyear on lastyear.YEAR_NOMINAL = -1
   left outer join SYS_YEAR curyear on curyear.YEAR_NOMINAL = 0
   left outer join SYS_YEAR nextyear on nextyear.YEAR_NOMINAL =1
   cross join SYS_DATAINFO d with (nolock)
   cross join SYS_DATAINFO2 d2 with (nolock)
   where d.SYS_PRIMARY=1 and d2.SYS_PRIMARY_2=1

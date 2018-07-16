create view    DASHBOARD.AA_ARSDB_CARBON_NOMINALS_BY_YEAR_PERIOD_VIEW
as
/*
** Written     :  25/08/09 NC
** Last Amended:  30/09/09 NC, 07/06/2010 SM
** Comments    :  Returns 1 row for each combination of year, period, FirstCategory, Division and Emissions Group
**                that has either a carbon turnover, a carbon budget, a financial turnover or financial budget.
**                Only the financial data from Nominals with the option ‘Account for Carbon’ ticked are included.
*/
select
   datepart(year,dateadd(year,YEAR,ENDDATE_P1)) FinancialYearStartYear
,  PERIOD                                       Period
,  convert(varchar,datepart(year,dateadd(year,YEAR,ENDDATE_P1)))
   + '(' + convert(varchar,PERIOD) +')'         YearPeriod

,  case PERIOD
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
      when 13 then case when d2.ENDDATE_P13 is NULL then '' else left(datename(mm,d2.ENDDATE_P13),3) end
    end
                                                Month

,  convert(varchar,datepart(year,dateadd(year,YEAR,ENDDATE_P1)))
   + '/' +
   case PERIOD
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
      when 13 then case when d2.ENDDATE_P13 is NULL then '' else left(datename(mm,d2.ENDDATE_P13),3) end
    end
                                                YearMonth
,  isnull(FIRST_CATEGORY.NCAT_CODE,'')          FirstCategoryCode
,  isnull(FIRST_CATEGORY.NCAT_NAME,'')          FirstCategoryName
,  isnull(SECOND_CATEGORY.NCAT_CODE,'')         SecondCategoryCode
,  isnull(SECOND_CATEGORY.NCAT_NAME,'')         SecondCategoryName
,  CGRP_ID                                      EmissionsGroupId
,  CGRP_DESCRIPTION                             EmissionsGroupDescription

,  datepart(year,ENDDATE_P1)                    FirstOpenNominalStartYear
,  NOMINAL_PERIOD                               FirstOpenNominalPeriod
,  case substring(YearPeriod,1,1)
      when 'C' then datepart(year,ENDDATE_P1)
      else datepart(year,ENDDATE_P1)-1
   end                                          CurrentDateStartYear
,  convert(int,substring(YearPeriod,2,2))       CurrentDatePeriod
,  (NO_OF_PERIODS
   * (  case substring(YearPeriod,1,1)
           when 'C' then 0
           else 1
        end
      -
      YEAR
      )
   )
   - PERIOD
   + convert(int,substring(YearPeriod,2,2))
                                                PeriodsBeforeCurrentDate
,  NOMINAL_PERIOD
   - (NO_OF_PERIODS * YEAR)
   - PERIOD


                                                PeriodsBeforeCurrentOpenPeriod
,  FinancialCost
,  FinancialBudget
,  CO2Cost
,  CO2Budget
from
  (select
        isnull(Nominals.YEAR,Carbon.YEAR)                            as YEAR
      , isnull(Nominals.PERIOD,Carbon.PERIOD)                        as PERIOD
      , isnull(Nominals.EmissionGroupLink,Carbon.CCLS_GROUP_LINK)    as EmissionGroupLink
      , isnull(Nominals.Category1Link,Carbon.FIRST_CATEGORY_LINK)    as FIRST_CATEGORY_LINK
      , isnull(Nominals.Category2Link,Carbon.SECOND_CATEGORY_LINK)   as SECOND_CATEGORY_LINK
      , isnull(PeriodTurnover,0)                                     as FinancialCost
      , isnull(PeriodTurnoverBudget,0)                               as FinancialBudget
      , isnull(CTRN_CO2,0)                                           as CO2Cost
      , isnull(CBDG_CO2,0)                                           as CO2Budget
   from
   ( select
           Category1Link
         , Category2Link
         , EmissionGroupLink
         , sum(PeriodTurnover) as         PeriodTurnover
         , sum(case PeriodSort
                  when 1 then BudgetCYP1
                  when 2 then BudgetCYP2
                  when 3 then BudgetCYP3
                  when 4 then BudgetCYP4
                  when 5 then BudgetCYP5
                  when 6 then BudgetCYP6
                  when 7 then BudgetCYP7
                  when 8 then BudgetCYP8
                  when 9 then BudgetCYP9
                  when 10 then BudgetCYP10
                  when 11 then BudgetCYP11
                  when 12 then BudgetCYP12
                  when 13 then BudgetCYP13
                  when 14 then BudgetLYP1
                  when 15 then BudgetLYP2
                  when 16 then BudgetLYP3
                  when 17 then BudgetLYP4
                  when 18 then BudgetLYP5
                  when 19 then BudgetLYP6
                  when 20 then BudgetLYP7
                  when 21 then BudgetLYP8
                  when 22 then BudgetLYP9
                  when 23 then BudgetLYP10
                  when 24 then BudgetLYP11
                  when 25 then BudgetLYP12
                  when 26 then BudgetLYP13
                  when 27 then BudgetNYP1
                  when 28 then BudgetNYP2
                  when 29 then BudgetNYP3
                  when 30 then BudgetNYP4
                  when 31 then BudgetNYP5
                  when 32 then BudgetNYP6
                  when 33 then BudgetNYP7
                  when 34 then BudgetNYP8
                  when 35 then BudgetNYP9
                  when 36 then BudgetNYP10
                  when 37 then BudgetNYP11
                  when 38 then BudgetNYP12
                  when 39 then BudgetNYP13
               end
            )
          PeriodTurnoverBudget
         ,convert(tinyint
                     ,case
                        when PeriodSort>26
                        then PeriodSort-26
                        when PeriodSort>13
                        then PeriodSort-13
                        else PeriodSort
                      end
                 )
                                          PERIOD
         ,case
               when PeriodSort > 26
               then 1
               when PeriodSort > 13
               then 0
               else -1
          end                             YEAR
   from
   (select
          n.NCODE                                           NominalCode
         ,n.NNAME                                           NominalName
         ,c1.NC_PRIMARY                                     Category1Link
         ,c2.NC_PRIMARY                                     Category2Link
         ,n.N_EMISSIONS_GROUP_LINK                          EmissionGroupLink
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
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L1)                [1]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L2)                [2]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L3)                [3]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L4)                [4]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L5)                [5]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L6)                [6]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L7)                [7]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L8)                [8]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L9)                [9]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L10)               [10]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L11)               [11]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L12)               [12]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L13)               [13]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C1)                [14]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C2)                [15]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C3)                [16]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C4)                [17]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C5)                [18]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C6)                [19]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C7)                [20]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C8)                [21]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C9)                [22]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C10)               [23]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C11)               [24]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C12)               [25]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C13)               [26]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N1)                [27]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N2)                [28]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N3)                [29]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N4)                [30]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N5)                [31]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N6)                [32]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N7)                [33]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N8)                [34]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N9)                [35]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N10)               [36]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N11)               [37]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N12)               [38]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N13)               [39]
      from NL_ACCOUNTS n with (nolock)
         left  join NL_CATEGORY c1 with(nolock)   on c1.NL_CAT_SORTCODE = '1' + n.NCATEGORYCODE1
         left  join NL_CATEGORY c2 with(nolock)   on c2.NL_CAT_SORTCODE = '2' + n.NCATEGORYCODE2

      where n.N_ACCOUNT_FOR_CO2 = 1
      ) p
   UNPIVOT
      (PeriodTurnover FOR PeriodSort IN
         ( [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13]
          ,[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26]
          ,[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39]
         )
      )AS unpvt
    group by
       Category1Link
      ,Category2Link
      ,EmissionGroupLink
      ,PeriodSort
   )  Nominals
   full join
   ( select
            CCLS_GROUP_LINK
         ,  sum(CTRN_CO2)                          CTRN_CO2
         ,  sum(CBDG_CO2)                          CBDG_CO2
         ,  YEAR
         ,  PERIOD
         ,  FIRST_CATEGORY_LINK
         ,  SECOND_CATEGORY_LINK
       from
       ( select
            sum(CTRN_CO2)                          CTRN_CO2
         ,  sum(CBDG_CO2)                          CBDG_CO2
         ,  YEAR
         ,  PERIOD
         ,  CLASS_LINK
         ,  FIRST_CATEGORY_LINK
         ,  SECOND_CATEGORY_LINK
            from
               (
                  select
                     CTNO_CO2                      CTRN_CO2
                  ,  0                             CBDG_CO2
                  ,  CTNO_YEAR                     YEAR
                  ,  CTNO_PERIOD                   PERIOD
                  ,  CTNO_CLASS_LINK               CLASS_LINK
                  ,  CTNO_1ST_CATEGORY_LINK        FIRST_CATEGORY_LINK
                  ,  CTNO_2ND_CATEGORY_LINK        SECOND_CATEGORY_LINK
                     from
                        CO2_TURNOVERS with(nolock)
                     where
                        CTNO_YEAR   between -9 and 9
                  union all
                  select
                     0                             CTRN_CO2
                  ,  CBDG_CO2                      CBDG_CO2
                  ,  CBDG_YEAR                     YEAR
                  ,  CBDG_PERIOD                   PERIOD
                  ,  CBDG_CLASS_LINK               CLASS_LINK
                  ,  CBDG_1ST_CATEGORY_LINK        FIRST_CATEGORY_LINK
                  ,  CBDG_2ND_CATEGORY_LINK        SECOND_CATEGORY_LINK
                     from
                        CO2_BUDGETS with(nolock)
                     where
                        CBDG_YEAR   between -9 and 9
               )  COMBINE_TRANSACTIONS_AND_BUDGETS -- Gather all Budgets and Actuals in to one result set
            group by
               YEAR
            ,  PERIOD
            ,  CLASS_LINK
            ,  FIRST_CATEGORY_LINK
            ,  SECOND_CATEGORY_LINK
          ) innerCarbon
         inner join CO2_CLASSIFICATIONS with(nolock) on CCLS_PRIMARY = CLASS_LINK
            group by
               CCLS_GROUP_LINK
            ,  YEAR
            ,  PERIOD
            ,  FIRST_CATEGORY_LINK
            ,  SECOND_CATEGORY_LINK
      )  Carbon
      on  Carbon.YEAR                  = Nominals.YEAR
      and Carbon.PERIOD                = Nominals.PERIOD
      and Carbon.CCLS_GROUP_LINK       = Nominals.EmissionGroupLink
      and Carbon.FIRST_CATEGORY_LINK   = Nominals.Category1Link
      and Carbon.SECOND_CATEGORY_LINK  = Nominals.Category2Link
      where
         not
            (
                     Carbon.PERIOD              = 13 
               and   isnull(PeriodTurnover,0)   = 0 
               and   isnull(CTRN_CO2,0)         = 0
            )
   ) dt1

   inner join CO2_EMISSIONS_GROUPS                    with(nolock)   on CGRP_PRIMARY                  = EmissionGroupLink
   inner join SYS_DATAINFO          d1                with(nolock)   on SYS_PRIMARY                   = 1
   inner join SYS_DATAINFO2         d2                with(nolock)   on SYS_PRIMARY_2                 = 1
   left  join NL_CATEGORIES         FIRST_CATEGORY    with(nolock)   on FIRST_CATEGORY.NCAT_PRIMARY   = FIRST_CATEGORY_LINK
   left  join NL_CATEGORIES         SECOND_CATEGORY   with(nolock)     on SECOND_CATEGORY.NCAT_PRIMARY  = SECOND_CATEGORY_LINK
   cross join (select .dbo.AA_GET_YEAR_PERIOD_FROM_DATE_F(getdate(),'N') as YearPeriod) as CurrentDate
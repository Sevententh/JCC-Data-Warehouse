﻿create view    DASHBOARD.AA_ARSDB_CARBON_BY_YEAR_PERIOD_VIEW
as
/*
** Written     :  25/08/09 NC
** Last Amended:  30/09/09 NC, 07/06/2010 SM
** Comments    :  Returns 1 row for each combination of year, period, FirstCategory, Division, Emissions Group and Classification
**                that has either a carbon turnover or a carbon budget.
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
,  FirstCategory.NCAT_CODE                      FirstCategoryCode
,  FirstCategory.NCAT_NAME                      FirstCategoryName
,  SecondCategory.NCAT_CODE                     SecondCategoryCode
,  SecondCategory.NCAT_NAME                     SecondCategoryName
,  CGRP_ID                                      EmissionsGroupId
,  CGRP_DESCRIPTION                             EmissionsGroupDescription
,  CCLS_CLASS_ID                                ClassificationId
,  CCLS_DESCRIPTION                             ClassificationDescription
,  CTRN_CO2/1000                                ActualCO2
,  CBDG_CO2/1000                                BudgetCO2
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

   from
      (
         select
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
      )  GROUPED  -- Merge Budget and Actual rows for same Year,Period,Classification,Group Heading, & Division Heading together
         inner join CO2_CLASSIFICATIONS                     with(nolock)   on CCLS_PRIMARY                  = CLASS_LINK
         inner join CO2_EMISSIONS_GROUPS                    with(nolock)   on CGRP_PRIMARY                  = CCLS_GROUP_LINK
         inner join SYS_DATAINFO          d1                with(nolock)   on SYS_PRIMARY                   = 1
         inner join SYS_DATAINFO2         d2                with(nolock)   on SYS_PRIMARY_2                 = 1
         left  join NL_CATEGORIES         FirstCategory     with(nolock)   on FirstCategory.NCAT_PRIMARY    = FIRST_CATEGORY_LINK
         left  join NL_CATEGORIES         SecondCategory    with(nolock)   on SecondCategory.NCAT_PRIMARY   = SECOND_CATEGORY_LINK
         cross join (select .dbo.AA_GET_YEAR_PERIOD_FROM_DATE_F(getdate(),'N') as YearPeriod) as CurrentDate
create view    DASHBOARD.AA_ARSDB_CARBON_TRANSACTIONAL_VIEW
as
/*
** Written     :  27/08/2009 NC
** Last Amended:  30/09/09 NC, 11/05/2010 SM, 07/06/2010 SM
** Comments    :  Returns 1 row for each financial transaction detail that is linked directly to a carbon transaction.
*/
select
   datepart(year,dateadd(year,CTRN_YEAR,ENDDATE_P1)) FinancialYearStartYear
,  CTRN_PERIOD                                       Period
,  convert(varchar,datepart(year,dateadd(year,CTRN_YEAR,ENDDATE_P1)))
   + '(' + convert(varchar,CTRN_PERIOD) +')'         YearPeriod

,  case CTRN_PERIOD
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

,  convert(varchar,datepart(year,dateadd(year,CTRN_YEAR,ENDDATE_P1)))
   + '/' +
   case CTRN_PERIOD
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
,  CGRP_ID                                      EmissionsGroupId
,  CGRP_DESCRIPTION                             EmissionsGroupDescription
,  CCLS_CLASS_ID                                ClassificationId
,  CCLS_DESCRIPTION                             ClassificationDescription
,  FIRST_CATEGORY.NCAT_CODE                     FirstCategoryCode
,  FIRST_CATEGORY.NCAT_NAME                     FirstCategoryName
,  SECOND_CATEGORY.NCAT_CODE                    SecondCategoryCode
,  SECOND_CATEGORY.NCAT_NAME                    SecondCategoryName
,  CTRN_DATE                                    ConsumptionDate
,  isnull(DET_NOMINALDR,'')                     NominalCode
,  SUNAME                                       SupplierName
,  case CTRN_TYPE
      when 'C' then CTRN_NOTES
      else
         DET_DESCRIPTION
   end                                          Detail
,  CTRN_CO2_SIGNED                              Co2
,  isnull(DET_NETT,0)                           FinancialValue
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
      CTRN_YEAR
      )
   )
   - CTRN_PERIOD
   + convert(int,substring(YearPeriod,2,2))
                                                PeriodsBeforeCurrentDate
,  NOMINAL_PERIOD
   - (NO_OF_PERIODS * CTRN_YEAR)
   - CTRN_PERIOD
                                                PeriodsBeforeCurrentOpenPeriod
,  CGHGS_CODE
,  CSK1_DESCRIPTION
,  CSK2_DESCRIPTION
,  CSK3_DESCRIPTION
,  CSK4_DESCRIPTION
,  CTRN_GHG_SCOPE_LINK
   from
      CO2_TRANSACTIONS with(nolock)
         inner join CO2_CLASSIFICATIONS                     with(nolock)   on       CCLS_PRIMARY                  = CTRN_CLASS_LINK
         inner join CO2_EMISSIONS_GROUPS                    with(nolock)   on       CGRP_PRIMARY                  = CCLS_GROUP_LINK
         inner join SYS_LOOKUP_TEXT                         with(nolock)   on       TXT_PRIMARY                   = CTRN_UOM_LINK
                                                                              and   TXT_ORIGIN                    = 'CO2UOM'
         inner join SYS_DATAINFO          d1                with(nolock)   on       SYS_PRIMARY                   = 1
         inner join SYS_DATAINFO2         d2                with(nolock)   on       SYS_PRIMARY_2                 = 1
               join SL_PL_NL_DETAIL                         with(nolock)   on       DET_PRIMARY                   = CTRN_DETAIL_LINK
         left  join NL_CATEGORIES         FIRST_CATEGORY    with(nolock)   on       FIRST_CATEGORY.NCAT_PRIMARY   = CTRN_1ST_CATEGORY_LINK
         left  join NL_CATEGORIES         SECOND_CATEGORY   with(nolock)   on       SECOND_CATEGORY.NCAT_PRIMARY  = CTRN_2ND_CATEGORY_LINK
         left  join PL_ACCOUNTS                             with(nolock)   on       CTRN_TYPE                     in('PL','PO')
                                                                              and   SUCODE                        = DET_ACCOUNT
         inner join CO2_GHG_SCOPE                           with(nolock)   on       CTRN_GHG_SCOPE_LINK           = CGHGS_PRIMARY
         left  join CO2_SORT_KEYS_1                         with(nolock)   on       CTRN_SORT_KEY_1_LINK          = CSK1_PRIMARY
         left  join CO2_SORT_KEYS_2                         with(nolock)   on       CTRN_SORT_KEY_2_LINK          = CSK2_PRIMARY
         left  join CO2_SORT_KEYS_3                         with(nolock)   on       CTRN_SORT_KEY_3_LINK          = CSK3_PRIMARY
         left  join CO2_SORT_KEYS_4                         with(nolock)   on       CTRN_SORT_KEY_4_LINK          = CSK4_PRIMARY
         cross join (select .dbo.AA_GET_YEAR_PERIOD_FROM_DATE_F(getdate(),'N') as YearPeriod) as CurrentDate
   where
            CTRN_YEAR between -9 and 9
      and   CTRN_BATCHED = 0
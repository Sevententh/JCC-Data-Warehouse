create view    AA_ACR_CARBON_EG_AND_CLASS_BY_PERIOD_BUDGET_VIEW
as
select
   CGRP_ID                                      EMISSIONS_GROUP_ID
,  CGRP_DESCRIPTION                             EMISSIONS_GROUP_DESCRIPTION
,  CCLS_CLASS_ID                                CLASSIFICATION_ID
,  CCLS_DESCRIPTION                             CLASSIFICATION_DESCRIPTION
,  dbo.AA_SYS_BUDGET_YEAR_TO_CHAR_F(YEAR)       YEAR
,  CO2_PERIOD_01
,  CO2_PERIOD_02
,  CO2_PERIOD_03
,  CO2_PERIOD_04
,  CO2_PERIOD_05
,  CO2_PERIOD_06
,  CO2_PERIOD_07
,  CO2_PERIOD_08
,  CO2_PERIOD_09
,  CO2_PERIOD_10
,  CO2_PERIOD_11
,  CO2_PERIOD_12
,  CO2_PERIOD_13
,  COMPANY_NAME
,  FirstCategory.NCAT_CODE                      FIRST_CATEGORY_CODE
,  FirstCategory.NCAT_NAME                      FIRST_CATEGORY_NAME
,  SecondCategory.NCAT_CODE                     SECOND_CATEGORY_CODE
,  SecondCategory.NCAT_NAME                     SECOND_CATEGORY_NAME
   from
      (
         select
            CBDG_CLASS_LINK
         ,  FIRST_CATEGORY_LINK
         ,  SECOND_CATEGORY_LINK
         ,  YEAR
         ,  sum
            (
               case PERIOD
                  when 1 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_01
         ,  sum
            (
               case PERIOD
                  when 2 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_02
         ,  sum
            (
               case PERIOD
                  when 3 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_03
         ,  sum
            (
               case PERIOD
                  when 4 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_04
         ,  sum
            (
               case PERIOD
                  when 5 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_05
         ,  sum
            (
               case PERIOD
                  when 6 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_06
         ,  sum
            (
               case PERIOD
                  when 7 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_07
         ,  sum
            (
               case PERIOD
                  when 8 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_08
         ,  sum
            (
               case PERIOD
                  when 9 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_09
         ,  sum
            (
               case PERIOD
                  when 10 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_10
         ,  sum
            (
               case PERIOD
                  when 11 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_11
         ,  sum
            (
               case PERIOD
                  when 12 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_12
         ,  sum
            (
               case PERIOD
                  when 13 then CO2
                  else
                     0
               end
            )                    CO2_PERIOD_13
            from
            (
               select
                  CBDG_CLASS_LINK
               ,  CBDG_1ST_CATEGORY_LINK  FIRST_CATEGORY_LINK
               ,  CBDG_2ND_CATEGORY_LINK  SECOND_CATEGORY_LINK
               ,  YEAR
               ,  PERIOD
               ,  sum
                  (
                     case
                        when        CBDG_YEAR   = YEAR
                              and   CBDG_PERIOD = PERIOD then CBDG_CO2
                        else
                           0
                     end
                  )                 CO2
                  from
                     CO2_BUDGETS with(nolock)
                     cross join
                     dbo.AA_SYS_BUDGET_YEAR_PERIOD_F()
                  group by
                     CBDG_CLASS_LINK
                  ,  CBDG_1ST_CATEGORY_LINK
                  ,  CBDG_2ND_CATEGORY_LINK
                  ,  YEAR
                  ,  PERIOD
            )  CYP
            group by
               CBDG_CLASS_LINK
            ,  FIRST_CATEGORY_LINK
            ,  SECOND_CATEGORY_LINK
            ,  YEAR
      ) GROUPED
         inner join CO2_CLASSIFICATIONS                        with(nolock)   on CCLS_PRIMARY                     = CBDG_CLASS_LINK
         inner join CO2_EMISSIONS_GROUPS                       with(nolock)   on CGRP_PRIMARY                     = CCLS_GROUP_LINK
         inner join SYS_DATAINFO                               with(nolock)   on SYS_PRIMARY                      = 1
         left  join NL_CATEGORIES           FirstCategory      with(nolock)   on FirstCategory.NCAT_PRIMARY       = FIRST_CATEGORY_LINK
         left  join NL_CATEGORIES           SecondCategory     with(nolock)   on SecondCategory.NCAT_PRIMARY      = SECOND_CATEGORY_LINK
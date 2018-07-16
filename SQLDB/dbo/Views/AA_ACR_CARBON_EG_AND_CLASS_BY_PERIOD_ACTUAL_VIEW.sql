create view    AA_ACR_CARBON_EG_AND_CLASS_BY_PERIOD_ACTUAL_VIEW
as
select
   dbo.AA_SYS_BUDGET_YEAR_TO_CHAR_F(YEAR)    YEAR
,  CGRP_ID                                   EMISSIONS_GROUP_ID
,  CGRP_DESCRIPTION                          EMISSIONS_GROUP_DESCRIPTION
,  CCLS_CLASS_ID                             CLASSIFICATION_ID
,  CCLS_DESCRIPTION                          CLASSIFICATION_DESCRIPTION
,  FIRSTCAT.NCAT_CODE                        FIRST_CATEGORY_CODE
,  FIRSTCAT.NCAT_NAME                        FIRST_CATEGORY_NAME
,  SECONDCAT.NCAT_CODE                       SECOND_CATEGORY_CODE
,  SECONDCAT.NCAT_NAME                       SECOND_CATEGORY_NAME
,  CTRN_CLASS_LINK
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
-- Language labels
,  CO2_EMISSION_GROUP
,  CO2_CLASSIFICATION
,  TOTAL_FOR_ALL_EM_GRPS
,  TOTAL_FOR_YEAR
-- END Language labels
,  CTNO_GHG_SCOPE_LINK                       GHG_SCOPE
,  CSK1_DESCRIPTION                          USER_KEY_1
,  CSK2_DESCRIPTION                          USER_KEY_2
,  CSK3_DESCRIPTION                          USER_KEY_3
,  CSK4_DESCRIPTION                          USER_KEY_4
   from
      (
         select
            CTRN_CLASS_LINK
         ,  CTRN_1ST_CATEGORY_LINK
         ,  CTRN_2ND_CATEGORY_LINK
         ,  YEAR
         ,  CTNO_GHG_SCOPE_LINK 
         ,  CTNO_SORT_KEY_1_LINK
         ,  CTNO_SORT_KEY_2_LINK
         ,  CTNO_SORT_KEY_3_LINK
         ,  CTNO_SORT_KEY_4_LINK
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
                  YEAR
               ,  PERIOD
               ,  CTRN_CLASS_LINK
               ,  CTRN_1ST_CATEGORY_LINK
               ,  CTRN_2ND_CATEGORY_LINK
               ,  CTNO_GHG_SCOPE_LINK 
               ,  CTNO_SORT_KEY_1_LINK
               ,  CTNO_SORT_KEY_2_LINK
               ,  CTNO_SORT_KEY_3_LINK
               ,  CTNO_SORT_KEY_4_LINK
               ,  case
                     when        CTRN_YEAR   = YEAR
                           and   CTRN_PERIOD = PERIOD then CO2
                     else
                        0
                  end CO2
                  from
                     (
                        select
                           CTNO_YEAR                  CTRN_YEAR
                        ,  CTNO_PERIOD                CTRN_PERIOD
                        ,  CTNO_CLASS_LINK            CTRN_CLASS_LINK
                        ,  CTNO_1ST_CATEGORY_LINK     CTRN_1ST_CATEGORY_LINK
                        ,  CTNO_2ND_CATEGORY_LINK     CTRN_2ND_CATEGORY_LINK
                        ,  CTNO_GHG_SCOPE_LINK 
                        ,  CTNO_SORT_KEY_1_LINK
                        ,  CTNO_SORT_KEY_2_LINK
                        ,  CTNO_SORT_KEY_3_LINK
                        ,  CTNO_SORT_KEY_4_LINK
                        ,  sum(CTNO_CO2)              CO2
                           from
                              CO2_TURNOVERS with(nolock)
                           group by
                              CTNO_YEAR
                           ,  CTNO_PERIOD
                           ,  CTNO_CLASS_LINK
                           ,  CTNO_1ST_CATEGORY_LINK
                           ,  CTNO_2ND_CATEGORY_LINK
                           ,  CTNO_GHG_SCOPE_LINK 
                           ,  CTNO_SORT_KEY_1_LINK
                           ,  CTNO_SORT_KEY_2_LINK
                           ,  CTNO_SORT_KEY_3_LINK
                           ,  CTNO_SORT_KEY_4_LINK
                     ) Actuals_by_period
                     cross join
                     dbo.AA_SYS_BUDGET_YEAR_PERIOD_F()
            )  CYP
            group by
               YEAR
            ,  CTRN_CLASS_LINK
            ,  CTRN_1ST_CATEGORY_LINK
            ,  CTRN_2ND_CATEGORY_LINK
            ,  CTNO_GHG_SCOPE_LINK 
            ,  CTNO_SORT_KEY_1_LINK
            ,  CTNO_SORT_KEY_2_LINK
            ,  CTNO_SORT_KEY_3_LINK
            ,  CTNO_SORT_KEY_4_LINK
      ) GROUPED
         inner join CO2_CLASSIFICATIONS               with(nolock)   on CCLS_PRIMARY            = CTRN_CLASS_LINK
         inner join CO2_EMISSIONS_GROUPS              with(nolock)   on CGRP_PRIMARY            = CCLS_GROUP_LINK
         inner join SYS_DATAINFO                      with(nolock)   on SYS_PRIMARY             = 1
         left  join NL_CATEGORIES         FIRSTCAT    with(nolock)   on FIRSTCAT.NCAT_PRIMARY   = CTRN_1ST_CATEGORY_LINK
         left  join NL_CATEGORIES         SECONDCAT   with(nolock)   on SECONDCAT.NCAT_PRIMARY  = CTRN_2ND_CATEGORY_LINK
         left  join CO2_SORT_KEYS_1                   with(nolock)   on CSK1_PRIMARY            = CTNO_SORT_KEY_1_LINK
         left  join CO2_SORT_KEYS_2                   with(nolock)   on CSK2_PRIMARY            = CTNO_SORT_KEY_2_LINK
         left  join CO2_SORT_KEYS_3                   with(nolock)   on CSK3_PRIMARY            = CTNO_SORT_KEY_3_LINK
         left  join CO2_SORT_KEYS_4                   with(nolock)   on CSK4_PRIMARY            = CTNO_SORT_KEY_4_LINK
   ,  (
         select
            CO2_EMISSION_GROUP
         ,  CO2_CLASSIFICATION
         ,  TOTAL_FOR_ALL_EM_GRPS
         ,  TOTAL_FOR_YEAR
            from
               LANG_CO2 with(nolock)
            where
               LANGCODE_CO2 = 'ENGLISH'
      ) Language
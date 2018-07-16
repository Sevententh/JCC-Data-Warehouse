create view    AA_ACR_CARBON_EG_AND_CLASS_BY_YEAR_ACTUAL_VIEW
as
select
   CGRP_ID                          EMISSIONS_GROUP_ID
,  CGRP_DESCRIPTION                 EMISSIONS_GROUP_DESCRIPTION
,  CCLS_CLASS_ID                    CLASSIFICATION_ID
,  CCLS_DESCRIPTION                 CLASSIFICATION_DESCRIPTION
,  FIRSTCAT.NCAT_CODE               FIRST_CATEGORY_CODE
,  FIRSTCAT.NCAT_NAME               FIRST_CATEGORY_NAME
,  SECONDCAT.NCAT_CODE              SECOND_CATEGORY_CODE
,  SECONDCAT.NCAT_NAME              SECOND_CATEGORY_NAME
,  CO2_YEAR_L09
,  CO2_YEAR_L08
,  CO2_YEAR_L07
,  CO2_YEAR_L06
,  CO2_YEAR_L05
,  CO2_YEAR_L04
,  CO2_YEAR_L03
,  CO2_YEAR_L02
,  CO2_YEAR_L01
,  CO2_YEAR_C
,  CO2_YEAR_N01
,  CO2_YEAR_N02
,  CO2_YEAR_N03
,  CO2_YEAR_N04
,  CO2_YEAR_N05
,  CO2_YEAR_N06
,  CO2_YEAR_N07
,  CO2_YEAR_N08
,  CO2_YEAR_N09
,  COMPANY_NAME
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
         ,  CTNO_GHG_SCOPE_LINK 
         ,  CTNO_SORT_KEY_1_LINK
         ,  CTNO_SORT_KEY_2_LINK
         ,  CTNO_SORT_KEY_3_LINK
         ,  CTNO_SORT_KEY_4_LINK
         ,  sum
            (
               case YEAR
                  when -9 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L09
         ,  sum
            (
               case YEAR
                  when -8 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L08
         ,  sum
            (
               case YEAR
                  when -7 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L07
         ,  sum
            (
               case YEAR
                  when -6 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L06
         ,  sum
            (
               case YEAR
                  when -5 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L05
         ,  sum
            (
               case YEAR
                  when -4 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L04
         ,  sum
            (
               case YEAR
                  when -3 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L03
         ,  sum
            (
               case YEAR
                  when -2 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L02
         ,  sum
            (
               case YEAR
                  when -1 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_L01
         ,  sum
            (
               case YEAR
                  when 0 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_C
         ,  sum
            (
               case YEAR
                  when 1 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N01
         ,  sum
            (
               case YEAR
                  when 2 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N02
         ,  sum
            (
               case YEAR
                  when 3 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N03
         ,  sum
            (
               case YEAR
                  when 4 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N04
         ,  sum
            (
               case YEAR
                  when 5 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N05
         ,  sum
            (
               case YEAR
                  when 6 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N06
         ,  sum
            (
               case YEAR
                  when 7 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N07
         ,  sum
            (
               case YEAR
                  when 8 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N08
         ,  sum
            (
               case YEAR
                  when 9 then CO2
                  else
                     0
               end
            )                    CO2_YEAR_N09
            from
            (
               select
                  CTRN_CLASS_LINK
               ,  YEAR
               ,  CTRN_1ST_CATEGORY_LINK
               ,  CTRN_2ND_CATEGORY_LINK
               ,  CTNO_GHG_SCOPE_LINK 
               ,  CTNO_SORT_KEY_1_LINK
               ,  CTNO_SORT_KEY_2_LINK
               ,  CTNO_SORT_KEY_3_LINK
               ,  CTNO_SORT_KEY_4_LINK
               ,  case CTRN_YEAR
                     when YEAR then CO2
                     else
                        0
                  end                                             CO2
                  from
                     (
                        select
                           CTNO_YEAR                  CTRN_YEAR
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
                              CTNO_CLASS_LINK
                           ,  CTNO_1ST_CATEGORY_LINK
                           ,  CTNO_2ND_CATEGORY_LINK
                           ,  CTNO_YEAR
                           ,  CTNO_GHG_SCOPE_LINK 
                           ,  CTNO_SORT_KEY_1_LINK
                           ,  CTNO_SORT_KEY_2_LINK
                           ,  CTNO_SORT_KEY_3_LINK
                           ,  CTNO_SORT_KEY_4_LINK
                     ) Actuals_by_year
                     cross join
                     dbo.AA_SYS_BUDGET_YEAR_F()
            )  CY
            group by
               CTRN_CLASS_LINK
            ,  CTRN_1ST_CATEGORY_LINK
            ,  CTRN_2ND_CATEGORY_LINK
            ,  YEAR
            ,  CTNO_GHG_SCOPE_LINK 
            ,  CTNO_SORT_KEY_1_LINK
            ,  CTNO_SORT_KEY_2_LINK
            ,  CTNO_SORT_KEY_3_LINK
            ,  CTNO_SORT_KEY_4_LINK
      ) GROUPED
         inner join CO2_CLASSIFICATIONS            with(nolock)   on CCLS_PRIMARY            = CTRN_CLASS_LINK
         inner join CO2_EMISSIONS_GROUPS           with(nolock)   on CGRP_PRIMARY            = CCLS_GROUP_LINK
         inner join SYS_DATAINFO                   with(nolock)   on SYS_PRIMARY             = 1
         left  join NL_CATEGORIES        FIRSTCAT  with(nolock)   on FIRSTCAT.NCAT_PRIMARY   = CTRN_1ST_CATEGORY_LINK
         left  join NL_CATEGORIES        SECONDCAT with(nolock)   on SECONDCAT.NCAT_PRIMARY  = CTRN_2ND_CATEGORY_LINK
         left  join CO2_SORT_KEYS_1                with(nolock)   on CSK1_PRIMARY            = CTNO_SORT_KEY_1_LINK
         left  join CO2_SORT_KEYS_2                with(nolock)   on CSK2_PRIMARY            = CTNO_SORT_KEY_2_LINK
         left  join CO2_SORT_KEYS_3                with(nolock)   on CSK3_PRIMARY            = CTNO_SORT_KEY_3_LINK
         left  join CO2_SORT_KEYS_4                with(nolock)   on CSK4_PRIMARY            = CTNO_SORT_KEY_4_LINK
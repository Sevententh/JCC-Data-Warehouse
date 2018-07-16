create view    AA_ACR_CARBON_ACTUAL_VIEW
as
select
   dbo.AA_SYS_BUDGET_YEAR_TO_CHAR_F(CTNO_YEAR)  YEAR
,  CTNO_PERIOD                                  PERIOD
,  FirstCategory.NCAT_CODE                      FIRST_CATEGORY_CODE
,  FirstCategory.NCAT_NAME                      FIRST_CATEGORY_NAME
,  SecondCategory.NCAT_CODE                     SECOND_CATEGORY_CODE
,  SecondCategory.NCAT_NAME                     SECOND_CATEGORY_NAME
,  CGRP_ID                                      EMISSIONS_GROUP_ID
,  CGRP_DESCRIPTION                             EMISSIONS_GROUP_DESCRIPTION
,  CCLS_CLASS_ID                                CLASSIFICATION_ID
,  CCLS_DESCRIPTION                             CLASSIFICATION_DESCRIPTION
,  CTNO_CO2                                     ACTUAL_CO2
,  CTNO_YEAR                                    YEAR_SEARCH
,  COMPANY_NAME
,  CO2_EMISSION_GROUP
,  CO2_CLASSIFICATION
,  VARIANCE_PERCENT
,  TOTAL_FOR_ALL_EM_GRPS
,  ACTUAL_EMISSIONS
,  VARIANCE_TXT
,  CURRENT_YEAR_M_REP
,  LAST_YEAR_M_REP
,  case CO2_OPT_1ST_CATEGORY_GROUP
      when 1 then NOMSORTDEF1_REP
      when 2 then NOMSORTDEF1_REP
      when 3 then NOMSORTDEF1_REP
      when 4 then NOMSORTDEF1_REP
      when 5 then NOMSORTDEF1_REP
      when 6 then NOMSORTDEF1_REP
      when 7 then NOMSORTDEF1_REP
      when 8 then NOMSORTDEF1_REP
   end                                          NOMSORTDEF1_REP
,  case CO2_OPT_2ND_CATEGORY_GROUP
      when 1 then NOMSORTDEF1_REP
      when 2 then NOMSORTDEF1_REP
      when 3 then NOMSORTDEF1_REP
      when 4 then NOMSORTDEF1_REP
      when 5 then NOMSORTDEF1_REP
      when 6 then NOMSORTDEF1_REP
      when 7 then NOMSORTDEF1_REP
      when 8 then NOMSORTDEF1_REP
   end                                          NOMSORTDEF2_REP
,  PER_HEAD_ACTUAL
,  PER_HEAD_BUDGET
,  NUMBER_OF_STAFF
,  DESCRIPTION_REP
,  CTNO_GHG_SCOPE_LINK                          GHG_SCOPE
,  CSK1_DESCRIPTION                             USER_KEY_1
,  CSK2_DESCRIPTION                             USER_KEY_2
,  CSK3_DESCRIPTION                             USER_KEY_3
,  CSK4_DESCRIPTION                             USER_KEY_4
   from
      CO2_TURNOVERS
         inner join CO2_CLASSIFICATIONS                     with(nolock)   on CCLS_PRIMARY                     = CTNO_CLASS_LINK
         inner join CO2_EMISSIONS_GROUPS                    with(nolock)   on CGRP_PRIMARY                     = CCLS_GROUP_LINK
         inner join SYS_DATAINFO                            with(nolock)   on SYS_PRIMARY                      = 1
         inner join SYS_CO2_OPTIONS                         with(nolock)   on CO2_OPT_PRIMARY                  = 1
         left  join NL_CATEGORIES        FirstCategory      with(nolock)   on FirstCategory.NCAT_PRIMARY       = CTNO_1ST_CATEGORY_LINK
         left  join NL_CATEGORIES        SecondCategory     with(nolock)   on SecondCategory.NCAT_PRIMARY      = CTNO_2ND_CATEGORY_LINK
         left  join CO2_SORT_KEYS_1                         with(nolock)   on CSK1_PRIMARY                     = CTNO_SORT_KEY_1_LINK
         left  join CO2_SORT_KEYS_2                         with(nolock)   on CSK2_PRIMARY                     = CTNO_SORT_KEY_2_LINK
         left  join CO2_SORT_KEYS_3                         with(nolock)   on CSK3_PRIMARY                     = CTNO_SORT_KEY_3_LINK
         left  join CO2_SORT_KEYS_4                         with(nolock)   on CSK4_PRIMARY                     = CTNO_SORT_KEY_4_LINK
   ,  (
         select
            CO2_EMISSION_GROUP
         ,  CO2_CLASSIFICATION
         ,  VARIANCE_PERCENT
         ,  TOTAL_FOR_ALL_EM_GRPS
         ,  ACTUAL_EMISSIONS
         ,  VARIANCE_TXT
         ,  CURRENT_YEAR_M_REP
         ,  LAST_YEAR_M_REP
         ,  NOMSORTDEF1_REP
         ,  NOMSORTDEF2_REP
			,  PER_HEAD_ACTUAL
         ,  PER_HEAD_BUDGET
         ,  NUMBER_OF_STAFF
         ,  DESCRIPTION_REP
            from
               LANG_CO2 with(nolock)
                  inner join LANG_DEF15      with(nolock)   on LANGCODE_DEF15 = LANGCODE_CO2
                  inner join LANG_REPORTS_R4 with(nolock)   on LANGCODE_REP4  = LANGCODE_CO2
                  inner join LANG_REPORTS_R6 with(nolock)   on LANGCODE_REP6  = LANGCODE_CO2
            where
               LANGCODE_CO2 = 'ENGLISH'
      ) Language
   where
      CTNO_YEAR   between -9 and 9
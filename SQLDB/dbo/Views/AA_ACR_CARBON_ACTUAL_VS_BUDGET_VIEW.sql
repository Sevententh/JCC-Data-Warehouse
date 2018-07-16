create view    AA_ACR_CARBON_ACTUAL_VS_BUDGET_VIEW
as
select
   dbo.AA_SYS_BUDGET_YEAR_TO_CHAR_F(YEAR)       YEAR
,  PERIOD
,  FirstCategory.NCAT_CODE                      FIRST_CATEGORY_CODE
,  FirstCategory.NCAT_NAME                      FIRST_CATEGORY_NAME
,  SecondCategory.NCAT_CODE                     SECOND_CATEGORY_CODE
,  SecondCategory.NCAT_NAME                     SECOND_CATEGORY_NAME
,  CGRP_ID                                      EMISSIONS_GROUP_ID
,  CGRP_DESCRIPTION                             EMISSIONS_GROUP_DESCRIPTION
,  CCLS_CLASS_ID                                CLASSIFICATION_ID
,  CCLS_DESCRIPTION                             CLASSIFICATION_DESCRIPTION
,  CTRN_CO2                                     ACTUAL_CO2
,  CBDG_CO2                                     BUDGET_CO2
,  YEAR                                         YEAR_SEARCH
,  COMPANY_NAME
,  CO2_EMISSION_GROUP
,  CO2_CLASSIFICATION
,  VARIANCE_PERCENT
,  TOTAL_FOR_ALL_EM_GRPS
,  ACTUAL_EMISSIONS
,  BUDGETED_EMISSIONS
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
         inner join CO2_CLASSIFICATIONS                        with(nolock)   on CCLS_PRIMARY                  = CLASS_LINK
         inner join CO2_EMISSIONS_GROUPS                       with(nolock)   on CGRP_PRIMARY                  = CCLS_GROUP_LINK
         inner join SYS_DATAINFO                               with(nolock)   on SYS_PRIMARY                   = 1
         inner join SYS_CO2_OPTIONS                            with(nolock)   on CO2_OPT_PRIMARY               = 1
         left  join NL_CATEGORIES           FirstCategory      with(nolock)   on FirstCategory.NCAT_PRIMARY    = FIRST_CATEGORY_LINK
         left  join NL_CATEGORIES           SecondCategory     with(nolock)   on SecondCategory.NCAT_PRIMARY   = SECOND_CATEGORY_LINK
   ,  (
         select
            CO2_EMISSION_GROUP
         ,  CO2_CLASSIFICATION
         ,  VARIANCE_PERCENT
         ,  TOTAL_FOR_ALL_EM_GRPS
         ,  ACTUAL_EMISSIONS
         ,  BUDGETED_EMISSIONS
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
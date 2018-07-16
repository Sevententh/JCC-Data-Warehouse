create view    AA_ACR_CARBON_TRANSACTIONS_VIEW
as
select
   CGRP_ID                                      EMISSIONS_GROUP_ID
,  CGRP_DESCRIPTION                             EMISSIONS_GROUP_DESCRIPTION
,  CCLS_CLASS_ID                                CLASSIFICATION_ID
,  CCLS_DESCRIPTION                             CLASSIFICATION_DESCRIPTION
,  FirstCategory.NCAT_CODE                      FIRST_CATEGORY_CODE
,  FirstCategory.NCAT_NAME                      FIRST_CATEGORY_NAME
,  SecondCategory.NCAT_CODE                     SECOND_CATEGORY_CODE
,  SecondCategory.NCAT_NAME                     SECOND_CATEGORY_NAME
,  case CTRN_INVERT_SIGN
      when 1 then CTRN_QUANTITY*-1 
      else
         CTRN_QUANTITY 
   end                                          QUANTITY
,  TXT_USER_TEXT                                UNIT_OF_MEASURE
,  CTRN_CONVERSION                              CONVERSION_FACTOR
,  CTRN_CO2_SIGNED                              CO2
,  CTRN_DATE                                    CONSUMPTION_DATE
,  dbo.AA_SYS_BUDGET_YEAR_TO_CHAR_F(CTRN_YEAR)  YEAR
,  CTRN_PERIOD                                  PERIOD
,  DET_NOMINALDR                                NOMINAL_CODE
,  SUNAME                                       SUPPLIER_NAME
,  case CTRN_TYPE
      when 'C' then CTRN_NOTES
      else
         DET_DESCRIPTION
   end                                          DETAIL
,  COMPANY_NAME
,  CO2_EMISSION_GROUP
,  CO2_CLASSIFICATION
,  CO2_CONSUMPTION_DATE
,  CO2_MEASURE
,  CO2_FACTOR
,  CARBON
,  TOTAL_FOR_ALL_EM_GRPS
,  ACCOUNT_REP
,  NOMINAL_CODE_REP
,  PERIOD_REP
,  QUANTITY_REP
,  SUPPLIER_REP
,  SUPPLIER_NAME_REP
,  SYS_NL1_MODULE_REP
,  TOTAL_REP
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
,  YEAR_REP
,  DETAIL_REP
,  CGHGS_CODE
,  CSK1_DESCRIPTION
,  CSK2_DESCRIPTION
,  CSK3_DESCRIPTION
,  CSK4_DESCRIPTION
,  CTRN_GHG_SCOPE_LINK
,  CARBON_GHG_SCOPE
,  CO2_SORT_KEY_1
,  CO2_SORT_KEY_2
,  CO2_SORT_KEY_3
,  CO2_SORT_KEY_4
   from
      CO2_TRANSACTIONS with(nolock)
         inner join CO2_CLASSIFICATIONS                     with(nolock)   on       CCLS_PRIMARY                     = CTRN_CLASS_LINK
         inner join CO2_EMISSIONS_GROUPS                    with(nolock)   on       CGRP_PRIMARY                     = CCLS_GROUP_LINK
         inner join SYS_LOOKUP_TEXT                         with(nolock)   on       TXT_PRIMARY                      = CTRN_UOM_LINK
                                                                              and   TXT_ORIGIN                       = 'CO2UOM'
         inner join SYS_DATAINFO                            with(nolock)   on       SYS_PRIMARY                      = 1
         inner join SYS_CO2_OPTIONS                         with(nolock)   on       CO2_OPT_PRIMARY                  = 1
         left  join NL_CATEGORIES         FirstCategory     with(nolock)   on       FirstCategory.NCAT_PRIMARY       = CTRN_1ST_CATEGORY_LINK
         left  join NL_CATEGORIES         SecondCategory    with(nolock)   on       SecondCategory.NCAT_PRIMARY      = CTRN_2ND_CATEGORY_LINK
         left  join SL_PL_NL_DETAIL                         with(nolock)   on       DET_PRIMARY                      = CTRN_DETAIL_LINK
         left  join PL_ACCOUNTS                             with(nolock)   on       CTRN_TYPE                        in('PL','PO')
                                                                              and   SUCODE                           = DET_ACCOUNT
         inner join CO2_GHG_SCOPE                           with(nolock)   on       CTRN_GHG_SCOPE_LINK              = CGHGS_PRIMARY
         left  join CO2_SORT_KEYS_1                         with(nolock)   on       CTRN_SORT_KEY_1_LINK             = CSK1_PRIMARY
         left  join CO2_SORT_KEYS_2                         with(nolock)   on       CTRN_SORT_KEY_2_LINK             = CSK2_PRIMARY
         left  join CO2_SORT_KEYS_3                         with(nolock)   on       CTRN_SORT_KEY_3_LINK             = CSK3_PRIMARY
         left  join CO2_SORT_KEYS_4                         with(nolock)   on       CTRN_SORT_KEY_4_LINK             = CSK4_PRIMARY
   ,  (
         select
            CO2_EMISSION_GROUP
         ,  CO2_CLASSIFICATION
         ,  CO2_CONSUMPTION_DATE
         ,  CO2_MEASURE
         ,  CO2_FACTOR
         ,  CARBON
         ,  TOTAL_FOR_ALL_EM_GRPS
         ,  ACCOUNT_REP
         ,  NOMINAL_CODE_REP
         ,  PERIOD_REP
         ,  QUANTITY_REP
         ,  SUPPLIER_REP
         ,  SUPPLIER_NAME_REP
         ,  SYS_NL1_MODULE_REP
         ,  TOTAL_REP
         ,  NOMSORTDEF1_REP
         ,  NOMSORTDEF2_REP
         ,  YEAR_REP
         ,  DETAIL_REP
         ,  CARBON_GHG_SCOPE
         ,  CO2_SORT_KEY_1
         ,  CO2_SORT_KEY_2
         ,  CO2_SORT_KEY_3
         ,  CO2_SORT_KEY_4
            from
               LANG_CO2 with(nolock)
                  inner join LANG_REPORTS_R4 with(nolock)   on LANGCODE_REP4  = LANGCODE_CO2
                  inner join LANG_REPORTS_R5 with(nolock)   on LANGCODE_REP5  = LANGCODE_CO2
                  inner join LANG_REPORTS_R6 with(nolock)   on LANGCODE_REP6  = LANGCODE_CO2
                  inner join LANG_USERFIELDS with(nolock)   on LANGCODE_USER  = LANGCODE_CO2
            where
               LANGCODE_CO2 = 'ENGLISH'
      ) Language
   where
            CTRN_YEAR between -9 and 9
      and   CTRN_BATCHED = 0
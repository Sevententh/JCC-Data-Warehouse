create view    AA_ACR_NL_ACCOUNTS_CARBON_DEFAULTS_VIEW
as
select
   NCODE                                        NOMINAL_ACCOUNT_CODE
,  NNAME                                        NOMINAL_ACCOUNT_NAME
,  N_ACCOUNT_FOR_CO2                            ACCOUNT_FOR_CARBON
,  isnull(CGRP_ID,'')+isnull(CCLS_CLASS_ID,'')  EMISSION_GROUP_AND_CLASSIFICATION
,  FIRST_HEADING.NCAT_NAME                      FIRST_HEADING
,  SECOND_HEADING.NCAT_NAME                     SECOND_HEADING
   from
      NL_ACCOUNTS with(nolock)
         inner join SYS_DATAINFO                            with(nolock)   on       SYS_PRIMARY                = 1
         inner join SYS_CO2_OPTIONS                         with(nolock)   on       CO2_OPT_PRIMARY            = SYS_PRIMARY
         left  join CO2_EMISSIONS_GROUPS                    with(nolock)   on       CGRP_PRIMARY               = N_EMISSIONS_GROUP_LINK
         left  join CO2_CLASSIFICATIONS                     with(nolock)   on       CCLS_PRIMARY               = N_CLASSIFICATION_LINK
         left  join NL_CATEGORIES           FIRST_HEADING   with(nolock)   on       FIRST_HEADING.NCAT_CODE    = NCATEGORYCODE1
                                                                              and   FIRST_HEADING.NCAT_NUMBER  = CO2_OPT_1ST_CATEGORY_GROUP
         left  join NL_CATEGORIES           SECOND_HEADING  with(nolock)   on       SECOND_HEADING.NCAT_CODE   = NCATEGORYCODE2
                                                                              and   SECOND_HEADING.NCAT_NUMBER = CO2_OPT_2ND_CATEGORY_GROUP
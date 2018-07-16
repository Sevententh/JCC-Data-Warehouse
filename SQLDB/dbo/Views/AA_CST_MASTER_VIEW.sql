create view AA_CST_MASTER_VIEW
/*
** Returns a table to be used specifically with AA_CST_MASTER_RETRIEVE_S
**
** Written     :  03/01/2006 DB
** Last Amended:
**
*/
as

select
   CCM_PRIMARY
,  CCM_CODE
,  isnull(CCM_NAME,'')                                            as CCM_NAME
,  substring
   (
      '012'
   ,  charindex(isnull(CCM_CATEGORY,'B'),'IEB')
   ,  1
   )                                                              as CCM_CATEGORY         -- Category:
                                                                                          --    0 = Income
                                                                                          --    1 = Expenditure
                                                                                          --    2 = Both
,  isnull(CCM_TYPE,0)                                             as CCM_TYPE
,  CCM_SALES_ANALYSIS_LINK
,  CCM_PURCHASE_ANALYSIS_LINK
,  isnull(SACODE,'')                                              as SACODE
,  isnull(PACODE,'')                                              as PACODE
,  isnull(SANAME,'')                                              as SANAME
,  isnull(PANAME,'')                                              as PANAME
,  isnull(CCM_UPLIFT_TYPE,0)                                      as CCM_UPLIFT_TYPE
,  CCM_UPLIFT_VALUE
,  CCM_UPLIFT_P
,  isnull(CCM_MARKUP_TYPE,0)                                      as CCM_MARKUP_TYPE
,  dbo.AA_VALUE_DPS_F(CCM_MARKUP_VALUE)                           as CCM_MARKUP_VALUE
,  CCM_MARKUP_P
,  substring
   (
      '01'
   ,  charindex(isnull(CCM_CHRG_RATE,'R'),'RF')
   ,  1
   )                                                              as RATE_TYPE            -- Charge Type:
                                                                                          --    0 = Resource
                                                                                          --    1 = Fixed Skill
,  CCM_CHRG_LINE                                                  as RESOURCE_RATE
,  CCM_CHRG_VALUE                                                 as RATE_VALUE
,  CCM_SUBTOTAL_SORTKEY
,  CCM_DATE_PUTIN
,  CCM_USER_PUTIN
,  CCM_DATE_EDITED
,  CCM_USER_EDITED
,  CCM_USRCHAR1
,  CCM_USRCHAR2
,  CCM_USRCHAR3
,  CCM_USRCHAR4
,  CCM_USRCHAR5
,  CCM_USRCHAR6
,  CCM_USRCHAR7
,  CCM_USRCHAR8
,  CCM_USRNUM1
,  CCM_USRNUM2
,  CCM_USRNUM3
,  CCM_USRDATE1
,  CCM_USRDATE2
,  CCM_USRDATE3
,  CCM_USRFLAG1
,  CCM_USRFLAG2
,  CCM_USRFLAG3
,  CCM_SECURITY_LEVEL
,  CCM_NOTES
,  CCM_ALLOW_QTY_BUDGETS
,  CCM_DO_NOT_USE
   from
      CST_MASTER_RECORD
         left join SL_ANALYSIS         on CCM_SALES_ANALYSIS_LINK      = SA_PRIMARY
         left join PL_ANALYSIS         on CCM_PURCHASE_ANALYSIS_LINK   = PA_PRIMARY
         left join SYS_RESOURCE_RATES  on R_RATE_NUMBER                = CCM_CHRG_LINE -- Not sure if this is necessary yet
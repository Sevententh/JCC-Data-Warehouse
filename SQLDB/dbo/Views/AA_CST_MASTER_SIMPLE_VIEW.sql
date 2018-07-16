create view AA_CST_MASTER_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_CST_MASTER_LIST_S
**
** Written     :  25/11/2005 SR
** Last Amended:  12/12/2005 SH, 03/01/2006 DB
**
*/
as

select
   CCM_PRIMARY                            as [PRIMARY]
,  CCM_CODE
,  isnull(CCM_NAME,'')                    as CCM_NAME
,  isnull(CCM_CATEGORY,'')                as CCM_CATEGORY
,  case isnull(CCM_TYPE,0)
      when 0 then 'P'
      else
         'R'
   end                                    as CCM_TYPE
,  isnull(SACODE,'')                      as SACODE
,  isnull(PACODE,'')                      as PACODE
,  dbo.AA_VALUE_DPS_F(CCM_UPLIFT_VALUE)   as CCM_UPLIFT_VALUE
,  CCM_UPLIFT_P
,  dbo.AA_VALUE_DPS_F(CCM_MARKUP_VALUE)   as CCM_MARKUP_VALUE
,  CCM_MARKUP_P
,  CCM_CHRG_RATE                          as RATE_TYPE
,  CCM_CHRG_LINE                          as RESOURCE_RATE
,  CCM_DATE_PUTIN
,  CCM_DATE_EDITED
,  CCM_SECURITY_LEVEL
,  isnull(CCM_DO_NOT_USE,0)               as CCM_DO_NOT_USE
   from
      CST_MASTER_RECORD
         left join SL_ANALYSIS on CCM_SALES_ANALYSIS_LINK      = SA_PRIMARY
         left join PL_ANALYSIS on CCM_PURCHASE_ANALYSIS_LINK   = PA_PRIMARY
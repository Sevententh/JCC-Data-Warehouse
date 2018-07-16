create view AA_CST_RESOURCE_RATE_VIEW

as
/*
** Returns a table to be used specifically with AA_CST_RESOURCE_RATE_RETRIEVE_S.
**
** The following fields are intended to be displayed:
**               CR_RESOURCE_LINK      Link to PRC_PRICE_RECS
**               R_RATE_NUMBER         Rate Number
**               R_DESCRIPTION         Rate description.
**               CR_COST_PRICE         Home Cost Price
**               CR_UPLIFT_P           Uplift Percentage
**               CR_UPLIFT_VALUE       Home Uplift Value
**               CR_COST_UPLIFT        Home Cost + Uplift Value
**               CR_MARGIN_P           Margin Percent
**               CR_MARGIN_VALUE       Margin Value
**               CR_FLAT_RATE          Flat Rate
**               CR_SALES_PRICE        Sales Price
**               CR_CURR_RATE          Currency Rate
**               CR_CURR_LINK          Currency Link
**               CURR_CODE             Currency Rate Code
**               CURREC_SYMBOL         Currency symbol
**               IS_HOME_CURRENCY      Flag for home currency
**               CR_COST_PRICE_C       Currency Cost Price
**               CR_UPLIFT_VALUE_C     Currency Uplift Value
**               CR_COST_UPLIFT_C      Currency Cost + Uplift
**               CR_MARGIN_VALUE_C     Currency Margin Value
**               CR_SALES_PRICE_C      Currency Sales Price
**
** CR_RESOURCE_LIMK identifies a row in the result set.
**
** Written:      20/02/2006 JC
** Last Amended: 
**
*/

select 
    CR.CR_RESOURCE_LINK
,   RR.R_RATE_NUMBER
,   RR.R_DESCRIPTION
,   CR.CR_COST_PRICE
,   CR.CR_UPLIFT_P
,   CR.CR_UPLIFT_VALUE
,   CR.CR_COST_UPLIFT
,   CR.CR_MARGIN_P
,   CR.CR_MARGIN_VALUE
,   CR.CR_FLAT_RATE
,   CR.CR_SALES_PRICE
,   CR.CR_CURR_RATE
,   CR.CR_CURR_LINK
,   CU.CURR_CODE
,   CU.CURR_SYMBOL
,   case CU.CURR_TYPE 
      when 'H' then
         1
      else
         0
    end                             as IS_HOME_CURRENCY
,   CR.CR_COST_PRICE_C
,   CR.CR_UPLIFT_VALUE_C
,   CR.CR_COST_UPLIFT_C
,   CR.CR_MARGIN_VALUE_C
,   CR.CR_SALES_PRICE_C

from SYS_RESOURCE_RATES RR
   left outer join CST_RESOURCE_RATE CR on RR.R_RATE_NUMBER = CR.CR_RATE_NUMBER
   left outer join SYS_CURRENCY CU on CR.CR_CURR_LINK = CU.CUR_PRIMARY
where CR.CR_RESOURCE_LINK is not null and RR.R_IN_USE = 1

union

select 
    PR_PRIMARY                     as CR_RESOURCE_LINK
,   RR.R_RATE_NUMBER               as R_RATE_NUMBER
,   RR.R_DESCRIPTION               as R_DESCRIPTION
,   0                              as CR_COST_PRICE
,   0                              as CR_UPLIFT_P
,   0                              as CR_UPLIFT_VALUE
,   0                              as CR_COST_UPLIFT
,   0                              as CR_MARGIN_P
,   0                              as CR_MARGIN_VALUE
,   0                              as CR_FLAT_RATE
,   0                              as CR_SALES_PRICE
,   CU.CURR_RATE                   as CR_CURR_RATE
,   CU.CUR_PRIMARY                 as CR_CURR_LINK
,   CU.CURR_CODE                   as CURR_CODE
,   CU.CURR_SYMBOL                 as CURREC_SYMBOL
,   1                              as IS_HOME_CURRENCY
,   0                              as CR_COST_PRICE_C
,   0                              as CR_UPLIFT_VALUE_C
,   0                              as CR_COST_UPLIFT_C
,   0                              as CR_MARGIN_VALUE_C
,   0                              as CR_SALES_PRICE_C
from PRC_PRICE_RECS PR
   cross join  SYS_RESOURCE_RATES RR
   left join SYS_CURRENCY CU on CU.CURR_TYPE = 'H'
   left join CST_RESOURCE_RATE CR on CR_RESOURCE_LINK = PR.PR_PRIMARY and CR.CR_RATE_NUMBER = RR.R_RATE_NUMBER
where RR.R_IN_USE = 1 and CR.CR_RATE_NUMBER is null

union
   
select 
    0                              as CR_RESOURCE_LINK
,   RR.R_RATE_NUMBER               as R_RATE_NUMBER
,   RR.R_DESCRIPTION               as R_DESCRIPTION
,   0                              as CR_COST_PRICE
,   0                              as CR_UPLIFT_P
,   0                              as CR_UPLIFT_VALUE
,   0                              as CR_COST_UPLIFT
,   0                              as CR_MARGIN_P
,   0                              as CR_MARGIN_VALUE
,   0                              as CR_FLAT_RATE
,   0                              as CR_SALES_PRICE
,   CU.CURR_RATE                   as CR_CURR_RATE
,   CU.CUR_PRIMARY                 as CR_CURR_LINK
,   CU.CURR_CODE                   as CURR_CODE
,   CU.CURR_SYMBOL                 as CURREC_SYMBOL
,   1                              as IS_HOME_CURRENCY
,   0                              as CR_COST_PRICE_C
,   0                              as CR_UPLIFT_VALUE_C
,   0                              as CR_COST_UPLIFT_C
,   0                              as CR_MARGIN_VALUE_C
,   0                              as CR_SALES_PRICE_C
from SYS_RESOURCE_RATES RR
   left join SYS_CURRENCY CU on CU.CURR_TYPE = 'H'
where RR.R_IN_USE = 1

   

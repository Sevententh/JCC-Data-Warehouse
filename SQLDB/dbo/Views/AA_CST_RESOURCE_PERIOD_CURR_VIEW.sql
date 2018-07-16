CREATE VIEW AA_CST_RESOURCE_PERIOD_CURR_VIEW
AS 
/*
**
** Written     :  15/03/2006 SB
** Last amended:  16/03/2006 SB
*/
select PR_PRIMARY
,   ORDER_YEAR                                              YEAR
,   PERIOD
,   dbo.AA_VALUE_DPS_F(COST_VALUES)                         COST_VALUES
,   dbo.AA_VALUE_DPS_F(QUANTITIES)                          QUANTITIES
,   dbo.AA_VALUE_DPS_F(SALES_VALUES)                        SALES_VALUES
,   dbo.AA_VALUE_DPS_F(COST_VALUES - COSTS_INVOICED_VALUES) WIP
,   CT_CURR_CODE   
from
(select 
         YEAR
         ,case    when YEAR = 'O' then 0
                  when YEAR = 'L' then 1
                  when YEAR = 'C' then 2
                  else 3 end
                                                ORDER_YEAR                                                                
         ,PERIOD                                                              
         ,PR_PRIMARY
         ,sum(CT_CURR_PRICE)                    COST_VALUES
         ,sum(CT_CURR_SALES_PRICE)              SALES_VALUES
         ,sum(CT_ORIGINAL_INVOICEABLE_VALUE_C)  COSTS_INVOICED_VALUES
         ,sum(CT_QUANTITY)                      QUANTITIES
         ,CT_CURR_CODE
      from 
      (select * from PRC_PRICE_RECS 
         ,(       select 1    as PERIOD union select 2   as PERIOD union select 3   as PERIOD
            union select 4    as PERIOD union select 5   as PERIOD
            union select 6    as PERIOD union select 7   as PERIOD union select 8   as PERIOD
            union select 9    as PERIOD union select 10  as PERIOD
            union select 11   as PERIOD union select 12  as PERIOD union select 13  as PERIOD
          ) PERIODS
          ,(select 'O' as Year union 
            select 'L' as Year union 
            select 'C' as Year union 
            select 'N' as Year) YEARS
      ) PR
      left join CST_DETAIL D on PR.PRCODE = D.CT_RESOURCE
         and YEAR = CT_YEAR
         and PERIOD = CT_PERIODNUMBR
      group by YEAR
         , PERIOD
         , PR_PRIMARY
         , CT_CURR_CODE
) V

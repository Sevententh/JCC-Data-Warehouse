CREATE VIEW AA_CST_RESOURCE_WEEKLY_VIEW
AS 
/*
**
** Written     :  15/03/2006 SB
** Last amended:  16/03/2006 SB
*/
select PR_PRIMARY
,   ORDER_YEAR                                              YEAR
,   [WEEK]
,   dbo.AA_VALUE_DPS_F(COST_VALUES)                         COST_VALUES
,   dbo.AA_VALUE_DPS_F(QUANTITIES)                          QUANTITIES
,   dbo.AA_VALUE_DPS_F(SALES_VALUES)                        SALES_VALUES
,   dbo.AA_VALUE_DPS_F(COST_VALUES - COSTS_INVOICED_VALUES) WIP
    
from
(select 
         YEAR
         ,case    when YEAR = 'O' then 0
                  when YEAR = 'L' then 1
                  when YEAR = 'C' then 2
                  else 3 end
                                             ORDER_YEAR                                                                
         ,[WEEK]                                                              
         ,PR_PRIMARY
         ,CT_RESOURCE
         ,sum(CT_PRICE)                      COST_VALUES
         ,sum(CT_SALES_PRICE)                SALES_VALUES
         ,sum(CT_ORIGINAL_INVOICEABLE_VALUE) COSTS_INVOICED_VALUES
         ,sum(CT_QUANTITY)                   QUANTITIES
      from 
      (  select * from PRC_PRICE_RECS 
         ,(select 1           as [WEEK] union select 2   as [WEEK] union select 3   as [WEEK] 
            union select 4    as [WEEK] union select 5   as [WEEK] 
            union select 6    as [WEEK] union select 7   as [WEEK] union select 8   as [WEEK] 
            union select 9    as [WEEK] union select 10  as [WEEK] 
            union select 11   as [WEEK] union select 12  as [WEEK] union select 13  as [WEEK] 
            union select 14   as [WEEK] union select 15  as [WEEK] 
            union select 16   as [WEEK] union select 17  as [WEEK] union select 18  as [WEEK] 
            union select 19   as [WEEK] union select 20  as [WEEK] 
            union select 21   as [WEEK] union select 22  as [WEEK] union select 23  as [WEEK] 
            union select 24   as [WEEK] union select 25  as [WEEK] 
            union select 26   as [WEEK] union select 27  as [WEEK] union select 28  as [WEEK] 
            union select 29   as [WEEK] union select 30  as [WEEK] 
            union select 31   as [WEEK] union select 32  as [WEEK] union select 33  as [WEEK] 
            union select 34   as [WEEK] union select 35  as [WEEK] 
            union select 36   as [WEEK] union select 37  as [WEEK] union select 38  as [WEEK] 
            union select 39   as [WEEK] union select 40  as [WEEK] 
            union select 41   as [WEEK] union select 42  as [WEEK] union select 43  as [WEEK] 
            union select 44   as [WEEK] union select 45  as [WEEK] 
            union select 46   as [WEEK] union select 47  as [WEEK] union select 48  as [WEEK] 
            union select 49   as [WEEK] union select 50  as [WEEK] 
            union select 51   as [WEEK] union select 52  as [WEEK] union select 53  as [WEEK] 
          ) WEEKS
          ,(select 'O' as Year union 
            select 'L' as Year union 
            select 'C' as Year union 
            select 'N' as Year) YEARS
      ) PR
      left join CST_DETAIL D on PR.PRCODE = D.CT_RESOURCE
         and YEAR = CT_YEAR
         and [WEEK] = CT_PERIODNUMBR
         group by YEAR
            , [WEEK]
            , PR_PRIMARY
            , CT_RESOURCE
) V
WHERE PR_PRIMARY = 15
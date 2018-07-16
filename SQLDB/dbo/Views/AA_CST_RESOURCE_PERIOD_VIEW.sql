CREATE VIEW AA_CST_RESOURCE_PERIOD_VIEW
AS 
/*
**
** Written     :  14/03/2006 SB
** Last amended:  15/03/2006 SB, 16/03/2006 SB
*/
select A.PR_PRIMARY
,   A.ORDER_YEAR                                                  YEAR
,   A.PERIOD
,   dbo.AA_VALUE_DPS_F(A.COST_VALUES)                             COST_VALUES
,   dbo.AA_VALUE_DPS_F(A.QUANTITIES)                              QUANTITIES
,   dbo.AA_VALUE_DPS_F(B.SALES_VALUES)                            SALES_VALUES
,   dbo.AA_VALUE_DPS_F(A.COST_VALUES - B.COSTS_INVOICED_VALUES)   WIP
    
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
         ,cast(case 
            when PERIOD = 1  and YEAR = 'O' then PR.PR_TURNOVER_O1
            when PERIOD = 2  and YEAR = 'O' then PR.PR_TURNOVER_O2
            when PERIOD = 3  and YEAR = 'O' then PR.PR_TURNOVER_O3
            when PERIOD = 4  and YEAR = 'O' then PR.PR_TURNOVER_O4
            when PERIOD = 5  and YEAR = 'O' then PR.PR_TURNOVER_O5
            when PERIOD = 6  and YEAR = 'O' then PR.PR_TURNOVER_O6
            when PERIOD = 7  and YEAR = 'O' then PR.PR_TURNOVER_O7
            when PERIOD = 8  and YEAR = 'O' then PR.PR_TURNOVER_O8
            when PERIOD = 9  and YEAR = 'O' then PR.PR_TURNOVER_O9
            when PERIOD = 10 and YEAR = 'O' then PR.PR_TURNOVER_O10
            when PERIOD = 11 and YEAR = 'O' then PR.PR_TURNOVER_O11
            when PERIOD = 12 and YEAR = 'O' then PR.PR_TURNOVER_O12
            when PERIOD = 13 and YEAR = 'O' then PR.PR_TURNOVER_O13
            
            when PERIOD = 1  and YEAR = 'L' then PR.PR_TURNOVER_L1 
            when PERIOD = 2  and YEAR = 'L' then PR.PR_TURNOVER_L2
            when PERIOD = 3  and YEAR = 'L' then PR.PR_TURNOVER_L3
            when PERIOD = 4  and YEAR = 'L' then PR.PR_TURNOVER_L4
            when PERIOD = 5  and YEAR = 'L' then PR.PR_TURNOVER_L5
            when PERIOD = 6  and YEAR = 'L' then PR.PR_TURNOVER_L6
            when PERIOD = 7  and YEAR = 'L' then PR.PR_TURNOVER_L7
            when PERIOD = 8  and YEAR = 'L' then PR.PR_TURNOVER_L8                                      
            when PERIOD = 9  and YEAR = 'L' then PR.PR_TURNOVER_L9
            when PERIOD = 10 and YEAR = 'L' then PR.PR_TURNOVER_L10
            when PERIOD = 11 and YEAR = 'L' then PR.PR_TURNOVER_L11
            when PERIOD = 12 and YEAR = 'L' then PR.PR_TURNOVER_L12
            when PERIOD = 13 and YEAR = 'L' then PR.PR_TURNOVER_L13
            
            when PERIOD = 1  and YEAR = 'C' then PR.PR_TURNOVER_C1 
            when PERIOD = 2  and YEAR = 'C' then PR.PR_TURNOVER_C2
            when PERIOD = 3  and YEAR = 'C' then PR.PR_TURNOVER_C3
            when PERIOD = 4  and YEAR = 'C' then PR.PR_TURNOVER_C4
            when PERIOD = 5  and YEAR = 'C' then PR.PR_TURNOVER_C5
            when PERIOD = 6  and YEAR = 'C' then PR.PR_TURNOVER_C6
            when PERIOD = 7  and YEAR = 'C' then PR.PR_TURNOVER_C7
            when PERIOD = 8  and YEAR = 'C' then PR.PR_TURNOVER_C8                                      
            when PERIOD = 9  and YEAR = 'C' then PR.PR_TURNOVER_C9
            when PERIOD = 10 and YEAR = 'C' then PR.PR_TURNOVER_C10
            when PERIOD = 11 and YEAR = 'C' then PR.PR_TURNOVER_C11
            when PERIOD = 12 and YEAR = 'C' then PR.PR_TURNOVER_C12
            when PERIOD = 13 and YEAR = 'C' then PR.PR_TURNOVER_C13
            else 0 end as decimal(24,8))                                           COST_VALUES

         ,cast(case 
            when PERIOD = 1  and YEAR = 'O' then PR.PR_QTY_O1
            when PERIOD = 2  and YEAR = 'O' then PR.PR_QTY_O2
            when PERIOD = 3  and YEAR = 'O' then PR.PR_QTY_O3
            when PERIOD = 4  and YEAR = 'O' then PR.PR_QTY_O4
            when PERIOD = 5  and YEAR = 'O' then PR.PR_QTY_O5
            when PERIOD = 6  and YEAR = 'O' then PR.PR_QTY_O6
            when PERIOD = 7  and YEAR = 'O' then PR.PR_QTY_O7
            when PERIOD = 8  and YEAR = 'O' then PR.PR_QTY_O8
            when PERIOD = 9  and YEAR = 'O' then PR.PR_QTY_O9
            when PERIOD = 10 and YEAR = 'O' then PR.PR_QTY_O10
            when PERIOD = 11 and YEAR = 'O' then PR.PR_QTY_O11
            when PERIOD = 12 and YEAR = 'O' then PR.PR_QTY_O12
            when PERIOD = 13 and YEAR = 'O' then PR.PR_QTY_O13
            
            when PERIOD = 1  and YEAR = 'L' then PR.PR_QTY_L1 
            when PERIOD = 2  and YEAR = 'L' then PR.PR_QTY_L2
            when PERIOD = 3  and YEAR = 'L' then PR.PR_QTY_L3
            when PERIOD = 4  and YEAR = 'L' then PR.PR_QTY_L4
            when PERIOD = 5  and YEAR = 'L' then PR.PR_QTY_L5
            when PERIOD = 6  and YEAR = 'L' then PR.PR_QTY_L6
            when PERIOD = 7  and YEAR = 'L' then PR.PR_QTY_L7
            when PERIOD = 8  and YEAR = 'L' then PR.PR_QTY_L8                                      
            when PERIOD = 9  and YEAR = 'L' then PR.PR_QTY_L9
            when PERIOD = 10 and YEAR = 'L' then PR.PR_QTY_L10
            when PERIOD = 11 and YEAR = 'L' then PR.PR_QTY_L11
            when PERIOD = 12 and YEAR = 'L' then PR.PR_QTY_L12
            when PERIOD = 13 and YEAR = 'L' then PR.PR_QTY_L13
            
            when PERIOD = 1  and YEAR = 'C' then PR.PR_QTY_C1 
            when PERIOD = 2  and YEAR = 'C' then PR.PR_QTY_C2
            when PERIOD = 3  and YEAR = 'C' then PR.PR_QTY_C3
            when PERIOD = 4  and YEAR = 'C' then PR.PR_QTY_C4
            when PERIOD = 5  and YEAR = 'C' then PR.PR_QTY_C5
            when PERIOD = 6  and YEAR = 'C' then PR.PR_QTY_C6
            when PERIOD = 7  and YEAR = 'C' then PR.PR_QTY_C7
            when PERIOD = 8  and YEAR = 'C' then PR.PR_QTY_C8                                      
            when PERIOD = 9  and YEAR = 'C' then PR.PR_QTY_C9
            when PERIOD = 10 and YEAR = 'C' then PR.PR_QTY_C10
            when PERIOD = 11 and YEAR = 'C' then PR.PR_QTY_C11
            when PERIOD = 12 and YEAR = 'C' then PR.PR_QTY_C12
            when PERIOD = 13 and YEAR = 'C' then PR.PR_QTY_C13
            else 0 end as decimal(24,8))                                           QUANTITIES
      from 
           PRC_PRICE_RECS PR
               ,(       select 1    as PERIOD union select 2   as PERIOD union select 3   as PERIOD
                  union select 4    as PERIOD union select 5   as PERIOD
                  union select 6    as PERIOD union select 7   as PERIOD union select 8   as PERIOD
                  union select 9    as PERIOD union select 10  as PERIOD
                  union select 11   as PERIOD union select 12  as PERIOD union select 13  as PERIOD
                ) PERIODS
                ,(select 'O' as YEAR union 
                  select 'L' as YEAR union 
                  select 'C' as YEAR) YEARS
union all

   select YEAR
         ,case    when YEAR = 'O' then 0
                  when YEAR = 'L' then 1
                  when YEAR = 'C' then 2
                  else 3 end
                                             ORDER_YEAR                                                                
         ,PERIOD                                                              
         ,PR_PRIMARY
         ,sum(isnull(RCT_VALUE,0))           COST_VALUES
         ,sum(isnull(RCT_QUANTITY,0))        QUANTITIES
      from 
      (select * from
           PRC_PRICE_RECS 
               ,(       select 1    as PERIOD union select 2   as PERIOD union select 3   as PERIOD
                  union select 4    as PERIOD union select 5   as PERIOD
                  union select 6    as PERIOD union select 7   as PERIOD union select 8   as PERIOD
                  union select 9    as PERIOD union select 10  as PERIOD
                  union select 11   as PERIOD union select 12  as PERIOD union select 13  as PERIOD
                ) PERIODS
                ,(select 'N' as YEAR) YEARS
      ) PR
         left join CST_RESOURCE_COST_TURNOVERS RCT on PR.PR_PRIMARY = RCT.RCT_RESOURCE_LINK
               and RCT_YEAR_LINK = (select YEAR_COSTING from SYS_YEAR where YEAR_COSTING_CODE = 'N')
               and RCT_PERIOD = PERIOD
      group by YEAR
         , PERIOD
         , PR_PRIMARY
) A
join
(
select
         sum(isnull(RST.RST_SALES_VALUE,0))                                   SALES_VALUES
         ,sum(isnull(RST.RST_COSTS_INVOICED_VALUE,0))                         COSTS_INVOICED_VALUES          
         ,YEAR                                                                
         ,PERIOD                                                              
         ,PR_PRIMARY
      from 
      (select PR_PRIMARY, PERIOD, YEAR from
           PRC_PRICE_RECS P
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
           left join CST_RESOURCE_SALES_TURNOVERS RST
               on cast(PR.PR_PRIMARY as int) = RST.RST_RESOURCE_LINK
               and case YEAR when 'O' then
                                    (select YEAR_COSTING from SYS_YEAR where YEAR_COSTING_CODE = 'P') 
                                when 'L' then 
                                    (select YEAR_COSTING from SYS_YEAR where YEAR_COSTING_CODE = 'L') 
                                when 'C' then 
                                    (select YEAR_COSTING from SYS_YEAR where YEAR_COSTING_CODE = 'C')
                                else --N
                                    (select YEAR_COSTING from SYS_YEAR where YEAR_COSTING_CODE = 'N')
                                end = RST.RST_YEAR_LINK
            and PR.PERIOD = RST.RST_PERIOD
            group by PR.PR_PRIMARY, PR.YEAR, PR.PERIOD
) B
on A.PR_PRIMARY = B.PR_PRIMARY
and A.YEAR = B.YEAR
and A.PERIOD = B.PERIOD


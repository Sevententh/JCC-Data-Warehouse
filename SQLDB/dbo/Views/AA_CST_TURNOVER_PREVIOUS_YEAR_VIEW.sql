create view AA_CST_TURNOVER_PREVIOUS_YEAR_VIEW
/*
** Returns a table to be used specifically with AA_CST_PROJECT_TURNOVER_S
**
** Written     :  30/01/2006 SB
** Last Amended:  07/02/2006 SB, 23/02/06 NC
**
*/
as
select 
   C.PERIOD                                                                   [PRIMARY]
   , C.CH_PRIMARY
   , C.PERIOD
   ,(select CURR_SYMBOL
      from SYS_CURRENCY
      where CURR_TYPE = 'H')                                                  CURR_SYMBOL
   , dbo.AA_VALUE_DPS_F(C.COST_TURNOVER)                                      COST_TURNOVER
   , dbo.AA_VALUE_DPS_F(isnull(CTO_VALUE,0))                                  SALES_TURNOVER
   , dbo.AA_VALUE_DPS_F(isnull(CTO_VALUE,0) - COST_TURNOVER)                  MARGIN
   , dbo.AA_EIGHT_DPS_F(case when isnull(CTO_VALUE,0) = 0 then 0 
          else (CTO_VALUE - COST_TURNOVER)/CTO_VALUE * 100
          end)                                                                MARGIN_P
from 
   (  select PERIOD
      , CH_PRIMARY
      , cast(case
            when PERIOD = 1  then CH.CH_COST_O_1       
            when PERIOD = 2  then CH.CH_COST_O_2   
            when PERIOD = 3  then CH.CH_COST_O_3   
            when PERIOD = 4  then CH.CH_COST_O_4   
            when PERIOD = 5  then CH.CH_COST_O_5   
            when PERIOD = 6  then CH.CH_COST_O_6   
            when PERIOD = 7  then CH.CH_COST_O_7   
            when PERIOD = 8  then CH.CH_COST_O_8   
            when PERIOD = 9  then CH.CH_COST_O_9   
            when PERIOD = 10 then CH.CH_COST_O_10  
            when PERIOD = 11 then CH.CH_COST_O_11  
            when PERIOD = 12 then CH.CH_COST_O_12  
            when PERIOD = 13 then CH.CH_COST_O_13  
            else 0 end as decimal(24,8))                                      COST_TURNOVER
      from CST_COSTHEADER CH
      ,(          select 1 as  PERIOD union select 2  as PERIOD union select 3  as PERIOD
            union select 4  as PERIOD union select 5  as PERIOD
            union select 6  as PERIOD union select 7  as PERIOD union select 8  as PERIOD
            union select 9  as PERIOD union select 10 as PERIOD
            union select 11 as PERIOD union select 12 as PERIOD union select 13 as PERIOD
          ) PERIODS
   ) C
   left join CST_SALES_TURNOVERS T
      on C.CH_PRIMARY = T.CTO_PROJECT_LINK
         and isnull(T.CTO_YEAR_LINK,(select YEAR_PRIMARY from SYS_YEAR where YEAR_COSTING_CODE = 'P')) 
                                  = (select YEAR_PRIMARY from SYS_YEAR where YEAR_COSTING_CODE = 'P')
         and isnull(T.CTO_PERIOD, C.PERIOD) = C.PERIOD


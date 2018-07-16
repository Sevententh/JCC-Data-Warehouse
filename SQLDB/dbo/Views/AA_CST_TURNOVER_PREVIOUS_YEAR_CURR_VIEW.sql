create view AA_CST_TURNOVER_PREVIOUS_YEAR_CURR_VIEW
/*
** Returns a table to be used specifically with AA_CST_PROJECT_TURNOVER_S
**
** Written     :  07/02/2006 SB
** Last Amended:  23/02/06 NC, 28/02/06 SB
**
*/
as
select 
   CT_PERIODNUMBR                                                             [PRIMARY]
   , C.CH_PRIMARY
   , CT_PERIODNUMBR                                                           PERIOD
   , isnull(CURR_TURNOVERS.CT_CURR_CODE,( select CURR_SYMBOL 
                                          from SYS_CURRENCY
                                          where CURR_TYPE = 'H'))             CURR_SYMBOL
   , dbo.AA_VALUE_DPS_F(CURR_TURNOVERS.COST_TURNOVER_C)                       COST_TURNOVER
   , dbo.AA_VALUE_DPS_F(CURR_TURNOVERS.SALES_TURNOVER_C)                      SALES_TURNOVER
   , dbo.AA_VALUE_DPS_F(CURR_TURNOVERS.SALES_TURNOVER_C 
      - CURR_TURNOVERS.COST_TURNOVER_C)                                       MARGIN
   , dbo.AA_EIGHT_DPS_F(case 
         when CURR_TURNOVERS.SALES_TURNOVER_C = 0 then 0 
         else (CURR_TURNOVERS.SALES_TURNOVER_C 
            - CURR_TURNOVERS.COST_TURNOVER_C)
            / CURR_TURNOVERS.SALES_TURNOVER_C 
            * 100
         end)                                                                 MARGIN_P
from 
   (  select 
        CH_PRIMARY
      , CH_CODE
      from CST_COSTHEADER CH
   ) C
   left join (select CURRS.CT_COSTHEADER
               , CURRS.CT_CURR_CODE
               , PERIOD                      CT_PERIODNUMBR
               , isnull(CT_YEAR,'O')         CT_YEAR
               , isnull(COST_TURNOVER_C,0)   COST_TURNOVER_C
               , isnull(SALES_TURNOVER_C,0)  SALES_TURNOVER_C
               from
                  (select distinct CT_CURR_CODE, CT_COSTHEADER, PERIOD from CST_DETAIL
                 ,(select 1 as  PERIOD union select 2  as PERIOD union select 3  as PERIOD
                     union select 4  as PERIOD union select 5  as PERIOD
                     union select 6  as PERIOD union select 7  as PERIOD union select 8  as PERIOD
                     union select 9  as PERIOD union select 10 as PERIOD
                     union select 11 as PERIOD union select 12 as PERIOD union select 13 as PERIOD) PERIODS
                  ) CURRS
               left join
                  (select CT_COSTHEADER
                     , CT_CURR_CODE
                     , CT_PERIODNUMBR
                     , CT_YEAR
                     ,isnull((select sum(CT_CURR_VALUE)
                           from CST_DETAIL D2
                           where D2.CT_STATUS = 'A'
                           and D2.CT_BATCH_FLAG = 0
                           and D2.CT_POSTTYPE = 'C'
                           and D1.CT_COSTHEADER = D2.CT_COSTHEADER
                           and D1.CT_CURR_CODE = D2.CT_CURR_CODE 
                           and D1.CT_YEAR = D2.CT_YEAR
                     ),0) COST_TURNOVER_C
                     ,isnull((select sum(CT_CURR_VALUE)
                           from CST_DETAIL D3
                           where D3.CT_STATUS = 'A'
                           and D3.CT_BATCH_FLAG = 0
                           and D3.CT_POSTTYPE = 'S'
                           and D1.CT_COSTHEADER = D3.CT_COSTHEADER
                           and D1.CT_CURR_CODE = D3.CT_CURR_CODE 
                           and D1.CT_YEAR = D3.CT_YEAR
                     ),0) SALES_TURNOVER_C
                     from CST_DETAIL D1
                     where D1.CT_STATUS = 'A'
                        and D1.CT_BATCH_FLAG = 0
                     and CT_YEAR = 'O'
                     group by D1.CT_COSTHEADER
                        ,D1.CT_CURR_CODE
                        ,D1.CT_PERIODNUMBR
                        ,D1.CT_YEAR
                      ) CURR_TURNOVERS
               on CURRS.CT_COSTHEADER = CURR_TURNOVERS.CT_COSTHEADER
               and CURRS.PERIOD = CURR_TURNOVERS.CT_PERIODNUMBR
               and CURRS.CT_CURR_CODE = CURR_TURNOVERS.CT_CURR_CODE
       ) CURR_TURNOVERS
   on  C.CH_CODE = CURR_TURNOVERS.CT_COSTHEADER


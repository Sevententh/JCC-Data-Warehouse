create view AA_CST_CC_TURNOVER_LAST_YEAR_CURR_VIEW
/*
** Returns a table to be used specifically with AA_CST_COSTCENTRE_TURNOVER_S
**
** Written     :  27/02/2006 SB
** Last Amended: 
**
*/
as
select 
   C.PERIOD                                                                   [PRIMARY]
   , C.CH_PRIMARY
   , C.CCM_PRIMARY
   , C.CC_PRIMARY
   , C.PERIOD
   , CURR_TURNOVERS.CT_CURR_CODE                                              CURR_SYMBOL
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
   (  select PERIOD
      , CV.[PRIMARY]                                                          CCM_PRIMARY
      , CH.CH_PRIMARY
      , CC.CC_PRIMARY
      , CC.CC_CODE
      from CST_COSTHEADER CH
         left join AA_CST_CENTRE_VIEW CV  on CH.CH_PRIMARY  = CV.CH_PRIMARY
         left join CST_COSTCENTRE CC      on CV.CC_PRIMARY  = CC.CC_PRIMARY
      ,(          select 1 as  PERIOD union select 2  as PERIOD union select 3  as PERIOD
            union select 4  as PERIOD union select 5  as PERIOD
            union select 6  as PERIOD union select 7  as PERIOD union select 8  as PERIOD
            union select 9  as PERIOD union select 10 as PERIOD
            union select 11 as PERIOD union select 12 as PERIOD union select 13 as PERIOD
       ) PERIODS
   ) C
   left join (select CT_COSTCENTRE
      , CT_CURR_CODE
      , CT_PERIODNUMBR
      , CT_YEAR
      ,isnull((select sum(CT_CURR_VALUE)
            from CST_DETAIL D2
            where D2.CT_STATUS = 'A'
            and D2.CT_BATCH_FLAG = 0
            and D2.CT_POSTTYPE = 'C'
            and D1.CT_COSTCENTRE = D2.CT_COSTCENTRE
            and D1.CT_CURR_CODE = D2.CT_CURR_CODE 
      ),0) COST_TURNOVER_C
      ,isnull((select sum(CT_CURR_VALUE)
            from CST_DETAIL D3
            where D3.CT_STATUS = 'A'
            and D3.CT_BATCH_FLAG = 0
            and D3.CT_POSTTYPE = 'S'
            and D1.CT_COSTCENTRE = D3.CT_COSTCENTRE
            and D1.CT_CURR_CODE = D3.CT_CURR_CODE 
      ),0) SALES_TURNOVER_C
      from CST_DETAIL D1
      where D1.CT_STATUS = 'A'
         and D1.CT_BATCH_FLAG = 0
      and CT_YEAR = 'L'
      group by D1.CT_COSTCENTRE
         ,D1.CT_CURR_CODE
         ,D1.CT_PERIODNUMBR
         ,D1.CT_YEAR
       ) CURR_TURNOVERS
   on PERIOD = CURR_TURNOVERS.CT_PERIODNUMBR and C.CC_CODE = CURR_TURNOVERS.CT_COSTCENTRE
--WHERE CH_PRIMARY = 15


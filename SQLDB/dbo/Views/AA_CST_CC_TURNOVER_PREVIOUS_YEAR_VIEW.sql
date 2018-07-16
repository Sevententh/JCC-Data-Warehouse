create view AA_CST_CC_TURNOVER_PREVIOUS_YEAR_VIEW
/*
** Returns a table to be used specifically with AA_CST_COSTCENTRE_TURNOVER_S
**
** Written     :  27/02/2006 SB
** Last Amended:  06/03/2006 SB
**
*/
as
select 
   C.PERIOD                                                                   [PRIMARY]
   , C.CH_PRIMARY
   , C.[PRIMARY]                                                              CCM_PRIMARY
   , C.CC_PRIMARY                                                             CC_PRIMARY
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
      , CH.CH_PRIMARY
      , CC.CC_PRIMARY
      , CV.[PRIMARY]
      , cast(case
            when PERIOD = 1  then CC.CC_COST_O_1       
            when PERIOD = 2  then CC.CC_COST_O_2   
            when PERIOD = 3  then CC.CC_COST_O_3   
            when PERIOD = 4  then CC.CC_COST_O_4   
            when PERIOD = 5  then CC.CC_COST_O_5   
            when PERIOD = 6  then CC.CC_COST_O_6   
            when PERIOD = 7  then CC.CC_COST_O_7   
            when PERIOD = 8  then CC.CC_COST_O_8   
            when PERIOD = 9  then CC.CC_COST_O_9   
            when PERIOD = 10 then CC.CC_COST_O_10  
            when PERIOD = 11 then CC.CC_COST_O_11  
            when PERIOD = 12 then CC.CC_COST_O_12  
            when PERIOD = 13 then CC.CC_COST_O_13  
            else 0 end as decimal(24,8))           COST_TURNOVER
      from CST_COSTHEADER CH
         left join AA_CST_CENTRE_VIEW CV  on CH.CH_PRIMARY = CV.CH_PRIMARY
         left join CST_COSTCENTRE CC      on CV.CC_PRIMARY = CC.CC_PRIMARY
      ,(          select 1 as  PERIOD union select 2  as PERIOD union select 3  as PERIOD
            union select 4  as PERIOD union select 5  as PERIOD
            union select 6  as PERIOD union select 7  as PERIOD union select 8  as PERIOD
            union select 9  as PERIOD union select 10 as PERIOD
            union select 11 as PERIOD union select 12 as PERIOD union select 13 as PERIOD
          ) PERIODS
   ) C
   left join CST_SALES_TURNOVERS T
      on C.CH_PRIMARY = T.CTO_PROJECT_LINK and C.CC_PRIMARY = T.CTO_CENTRE_LINK
         and ISNULL(T.CTO_YEAR_LINK,(SELECT YEAR_PRIMARY FROM SYS_YEAR WHERE YEAR_COSTING_CODE = 'P')) 
                                  = (SELECT YEAR_PRIMARY FROM SYS_YEAR WHERE YEAR_COSTING_CODE = 'P')
         and isnull(T.CTO_PERIOD, C.PERIOD) = C.PERIOD


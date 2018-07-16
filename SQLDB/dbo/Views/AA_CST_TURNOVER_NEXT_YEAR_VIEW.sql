create view AA_CST_TURNOVER_NEXT_YEAR_VIEW
/*
** Returns a table to be used specifically with AA_CST_PROJECT_TURNOVER_S
**
** Written     :  31/01/2006 SB
** Last Amended:  07/02/2006 SB, 23/02/06 NC
**
*/
as
select 
   PERIOD                                                                     [PRIMARY]
   , CH_PRIMARY
   , PERIOD
   ,(select CURR_SYMBOL
      from SYS_CURRENCY
      where CURR_TYPE = 'H')                                                  CURR_SYMBOL
   , dbo.AA_VALUE_DPS_F(isnull(CCT_VALUE,0))                                  COST_TURNOVER
   , dbo.AA_VALUE_DPS_F(isnull(CTO_VALUE,0))                                  SALES_TURNOVER
   , dbo.AA_VALUE_DPS_F(isnull(CTO_VALUE,0) - isnull(CCT_VALUE,0))            MARGIN
   , dbo.AA_EIGHT_DPS_F(case when isnull(CTO_VALUE,0) = 0 then 0 
          else (CTO_VALUE - isnull(CCT_VALUE,0))/CTO_VALUE * 100
          end)                                                                MARGIN_P
   from
   (  select PERIOD
      , CH_PRIMARY
      from CST_COSTHEADER CH
      ,(          select 1 as  PERIOD union select 2  as PERIOD union select 3  as PERIOD
            union select 4  as PERIOD union select 5  as PERIOD
            union select 6  as PERIOD union select 7  as PERIOD union select 8  as PERIOD
            union select 9  as PERIOD union select 10 as PERIOD
            union select 11 as PERIOD union select 12 as PERIOD union select 13 as PERIOD
          ) PERIODS
   ) C   left join CST_SALES_TURNOVERS ST
      on C.CH_PRIMARY = ST.CTO_PROJECT_LINK
         and isnull(ST.CTO_YEAR_LINK,(select YEAR_PRIMARY from SYS_YEAR where YEAR_COSTING_CODE = 'N')) 
                                  = (select YEAR_PRIMARY from SYS_YEAR where YEAR_COSTING_CODE = 'N')
         and isnull(ST.CTO_PERIOD, C.PERIOD) = C.PERIOD
   left join CST_COST_TURNOVERS CT
      on C.CH_PRIMARY = CT.CCT_PROJECT_LINK
         and isnull(CT.CCT_YEAR_LINK,(select YEAR_PRIMARY from SYS_YEAR where YEAR_COSTING_CODE = 'N')) 
                                  = (select YEAR_PRIMARY from SYS_YEAR where YEAR_COSTING_CODE = 'N')
         and isnull(CT.CCT_PERIOD, C.PERIOD) = C.PERIOD
--where CH_CODE = 'R-BRI100'

create view AA_SYS_CURR_CODE_ADVANCED_VIEW
/*
** Written:       8/4/2004 RL
** Last Amended:  20/5/2004 RL, 23/6/2004 DG, 03/12/2004 SR, 07/01/2005 ROBB, 02/02/05 SR, 24/02/2005 SR, 13/12/05 NC, 21/12/05 NC
*/
as

select
CUR_PRIMARY as [PRIMARY],
CURR_CODE,
CURR_SYMBOL,
CURR_RATE,
CURR_RATEDATE,

case CURR_TYPE -- 0 = home, 1 = triangulated, 2 = 2nd base, 3 = direct
   when 'H' then 0                  -- home
   when 'E' then 
      (case CURR_SYMBOL 
         when HOME_CURR_SYMBL then 2   -- 2nd base
         else 1 end)             -- triangulated
   when '2' then 2                  -- 2nd base
   else 3 end                    -- direct
      as CURR_TYPE,
      
CSALES_DEFAULT,
CPURCH_DEFAULT,
CUR_DATE_EDITED,
CUR_DATE_PUTIN,
coalesce(CUR_USER_EDITED,'') as CUR_USER_EDITED,
coalesce(CUR_USER_PUTIN,'') as CUR_USER_PUTIN,
CURR_NOTE,
SL_ANALYSIS.SANAME as CSALES_DEFAULT_NAME,
PL_ANALYSIS.PANAME as CPURCH_DEFAULT_NAME,
cast(CURREC_EURO_CURRENCY as bit) as CURREC_EURO_CURRENCY
,CURREC_DO_NOT_USE as EXCLUDED
from
SYS_CURRENCY
left outer join SL_ANALYSIS on SACODE = CSALES_DEFAULT
left outer join PL_ANALYSIS on PACODE = CPURCH_DEFAULT
left outer join SYS_CURRENCY_REC on CURREC_SYMBOL = CURR_SYMBOL
inner join SYS_DATAINFO on SYS_PRIMARY = 1
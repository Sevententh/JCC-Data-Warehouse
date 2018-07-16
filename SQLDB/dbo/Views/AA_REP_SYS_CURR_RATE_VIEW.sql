create view AA_REP_SYS_CURR_RATE_VIEW
/*
** Written     :  01/12/2005 RV
** Last Amended:
**
** Comments    :  Returns all currency rates for crystal reports.
*/
as

select
   CUR_PRIMARY                                                    as [PRIMARY]
,  CURR_CODE
,  CURR_SYMBOL
,  CURR_RATE
,  CURR_RATEDATE
,  case CURR_TYPE -- 0 = home, 1 = triangulated, 2 = 2nd base, 3 = direct
      when 'H' then 0                                             -- 0
      when 'E' then  (
                        case CURR_SYMBOL
                           when HOME_CURR_SYMBL then 2            -- 2
                           else
                              1                                   -- 1
                        end
                     )
      when '2' then 2                                             -- 2
      else
         3                                                        -- 3
   end                                                            as CURR_TYPE
,  case CURR_TYPE -- 0 = home, 1 = triangulated, 2 = 2nd base, 3 = direct
      when 'H' then 'Home'                                        -- 0
      when 'E' then  (
                        case CURR_SYMBOL
                           when HOME_CURR_SYMBL then '2nd Base'   -- 2
                           else
                              'Triangulated'                      -- 1
                        end
                     )
      when '2' then '2nd Base'                                    -- 2
      else
         'Direct'                                                 -- 3
   end                                                            as CURR_TYPE_TEXT
,  CSALES_DEFAULT
,  CPURCH_DEFAULT
,  CUR_DATE_EDITED
,  CUR_DATE_PUTIN
,  isnull(CUR_USER_EDITED,'')                                     as CUR_USER_EDITED
,  isnull(CUR_USER_PUTIN,'')                                      as CUR_USER_PUTIN
,  CURR_NOTE
,  SANAME                                                         as CSALES_DEFAULT_NAME
,  PANAME                                                         as CPURCH_DEFAULT_NAME
,  cast(CURREC_EURO_CURRENCY as bit)                              as CURREC_EURO_CURRENCY
   from
      SYS_CURRENCY
         left  join SL_ANALYSIS        on SACODE         = CSALES_DEFAULT
         left  join PL_ANALYSIS        on PACODE         = CPURCH_DEFAULT
         left  join SYS_CURRENCY_REC   on CURREC_SYMBOL  = CURR_SYMBOL
         inner join SYS_DATAINFO       on SYS_PRIMARY    = 1
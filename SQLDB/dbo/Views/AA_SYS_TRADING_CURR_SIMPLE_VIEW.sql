create view AA_SYS_TRADING_CURR_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_SYS_TRADING_CURR_LIST_S
** Written:      19/05/2004 DG
** Last Amended: 25/04/2005 SH, 13/12/05 NC
**
*/
as

/* Select all currencies except the Euro and then add the Euro 1) if not using two-currency 
   or 2) using two-currency and either home or 2nd base is Euro */  
select 
 CURREC_PRIMARY as [PRIMARY]
,CURREC_SYMBOL
,CURREC_CURRENCY_TYPE
,coalesce(CURREC_DESCRIPTION,'') as CURREC_DESCRIPTION
,coalesce(CURREC_ISO_CODE,'') as CURREC_ISO_CODE
,CURREC_DATE_PUTIN
,CURREC_DATE_EDITED
,CURREC_USER_PUTIN
,CURREC_USER_EDITED
,cast(CURREC_EURO_CURRENCY as bit) as CURREC_EURO_CURRENCY
,CURREC_DO_NOT_USE as EXCLUDED
from SYS_CURRENCY_REC
where (CURREC_SYMBOL <> 'EUR')
   or (CURREC_SYMBOL  = 'EUR'
   and exists (select 1
               from SYS_DATAINFO 
               join SYS_DATAINFO2 on SYS_PRIMARY_2 = SYS_PRIMARY
               where ((substring(MASK_HISTORY,50,1) = 0)
                  or  (substring(MASK_HISTORY,50,1) = 1) 
                  and ((HOME_CURR_SYMBL = CURREC_SYMBOL) 
                    or (BASE2_CURR_SYMBOL = CURREC_SYMBOL)))))

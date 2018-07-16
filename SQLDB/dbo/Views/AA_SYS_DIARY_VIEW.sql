create view AA_SYS_DIARY_VIEW
/*
** Returns values for the user record.
** Written:      02/02/2006 SRB
** Last Amended: 04/04/2006 JC
**
*/
as

select
 DIARY_PRIMARY as [PRIMARY]
,cast(DIARY_STATUS As bit) As DIARY_COMPLETED -- Completed
,DIARY_ACTIONDATE as DIARY_ACTION_DATE  -- Target Date
,DIARY_TEXT                            -- Text
,DIARY_PRIORITY                        -- Priority
,case DIARY_MODULE+isnull(DIARY_RECORDTYPE,'') -- Type
   when 'GEN' then 0
   when 'SLCUST' then 1
   when 'SLPROS' then 2
   when 'SLANAL' then 3
   when 'PLSUPP' then 4
   when 'PLANAL' then 5
   when 'NLACCT' then 6
   when 'CSTPRJ' then 7
   when 'CSTRES' then 8
   when 'STKREC' then 9
   when 'SOPPRC' then 10
   when 'POPPRC' then 11
   when 'IRPRC'  then  12 
   else -1 end as DIARY_RECORD_TYPE
, DIARY_RECORDCODE as DIARY_RECORD_CODE -- Code
,case DIARY_MODULE+isnull(DIARY_RECORDTYPE,'') -- Name
   when 'GEN' then ''
   when 'SLCUST' then (select CUNAME from SL_ACCOUNTS where CUCODE = DIARY_RECORDCODE)
   when 'SLPROS' then (select CUNAME from SL_ACCOUNTS where CUPROSCODE = DIARY_RECORDCODE)
   when 'SLANAL' then (select SANAME from SL_ANALYSIS where SACODE = DIARY_RECORDCODE)
   when 'PLSUPP' then (select SUNAME from PL_ACCOUNTS where SUCODE = DIARY_RECORDCODE)
   when 'PLANAL' then (select PANAME from PL_ANALYSIS where PACODE = DIARY_RECORDCODE)
   when 'NLACCT' then (select NNAME from NL_ACCOUNTS where NCODE = DIARY_RECORDCODE)
   when 'CSTPRJ' then (select CH_NAME from CST_COSTHEADER where CH_CODE = DIARY_RECORDCODE)
   when 'CSTRES' then (select PRNAME from PRC_PRICE_RECS where PRCODE = DIARY_RECORDCODE) 
   when 'STKREC' then (select STKNAME from STK_STOCK where STKCODE = DIARY_RECORDCODE)
   when 'SOPPRC' then  (select PRNAME from PRC_PRICE_RECS where PRCODE = DIARY_RECORDCODE)
   when 'POPPRC' then  (select PRNAME from PRC_PRICE_RECS where PRCODE = DIARY_RECORDCODE) 
   when 'IRPRC'  then  (select PRNAME from PRC_PRICE_RECS where PRCODE = DIARY_RECORDCODE) 
   else '' end DIARY_RECORD_NAME
,DIARY_USERID                 -- Assigned User
,[USER_NAME] as DIARY_USERNAME
,DIARY_DATE_PUTIN             -- Date Inserted
,DIARY_DATE_EDITED            -- Date Edited
,DIARY_COMPLETED_DATE         -- Date Completed
,DIARY_USER_PUTIN             -- User Inserted
,DIARY_USER_EDITED            -- User Edited
from SYS_DIARY
left join SYS_USER on DIARY_USERID = [USER_ID] 



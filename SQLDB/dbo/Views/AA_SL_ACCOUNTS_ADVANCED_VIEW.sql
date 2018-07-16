create view AA_SL_ACCOUNTS_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_SL_ACCOUNT_LIST_S
** Written:      28/04/03 SRB
** Last Amended: 04/07/03 SRB, 11/02/04 DG, 10/05/04 DG, 11/11/04 SRB, 29/11/04 PT, 16/12/04 PT, 13/01/05 SR, 13/12/05 NC, 09/03/2006 JC
**
*/
as

select

 CU_PRIMARY as [PRIMARY]
,CUCODE 
,coalesce(CUNAME, '') as CUNAME
,cast(CU_ON_STOP As bit) As CU_ON_STOP
,cast((case when (dbo.AA_VALUE_DPS_F(CU_CREDIT_LIMIT) > 0) 
       and (dbo.AA_VALUE_DPS_F(CUBALANCE) > dbo.AA_VALUE_DPS_F(CU_CREDIT_LIMIT)) then 1
      else 0 end) as bit) as OVERCREDITLIMIT
,dbo.AA_VALUE_DPS_F(CUBALANCE) as CUBALANCE
,dbo.AA_VALUE_DPS_F(CU_CREDIT_LIMIT) as CU_CREDIT_LIMIT 
,coalesce(CUPHONE, '') as CUPHONE
,coalesce(CU_ADDRESS_USER1, '') as CU_ADDRESS_USER1
,coalesce(CUPOSTCODE, '') as CUPOSTCODE
,coalesce(CU_ADDRESS_USER2, '') as CU_ADDRESS_USER2
,coalesce(CU_COUNTRY,'') as CU_COUNTRY
,cast(CU_HEAD_OFFICE as bit) as CU_HEAD_OFFICE
,coalesce(CU_HEAD_OFFICE_CODE, '') as CU_HEAD_OFFICE_CODE
,coalesce(CU_CONTACT_SURNAME, '') as CU_CONTACT_SURNAME
,coalesce(CUSORT, '') as CUSORT
,coalesce(CUUSER1, '') as CUUSER1
,coalesce(CUUSER2, '') as CUUSER2
,coalesce(CUUSER3, '') as CUUSER3
,coalesce(CUCURRENCYCODE, '') as CUCURRENCYCODE
,coalesce(CURR_SYMBOL, '') as CURR_SYMBOL
,CU_DATE_PUTIN
,CU_DATE_EDITED
,CU_ANALYSIS
,CU_BANK_ANALYS
,CU_LEVEL as PROFILELEVEL
-- Need to ensure the field is populated as every customer is related to a country, by default the home.
,case coalesce(CU_COUNTRY_CODE,'') when '' then HOME_COUNTRY
                                   else CU_COUNTRY_CODE
 end as CU_COUNTRY_CODE
-- Multi-line text field so if longer than 50 chars then first 47 chars plus '...' or up to first cr/lf plus '...'    
,case when ((charindex(char(13),CUADDRESS,1) > 50)    
         or (charindex(char(13),CUADDRESS,1) = 0) and (len(CUADDRESS) > 50)) then substring(CUADDRESS,1,47) + '...' 
      when (charindex(char(13),CUADDRESS,1) between 1 and 50) then substring(substring(CUADDRESS,1,(charindex(char(13),CUADDRESS,1)-1)),1,47) + '...' 
      else coalesce(CUADDRESS,'')  
  end as CUADDRESS 
,CU_CONTACT_TITLE
,CU_CONTACT_INITIALS
,CU_CONTACT_FIRSTNAME
,CUSALUTE
,CU_CONTACT_JOB
,CU_EMAIL
,dbo.AA_VALUE_DPS_F(CUBALANCE_C)as CUBALANCE_C
,dbo.AA_VALUE_DPS_F(CUTURNOVERPTD) as CUTURNOVERPTD
,dbo.AA_VALUE_DPS_F(CUTURNOVERYTD) as CUTURNOVERYTD
,coalesce(CU_USRCHAR1,'') as CU_USRCHAR1
,coalesce(CU_USRCHAR2,'') as CU_USRCHAR2
,coalesce(CU_USRCHAR3,'') as CU_USRCHAR3
,coalesce(CU_USRCHAR4,'') as CU_USRCHAR4
,coalesce(CU_USRCHAR5,'') as CU_USRCHAR5
,coalesce(CU_USRCHAR6,'') as CU_USRCHAR6
,coalesce(CU_USRCHAR7,'') as CU_USRCHAR7
,coalesce(CU_USRCHAR8,'') as CU_USRCHAR8
,cast(CU_USRFLAG1 as bit) as CU_USRFLAG1
,cast(CU_USRFLAG2 as bit) as CU_USRFLAG2
,cast(CU_USRFLAG3 as bit) as CU_USRFLAG3
,CU_USRDATE1
,CU_USRDATE2
,CU_USRDATE3
,dbo.AA_VALUE_DPS_F(CU_USRNUM1)as CU_USRNUM1
,dbo.AA_VALUE_DPS_F(CU_USRNUM2)as CU_USRNUM2
,dbo.AA_VALUE_DPS_F(CU_USRNUM3)as CU_USRNUM3
,CU_USER_EDITED
,CU_USER_PUTIN
,cast(CU_MULTI_CURR as bit) as CU_MULTI_CURR
,CU_DO_NOT_USE as EXCLUDED
from SL_ACCOUNTS
left join SL_ACCOUNTS2 on CU_PRIMARY = CU_PRIMARY_2
left join SYS_CURRENCY on CUCURRENCYCODE = CURR_CODE
join SYS_DATAINFO on SYS_PRIMARY = 1
where CUCODE is not null and CUCODE != '' 


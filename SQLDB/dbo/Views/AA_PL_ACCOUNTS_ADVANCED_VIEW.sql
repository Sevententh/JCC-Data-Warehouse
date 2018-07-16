create view AA_PL_ACCOUNTS_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_PL_ACCOUNT_LIST_S
** Written:      28/04/03 SRB; 17/06/03 SRB
** Last Amended: 09/07/03 SRB; 12/02/04 DG; 17/05/04 DG; 11/11/04 SRB; 07/12/04 PT; 23/03/2005 sh, 13/12/05 NC, 09/03/2006 JC, 16/10/07 SR
**
*/
as

select

 SU_PRIMARY as [PRIMARY]
,SUCODE
,coalesce(SUNAME, '') as SUNAME
,cast(SU_ON_STOP as bit) as SU_ON_STOP
,cast((case when (dbo.AA_VALUE_DPS_F(SU_CREDIT_LIMIT) > 0) 
       and (dbo.AA_VALUE_DPS_F(SUBALANCE) > dbo.AA_VALUE_DPS_F(SU_CREDIT_LIMIT)) then 1 
      else 0 end) as bit) as OVERCREDITLIMIT
,dbo.AA_VALUE_DPS_F(SUBALANCE) as SUBALANCE
,dbo.AA_VALUE_DPS_F(SU_CREDIT_LIMIT) as SU_CREDIT_LIMIT 
,coalesce(SUPHONE, '') as SUPHONE
,coalesce(SU_ADDRESS_USER1, '') as SU_ADDRESS_USER1
,coalesce(SUPOSTCODE, '') as SUPOSTCODE
,coalesce(SU_ADDRESS_USER2, '') as SU_ADDRESS_USER2
,coalesce(SU_COUNTRY,'') as SU_COUNTRY
,coalesce(SU_CONTACT_SURNAME, '') as SU_CONTACT_SURNAME
,coalesce(SUSORT, '') as SUSORT
,coalesce(SUUSER1, '') as SUUSER1
,coalesce(SUUSER2, '') as SUUSER2
,coalesce(SUUSER3, '') as SUUSER3
,coalesce(SUCURRENCYCODE, '') as SUCURRENCYCODE
,coalesce(CURR_SYMBOL, '') as CURR_SYMBOL
,SU_DATE_PUTIN
,SU_DATE_EDITED
,SU_LEVEL as PROFILELEVEL
-- Need to ensure the field is populated as every customer is related to a country, by default the home.
,case coalesce(SU_COUNTRY_CODE,'') when '' then HOME_COUNTRY
                                   else SU_COUNTRY_CODE
 end as SU_COUNTRY_CODE
-- Multi-line text field so if longer than 50 chars then first 47 chars plus '...' or up to first cr/lf plus '...'    
,case when ((charindex(char(13),SUADDRESS,1) > 50)    
         or (charindex(char(13),SUADDRESS,1) = 0) and (len(SUADDRESS) > 50)) then substring(SUADDRESS,1,47) + '...' 
      when (charindex(char(13),SUADDRESS,1) between 1 and 50) then substring(substring(SUADDRESS,1,(charindex(char(13),SUADDRESS,1)-1)),1,47) + '...' 
      else coalesce(SUADDRESS,'')  
  end as SUADDRESS 
,SU_CONTACT_TITLE
,SU_CONTACT_INITIALS
,SU_CONTACT_FIRSTNAME
,SUSALUTE
,SU_CONTACT_JOB
,SU_EMAIL
,dbo.AA_VALUE_DPS_F(SUBALANCE_C)as SUBALANCE_C
,dbo.AA_VALUE_DPS_F(SUTURNOVERPTD) as SUTURNOVERPTD
,dbo.AA_VALUE_DPS_F(SUTURNOVERYTD) as SUTURNOVERYTD
,coalesce(SU_USRCHAR1,'') as SU_USRCHAR1
,coalesce(SU_USRCHAR2,'') as SU_USRCHAR2
,coalesce(SU_USRCHAR3,'') as SU_USRCHAR3
,coalesce(SU_USRCHAR4,'') as SU_USRCHAR4
,coalesce(SU_USRCHAR5,'') as SU_USRCHAR5
,coalesce(SU_USRCHAR6,'') as SU_USRCHAR6
,coalesce(SU_USRCHAR7,'') as SU_USRCHAR7
,coalesce(SU_USRCHAR8,'') as SU_USRCHAR8
,cast(SU_USRFLAG1 as bit) as SU_USRFLAG1
,cast(SU_USRFLAG2 as bit) as SU_USRFLAG2
,cast(SU_USRFLAG3 as bit) as SU_USRFLAG3
,SU_USRDATE1
,SU_USRDATE2
,SU_USRDATE3
,dbo.AA_VALUE_DPS_F(SU_USRNUM1)as SU_USRNUM1
,dbo.AA_VALUE_DPS_F(SU_USRNUM2)as SU_USRNUM2
,dbo.AA_VALUE_DPS_F(SU_USRNUM3)as SU_USRNUM3
,SU_USER_EDITED
,SU_USER_PUTIN
,cast(SU_MULTI_CURR as bit) as SU_MULTI_CURR
,isnull( SU_ANALYSIS, '' ) as SU_ANALYSIS
,isnull( SU_BANK_ANALYS, '' ) as SU_BANK_ANALYS
,SU_DO_NOT_USE as EXCLUDED
,isnull(SUCONTACT, '') as SUCONTACT
,isnull(SUADDRESS, '') + SUBSTRING(',', 1, len(SUADDRESS))
   + isnull(SU_ADDRESS_USER1, '') + SUBSTRING(',', 1, len(SU_ADDRESS_USER1))
    + isnull(SU_ADDRESS_USER2, '') + SUBSTRING(',', 1, len(SU_ADDRESS_USER2)) 
      + isnull(SUPOSTCODE, '') as SU_FULL_ADDRESS
from PL_ACCOUNTS
left join PL_ACCOUNTS2 on SU_PRIMARY = SU_PRIMARY_2
left join SYS_CURRENCY on SUCURRENCYCODE = CURR_CODE
join  SYS_DATAINFO on SYS_PRIMARY = 1

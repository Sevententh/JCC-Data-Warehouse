create view AA_PL_ADDRESSES_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_PL_ADDRESS_LIST_S
** Written:      29/04/03 SRB
** Last Amended: 02/03/04 DG, 09/06/04 DG, 10/01/05 SR, 17/01/05 SR, 27/01/05 SR, 01/03/2006 JC
**
*/
as

select 
 PL_AD_PRIMARY as [PRIMARY]
,SUNAME
,SUCODE 
,SU_PRIMARY
,cast(PL_AD_CODE as int) as ADDRESSNO
,cast(coalesce(PL_AD_DO_NOT_USE,0) as bit) as DO_NOT_USE
,cast(coalesce(PL_AD_INV_ADD,0) as bit) as DEFAULTORDERADDRESS
,cast(coalesce(PL_AD_DEL_ADD,0) as bit) as DEFAULTDELIVERYADDRESS
,cast(coalesce(PL_AD_STAT_ADD,0) as bit) as STATEMENTADDRESS
,cast(coalesce(PL_AD_REM_ADD,0) as bit) as REMITTANCEADDRESS
,cast(coalesce(PL_AD_DEL_ADDRESS_2,0) as bit) as DELIVERYADDRESS
,coalesce(PL_AD_CONTACT,'') as CONTACT
-- Multi-line text field so if longer than 50 chars then first 47 chars plus '...' or up to first cr/lf plus '...'    
,case when ((charindex(char(13),PL_AD_ADDRESS,1) > 50)    
         or (charindex(char(13),PL_AD_ADDRESS,1) = 0) and (len(PL_AD_ADDRESS) > 50)) then substring(PL_AD_ADDRESS,1,47) + '...' 
      when (charindex(char(13),PL_AD_ADDRESS,1) between 1 and 50) then substring(substring(PL_AD_ADDRESS,1,(charindex(char(13),PL_AD_ADDRESS,1)-1)),1,47) + '...' 
      else coalesce(PL_AD_ADDRESS,'')  
  end as ADDRESS
,coalesce(PL_AD_ADDRESS_USER1,'') as TOWN
,coalesce(PL_AD_ADDRESS_USER2,'') as COUNTY
,coalesce(PL_AD_POSTCODE,'') as POSTCODE
,coalesce(PL_AD_COUNTRY,'') as COUNTRY
,coalesce(PL_AD_PHONE,'') as PHONE	
,coalesce(PL_AD_FAX,'') as FAX
,coalesce(PL_AD_EMAIL,'') as EMAIL
,coalesce(PL_AD_CC_EMAIL,'') as ccEMAIL
,coalesce(PL_AD_ANALYSIS,'') as ANALYSIS
,coalesce(PL_AD_USRCHAR1,'') as AD_USRCHAR1
,coalesce(PL_AD_USRCHAR2,'') as AD_USRCHAR2
,coalesce(PL_AD_USRCHAR3,'') as AD_USRCHAR3
,coalesce(PL_AD_USRCHAR4,'') as AD_USRCHAR4
,coalesce(PL_AD_USRCHAR5,'') as AD_USRCHAR5
,coalesce(PL_AD_USRCHAR6,'') as AD_USRCHAR6
,coalesce(PL_AD_USRCHAR7,'') as AD_USRCHAR7
,coalesce(PL_AD_USRCHAR8,'') as AD_USRCHAR8
,cast(PL_AD_USRFLAG1 as bit) as AD_USRFLAG1
,cast(PL_AD_USRFLAG2 as bit) as AD_USRFLAG2
,cast(PL_AD_USRFLAG3 as bit) as AD_USRFLAG3
,PL_AD_USRDATE1 as AD_USRDATE1
,PL_AD_USRDATE2 as AD_USRDATE2
,PL_AD_USRDATE3 as AD_USRDATE3
,dbo.AA_VALUE_DPS_F(PL_AD_USRNUM1)as AD_USRNUM1
,dbo.AA_VALUE_DPS_F(PL_AD_USRNUM2)as AD_USRNUM2
,dbo.AA_VALUE_DPS_F(PL_AD_USRNUM3)as AD_USRNUM3
,PL_AD_DATE_PUTIN as DATE_CREATED
,PL_AD_DATE_EDITED as DATE_EDITED
,PL_AD_USER_PUTIN as USER_CREATED
,PL_AD_USER_EDITED as USER_EDITED

from PL_ADDRESSES 
inner join PL_ACCOUNTS on SUCODE = PL_AD_ACCCODE
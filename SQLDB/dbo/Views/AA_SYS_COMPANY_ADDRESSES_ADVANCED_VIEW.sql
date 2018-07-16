create view AA_SYS_COMPANY_ADDRESSES_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_SYS_COMPANY_ADDRESS_LIST_S
** Written:      30/11/2004 DG
** Last Amended:                         
**
*/
as

select 
 COAD_PRIMARY as [PRIMARY]
,coalesce(COAD_CODE,'') as COAD_CODE
,COAD_DEFAULT as DEFAULTADDRESS 
,coalesce(COAD_NAME,'') as COMPANYNAME
,coalesce(COAD_CONTACT,'') as CONTACT
-- Multi-line text field so if longer than 50 chars then first 47 chars plus '...' or up to first cr/lf plus '...'    
,case when ((charindex(char(13),COAD_ADDRESS,1) > 50)    
         or (charindex(char(13),COAD_ADDRESS,1) = 0) and (len(COAD_ADDRESS) > 50)) then substring(COAD_ADDRESS,1,47) + '...' 
      when (charindex(char(13),COAD_ADDRESS,1) between 1 and 50) then substring(substring(COAD_ADDRESS,1,(charindex(char(13),COAD_ADDRESS,1)-1)),1,47) + '...' 
      else coalesce(COAD_ADDRESS,'') end as ADDRESS
,coalesce(COAD_ADDRESS_USER1,'') as TOWN
,coalesce(COAD_ADDRESS_USER2,'') as COUNTY
,coalesce(COAD_POSTCODE,'') as POSTCODE
,coalesce(COAD_COUNTRY,'') as COUNTRY
,coalesce(COAD_PHONE,'') as PHONE
,coalesce(COAD_FAX,'') as FAX
,coalesce(COAD_EMAIL,'') as EMAIL
,coalesce(COAD_CC_EMAIL,'') as CCEMAIL
,coalesce(COAD_ANALYSIS,'') as ANALYSIS
,coalesce(PANAME,'') as ANALYSISNAME
,COAD_DATE_PUTIN 
,COAD_DATE_EDITED 
,COAD_USER_PUTIN 
,COAD_USER_EDITED
from SYS_COMP_ADDRESS
left outer join PL_ANALYSIS on PACODE = COAD_ANALYSIS


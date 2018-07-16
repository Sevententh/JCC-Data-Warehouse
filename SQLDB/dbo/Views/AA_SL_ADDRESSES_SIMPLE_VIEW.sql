create view AA_SL_ADDRESSES_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_SL_ADDRESS_LIST_S
** Written:      29/04/03 SRB
** Last Amended: 13/02/04 DG, 17/02/04 DG, 03/06/04 DG, 11/08/04 DG, 13/01/05 SR, 27/01/05 SR
**
*/
AS

select 
 SL_AD_PRIMARY as [PRIMARY]
,CUNAME
,CUCODE
,CU_PRIMARY
,cast(AD_CODE as int) as ADDRESSNO
,cast(coalesce(AD_DO_NOT_USE,0) as bit) as DO_NOT_USE
,cast(coalesce(AD_INV_ADDRESS,0) as bit) as DEFAULTINVOICEADDRESS
,cast(coalesce(AD_DEL_ADDRESS,0) as bit) as DEFAULTDELIVERYADDRESS
,cast(coalesce(AD_STAT_ADDRESS,0) as bit) as STATEMENTADDRESS
,cast(coalesce(AD_DEL_ADDRESS_2,0) as bit) as DELIVERYADDRESS
,coalesce(AD_CONTACT,'') as CONTACT
-- Multi-line text field so if longer than 50 chars then first 47 chars plus '...' or up to first cr/lf plus '...'    
,case when ((charindex(char(13),AD_ADDRESS,1) > 50)    
         or (charindex(char(13),AD_ADDRESS,1) = 0) and (len(AD_ADDRESS) > 50)) then substring(AD_ADDRESS,1,47) + '...' 
      when (charindex(char(13),AD_ADDRESS,1) between 1 and 50) then substring(substring(AD_ADDRESS,1,(charindex(char(13),AD_ADDRESS,1)-1)),1,47) + '...' 
      else coalesce(AD_ADDRESS,'')  
  end as ADDRESS
,coalesce(AD_ADDRESS_USER1,'') as TOWN
,coalesce(AD_ADDRESS_USER2,'') as COUNTY
,coalesce(AD_POSTCODE,'') as POSTCODE
,coalesce(AD_COUNTRY,'') as COUNTRY
,coalesce(AD_PHONE,'') as PHONE	
,coalesce(AD_FAX,'') as FAX
,coalesce(AD_E_MAIL,'') as EMAIL
,coalesce(AD_CC_EMAIL,'') as ccEMAIL
,coalesce(AD_ANALYSIS,'') as ANALYSIS
,AD_DATE_PUTIN
,AD_DATE_EDITED
,AD_LEVEL as PROFILELEVEL

from SL_ADDRESSES 
inner join SL_ACCOUNTS on CUCODE = AD_ACC_CODE
where isnull(CUCODE,'') <> ''
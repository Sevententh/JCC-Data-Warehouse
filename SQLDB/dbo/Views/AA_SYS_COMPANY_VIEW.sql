﻿create view AA_SYS_COMPANY_VIEW
/*
** Written: 27/09/04 SR
** Last Amended: 01/11/04 ROBB, 01/11/04 SR
** Comments: Returns Company Details
*/
as

select 
	COMPANY_NAME,
	COMP_BRANCHID,
	COMP_ADDRESS,
	COMP_ADDRESS_USER1,
	COMP_ADDRESS_USER2,
	COMP_POSTCODE,
	COMP_COUNTRY,
	COMP_TELEPHONE,
	COMP_FAX,
	COMP_REGNUMBER,
	COMP_VATNUMBER,
	COMP_EMAIL,
	COMP_USERFIELD1,
	COMP_USERFIELD2,
	COMP_USERFIELD3,
	COMP_FACTORING,
	COMP_ISDN_NUMBER,
	COMP_WEBSITE_ADDRESS,
	COMP_TELX,
	COMP_NOTES,
	DATE_CREATED,
	CO_BANK_SORT,
	CO_BANK_AC_NO,
	CO_BANK_AC_NAME,
	CO_IBAN_NO,
	COMP_USRCHAR1,
	COMP_USRCHAR2,
	COMP_USRCHAR3,
	COMP_USRCHAR4,
	COMP_USRCHAR5,
	COMP_USRCHAR6,
	COMP_USRDATE1,
	COMP_USRDATE2,
	COMP_USRDATE3,
	COMP_USRFLAG1,
	COMP_USRFLAG2,
	COMP_USRFLAG3,
	COMP_USRNUM1,
	COMP_USRNUM2,
	COMP_USRNUM3,
	CO_BANK_AC_BACSREF,
	BACS_LAYOUT

from 
	SYS_DATAINFO
	inner join SYS_DATAINFO2 ON SYS_PRIMARY_2=1
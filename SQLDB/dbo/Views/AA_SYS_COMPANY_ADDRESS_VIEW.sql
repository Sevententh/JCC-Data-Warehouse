create view AA_SYS_COMPANY_ADDRESS_VIEW
/*
** Written: 01/10/04 SR
** Last Amended: 02/12/2004 SH, 20/09/05 SRB
** Comments: Company Address Details
*/
as

select 
	COAD_PRIMARY as [PRIMARY],
	(case D.DUPLICATE when 1 then NULL else COAD_PRIMARY end) as [COAD_PRIMARY],
	COAD_NAME,
	(case D.DUPLICATE when 1 then '' else COAD_CODE end) as COAD_CODE,
	COAD_ADDRESS,
	COAD_ADDRESS_USER1,
	COAD_ADDRESS_USER2,
	COAD_POSTCODE,
	COAD_COUNTRY,
	COAD_CONTACT,
	COAD_PHONE,
	COAD_FAX,
	COAD_EMAIL,
	COAD_CC_EMAIL,
	COAD_ANALYSIS,
	(case D.DUPLICATE when 1 then 0 else COAD_DEFAULT end) as COAD_DEFAULT,
	(case D.DUPLICATE when 1 then '' else COAD_NOTES end) as COAD_NOTES,
	(case D.DUPLICATE when 1 then NULL else COAD_DATE_PUTIN end) as COAD_DATE_PUTIN,
	(case D.DUPLICATE when 1 then NULL else COAD_USER_PUTIN end) as COAD_USER_PUTIN,
	(case D.DUPLICATE when 1 then NULL else COAD_DATE_EDITED end) as COAD_DATE_EDITED,
	(case D.DUPLICATE when 1 then NULL else COAD_USER_EDITED end) as COAD_USER_EDITED,
	PANAME,
	(case D.DUPLICATE when 1 then COAD_PRIMARY else 0 end) as DUPLICATE_PRIMARY

from 
	SYS_COMP_ADDRESS
	left outer join PL_ANALYSIS ON PACODE=COAD_ANALYSIS
	cross join (select 0 as DUPLICATE union select 1 as DUPLICATE) as D
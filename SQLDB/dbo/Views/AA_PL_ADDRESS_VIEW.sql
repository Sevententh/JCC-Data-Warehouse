create view AA_PL_ADDRESS_VIEW
/*
** Written: 27/02/04 SR
** Last Amended: 19/04/04 SR, 18/08/04 SR, 19/10/04 SR, 24/11/04 SR, 25/11/04 SR, 01/12/2004 SH; 07/12/04 SRB, 26/01/05 SR, 05/07/2005 SH
*/
as

select 
	PL_AD_PRIMARY as [PRIMARY],
	(case D.DUPLICATE when 1 then '' else PL_AD_CON_CODE end) as PL_AD_CON_CODE,
	PL_AD_ACCCODE,
	(case D.DUPLICATE when 1 then '' else SUNAME end) as SUNAME,
	(case D.DUPLICATE when 1 then 0 else SU_PRIMARY end) as SU_PRIMARY,
	(case D.DUPLICATE when 1 then '' else CURR_SYMBOL end) as CURR_SYMBOL,
	cast((case D.DUPLICATE when 1 then 0 else PL_AD_CODE end) as int) as PL_AD_CODE,
	PL_AD_ADDRESS,
	PL_AD_ADDRESS_USER1,
	PL_AD_ADDRESS_USER2,
	PL_AD_POSTCODE,
	PL_AD_CONTACT,
	PL_AD_PHONE,
	PL_AD_FAX,
	PL_AD_EMAIL,
	(case D.DUPLICATE when 1 then 0 else PL_AD_INV_ADD end) as PL_AD_INV_ADD,
	(case D.DUPLICATE when 1 then 0 else PL_AD_DEL_ADD end) as PL_AD_DEL_ADD,
	(case D.DUPLICATE when 1 then 0 else PL_AD_STAT_ADD end) as PL_AD_STAT_ADD,
	PL_AD_DEL_ADDRESS_2,
	(case D.DUPLICATE when 1 then 0 else PL_AD_REM_ADD end) as PL_AD_REM_ADD,
	PL_AD_CON_TITLE,
	PL_AD_CON_INITS,
	PL_AD_CON_SNAME,
	PL_AD_CON_FNAME,
	PL_AD_CON_JOB,
	PL_AD_CONT_SAL,
	(case D.DUPLICATE when 1 then '' else PL_AD_NOTE end) as PL_AD_NOTE,
	PL_AD_ANALYSIS,
	PANAME,
	PL_AD_CC_EMAIL,
	PL_AD_COUNTRY,
	(case D.DUPLICATE when 1 then 0 else PL_AD_PRIMARY end) as PL_AD_PRIMARY,
	PL_AD_USRDATE1,
	PL_AD_USRDATE2,
	PL_AD_USRDATE3,
	PL_AD_USRFLAG1,
	PL_AD_USRFLAG2,
	PL_AD_USRFLAG3,
	PL_AD_USRNUM1,
	PL_AD_USRNUM2,
	PL_AD_USRNUM3,
	PL_AD_USRCHAR1,
	PL_AD_USRCHAR2,
	PL_AD_USRCHAR3,
	PL_AD_USRCHAR4,
	PL_AD_USRCHAR5,
	PL_AD_USRCHAR6,
	PL_AD_USRCHAR7,
	PL_AD_USRCHAR8,
	(case D.DUPLICATE when 1 then NULL else PL_AD_USER_EDITED end) as PL_AD_USER_EDITED,
	(case D.DUPLICATE when 1 then NULL else PL_AD_USER_PUTIN end) as PL_AD_USER_PUTIN,
	(case D.DUPLICATE when 1 then NULL else PL_AD_DATE_PUTIN end) as PL_AD_DATE_PUTIN,
	(case D.DUPLICATE when 1 then NULL else PL_AD_DATE_EDITED end) as PL_AD_DATE_EDITED,
	(case D.DUPLICATE when 1 then '' else user1.USER_NAME end) as CREATEDBY,
	(case D.DUPLICATE when 1 then '' else user2.USER_NAME end) as MODIFIEDBY,
	(case D.DUPLICATE when 1 then 0 else PL_AD_DO_NOT_USE end) as PL_AD_DO_NOT_USE,
	PL_AD_MOBILE,
	(case D.DUPLICATE when 1 then NULL else SU_MULTI_CURR end) as SU_MULTI_CURR,
	(case D.DUPLICATE when 1 then NULL else (case SU_IMPORT_CODE when 'O' then 2 when 'E' then 1 else 0 end) end) as PL_AD_IMPORT_CODE,
	(case D.DUPLICATE when 1 then PL_AD_PRIMARY else 0 end) as DUPLICATE_PRIMARY

from 
	PL_ADDRESSES
	inner join PL_ACCOUNTS on SUCODE = PL_AD_ACCCODE
	cross join (select 0 as DUPLICATE union select 1 as DUPLICATE) as D
	inner join SYS_CURRENCY on SUCURRENCYCODE = CURR_CODE
	left outer join PL_ANALYSIS on PACODE = PL_AD_ANALYSIS
	left outer join SYS_USER user1 on PL_AD_USER_PUTIN = user1.USER_ID
	left outer join SYS_USER user2 on PL_AD_USER_EDITED = user2.USER_ID
﻿CREATE VIEW AA_NET_PL_ACCOUNTS_LIST_VIEW
/*
** Returns a table to be used specifically with AA_NET_PL_ACCOUNTS_LIST_VIEW
** Written:      28/04/03 SRB; 17/06/03 SRB
** Last Amended: 09/07/03 SRB;
**
*/
AS

SELECT

SUCODE as [PRIMARY]
,SU_LEVEL as PROFILELEVEL
,SU_DATE_PUTIN
,SU_DATE_EDITED
,SUCODE
,SUCODE AS CHILD
,COALESCE(SUNAME, '') as SUNAME
,SU_ADDRESS_USER1
,SUPHONE
,SUPOSTCODE
,SUCONTACT
,COALESCE(SUCURRENCYCODE, '') as SUCURRENCYCODE
,COALESCE(SUBALANCE, '0') as CUBALANCE
,SU_CREDIT_LIMIT
,COALESCE(SUSORT, '') as SUSORT
,COALESCE(SUUSER1, '') as SUUSER1
,COALESCE(SUUSER2, '') as SUUSER2
,COALESCE(SUUSER3, '') as SUUSER3
,SU_EMAIL
,SU_ON_STOP
,CURR_SYMBOL
 --Need to ensure the field is populated as every customer is related to a country, by defatult the home.
,case COALESCE(SU_COUNTRY_CODE,'')
	when '' then HOME_COUNTRY
	else SU_COUNTRY_CODE
end 

as
SU_COUNTRY_CODE

--Over Credit Limit
,CASE WHEN SU_CREDIT_LIMIT>0 and (SUBALANCE>SU_CREDIT_LIMIT) THEN
	1
ELSE
	0

END

as 

OVERCREDITLIMIT
FROM PL_ACCOUNTS

LEFT JOIN PL_ACCOUNTS2 ON
	SU_PRIMARY = SU_PRIMARY_2
JOIN  SYS_DATAINFO ON SYS_PRIMARY = 1
LEFT JOIN SYS_CURRENCY ON
	CURR_CODE = SUCURRENCYCODE


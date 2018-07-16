create view STK_ADV_PRICE_EXCLUDE

/*
**
** Advanced Price Matrix
**
** Written     :  Plug-Ins Team
** Last Amended:  10/06/2010 SM
**
*/

as

select stkc_parent as XID,cucode as XCODE
	from stk_price_list_cust with(nolock)
JOIN SL_ACCOUNTS with(nolock) ON
		((CUCODE=STKC_CHAR AND STKC_TYPE='C' and STKC_EXCLUDE=1)
	OR	(CUSORT=STKC_CHAR AND STKC_TYPE='S' and STKC_EXCLUDE=1)
	OR	(CUUSER1=STKC_CHAR AND STKC_TYPE='1' and STKC_EXCLUDE=1)
	OR	(CUUSER2=STKC_CHAR AND STKC_TYPE='2' and STKC_EXCLUDE=1)
	OR	(CUUSER3=STKC_CHAR AND STKC_TYPE='3' and STKC_EXCLUDE=1))
	AND ISNULL(CUCODE,'')<>''
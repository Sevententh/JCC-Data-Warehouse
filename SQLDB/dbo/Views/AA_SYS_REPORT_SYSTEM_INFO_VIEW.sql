﻿create view AA_SYS_REPORT_SYSTEM_INFO_VIEW
/*
**
** Written: 12/04/2005 SH
** Last Amended: 09/05/05 RV. 11/05/05 RV. 31/05/05 RV. 20/06/05 RV. 21/06/05 RV. 19/07/05 RV.
** 		28/09/05 RV, 11/10/05 RV, 22/11/2005 RV, 23/11/2005 RV, 19/09/2006 RV, 11/10/2006 RV, 06/03/2007 RV, 
**		18/01/2008 RV
*/
as

select D.SYS_PRIMARY as [PRIMARY],
	D.COMPANY_NAME,
	dbo.AA_FORMAT_ADDRESS_F(D.COMP_ADDRESS, D.COMP_POSTCODE, D.COMP_ADDRESS_USER1, D.COMP_ADDRESS_USER2, null, null, D.COMP_COUNTRY,1) COMP_ADDRESS,
	CAST (D.HIDE_ADDRESS AS BIT) AS HIDE_ADDRESS,
	D.SL_AGEING_MTHD,
	D.SL_AGEING_DAYS1,
	D.SL_AGEING_DAYS2,
	D.SL_AGEING_DAYS3,
	D.SL_AGEING_DAYS4,
	D.PL_AGEING_MTHD,
	D.PL_AGEING_DAYS1,
	D.PL_AGEING_DAYS2,
	D.PL_AGEING_DAYS3,
	D.PL_AGEING_DAYS4,
	D.HOME_CURR_SYMBL,
	D2.BASE2_CURR_SYMBOL,
	D2.NO_OF_PERIODS,
	CAST (D2.SETT_DISCOUNT_VAT_CALC AS BIT) AS SETT_DISCOUNT_VAT_CALC,
	D.SALES_PERIOD,
	D.PURCHASE_PERIOD,
	D.NOMINAL_PERIOD,
	D.COMP_VATNUMBER,
	D.COMP_TELEPHONE,
	D.COMP_BRANCHID,
	D.SL_AUDIT_COUNT,
	D.PL_AUDIT_COUNT,
	D.NL_AUDIT_COUNT,
	D.VALUE_DPS,
	D2.LINES_PER_PAGE,
	D2.STK_SOP_COPY_DESC,
	D2.TRI_VAL_ON_INVOICES,
	CAST (D.PL_REF_ON_REP AS BIT) AS PL_REF_ON_REP,
	D.HOME_COUNTRY,
	D.HOME_TAXNAME,
	D.NOM_VAT_CNTRL,
	D.YEAR_START_DATE,
	D.STK_USR_VALUATN

	from SYS_DATAINFO D with( nolock )
		inner join SYS_DATAINFO2 D2 with ( nolock ) on D2.SYS_PRIMARY_2 = D.SYS_PRIMARY
	where D.SYS_PRIMARY = 1

create view AA_SYS_SUB_LEDGER_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_SYS_SUB_LEDGER_LIST_S
** Written:      06/08/2004 DG 
** Last Amended: 17/11/2004 SR, 04/02/2005 ROBB
**
*/
as

select 
 SUBL_PRIMARY as [PRIMARY]
,isnull(SUBL_CODE,'') as SUBL_CODE
,isnull(SUBL_DESCRIPTION,'') as SUBL_DESCRIPTION
,(case SUBL_TYPE
	when 'S' then 0
	when 'P' then 1
	when 'N' then 2
	when 'B' then 3
	else -1 end) as	SUBL_TYPE
,SUBL_AUDIT_NO
,SUBL_INVOICE_NO
,SUBL_CREDIT_NO
,SUBL_OTHERLEDGER_NO
,SUBL_NCODE
,SUBL_BANK_AC_NO
,SUBL_BANK_SORTCODE

from SYS_SUB_LEDGERS
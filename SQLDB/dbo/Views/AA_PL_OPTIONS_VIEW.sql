create view AA_PL_OPTIONS_VIEW
/*
** Written:      30/01/04 SRB
** Last Amended: 08/10/04 RObb, 17/05/2005 SH, 22/11/2005 SRB, 17/03/2006 ??, 28/04/2006 SR
** Comments:     Returns Purchase Ledger Options
*/
as

select

--Prompts
case substring(SYS_MESSAGE_SWITCH, 2, 1) when 0 then 1 else 0 end as ALLOW_SUPPLIER_TAXINFO_PROMPT

--Auto Numbering
,AUTO_NUMBR_PL 	
,NEXT_PL_NUMBR
,PL_REF_ON_REP
,PL_CHEQUE_NO

--Documents
,INC_ALLOC_MATCH

--Cheque Stage Approval
,PL_PAYMENT_STAGES

--Ageing Method
,case PL_AGEING_MTHD
	when 'M' then
		0
	else
		1
end as PL_AGEING_BY_DAYS
,PL_AGEING_DAYS1
,PL_AGEING_DAYS2
,PL_AGEING_DAYS3
,PL_AGEING_DAYS4

from SYS_DATAINFO,SYS_DATAINFO2
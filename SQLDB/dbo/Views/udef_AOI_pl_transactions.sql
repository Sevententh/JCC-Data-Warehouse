


-- This view is designed to reformat the pl_transactions table with positives for debits / negatives for credits.

CREATE view [dbo].[udef_AOI_pl_transactions] as

with	Suppliers(SUCODE, SUNAME, SUSORT, SUUSER1, SUUSER2, SUUSER3)
as	(	SELECT SUCODE, SUNAME, SUSORT, SUUSER1, SUUSER2, SUUSER3
FROM	PL_ACCOUNTS )

-- Positives for invoices and Credit Adjustments
SELECT		SUCODE as [Supp Code], SUNAME as [Supp Name], SUSORT as [Supp Sort], SUUSER1 as [Sort1], SUUSER2 as [Sort2], SUUSER3 as [Sort3],
			PT_TRANTYPE as [Tran Type], PT_HEADER_REF as [Tran Ref], PT_DESCRIPTION as [Hdr Desc],
			PT_INTERNAL_REF as [Int Ref], PT_DATE as [Tran Date], PT_DUEDATE as [Due Date], PT_ANTICPAYDATE as [Antic Date], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_NETT ELSE PT_NETT * -1 END AS [Home Nett], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_VAT ELSE PT_VAT * -1 END AS [Home Vat], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_GROSS ELSE PT_GROSS * -1 END AS [Home Gross], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_UNALLOCATED ELSE PT_UNALLOCATED * -1 END AS [Home O/s], 
			case when PT_BATCH_FLAG = 0 THEN 'Posted' else 'Batched' END as [Posted?], 
			PT_BATCH_REF as [Batch Ref], PT_ORIGIN as [Origin], PT_REVALUE_RATE as [Reval Rate], PT_CURRENCYRATE as [Curr Rate], PT_CURRENCYCODE as [Curr Code], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_CURR_NETT ELSE PT_CURR_NETT * -1 END AS [Curr Nett], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_CURR_TAX ELSE PT_CURR_TAX * -1 END AS [Curr Tax], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_CURR_VALU ELSE PT_CURR_VALU * -1 END AS [Curr Gross], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_CURR_UNAL ELSE PT_CURR_UNAL * -1 END AS [Curr O/s], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_REVALUED ELSE PT_REVALUED * -1 END AS [Revalued], 
			PT_REVALUE_DATE as [Reval Date], PT_QUERY_FLAG as [Qry Flg], PT_PERIODNUMBER as [Per No], PT_YEAR as [Year], 
			PT_USER_PUTIN as [User Ent], PT_DATE_PUTIN as [Date Ent], PT_USER1 as [User1], PT_USER2 as [User2], PT_USER3 as [User3], 
			PT_ORDER_NUMBER as [Ord No], PT_PRIMARY as [Audit No], PT_HEADER_KEY as [Audit Key], PT_SUB_LEDGER as [Sub Ldr], 
			PT_PAYMENT_FLAG as [Pay Flag], PT_PAYLIST_REF as [Pay Ref], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_NETT_BASE2 ELSE PT_NETT_BASE2 * -1 END AS [2B Nett], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_VAT_BASE2 ELSE PT_VAT_BASE2 * -1 END AS [2B Tax], 
			case when PT_TRANTYPE in ('INV','ACR') THEN PT_GROSS_BASE2 ELSE PT_GROSS_BASE2 * -1 END AS [2B Gross], 
			DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) as 'Today',
			convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) as 'Age',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) <=30 then 
				case when PT_TRANTYPE in ('INV','ACR') THEN PT_UNALLOCATED ELSE PT_UNALLOCATED * -1 END 
			ELSE 0 END as '0-30',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) >=31 and convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) <=60 then 
				case when PT_TRANTYPE in ('INV','ACR') THEN PT_UNALLOCATED ELSE PT_UNALLOCATED * -1 END  
			ELSE 0 END as '31-60',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) >=61 and convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) <=90 then 
				case when PT_TRANTYPE in ('INV','ACR') THEN PT_UNALLOCATED ELSE PT_UNALLOCATED * -1 END 
			ELSE 0 END as '61-90',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) >=91 and convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) <=120 then 
				case when PT_TRANTYPE in ('INV','ACR') THEN PT_UNALLOCATED ELSE PT_UNALLOCATED * -1 END  
			ELSE 0 END as '91-120',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - PT_DATE) >=121 then 
				case when PT_TRANTYPE in ('INV','ACR') THEN PT_UNALLOCATED ELSE PT_UNALLOCATED * -1 END 
			ELSE 0 END as '121+',
			case when PT_ALOC_POINTER like '0%' THEN 'Unallocated' else 'Allocated' END as [Status]
FROM   PL_TRANSACTIONS
inner join   Suppliers on PT_COPYSUPP = SUCODE



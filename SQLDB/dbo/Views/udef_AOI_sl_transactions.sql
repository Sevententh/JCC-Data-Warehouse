

-- This view is designed to reformat the sl_transactions table with positives for debits / negatives for credits.

CREATE view [dbo].[udef_AOI_sl_transactions] as

with	Customers(CUCODE, CUNAME, CUSORT, CUUSER1, CUUSER2, CUUSER3)
as	(	SELECT CUCODE, CUNAME, CUSORT, CUUSER1, CUUSER2, CUUSER3
FROM	SL_ACCOUNTS )
--,
--		hdrkey(DET_HDR_KEY, MIN_DET_PRIMARY)
--as  (	SELECT DET_HEADER_KEY, min(DET_PRIMARY)  
--FROM	SL_PL_NL_DETAIL with (nolock) 
--WHERE	DET_LEDGER = 'SL'
--GROUP BY DET_HEADER_KEY)
--,
--		det_desc(DET_HDR_KEY, DET_DESCRIPTION)
--as  (	SELECT hdrkey.DET_HDR_KEY, DET_DESCRIPTION
--FROM	hdrkey
--INNER JOIN SL_PL_NL_DETAIL with (nolock) ON DET_PRIMARY = MIN_DET_PRIMARY)


SELECT		CUCODE as [Cust Code], CUNAME as [Cust Name], CUSORT as [Cust Sort], CUUSER1 as [Sort1], CUUSER2 as [Sort2], CUUSER3 as [Sort3],
			ST_TRANTYPE as [Tran Type], ST_HEADER_REF as [Tran Ref], ST_DESCRIPTION as [Hdr Desc], 
--			det_description as [Det Desc],
			ST_DATE as [Tran Date], ST_DUEDATE as [Due Date], ST_ANTICPAYDATE as [Antic Date], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_NETT ELSE ST_NETT * -1 END AS [Home Nett], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_VAT ELSE ST_VAT * -1 END AS [Home Vat], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_GROSS ELSE ST_GROSS * -1 END AS [Home Gross], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_UNALLOCATED ELSE ST_UNALLOCATED * -1 END AS [Home O/s], 
			case when ST_BATCH_FLAG = 0 THEN 'Posted' else 'Batched' END as [Posted?], 
			ST_BATCH_REF as [Batch Ref], ST_ORIGIN as [Origin], ST_REVALUE_RATE as [Reval Rate], ST_CURRENCYRATE as [Curr Rate], ST_CURRENCYCODE as [Curr Code], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_CURR_NETT ELSE ST_CURR_NETT * -1 END AS [Curr Nett], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_CURR_TAX ELSE ST_CURR_TAX * -1 END AS [Curr Tax], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_CURR_VALU ELSE ST_CURR_VALU * -1 END AS [Curr Gross], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_CURR_UNAL ELSE ST_CURR_UNAL * -1 END AS [Curr O/s], 
			ST_EXPORT_CODE as [Exp Code], ST_EC_DEL_TERMS as [EC Del Terms], ST_EC_T_NATURE as [EC Del Nat], ST_EC_T_MODE as [EC Del Mode], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_REVALUED ELSE ST_REVALUED * -1 END AS [Revalued], 
			ST_REVALUE_DATE as [Reval Date], ST_QUERY_FLAG as [Qry Flg], ST_PERIODNUMBER as [Per No], ST_YEAR as [Year], 
			ST_USER_PUTIN as [User Ent], ST_DATE_PUTIN as [Date Ent], ST_USER1 as [User1], ST_USER2 as [User2], ST_USER3 as [User3], 
			ST_ORDER_NUMBER as [Ord No], ST_PRIMARY as [Audit No], ST_HEADER_KEY as [Audit Key], ST_SUB_LEDGER as [Sub Ldr], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_NETT_BASE2 ELSE ST_NETT_BASE2 * -1 END AS [2B Nett], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_VAT_BASE2 ELSE ST_VAT_BASE2 * -1 END AS [2B Tax], 
			case when ST_TRANTYPE in ('INV','ADR') THEN ST_GROSS_BASE2 ELSE ST_GROSS_BASE2 * -1 END AS [2B Gross], 
			ST_CREDIT_CONTROLLER as [Credit Cont],
			DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) as 'Today',
			convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) as 'Age',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) <=30 then 
				case when ST_TRANTYPE in ('INV','ADR') THEN ST_UNALLOCATED ELSE ST_UNALLOCATED * -1 END  
			ELSE 0 END as '0-30',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) >=31 and convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) <=60 then 
				case when ST_TRANTYPE in ('INV','ADR') THEN ST_UNALLOCATED ELSE ST_UNALLOCATED * -1 END  
			ELSE 0 END as '31-60',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) >=61 and convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) <=90 then 
				case when ST_TRANTYPE in ('INV','ADR') THEN ST_UNALLOCATED ELSE ST_UNALLOCATED * -1 END  
			ELSE 0 END as '61-90',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) >=91 and convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) <=120 then 
				case when ST_TRANTYPE in ('INV','ADR') THEN ST_UNALLOCATED ELSE ST_UNALLOCATED * -1 END  
			ELSE 0 END as '91-120',
			case when convert(int,DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) - ST_DATE) >=121 then 
				case when ST_TRANTYPE in ('INV','ADR') THEN ST_UNALLOCATED ELSE ST_UNALLOCATED * -1 END  
			ELSE 0 END as '121+',
			case when ST_ALOC_POINTER like '0%' THEN 'Unallocated' else 'Allocated' END as [Status]
FROM         SL_TRANSACTIONS  with (nolock)
inner join   Customers  with (nolock) on ST_COPYCUST = CUCODE
--inner join   det_desc on ST_HEADER_KEY = DET_HDR_KEY




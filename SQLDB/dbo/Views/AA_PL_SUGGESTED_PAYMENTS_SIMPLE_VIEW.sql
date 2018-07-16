create view AA_PL_SUGGESTED_PAYMENTS_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_PL_SUGGESTED_PAYMENTS_LIST_S
** Written: 17/02/2005 SH
** Last Amended: 08/04/2005 SRB; 01/06/05 SRB; 01/11/05 SRB;
**
*/
as
	select T.PT_PRIMARY as [PRIMARY],
		S.SUCODE,
		S.SUNAME,
		T.PT_DATE,
		T.PT_HEADER_REF,
		T.PT_TRANTYPE,
		case PT_TRANTYPE
			when 'INV' then 0
			when 'CRN' then 1
			when 'PAY' then 2
			when 'ADR' then 3
			when 'ACR' then 4
		end as TRANSACTION_TYPE,
		--Nett
		case when HOME_CURR_SYMBL != PT_CURRENCYCODE then
			case 	when T.PT_TRANTYPE in ( 'PAY', 'ADR', 'CRN' ) then T.PT_CURR_NETT * -1
				else T.PT_CURR_NETT
			end
		else
			case 	when T.PT_TRANTYPE in ( 'PAY', 'ADR', 'CRN' ) then T.PT_NETT * -1
				else T.PT_NETT
			end
		end as PT_NETT,	
		--Gross
		case when HOME_CURR_SYMBL != PT_CURRENCYCODE then
			case 	when T.PT_TRANTYPE in ( 'PAY', 'ADR', 'CRN' ) then T.PT_CURR_VALU * -1
				else T.PT_CURR_VALU
			end
		else
			case 	when T.PT_TRANTYPE in ( 'PAY', 'ADR', 'CRN' ) then T.PT_GROSS * -1
				else T.PT_GROSS
			end
		end as PT_GROSS,
		--Unallocated
		case when HOME_CURR_SYMBL != PT_CURRENCYCODE then
			case 	when T.PT_TRANTYPE in ( 'PAY', 'ADR', 'CRN' ) then T.PT_CURR_UNAL * -1
				else T.PT_CURR_UNAL
			end
		else
			case 	when T.PT_TRANTYPE in ( 'PAY', 'ADR', 'CRN' ) then T.PT_UNALLOCATED * -1
				else T.PT_UNALLOCATED
			end
		end as PT_UNALLOCATED,
		case when T.PT_TRANTYPE in ( 'PAY', 'ADR', 'CRN' ) then T.PT_PAYLIST_VALUE * -1
			else T.PT_PAYLIST_VALUE
		end as PT_PAYLIST_VALUE,
		T.PT_PAYLIST_SETT_DISC,
		T.PT_SETT_DISC1,
		T.PT_SETT_DISC2,
		T.PT_SETT_DAYS1,
		T.PT_SETT_DAYS2,
		isnull( T.PT_PAYLIST_REF, '' ) as PT_PAYLIST_REF,
		isnull( T.PT_PAY_STAGE_STATUS, 0 ) as PT_PAY_STAGE_STATUS,
		T.PT_QUERY_FLAG,
		isnull( T2.PT_USRCHAR1, '' ) as PT_USRCHAR1,
		isnull( T2.PT_USRCHAR2, '' ) as PT_USRCHAR2,
		isnull( T2.PT_USRCHAR3, '' ) as PT_USRCHAR3,
		isnull( T2.PT_USRCHAR4, '' ) as PT_USRCHAR4,
		isnull( T2.PT_USRNUM1, 0 ) as PT_USRNUM1,
		isnull( T2.PT_USRNUM2, 0 ) as PT_USRNUM2,
		T2.PT_USRDATE1,
		T2.PT_USRDATE2,
		isnull( T2.PT_USRFLAG1, 0 ) as PT_USRFLAG1,
		isnull( T2.PT_USRFLAG2, 0 ) as PT_USRFLAG2,
		isnull( T.PT_SUB_LEDGER, '' ) as PT_SUB_LEDGER,
		isnull( T.PT_USER1, '' ) as PT_USER1,
		isnull( T.PT_USER2, '' ) as PT_USER2,
		isnull( T.PT_USER3, '' ) as PT_USER3,
		T.PT_DUEDATE,
		T.PT_ANTICPAYDATE,
		T.PT_CURRENCYCODE,
		isnull( S.SUSORT, '' ) as SUSORT,
		case when T.PT_YEAR = 'N' or ( T.PT_YEAR = 'C' and T.PT_PERIODNUMBER > D.PURCHASE_PERIOD ) then 1
			else 0
		end as FUTURE_PERIOD_POSTING,
		S2.SU_LEVEL as PROFILELEVEL

	from PL_TRANSACTIONS T
			left join PL_TRANSACTIONS2 T2 on T2.PT_PRIMARY_2 = T.PT_PRIMARY
			inner join PL_ACCOUNTS S on S.SUCODE = T.PT_COPYSUPP
			inner join PL_ACCOUNTS2 S2 on S2.SU_PRIMARY_2 = S.SU_PRIMARY
			left join SYS_DATAINFO D on D.SYS_PRIMARY = 1
			left join SYS_DATAINFO2 D2 on D2.SYS_PRIMARY_2 = D.SYS_PRIMARY

	where PT_ALOC_POINTER like '0%' and T.PT_BATCH_FLAG <> 1
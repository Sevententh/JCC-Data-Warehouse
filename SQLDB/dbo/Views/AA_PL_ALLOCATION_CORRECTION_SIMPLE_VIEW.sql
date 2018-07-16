create view AA_PL_ALLOCATION_CORRECTION_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_PL_ALLOCATION_CORRECTION_LIST_S
** Written: 11/01/2005 SH
** Last Amended: 28/02/2005 SRB, 15/04/2005 SH
**
*/
as

select cast( H.P_AL_REFERENCE as int ) as [PRIMARY], -- Allocation Reference acts as the primary key for this list
	H.P_AL_REFERENCE,
	sum( case when H.P_AL_VALUE_HOME >= 0 then H.P_AL_VALUE_HOME else 0 end ) as P_AL_VALUE_HOME,
	sum( case when H.P_AL_VALUE_CURR >= 0 then H.P_AL_VALUE_CURR else 0 end ) as P_AL_VALUE_CURR,
	H.P_AL_DATE,
	H.P_AL_USER_ID,
	H.P_AL_ACCOUNT_CODE,
	S.SUNAME,
	S.SU_MULTI_CURR,
	case count( distinct P.PT_CURRENCYCODE )
		when 1 then min( P.PT_CURRENCYCODE )
		else min( D.HOME_CURR_SYMBL )
	end as PT_CURRENCYCODE,
	sum( case when H.P_AL_VALUE_HOME < 0 then H.P_AL_VALUE_HOME else 0 end ) as P_AL_VALUE_HOME_NEGATIVE,
	sum( case when H.P_AL_VALUE_HOME < 0 then H.P_AL_VALUE_CURR else 0 end ) as P_AL_VALUE_CURR_NEGATIVE,
	count( distinct P.PT_CURRENCYCODE ) as CURRENCY_CODE_COUNT
	from PL_TRANSACTIONS P
		inner join PL_ALLOC_HISTORY H on H.P_AL_HEADER_KEY = P.PT_HEADER_KEY and cast( H.P_AL_REFERENCE as int ) = (
					select max( cast( P_AL_REFERENCE as int ) ) -- Convert to int to simplify sorting
						from PL_ALLOC_HISTORY
						where P_AL_HEADER_KEY = P.PT_HEADER_KEY
		)
		inner join PL_ACCOUNTS S on S.SUCODE = P.PT_COPYSUPP
		inner join SYS_DATAINFO D on D.SYS_PRIMARY = 1
	where P.PT_BATCH_FLAG <> 1 and P.PT_UNALLOCATED <> P.PT_GROSS and
		isnull( nullif( H.P_AL_REFERENCE, '' ), '0' ) <> '0'

	group by H.P_AL_REFERENCE, H.P_AL_DATE, H.P_AL_USER_ID, H.P_AL_ACCOUNT_CODE, S.SUNAME, S.SU_MULTI_CURR
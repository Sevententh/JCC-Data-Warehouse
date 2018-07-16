create view AA_SL_ALLOCATION_CORRECTION_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_SL_ALLOCATION_CORRECTION_LIST_S
** Written: 11/01/2005 SH
** Last Amended: 28/02/2005 SRB, 15/04/2005 SH
**
*/
as

select cast( H.S_AL_REFERENCE as int ) as [PRIMARY], -- Allocation Reference acts as the primary key for this list
	H.S_AL_REFERENCE,
	sum( case when H.S_AL_VALUE_HOME >= 0 then H.S_AL_VALUE_HOME else 0 end ) as S_AL_VALUE_HOME,
	sum( case when H.S_AL_VALUE_CURR >= 0 then H.S_AL_VALUE_CURR else 0 end ) as S_AL_VALUE_CURR,
	H.S_AL_DATE,
	H.S_AL_USER_ID,
	H.S_AL_ACCOUNT_CODE,
	C.CUNAME,
	C.CU_MULTI_CURR,
	case count( distinct S.ST_CURRENCYCODE )
		when 1 then min( S.ST_CURRENCYCODE )
		else min( D.HOME_CURR_SYMBL )
	end as ST_CURRENCYCODE,
	sum( case when H.S_AL_VALUE_HOME < 0 then H.S_AL_VALUE_HOME else 0 end ) as S_AL_VALUE_HOME_NEGATIVE,
	sum( case when H.S_AL_VALUE_CURR < 0 then H.S_AL_VALUE_CURR else 0 end ) as S_AL_VALUE_CURR_NEGATIVE,
	count( distinct S.ST_CURRENCYCODE ) as CURRENCY_CODE_COUNT
	from SL_TRANSACTIONS S
		inner join SL_ALLOC_HISTORY H on H.S_AL_HEADER_KEY = S.ST_HEADER_KEY and cast( H.S_AL_REFERENCE as int ) = (
					select max( cast( S_AL_REFERENCE as int ) ) -- Convert to int to simplify sorting
						from SL_ALLOC_HISTORY
						where S_AL_HEADER_KEY = S.ST_HEADER_KEY
		)
		inner join SL_ACCOUNTS C on C.CUCODE = S.ST_COPYCUST
		inner join SYS_DATAINFO D on D.SYS_PRIMARY = 1

	where S.ST_BATCH_FLAG <> 1 and S.ST_UNALLOCATED <> S.ST_GROSS and
		isnull( nullif( H.S_AL_REFERENCE, '' ), '0' ) <> '0'

	group by H.S_AL_REFERENCE, H.S_AL_DATE, H.S_AL_USER_ID, H.S_AL_ACCOUNT_CODE, C.CUNAME, C.CU_MULTI_CURR
﻿create view AA_SYS_REPORT_OPTIONS_VIEW
/*
** Returns a table to be used specifically with AA_SYS_REPORT_OPTIONS_LIST_S
** Written: 14/02/2005 SH
** Last Amended: 19/04/2005 SH
**
*/
as

	select O.OPTION_ID as [PRIMARY],
			O.REPORT_ID,
			O.USER_PUTIN,
			U.[USER_NAME] as USER_PUTIN_NAME,
			OPTION_NAME,
			UPG_CODE,
			UPG_DESCRIPTION as PROFILE_NAME,
			isnull( O.DATE_EDITED, O.DATE_PUTIN ) as DATE_EDITED,
			cast( case when D.OPTION_ID is NULL then 0 else 1 end as bit ) as USER_DEFAULT,
			U2.[USER_ID] as USER_DEFAULT_USER_ID,
			U2.USER_PROFILE_CODE as USER_DEFAULT_PROFILE_ID
		from SYS_REPORT_OPTIONS O
			inner join SYS_USER U on U.[USER_ID] = O.[USER_PUTIN]
			left join SYS_USER_PROFILE_GLOBAL P on P.UPG_CODE = U.USER_PROFILE_CODE
			cross join SYS_USER U2
			left join SYS_REPORT_USER_DEFAULTS D on D.[USER_ID] = U2.[USER_ID] and D.OPTION_ID = O.OPTION_ID
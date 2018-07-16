﻿CREATE VIEW AA_NET_CST_RECORD_LIST_VIEW
/*
** Returns a table to be used specifically with AA_NET_CST_RECORD_LIST_S
** Written:      13/03/03 ROBB
** Last Amended: 
**
*/
AS

SELECT 

CH_CODE as [PRIMARY],
CH_LEVEL as PROFILELEVEL,
CH_CODE,
COALESCE(CH_NAME,'') as CH_NAME,
COALESCE(CH_SORT,'') as CH_SORT,
COALESCE(CH_ACCOUNT,'') as CH_ACCOUNT,
CH_STATUS,
CH_USER1,
CH_USER2,
CH_USER3,
CH_USER4,
CH_USER5,
CH_USER6,
CH_DATE_USER1,
CH_DATE_USER2,
CH_DATE_USER3,
CH_DATE_EST,
CH_DATE_PUTIN,
CH_DATE_COMP,
CH_DATE_EDITED

FROM CST_COSTHEADER
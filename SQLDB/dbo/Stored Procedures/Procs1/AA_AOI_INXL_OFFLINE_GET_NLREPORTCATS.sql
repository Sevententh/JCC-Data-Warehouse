﻿--drop procedure  [AA_AOI_INXL_OFFLINE_GET_NLREPORTCATS]
create procedure [dbo].[AA_AOI_INXL_OFFLINE_GET_NLREPORTCATS]
@ds_code varchar(6)
as
select
@ds_code ds_code, NCODE, NL_MAJORCODE,
N1.NCAT_CODE NCATCODE1,N1.NCAT_NAME NCATNAME1,
N2.NCAT_CODE NCATCODE2,N2.NCAT_NAME NCATNAME2,
N3.NCAT_CODE NCATCODE3,N3.NCAT_NAME NCATNAME3,
N4.NCAT_CODE NCATCODE4,N4.NCAT_NAME NCATNAME4,
N5.NCAT_CODE NCATCODE5,N5.NCAT_NAME NCATNAME5,
N6.NCAT_CODE NCATCODE6,N6.NCAT_NAME NCATNAME6,
N7.NCAT_CODE NCATCODE7,N7.NCAT_NAME NCATNAME7,
N8.NCAT_CODE NCATCODE8,N8.NCAT_NAME NCATNAME8
from nl_accounts
inner join NL_MAJORHEADING on NL_MAJORCODE=NMAJORHEADCODE
left outer join NL_CATEGORIES N1 on N1.NCAT_CODE=NCATEGORYCODE1 and N1.NCAT_NUMBER=1
left outer join NL_CATEGORIES N2 on N2.NCAT_CODE=NCATEGORYCODE2 and N2.NCAT_NUMBER=2
left outer join NL_CATEGORIES N3 on N3.NCAT_CODE=NCATEGORYCODE3 and N3.NCAT_NUMBER=3
left outer join NL_CATEGORIES N4 on N4.NCAT_CODE=NCATEGORYCODE4 and N4.NCAT_NUMBER=4
left outer join NL_CATEGORIES N5 on N5.NCAT_CODE=NCATEGORYCODE5 and N5.NCAT_NUMBER=5
left outer join NL_CATEGORIES N6 on N6.NCAT_CODE=NCATEGORYCODE6 and N6.NCAT_NUMBER=6
left outer join NL_CATEGORIES N7 on N7.NCAT_CODE=NCATEGORYCODE7 and N7.NCAT_NUMBER=7
left outer join NL_CATEGORIES N8 on N8.NCAT_CODE=NCATEGORYCODE8 and N8.NCAT_NUMBER=8
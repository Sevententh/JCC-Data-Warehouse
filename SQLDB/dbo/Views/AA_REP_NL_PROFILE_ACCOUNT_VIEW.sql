﻿CREATE VIEW AA_REP_NL_PROFILE_ACCOUNT_VIEW
/*
** Written:     06/12/2005 RV   
** Last Amended: 
** Comments: returns nominal profile accounts for crystal reports
*/
AS
SELECT
 
NL_PROFILE.NP_COPYNCODE,
N.NNAME AS ACCOUNT_NAME, 
NL_PROFILE.NP_PROFILECODE,
P.NNAME AS PROFILE_NAME, 
                      
NL_PROFILE.NP_PERCENTAGE, 
CAST (N.N_PROFILE_NL AS BIT) AS N_PROFILE_NL, 
CAST (N.N_PROFILE_SL AS BIT) AS N_PROFILE_SL,                      
CAST (N.N_PROFILE_PL AS BIT) AS N_PROFILE_PL, 
CAST (N.N_PROFILE_REC AS BIT) AS N_PROFILE_REC, 
CAST (N.N_PROFILE_WARN AS BIT) AS PROFILE_WARN,                      
NL_PROFILE.NP_USER_PUTIN, 
NL_PROFILE.NP_USER_EDITED, 
NL_PROFILE.NP_DATE_EDITED, 
NL_PROFILE.NP_DATE_PUTIN


FROM NL_PROFILE 

	INNER JOIN NL_ACCOUNTS N
	ON N.NCODE = NL_PROFILE.NP_COPYNCODE

	INNER JOIN NL_ACCOUNTS P 
	ON P.NCODE = NL_PROFILE.NP_PROFILECODE
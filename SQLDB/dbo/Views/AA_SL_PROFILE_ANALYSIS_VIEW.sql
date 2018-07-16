create VIEW AA_SL_PROFILE_ANALYSIS_VIEW
/*
** Written:      03/02/2004 SRB
** Last Amended: 08/10/04 ROBB
** Comments:     Returns Security Profile settings for Sales Analysis Records
*/
As
Select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
Cast(Substring(UP_RECORDMASK, 2, 1) As tinyint) As ALLOWEDACCESS,
(Case 
   When Substring(UP_REC_OPTIONS2, 1, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [INSERT],
(Case 
   When Substring(UP_REC_OPTIONS2, 2, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDIT,
(Case 
   When Substring(UP_REC_OPTIONS2, 3, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [DELETE],
(Case 	When Substring(UP_REC_OPTIONS2, 4, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS2, 4, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS2, 4, 1) = 'V' Then Cast(2 as tinyint)
   End)
As INFO,
(Case 
   When Substring(UP_REC_OPTIONS2, 5, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As SETDEFAULTS,
(Case 	When Substring(UP_REC_OPTIONS2, 6, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS2, 6, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS2, 6, 1) = 'V' Then Cast(2 as tinyint)
   End)
As TRANSACTIONS,
(Case 
   When Substring(UP_REC_OPTIONS2, 7, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As TURNOVERSUMMARY,
(Case 
   When Substring(UP_REC_OPTIONS2, 8, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As CUSTOMISEUSERTAB,
(Case 
   When Substring(UP_REC_OPTIONS2, 9, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As SMARTTAGSUMMARY,
UP_LEVEL_RECENTRY2 AS ENTERAMENDLEVEL,
UP_LEVEL_RECVIEW2 AS WORKWITHLEVEL,
UP_LEVEL_EXACT2 As EXACTLEVEL
From SYS_USER_PROFILE
Where UP_MODULE = 'SL'




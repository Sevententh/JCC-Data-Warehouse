create view AA_NL_ACCOUNT_SECURITY_VIEW
/*
** Written:      01/04/2003 SRB
** Last Amended: 21/04/2006 JC
** Comments: Returns Security Profile settings for Nominal Records
*/
As
Select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
Cast(Substring(UP_RECORDMASK, 1, 1) As tinyint) As ALLOWEDACCESS,
(Case 
   When Substring(UP_REC_OPTIONS1, 1, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [INSERT],
(Case 
   When Substring(UP_REC_OPTIONS1, 2, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [SAVE],
(Case 
   When Substring(UP_REC_OPTIONS1, 3, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [DELETE],

1 As [OPEN],       -- TO BE IMPLEMENTED

(Case 	When Substring(UP_REC_OPTIONS1, 4, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 4, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 4, 1) = 'V' Then Cast(2 as tinyint)
   End)
As SETTINGS,
(Case 	When Substring(UP_REC_OPTIONS1, 5, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 5, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 5, 1) = 'V' Then Cast(2 as tinyint)
   End)
As BUDGETS,
(Case
   When Substring(UP_REC_OPTIONS1, 6, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As BANK,
(Case
   When Substring(UP_REC_OPTIONS1, 7, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As CASH,
(Case
   When Substring(UP_REC_OPTIONS1, 8, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As AUTOACCOUNT,
(Case
   When Substring(UP_REC_OPTIONS1, 9, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As ANALYSIS,

--Needs to be in a separate area for window it is associated with.  Now named 'Edit Nominal Transactions' 
(Case 	When Substring(UP_REC_OPTIONS1, 10, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 10, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 10, 1) = 'V' Then Cast(2 as tinyint)
   End)
As EDIT_TRANSACTIONS,

(Case 	When Substring(UP_REC_OPTIONS1, 11, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 11, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 11, 1) = 'V' Then Cast(2 as tinyint)
   End)
As PROFILES,

1 As RECORD_FIELD_CHOOSER,       -- TO BE IMPLEMENTED

/*
--Dimensions specific feature
(Case
   When Substring(UP_REC_OPTIONS1, 12, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As CUSTOMISEUSERTAB,
*/
(Case
   When Substring(UP_REC_OPTIONS1, 13, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As TURNOVERSUMMARY,

1 As SMART_TAG_SUMMARY,       -- TO BE IMPLEMENTED
1 As LIST_FIELD_CHOOSER,       -- TO BE IMPLEMENTED
1 As DUPLICATE,       -- TO BE IMPLEMENTED

UP_LEVEL_RECENTRY1 AS ENTERAMENDLEVEL,
UP_LEVEL_RECVIEW1 AS WORKWITHLEVEL,
UP_LEVEL_EXACT1 As EXACTLEVEL
From SYS_USER_PROFILE
Where UP_MODULE = 'NL'


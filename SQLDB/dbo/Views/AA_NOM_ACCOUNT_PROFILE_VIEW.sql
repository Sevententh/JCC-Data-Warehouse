CREATE VIEW AA_NOM_ACCOUNT_PROFILE_VIEW
/*
** Written:     03/01/2003 PAULT   
** Last Amended:
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
As EDIT,
(Case 
   When Substring(UP_REC_OPTIONS1, 3, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [DELETE],
(Case 
   When Substring(UP_REC_OPTIONS1, 4, 1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWINFO,
(Case 
   When Substring(UP_REC_OPTIONS1, 4, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITINFO,
(Case 
   When Substring(UP_REC_OPTIONS1, 5, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As VIEWBUDGETS,
(Case
   When Substring(UP_REC_OPTIONS1, 5, 1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As EDITBUDGETS,
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
(Case 
   When Substring(UP_REC_OPTIONS1, 10, 1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWTRANSACTIONS,
(Case 
   When Substring(UP_REC_OPTIONS1, 10, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITTRANSACTIONS,
(Case 
   When Substring(UP_REC_OPTIONS1, 11, 1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWPROFILES,
(Case 
   When Substring(UP_REC_OPTIONS1, 11, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITPROFILES,
(Case
   When Substring(UP_REC_OPTIONS1, 12, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As CUSTOMISEUSERTAB,
(Case
   When Substring(UP_REC_OPTIONS1, 13, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As TURNOVERSUMMARY,

UP_LEVEL_RECENTRY1 AS ENTERAMENDLEVEL,
UP_LEVEL_RECVIEW1 AS WORKWITHLEVEL,
UP_LEVEL_EXACT1 As EXACTLEVEL
From SYS_USER_PROFILE
Where UP_MODULE = 'NL'



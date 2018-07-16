CREATE VIEW AA_CST_PROJECT_PROFILE_VIEW
/*
** Written:     08/01/2003 PAULT   
** Last Amended:
** Comments: Returns Security Profile settings for Project Records
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
   When Substring(UP_REC_OPTIONS1, 5, 1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWCOSTCENTRES,
(Case 
   When Substring(UP_REC_OPTIONS1, 5, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITCOSTCENTRES,
(Case 
   When Substring(UP_REC_OPTIONS1, 6, 1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWGROUPS,
(Case 
   When Substring(UP_REC_OPTIONS1, 6, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITGROUPS,
(Case 
   When Substring(UP_REC_OPTIONS1, 7, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As UNRECOVERABLE,
(Case 
   When Substring(UP_REC_OPTIONS1, 8, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EXTRAWORK,
(Case 
   When Substring(UP_REC_OPTIONS1, 9, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As OUTSTANDINGPOP,
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
   When Substring(UP_REC_OPTIONS1, 11, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As SOP,
(Case 
   When Substring(UP_REC_OPTIONS1, 12, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As CUSTOMISEUSERTAB,
(Case 
   When Substring(UP_REC_OPTIONS1, 13, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As STATUS,
(Case 
   When Substring(UP_REC_OPTIONS1, 14, 1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWCOSTS,
(Case 
   When Substring(UP_REC_OPTIONS1, 14, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITCOSTS,
(Case 
   When Substring(UP_REC_OPTIONS1, 15, 1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWSALES,
(Case 
   When Substring(UP_REC_OPTIONS1, 15, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITSALES,
(Case 
   When Substring(UP_REC_OPTIONS1, 16, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [DIFFERENCE],

UP_LEVEL_RECENTRY1 AS ENTERAMENDLEVEL,
UP_LEVEL_RECVIEW1 AS WORKWITHLEVEL,
UP_LEVEL_EXACT1 As EXACTLEVEL
From SYS_USER_PROFILE
Where UP_MODULE = 'CST'



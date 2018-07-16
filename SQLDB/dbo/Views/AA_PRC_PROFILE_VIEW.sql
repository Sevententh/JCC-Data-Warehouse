CREATE VIEW AA_PRC_PROFILE_VIEW
/*
** Written:     02/01/2003 PAULT   
** Last Amended:
** Comments: Returns Security Profile settings for Price Records (for Invoice Register, SOP and POP)
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
   When Substring(UP_REC_OPTIONS1, 3,1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [DELETE],
(Case 
   When Substring(UP_REC_OPTIONS1, 4,1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWINFO,
(Case 
   When Substring(UP_REC_OPTIONS1, 4,1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITINFO,
(Case 
   When Substring(UP_REC_OPTIONS1, 5,1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWECINFO,
(Case 
   When Substring(UP_REC_OPTIONS1, 5,1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITECINFO,
(Case 
   When Substring(UP_REC_OPTIONS1, 6,1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As VIEWPROFIT,
(Case 
   When Substring(UP_REC_OPTIONS1, 7,1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As VIEWTRANSACTIONS,
(Case 
   When Substring(UP_REC_OPTIONS1, 8,1) = 'X' Then Cast(0 as tinyint)
   Else Cast(1 as tinyint)
   End)
As VIEWLINKEDITEMS,
(Case 
   When Substring(UP_REC_OPTIONS1, 8,1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDITLINKEDITEMS,
(Case 
   When Substring(UP_REC_OPTIONS1, 9,1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As CUSTOMISEUSERTAB,
(Case 
   When Substring(UP_REC_OPTIONS1, 10,1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As ENABLERTP,
UP_LEVEL_RECENTRY1 AS ENTERAMENDLEVEL,
UP_LEVEL_RECVIEW1 AS WORKWITHLEVEL,
UP_LEVEL_EXACT1 As EXACTLEVEL
From SYS_USER_PROFILE
Where UP_MODULE In('IR', 'SOP', 'POP')



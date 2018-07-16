CREATE VIEW AA_NL_CATEGORY1_PROFILE_VIEW
/*
** Written:     15/04/2003 ROBB   
** Last Amended:
** Comments: Returns Security Profile settings for Nominal Major Headings Records
*/
As
Select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
Cast(Substring(UP_RECORDMASK, 3, 1) As varchar(1)) As ALLOWEDACCESS,
(Case 
   When Substring(UP_REC_OPTIONS3, 1, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [INSERT],
(Case 
   When Substring(UP_REC_OPTIONS3, 1, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDIT,
(Case 
   When Substring(UP_REC_OPTIONS3, 1, 1) = 'F' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [DELETE],
(Case Substring(UP_REC_OPTIONS3, 1, 1)
   When 'F' Then Cast(1 as tinyint)
   When 'V' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [VIEW]

From SYS_USER_PROFILE
Where UP_MODULE = 'NL'
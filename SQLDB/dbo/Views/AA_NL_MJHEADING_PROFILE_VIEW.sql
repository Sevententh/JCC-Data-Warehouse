CREATE VIEW AA_NL_MJHEADING_PROFILE_VIEW
/*
** Written:     15/04/2003 ROBB   
** Last Amended:
** Comments: Returns Security Profile settings for Nominal Major Headings Records
*/
As
Select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
Cast(Substring(UP_RECORDMASK, 2, 1) As varchar(1)) As ALLOWEDACCESS,
(Case 
   When Substring(UP_REC_OPTIONS2, 1, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDIT
From SYS_USER_PROFILE
Where UP_MODULE = 'NL'
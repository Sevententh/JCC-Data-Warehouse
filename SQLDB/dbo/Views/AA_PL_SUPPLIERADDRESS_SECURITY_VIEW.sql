create view AA_PL_SUPPLIERADDRESS_SECURITY_VIEW
/*
** Written:     01/04/2004 SRB
** Last Amended:
** Comments: Returns Security Profile settings for Supplier Address Records
This is a mock Security Profile and is using the values from the Supplier Record Security 
Profile.  To fit into the structure of Win Forms it has been given it's own Security Profile.
*/
As
Select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
Cast(Substring(UP_RECORDMASK, 2, 1) As tinyint) As ALLOWEDACCESS,
(Case 	When Substring(UP_REC_OPTIONS1, 7, 1) = 'F' Then Cast(1 as tinyint)
	Else Cast(0 as tinyint)
   End)
As [INSERT],
(Case 	When Substring(UP_REC_OPTIONS1, 7, 1) = 'F' Then Cast(1 as tinyint)
	Else Cast(0 as tinyint)
   End)
As EDIT,
(Case 	When Substring(UP_REC_OPTIONS1, 7, 1) = 'F' Then Cast(1 as tinyint)
	Else Cast(0 as tinyint)
   End)
As [DELETE]

From SYS_USER_PROFILE
Where UP_MODULE = 'PL'
